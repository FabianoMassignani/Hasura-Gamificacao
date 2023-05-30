# Define a imagem base
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

# Copia os arquivos do projeto e restaura as dependências
COPY . ./
RUN dotnet restore

# Publica a aplicação
RUN dotnet publish -c Release -o out

# Define a imagem de execução
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
WORKDIR /app
COPY --from=build /app/out ./

# Define a porta exposta pela aplicação
EXPOSE 8443

# Inicia a aplicação
ENTRYPOINT ["dotnet", "hasura_swagger.dll"]
