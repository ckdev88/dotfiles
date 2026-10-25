vim9script

# Abbreviations: General -- see :digraphs / :dig!
iabbrev dgstar ☆
iabbrev dgstar2 ★
iabbrev dgok ✓
iabbrev dgx ✗
iabbrev dgplay ▶
iabbrev dg. ·
iabbrev dgeuro €
iabbrev dgalert !

autocmd FileType markdown silent! syntax match SpecialKeyFail /\v✗/
autocmd FileType markdown silent! syntax match SpecialKeyOK /\v✓/

# Abbreviations: Português
var Port: number = 0
if Port == 1
    echo "Portuguese abbreviations are active."
    iabbrev Comunicacao Comunicação
    iabbrev Nao Não
    iabbrev Portugues Português
    iabbrev Situacao Situação
    iabbrev acoes ações
    iabbrev analise análise
    iabbrev botao botão
    iabbrev botoes botões
    iabbrev comencou començou
    iabbrev compativel compatível
    iabbrev comunicacao comunicação
    iabbrev comunicacoes comunicações
    iabbrev conexao conexão
    iabbrev confusao confusão
    iabbrev estatisticas estatísticas
    iabbrev experiencia experiência
    iabbrev experiencia experiência
    iabbrev codigo código
    iabbrev inorganico inorgânico
    iabbrev integracao integração
    iabbrev manutencao manutenção
    iabbrev modificacao modificação
    iabbrev nao não
    iabbrev navegacao navegação
    iabbrev orcamento orçamento
    iabbrev organico orgânico
    iabbrev otimizacao otimização 
    iabbrev portugues português
    iabbrev promocoes promoções
    iabbrev proxima próxima
    iabbrev saida saída
    iabbrev sao são
    iabbrev servicos serviços
    iabbrev situacao situação
    iabbrev subsidiarios subsidiários
    iabbrev tambem também
    iabbrev teh the
    iabbrev usuario usuário
    iabbrev voce você
    iabbrev waht what
    iabbrev sequencia sequência
    iabbrev acessivel acessível
    iabbrev reference referência
    iabbrev crianca criança
    iabbrev criancas crianças
    iabbrev variavel variável
    iabbrev memoria memória
    iabbrev definicao definição
    iabbrev aplicacoes aplicações
    iabbrev computacao computaçao
    iabbrev padrao padrão
endif
