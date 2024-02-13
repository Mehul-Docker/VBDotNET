FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8

RUN powershell -Command Add-WindowsFeature Web-Server; Invoke-WebRequest -UseBasicParsing -Uri "https://dotnetbinaries.blob.core.windows.net/servicemonitor/2.0.1.10/ServiceMonitor.exe" -OutFile "C:\ServiceMonitor.exe"
 
ADD . /inetpub/wwwroot
 
EXPOSE 80

ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]

MAINTAINER MehulSolanki

LABEL NAME=VBDotNET
