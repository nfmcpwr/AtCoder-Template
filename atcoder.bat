@echo off

if "%1"=="" goto NoArgs

mkdir %1

dotnet new sln --output %1

for %%c in (a b c d e f g) do (
    dotnet new console -n %%c -f "net9.0" -lang "C#" -o %1\%%c --use-program-main
    powershell -Command "(Get-Content -Path %1\%%c\%%c.csproj) -replace '<ImplicitUsings>enable</ImplicitUsings>', '<ImplicitUsings>disable</ImplicitUsings>' | Set-Content -Path %1\%%c\%%c.csproj -Encoding UTF8"
    dotnet sln %1\%1.slnx add %1\%%c\%%c.csproj
)

:NoArgs
echo "No arguments"