# StratFin - Plataforma de Planejamento Financeiro

[![Flutter CI](https://github.com/Marseau/stratfin/actions/workflows/flutter_ci.yml/badge.svg)](https://github.com/Marseau/stratfin/actions/workflows/flutter_ci.yml)
[![Security Checks](https://github.com/Marseau/stratfin/actions/workflows/security.yml/badge.svg)](https://github.com/Marseau/stratfin/actions/workflows/security.yml)
[![codecov](https://codecov.io/gh/Marseau/stratfin/branch/main/graph/badge.svg)](https://codecov.io/gh/Marseau/stratfin)

> 🏦 Plataforma completa de planejamento financeiro desenvolvida com Flutter, Firebase e microserviços Python para o mercado brasileiro.

## 📋 Visão Geral

StratFin é uma aplicação de planejamento financeiro que oferece:

- 📊 **Gestão Completa de Portfólio**: Ativos, passivos, investimentos e seguros
- 📈 **Indicadores Econômicos**: Integração com dados do Banco Central do Brasil
- 👥 **Multi-usuário**: Clientes, advisors e empresas com diferentes níveis de acesso
- 📱 **Multiplataforma**: Web, Android e iOS
- 🔒 **Segurança Robusta**: Autenticação Firebase e criptografia end-to-end

## 🚀 Início Rápido

### Pré-requisitos

- **Flutter** 3.16.3+
- **Node.js** 18+
- **Python** 3.9+
- **Firebase CLI**
- **Docker** (opcional, para containers)

### Instalação

```bash
# 1. Clone o repositório
git clone https://github.com/Marseau/stratfin.git
cd stratfin

# 2. Configure o Flutter (aplicação principal)
cd strat_fin
flutter pub get

# 3. Configure o Firebase Functions
cd ../emails/functions
npm install

# 4. Configure os serviços Python
cd ../..
pip install -r requirements.txt

# 5. Execute os emuladores Firebase
firebase emulators:start
```

### Executar a Aplicação

```bash
# Flutter Web
cd strat_fin
flutter run -d chrome

# Android/iOS
flutter run

# Executar testes
./test_runner.sh all
```

## 🏗️ Arquitetura

### Frontend
- **`strat_fin/`**: Aplicação principal Flutter com recursos avançados
- **`emails/`**: Aplicação Flutter para gestão de emails (em processo de consolidação)

### Backend & Microserviços
- **Firebase**: Autenticação, Firestore, Cloud Functions, Storage
- **Python Services**: Processamento de dados econômicos e APIs
- **Node.js Functions**: Email providers e gestão de arquivos

### Integrações Externas
- **Banco Central do Brasil**: Indicadores econômicos (IPCA, SELIC, PIB)
- **CVM**: Dados de agentes autônomos
- **Yahoo Finance**: Cotações de mercado
- **SendGrid/Brevo**: Provedores de email

## 🧪 Testes

### Estrutura de Testes

```
strat_fin/test/
├── unit/               # Testes unitários
│   ├── auth_test.dart
│   └── financial_calculations_test.dart
├── widget/             # Testes de widgets
│   └── login_widget_test.dart
├── integration/        # Testes de integração
└── test_utils.dart     # Utilitários de teste
```

### Executar Testes

```bash
# Todos os testes
./strat_fin/test_runner.sh all

# Testes específicos
./strat_fin/test_runner.sh unit
./strat_fin/test_runner.sh widget
./strat_fin/test_runner.sh integration

# Com coverage
./strat_fin/test_runner.sh coverage
```

## 🔒 Segurança

### Medidas Implementadas

- ✅ **Secret Scanning**: Gitleaks para detecção de credenciais
- ✅ **Dependency Scanning**: Verificação automática de vulnerabilidades
- ✅ **Container Security**: Trivy scanner
- ✅ **Code Analysis**: CodeQL e Bandit
- ✅ **Firebase Rules**: Regras de segurança rigorosas

### Reporte de Vulnerabilidades

Consulte nosso [SECURITY.md](SECURITY.md) para detalhes sobre como reportar vulnerabilidades de segurança.

## 🚀 CI/CD Pipeline

### GitHub Actions Workflows

1. **CI/CD Principal** (`.github/workflows/flutter_ci.yml`)
   - Análise de código
   - Testes automatizados
   - Build Android/Web
   - Deploy de artefatos

2. **Security Scanning** (`.github/workflows/security.yml`)
   - Detecção de secrets
   - Scan de dependências
   - Validação de regras Firebase
   - Análise de containers

### Status dos Builds

- [![Flutter CI](https://github.com/Marseau/stratfin/actions/workflows/flutter_ci.yml/badge.svg)](https://github.com/Marseau/stratfin/actions/workflows/flutter_ci.yml)
- [![Security Checks](https://github.com/Marseau/stratfin/actions/workflows/security.yml/badge.svg)](https://github.com/Marseau/stratfin/actions/workflows/security.yml)

## 📊 Funcionalidades Principais

### Gestão de Clientes
- Cadastro completo de dados pessoais e financeiros
- Validação de CPF/CNPJ
- Gestão de dependentes
- Vínculos profissionais

### Planejamento Financeiro
- **Ativos**: Conta corrente, investimentos, imóveis
- **Passivos**: Financiamentos, cartão de crédito
- **Seguros**: Vida, residencial, automóvel
- **Projetos Futuros**: Aposentadoria, compra de imóveis
- **Conta de Emergência**: Cálculo automático

### Análise e Relatórios
- Dashboard interativo com gráficos
- Projeções financeiras personalizadas
- Cenários de investimento
- Relatórios em PDF e CSV
- Termômetro financeiro

### Indicadores Econômicos
- IPCA, SELIC, IGP-M em tempo real
- Índice de Confiança do Consumidor
- PIB e dados macroeconômicos
- Integração com APIs governamentais

## 🛠️ Desenvolvimento

### Stack Tecnológico

**Frontend:**
- Flutter 3.16.3
- Dart SDK >=3.0.0
- Firebase SDK 5.x
- fl_chart, Syncfusion Charts
- Go Router para navegação

**Backend:**
- Firebase (Auth, Firestore, Functions, Storage)
- Python 3.9 (Flask, Pandas)
- Node.js 18 (Express, Firebase Admin)
- Docker containers

**Ferramentas:**
- GitHub Actions (CI/CD)
- Firebase Emulator Suite
- Testing: Mockito, fake_cloud_firestore
- Security: Gitleaks, Trivy, Bandit

### Estrutura do Projeto

```
stratfin/
├── strat_fin/                 # Aplicação Flutter principal
├── emails/                    # Aplicação Flutter (legado)
├── cloud_run_app/            # Serviço de indicadores econômicos
├── middleware-api/           # API Gateway
├── engajar/                  # Serviços de dashboard
├── firebase-functions/       # Cloud Functions
├── .github/workflows/        # CI/CD pipelines
├── CLAUDE.md                 # Documentação para desenvolvimento
├── CONSOLIDATION_PLAN.md     # Plano de consolidação
├── SECURITY.md               # Políticas de segurança
└── README.md                 # Este arquivo
```

### Comandos de Desenvolvimento

```bash
# Análise de código
flutter analyze

# Formatação
flutter format .

# Build para produção
flutter build web --release
flutter build apk --release

# Deploy Firebase
firebase deploy

# Docker build
docker build -t stratfin .
```

## 📈 Roadmap

### Curto Prazo (Q1 2025)
- [ ] Consolidação completa das aplicações Flutter
- [ ] Implementação de testes E2E
- [ ] Otimização de performance
- [ ] Melhorias de UX/UI

### Médio Prazo (Q2-Q3 2025)
- [ ] App mobile nativo
- [ ] Integração com Open Banking
- [ ] IA para recomendações financeiras
- [ ] API pública para parceiros

### Longo Prazo (Q4 2025+)
- [ ] Marketplace de produtos financeiros
- [ ] Funcionalidades sociais
- [ ] Expansão internacional
- [ ] Blockchain integration

## 🤝 Contribuindo

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Execute os testes (`./strat_fin/test_runner.sh all`)
4. Faça commit das mudanças (`git commit -m 'Add some AmazingFeature'`)
5. Push para a branch (`git push origin feature/AmazingFeature`)
6. Abra um Pull Request

### Guidelines

- Siga os padrões de código estabelecidos
- Adicione testes para novas funcionalidades
- Atualize a documentação
- Execute o security scan antes do commit

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para detalhes.

## 👥 Time

- **Desenvolvimento**: Marseau Franco
- **Email**: marseaufranco@gmail.com
- **GitHub**: [@Marseau](https://github.com/Marseau)

## 🆘 Suporte

- **Issues**: [GitHub Issues](https://github.com/Marseau/stratfin/issues)
- **Discussões**: [GitHub Discussions](https://github.com/Marseau/stratfin/discussions)
- **Email**: suporte@stratfin.com

## 📊 Status do Projeto

- ✅ **MVP Completo**: Core features implementadas
- 🚧 **Em Desenvolvimento**: Consolidação e otimizações
- 📈 **Crescimento**: Novas features sendo adicionadas

---

<div align="center">

**StratFin** - Democratizando o planejamento financeiro no Brasil 🇧🇷

[![Made with Flutter](https://img.shields.io/badge/Made%20with-Flutter-02569B.svg)](https://flutter.dev/)
[![Powered by Firebase](https://img.shields.io/badge/Powered%20by-Firebase-FFCA28.svg)](https://firebase.google.com/)
[![Built with Claude Code](https://img.shields.io/badge/Built%20with-Claude%20Code-8A2BE2.svg)](https://claude.ai/code)

</div>