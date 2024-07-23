FROM mcr.microsoft.com/dotnet/aspnet:8.0
COPY . /App
WORKDIR /App
#ENV DOTNET_EnableDiagnostics=0
ENV ASPNETCORE_URLS http://*:5000
ENTRYPOINT ["dotnet", "Web.dll"]