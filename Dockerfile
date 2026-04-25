# 1. Etapa de Compilación (SDK de .NET 8)
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app

# Copiar el archivo de proyecto y restaurar dependencias
# Ajustamos la ruta para que apunte a tu carpeta src/Backend
COPY src/Backend/*.csproj ./
RUN dotnet restore

# Copiar el resto del código y publicar
COPY src/Backend/ ./
RUN dotnet publish -c Release -o out

# 2. Etapa de Ejecución (Runtime más ligero)
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build-env /app/out .

# Configurar el puerto para que sea dinámico (necesario para Render)
ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80

ENTRYPOINT ["dotnet", "Backend.dll"]
