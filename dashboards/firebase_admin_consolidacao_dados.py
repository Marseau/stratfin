import firebase_admin
from firebase_admin import credentials, firestore
from google.cloud import storage
import json
from datetime import datetime
import copy

# Inicialização do Firebase Admin SDK
cred_path = "/Users/marseau/StratFin/stratfin-393617-firebase-adminsdk-ya4u5-c7f57fd55a.json"
cred = credentials.Certificate(cred_path)
firebase_admin.initialize_app(cred)

# Inicializa o Firestore
db = firestore.client()

# Inicializa o cliente do Google Cloud Storage
bucket_name = "cloud_folder"
storage_client = storage.Client()
bucket = storage_client.bucket(bucket_name)

# Função auxiliar para somar valores de subcoleções
def sum_subcollection_values(client_id, subcollection, field_name):
    try:
        collection_ref = db.collection(f'cliente/{client_id}/{subcollection}').stream()
        return sum([doc.to_dict().get(field_name, 0) for doc in collection_ref])
    except Exception as e:
        print(f"Erro ao somar valores da subcoleção {subcollection} para o cliente {client_id}: {e}")
        return 0

# Função auxiliar para somar ativos financeiros
def sum_cliente_ativo_financeiro(client_id):
    return sum_subcollection_values(client_id, 'cliente_ativo_financeiro', 'valor_mercado')

# Função auxiliar para somar valores em subcoleções como cliente_vinculoprofissional
def sum_cliente_vinculoprofissional(client_id):
    try:
        total_remuneracao = 0
        total_fgts = 0
        total_inss = 0
        total_saldo_fgts = 0

        collection_ref = db.collection(f'cliente/{client_id}/cliente_vinculoprofissional').stream()
        for doc in collection_ref:
            data = doc.to_dict()
            total_remuneracao += data.get('remuneracao_fixa_liquida', 0) + data.get('remuneracao_variavel', 0)
            total_fgts += 1 if data.get('contribuicao_FGTS', False) else 0
            total_inss += data.get('contribuicao_inss', 0)
            total_saldo_fgts += data.get('saldo_fgts', 0)

        return total_remuneracao, total_fgts, total_inss, total_saldo_fgts
    except Exception as e:
        print(f"Erro ao somar valores da subcoleção cliente_vinculoprofissional para o cliente {client_id}: {e}")
        return 0, 0, 0, 0

# Adicionar estatísticas do cliente (gênero, estado, etc.) e calcular faixas etárias
def calculate_client_statistics(client_id):
    client_doc = db.collection('cliente').document(client_id).get()
    if client_doc.exists:
        client_data = client_doc.to_dict()
        gender = client_data.get('genero', 'Não especificado')
        state = client_data.get('estadoFederacao', 'Não especificado')
        marital_status = client_data.get('estadocivil', 'Não especificado')
        union_regime = client_data.get('regime_uniao', 'Não especificado')
        suitability = client_data.get('suitability', 'Não especificado')
        age = client_data.get('idade')

        # Determinar faixa etária
        if age is not None:
            if age <= 20:
                age_range = '0-20'
            elif age <= 30:
                age_range = '21-30'
            elif age <= 40:
                age_range = '31-40'
            elif age <= 50:
                age_range = '41-50'
            elif age <= 60:
                age_range = '51-60'
            else:
                age_range = 'acima de 60'
        else:
            age_range = 'Não especificado'

        return gender, state, marital_status, union_regime, suitability, age_range
    return 'Não especificado', 'Não especificado', 'Não especificado', 'Não especificado', 'Não especificado', 'Não especificado'

# Consolidar dados dos advisors
def consolidate_advisors():
    try:
        advisors_ref = db.collection('users').where('usuario_tipo', '==', 'Advisor')
        advisors = list(advisors_ref.stream())

        consolidated_advisors = []

        for advisor in advisors:
            advisor_data = advisor.to_dict()
            advisor_id = advisor.id
            advisor_name = advisor_data.get('display_name', 'Desconhecido')
            advisor_phone = advisor_data.get('phone_number', 'Desconhecido')
            advisor_email = advisor_data.get('email', 'Desconhecido')
            user_vinculado_list = advisor_data.get('user_vinculado', [])

            # Evitar erro 'NoneType' object is not iterable
            if user_vinculado_list is None:
                user_vinculado_list = []

            # Inicializar acumuladores
            total_remuneracao = 0
            total_fgts = 0
            total_inss = 0
            total_saldo_fgts = 0
            total_assets = 0
            total_dependents = 0
            total_nao_financeiros = {}
            total_passivos = {}
            total_seguros = {}
            total_valor_projeto_futuro = 0
            total_clients = 0
            gender_count = {'Homem': 0, 'Mulher': 0, 'Não especificado': 0}
            states_count = {}
            age_ranges_count = {
                '0-20': 0, '21-30': 0, '31-40': 0, '41-50': 0, '51-60': 0, 'acima de 60': 0, 'Não especificado': 0
            }

            for client_ref in user_vinculado_list:
                try:
                    client_id = client_ref.id  # Extrair ID diretamente do objeto
                    total_clients += 1
                    
                    # Estatísticas dos clientes
                    gender, state, marital_status, union_regime, suitability, age_range = calculate_client_statistics(client_id)
                    gender_count[gender] += 1
                    states_count[state] = states_count.get(state, 0) + 1
                    age_ranges_count[age_range] += 1

                    total_dependents += sum_subcollection_values(client_id, 'cliente_dependente', 'dependents_count')
                    remuneracao, fgts, inss, saldo_fgts = sum_cliente_vinculoprofissional(client_id)
                    total_remuneracao += remuneracao
                    total_fgts += fgts
                    total_inss += inss
                    total_saldo_fgts += saldo_fgts
                    total_assets += sum_cliente_ativo_financeiro(client_id)

                    # Outros valores e detalhes
                    ativos_nao_financeiros = sum_cliente_ativo_nao_financeiro(client_id)
                    for tipo_ativo, valor in ativos_nao_financeiros.items():
                        total_nao_financeiros[tipo_ativo] = total_nao_financeiros.get(tipo_ativo, 0) + valor

                    passivos = sum_cliente_passivo(client_id)
                    for tipo_passivo, valor in passivos.items():
                        total_passivos[tipo_passivo] = total_passivos.get(tipo_passivo, 0) + valor

                    seguros = sum_cliente_seguro(client_id)
                    for tipo_seguro, valor in seguros.items():
                        total_seguros[tipo_seguro] = total_seguros.get(tipo_seguro, 0) + valor

                    total_valor_projeto_futuro += sum_cliente_projetofuturo(client_id)

                except Exception as e:
                    print(f"Erro ao processar cliente com ID {client_ref}: {e}")

            # Atribuir os valores ao dicionário advisor_data_consolidated
            advisor_data_consolidated = {
                'advisor_id': advisor_id,
                'advisor_name': advisor_name,
                'phone_number': advisor_phone,
                'email': advisor_email,
                'summary': {
                    'financial_summary': {
                        'total_remuneracao': total_remuneracao,
                        'total_fgts': total_fgts,
                        'total_inss': total_inss,
                        'total_saldo_fgts': total_saldo_fgts,
                        'total_assets': total_assets,
                        'total_dependents': total_dependents,
                        'total_nao_financeiros': copy.deepcopy(total_nao_financeiros),
                        'total_passivos': copy.deepcopy(total_passivos),
                        'total_seguros': copy.deepcopy(total_seguros),
                        'total_valor_projeto_futuro': total_valor_projeto_futuro
                    },
                    'total_clients': total_clients,
                    'gender_count': copy.deepcopy(gender_count),
                    'states_count': copy.deepcopy(states_count),
                    'age_ranges_count': copy.deepcopy(age_ranges_count)
                }
            }

            consolidated_advisors.append(advisor_data_consolidated)

        # Salvar os dados consolidados em um arquivo JSON no GCS
        try:
            consolidated_json = json.dumps(consolidated_advisors, indent=2, ensure_ascii=False)
            blob = bucket.blob('consolidated_advisors/consolidated_advisors.json')
            blob.upload_from_string(consolidated_json, content_type='application/json')
            print("Dados consolidados dos advisors salvos com sucesso no GCS.")
        except Exception as e:
            print(f"Erro ao salvar os dados consolidados no GCS: {e}")

    except Exception as e:
        print(f"Erro ao consolidar dados dos advisors: {e}")

# Chamar as funções para consolidar dados
consolidate_advisors()
