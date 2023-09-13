# Como criar pipeline de sync entre repositórios Azure e GitHub

- Criar pipeline usando como base esse repositório

- Definir as variáveis no pipeline

    - `REPO_ORIGIN` : Parte da URL do repositório de origem
    - `REPO_DESTIN` : Parte da URL do repositório de destino
    - `REPO_ORIGIN_TOKEN` : Token de acesso repositório de origem
    - `REPO_DESTIN_TOKEN` : Token de acesso repositório de destino

- Exemplo de `REPO_ORIGIN` e `REPO_DESTIN`
    - Azure
        - `dev.azure.com/fitbank/Digital%20Banking%20-%20Credit%20-%20Data%20Office/_git/<nome-do-repositório>`
        
    - GitHub
        - `github.com/Fitbank-Pagamentos-Eletronicos/<nome-do-repositório>`

- Para pegar o Token de acesso:
    - Azure
        - [Criar um PAT](https://learn.microsoft.com/pt-br/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=Windows#create-a-pat)

    - GitHub
        - [Criando um PAT classic](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic)

