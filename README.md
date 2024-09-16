
# Teste para desenvolvedor - Mottu (branch: devel_level_3)

## Instalação
### Pré requisitos:
- Flutter instalado

### Passo a Passo
- Clonar repositório no computador
- Abrir o projeto `marvel_heroes_app` no visual studio code ou IDE de preferência 
- Executar os comandos a seguir: 
```bash
$ flutter pub get
$ flutter run
```

## Projeto
```bash
Teste desenvolvido no nível 3, atendendo todos os requisitos descritos abaixo:
```

### Arquitetura
- [x] App Modularizado
- [x] Arquitetura MVC
- [x] Clean architecture
- [x] Princípios do SOLID

### Gerenciamento de estado e navegação
- [x] Utilizar Getx.

### Serviços adicionais
- [x] Configurar Firebase crashlytics.
- [x] Criar channel em Swift, capturar a mudança de conexão, e mostrar uma mensagem de offline no flutter.

### Git flow
- [x] Fazer um **fork** deste repositório para o seu Github, de forma **privada**, e adicionar os usuarios `@brunosmm`, `@BetoMottu`, `@moreirawebmaster`,`@jeanchrocha`.
- [x] Criar um readme marcando os itens feitos.

### Configurações do projeto
- [x] Criar um projeto Flutter com a seguinte configuração de package: `com.mottu.marvel`.
- [x] Criar uma Splashscreen customizada;
- [x] Guardar em cache as consultas realizadas na API Marvel;
- [x] Limpar cache de consultas no fechamento do APP;
- [x] Mostrar a listagem dos personagens (imagem e nome);
- [x] Criar um filtro para a listagem;
- [x] Criar uma paginação da listagem;
- [x] Ação de clique nos cards da listagem e exibir os detalhes (imagem, nome, descrição e personagens relacionados);
- [x] Ação de clique nos personagens relacionados e exibir os detalhes (imagem, nome, descrição e personagens relacionados);

### Testes
- [ ] Criar testes de unidade das regras de negócio;

## Observações
>- Foram implementados dois filtros via API, *nameStartsWith* e *orderBy*;
>- A páginação na listagem de personagens acontece quando o usuário rola a lista de personagens até o final, se tiver mais personagens eles são carregados;
>- Na *home_page.dart* existem dois códigos que podemos testar o funcionamento do crashlytics;

