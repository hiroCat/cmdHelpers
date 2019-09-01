@echo off

:: to use you can call it like -> .\RunTests.cmd "C:\Source\myRepo" 

@echo "-------------------------------------------------------------------------------"
@echo "We are on"
@echo "-------------------------------------------------------------------------------"

@echo %1
cd %1

@echo "-------------------------------------------------------------------------------"
@echo "BUILD"
@echo "-------------------------------------------------------------------------------"

for /R %%f in (*.csproj) do (
    @echo "-->"%%f"<--"
    dotnet build %%f  --configuration Release --verbosity q 
)

@echo "-------------------------------------------------------------------------------"
@echo "RUN TESTS  FINISHED"
@echo "-------------------------------------------------------------------------------"

for /D /r %%f in ("*Test*") do (
    cd %%f
    for %%p in (*.csproj) do (
        @echo "-__->"%%p"<--"
        dotnet test %%f  --configuration Release --no-build --verbosity q
    )
)

exit /b