@echo off

:: to use you can call it like -> .\GenerateNugets.cmd "C:\Source\MyRepo" "C:\TMP" 

@setlocal enableextensions enabledelayedexpansion

set nuget[0]=prefix.assemblyName
set nuget[1]=prefix.assemblyName
set nuget[2]=prefix.assemblyName
set nuget[3]=prefix.assemblyName
set nuget[4]=prefix.assemblyName
set nuget[5]=prefix.assemblyName
set nuget[6]=prefix.assemblyName
set nuget[7]=prefix.assemblyName
set nuget[8]=prefix.assemblyName
set nuget[9]=prefix.assemblyName

@echo "-------------------------------------------------------------------------------"
@echo "We are on"
@echo "-------------------------------------------------------------------------------"

@echo %1
cd %1

@echo "-------------------------------------------------------------------------------"
@echo "PACKING STUFFF"
@echo "-------------------------------------------------------------------------------"

for /l %%n in (0,1,9) do (
    set n=*!nuget[%%n]!*.csproj 
    for /R %%f in (!n!) do (
        set fN=%%f
        if "!fN:Test=nothing!"=="!fN!" (
            @echo "-->"%%f"<--"
            dotnet pack %%f --include-symbols --configuration Release --verbosity q 
        )
    )
)

@echo "-------------------------------------------------------------------------------"
@echo "PACKING FINISHED"
@echo "-------------------------------------------------------------------------------"

mkdir %2"/TempNuggets/Symbols"
mkdir %2"/TempNuggets/Nuggets"

for /R %%f in (*prefix*.nupkg) do (
    set str1=%%f
    if "!str1:symbols=sap!"=="!str1!" (xcopy /Y %%f %2\TempNuggets\Nuggets) else (xcopy /Y %%f %2\TempNuggets\Symbols)
)
exit /b