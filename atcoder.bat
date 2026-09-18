@echo off

if "%1" == "" (
   goto NoArgs
)

if "%1" == "uninstall" (
    goto Uninstall
)

dotnet new list | findstr "atcoder"
if %ERRORLEVEL% == 1 (
    call :NotInstalled
)

mkdir %1

dotnet new sln --output %1

for %%c in (a b c d e f g) do (
    dotnet new atcoder -n %%c -o %1\%%c
    dotnet sln %1\%1.slnx add %1\%%c\%%c.csproj
)

exit /b

:NoArgs
echo "No arguments"
exit /b

:NotInstalled
dotnet new install %~dp0Template
exit /b

:Uninstall
dotnet new uninstall %~dp0Template
exit /b