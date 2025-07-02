# devops-automation-docker

Este repositório contém um script PowerShell para automatizar a atualização dos containers Docker para projetos **backend** e **frontend**.

---

## O que este script faz?
- Pergunta ao usuário qual branch deseja utilizar
- Faz o checkout da branch e executa `git pull` para atualizar o repositório
- Para e remove containers antigos com o mesmo nome se existirem
- Builda novas imagens Docker a partir do Dockerfile dos respectivos projetos
- Inicia novos containers atualizados

--- 

## Como executar?
1. **Certifique-se de que o Docker Desktop esteja aberto e rodando**

2. Antes de executar o script, ajuste os caminhos reais do seu ambiente, como `projectPath`, `containerName`, `imageName`, `portMapping`

3. Abra o **PowerShell** e navegue até a pasta onde está o script:

```powershell
cd "C:\caminho\do\script"
```

4. Execute o script: `.\cria-containers.ps1`

5. Quando solicitado, digite o nome da branch que deseja atualizar.

--- 

## Possíveis erros

Se aparecer mensagem de política de execução, libere com:

```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Ou opte por copiar a pasta do script e colar no seu `Explorador de Arquivos` para executá-lo.