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

# Erro no pipeline de sync

```yml
Pushing git updates
To https://github.com/Fitbank-Pagamentos-Eletronicos/<nome do repositório>
! [rejected]        master -> master (fetch first)
branch 'teste_branch' set up to track 'origin/teste_branch'.
error: failed to push some refs to 'https://github.com/Fitbank-Pagamentos-Eletronicos/<nome do repositório>'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
##[error]Bash exited with code '1'
```

### Problema
- Exemplo: **Sync Azure para GitHub:** Este erro ocorre quando o repositório de `destino` no GitHub já contém alterações que não estão presentes no repositório de `origem` na Azure. Quando o script tenta sincronizar os dois repositórios, ele não consegue fazer o push das alterações da Azure para o GitHub devido a essas diferenças.

### Resolução
- Para resolver isso é necessário:
    - Voltar as alterações feitas na Azure.
    - Rodar o pipeline de **Sync GitHub para Azure**
    - Commitar novamente as alterações na Azure 
    - Rodar o pipeline de **Sync Azure para GitHub**

### Precauções
- Evitar desenvolvimento simutâneo nos dois repositórios 
- Sempre verificar se existe alterações em um repositório e verificar se foi feito o **Sync** para o outro repositório