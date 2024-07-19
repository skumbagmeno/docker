FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /App
COPY ../var/repos/bollettino .
#ENV DOTNET_EnableDiagnostics=0
ENTRYPOINT ["dotnet", "Web.dll"]