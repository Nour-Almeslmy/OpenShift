#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 5000
ENV ASPNETCORE_URLS=http://*:5000

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["OpenShift/OpenShift_Area/OpenShift_Area.csproj", "OpenShift/OpenShift_Area/"]
COPY ["OpenShiftUtils/AreasUtils/AreasUtils.csproj", "OpenShiftUtils/AreasUtils/"]
RUN dotnet restore "OpenShift/OpenShift_Area/OpenShift_Area.csproj"
COPY . .
WORKDIR "/src/OpenShift"
RUN dotnet build "OpenShift_Area/OpenShift_Area.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "OpenShift_Area/OpenShift_Area.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "OpenShift_Area.dll"]