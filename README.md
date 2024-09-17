
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

### Funcionalidades do projeto
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

## Observações
>- Foram implementados dois filtros via API, *nameStartsWith* e *orderBy*;
>- A páginação na listagem de personagens acontece quando o usuário rola a lista de personagens até o final, se tiver mais personagens eles são carregados;
>- Na *home_page.dart* existem dois códigos que podemos testar o funcionamento do crashlytics;

## Prints das telas e funcionalidades do app
> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/32513744/368209713-3bb746eb-7329-42f0-a135-788420694443.PNG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240917%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240917T143610Z&X-Amz-Expires=300&X-Amz-Signature=8422472f596e6a440b0f5f9818295e86c26c8747464e0f87e5d7818d4d43c284&X-Amz-SignedHeaders=host&actor_id=32513744&key_id=0&repo_id=858153668" width="200"/> <img src="https://github.com/user-attachments/assets/d969e5db-4476-4bbf-bcc0-6d2cc436d15c" width="200"/> 

> <img src="https://github.com/user-attachments/assets/7857047f-4363-421d-b013-77703c0864a8" width="200"/> <img src="https://github.com/user-attachments/assets/8dba6303-967a-4d17-b10b-1189cc32b231" width="200"/> <img src="https://github.com/user-attachments/assets/a600ec85-ea68-4190-aab3-60ac7ad49b87" width="200"/> <img src="https://github.com/user-attachments/assets/47d6bf2b-ce34-4785-8c2f-035f2509de79" width="200"/>

> <img src="https://github.com/user-attachments/assets/ac42253c-1d70-45b0-8c3c-82ccfbe0d1b8" width="200"/> <img src="https://github.com/user-attachments/assets/dbaf727d-3943-4ae6-ad30-4f2e23c70c1d" width="200"/>

> <img src="https://github.com/user-attachments/assets/6c83a35c-6b54-47d5-a741-bc65d3b73634" width="200"/> <img src="https://github.com/user-attachments/assets/a090e90c-1d44-4765-93f2-957c7b4e545a" width="200"/>

> <img src="https://github.com/user-attachments/assets/c8490246-288e-4609-bb74-2dd82f5044be" width="200"/> <img src="https://github.com/user-attachments/assets/b31a9aed-757d-4189-b830-48fa6f87e005" width="200"/>

> <img src="https://github.com/user-attachments/assets/82f82670-f3fa-4265-afe7-82d219257f93" width="200"/>






