# StratFin - Plano de Consolidação de Aplicações Flutter

## Situação Atual
- **emails/**: Aplicação base com funcionalidades de email e chat
- **strat_fin/**: Aplicação evoluída com recursos avançados de relatórios e gráficos
- **Duplicação**: ~85% do código é duplicado entre as aplicações

## Estratégia de Consolidação

### Fase 1: Backup e Preparação ✅
- [x] Análise completa das diferenças
- [x] Identificação de funcionalidades únicas
- [x] Backup via Git commit

### Fase 2: Migração de Funcionalidades Únicas (EM PROGRESSO)
#### Do emails/ para strat_fin/:

1. **Lottie Animations Support**
   - Adicionar `lottie: ^2.7.0` ao pubspec.yaml
   - Migrar assets/lottie_animations/

2. **Funcionalidades de Chat Específicas**
   - Verificar diferenças em chat_mensagens_record.dart
   - Migrar melhorias específicas do sistema de chat

3. **Configurações macOS**
   - strat_fin/ não tem configuração macOS completa
   - Migrar de emails/macos/

### Fase 3: Padronização de Dependências
- Atualizar Firebase para versões mais recentes
- Sincronizar todas as dependências
- Remover dependências não utilizadas

### Fase 4: Otimização da Arquitetura
- Consolidar componentes duplicados
- Criar design system unificado
- Implementar estrutura de testes

### Fase 5: Validação e Limpeza
- Testes de integração completos
- Remoção da aplicação emails/
- Atualização da documentação

## Funcionalidades a Migrar

### Assets Únicos do emails/:
- `assets/lottie_animations/`
- Configurações específicas de email

### Configurações Únicas:
- macOS runner completo
- ESLint configurações específicas

## Benefícios Esperados
- ✅ Redução de 50% no esforço de manutenção
- ✅ Unificação de melhorias e features
- ✅ Simplificação do processo de deploy
- ✅ Redução de bugs por sincronização

## Cronograma
- **Semana 1**: Migração de assets e configurações
- **Semana 2**: Teste e validação
- **Semana 3**: Limpeza e documentação

## Status Atual
- [x] Fase 1: Análise e backup completos
- [ ] Fase 2: Migração em andamento
- [ ] Fase 3: Pendente
- [ ] Fase 4: Pendente
- [ ] Fase 5: Pendente