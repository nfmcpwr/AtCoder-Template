@echo off

if "%1"=="" goto NoArgs

mkdir %1

dotnet new sln --output %1

for %%c in (a b c d e f g) do (
    dotnet new atcoder -n %%c -f "net9.0" -lang "C#" -o %1\%%c --use-program-main
    dotnet sln %1\%1.slnx add %1\%%c\%%c.csproj
)

:NoArgs
echo "No arguments"
