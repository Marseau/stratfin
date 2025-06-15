import os
from flask import Flask, request, jsonify, make_response
import requests
from flask_cors import CORS

app = Flask(__name__)

# Habilitar CORS para os domínios autorizados
CORS(app, resources={r"/api/*": {"origins": ["https://stratfin.tec.br", "https://stratfin.flutterflow.app"]}},
     methods=['GET', 'POST', 'OPTIONS'], allow_headers=["Content-Type", "Authorization", "Access-Control-Allow-Origin"])

# URL da função getFileFromGCS (direta)
BASE_API_URL = 'https://us-central1-stratfin-393617.cloudfunctions.net/getFileFromGCS'

@app.route('/api', methods=['GET'])
def middleware_api():
    try:
        directory = request.args.get('directory')
        file_name = request.args.get('file_name')
        denom_social = request.args.get('denom_social', '').strip()

        if not directory or not file_name:
            return jsonify({"error": "Missing 'directory' or 'file_name' parameter"}), 400

        print(f"[INFO] Parâmetros recebidos: directory={directory}, file_name={file_name}, denom_social={denom_social}")

        target_url = f"{BASE_API_URL}?directory={directory}&file_name={file_name}"
        if denom_social:
            target_url += f"&denom_social={denom_social}"

        print(f"[INFO] URL de redirecionamento para getFileFromGCS: {target_url}")

        response = requests.get(target_url, timeout=10)

        if response.status_code != 200:
            print(f"[ERROR] Erro na requisição: {response.status_code}")
            return jsonify({"error": f"Erro ao acessar a função getFileFromGCS: {response.status_code}"}), response.status_code

        print(f"[INFO] Resposta da API de destino: {response.status_code}, {response.content}")

        return make_response(response.content, response.status_code, response.headers.items())

    except requests.exceptions.Timeout:
        print("[ERROR] Timeout ao tentar acessar a função getFileFromGCS")
        return jsonify({"error": "Timeout ao tentar acessar a função getFileFromGCS"}), 504

    except requests.exceptions.RequestException as e:
        print(f"[ERROR] Erro de conexão: {str(e)}")
        return jsonify({"error": f"Erro de conexão: {str(e)}"}), 500

    except Exception as e:
        print(f"[ERROR] Erro inesperado: {str(e)}")
        return jsonify({"error": f"Erro inesperado: {str(e)}"}), 500

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    app.run(host='0.0.0.0', port=port)
