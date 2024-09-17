
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
- caso o build do iOS falhar, o comando a seguir deve ser executado na pasta iOS:
```bash
$ arch -x86_64 pod update
```

## Projeto
```bash
Teste desenvolvido no nível 3, atendendo todos os requisitos descritos abaixo:
```

### Arquitetura
- [x] App Modularizado
    - Core
        > Módulo responsável por armazenar e compartilhar componentes necessários para estruturar o aplicativo, como: bibliotecas, provedor http, interceptors, method channel listener, enums, bindings em comum.
    - Commons
        > Módulo responsável por armazenar e compartilhar coisas em comum no aplicativo, nele podemos encontrar, imagens, icones, design system, rotas, fontes, enums, tamanhos, widgets, cores, controllers.
    - Home
        > Módulo com as principais telas do aplicativo.
    - App
        > Aplicativo principal, responsável por sobreescrever os demais módulos e possuir a estrutura de navegação inicial.
- [x] Arquitetura MVC
- [x] Clean architecture
- [x] Princípios do SOLID

### Gerenciamento de estado e navegação
- [x] Utilizar Getx.

### Serviços adicionais
- [x] Configurar Firebase crashlytics.
- [x] Configurar Firebase analytics e logar eventos de telas e ações.
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
- [x] Funcionalidade de favoritar personagem e excluir dos favoritos;
- [x] Adição de um novo ícone pro aplicativo;
- [x] Alteração do nome do aplicativo;

### Testes
- [x] Testes de unidade das regras de negócio;
> [Home] use cases responsáveis por realizarem as chamadas na api da marvel.

- [x] Testes de integração;
> [App] testes do fluxo de funcionalidades do aplicativo, como: 
>- home: carregar lista de personagens;
>- home: carregar mais personagens na lista, mostrando paginação;
>- home: buscar personagem através da busca;
>- home: ordenar listagem;
>- home: etc;

- [ ] Testes de widget;

## Observações
>- Foram implementados dois filtros via API, *nameStartsWith* e *orderBy*;
>- A páginação na listagem de personagens acontece quando o usuário rola a lista de personagens até o final, se tiver mais personagens eles são carregados;
>- Na *home_page.dart* existem dois códigos que podemos testar o funcionamento do crashlytics;