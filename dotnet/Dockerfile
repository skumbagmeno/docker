FROM mcr.microsoft.com/dotnet/aspnet:8.0
COPY var/repos/bollettino /App
WORKDIR /App
#ENV DOTNET_EnableDiagnostics=0
ENTRYPOINT ["dotnet", "Web.dll"]