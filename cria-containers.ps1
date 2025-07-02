# Pergunta a branch desejada
$branchName = Read-Host "Digite o nome da branch: "

function AtualizaBuildRun ($projectPath, $containerName, $imageName, $dockerfilePath, $portMapping, $branchName) {
    Write-Host "-------------------------------"
    Write-Host "Processando projeto em $projectPath"
    Set-Location -Path $projectPath

    # Força checkout para a branch informada
    Write-Host "Trocando para a branch $branchName..."
    git checkout $branchName

    # Atualiza a branch informada
    Write-Host "Atualizando branch $branchName..."
    git pull origin $branchName

    # Para e remove container antigo se existir
    if (docker ps -a --format '{{.Names}}' | Select-String -Pattern $containerName) {
        Write-Host "Parando container antigo ($containerName)..."
        docker stop $containerName
        docker rm $containerName
    }

    # Builda a imagme Docker
    Write-Host "Buildando a imagem Docker ($imagemName)..."
    docker build -t $imageName -f $dockerfilePath .

    # Roda o container
    Write-Host "Iniciando container ($containerName)..."
    docker run -d --name $containerName -p $portMapping $imageName
    Write-Host "Container $containerName iniciado!"
    Write-Host "-------------------------------"
}

# Backend
AtualizaBuildRun `
-projectPath "caminho\do\arquivo" `
-containerName "name-container-back" `
-imageName "name-container-back-image" `
-dockerfilePath "Dockerfile" `
-portMapping "5000:5000"`
-branchName $branchName

# Frontend
AtualizaBuildRun `
-projectPath "caminho\do\arquivo" `
-containerName "name-container-front" `
-imageName "name-container-front-image" `
-dockerfilePath "Dockerfile" `
-portMapping "4200:80"`
-branchName $branchName

Write-Host "Todos os containers foram atualizados e iniciados com sucesso!"