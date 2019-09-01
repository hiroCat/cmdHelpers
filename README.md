# cmdHelpers
Some scripts to make things simpler when working with multiple solutions in dotnet
At the moment there are 3 files ( 1 missing) one is a sh script , the other ones are cmd files. 

## Run Tests 
This two files do more or less the same, in the sh version you don't have that much verbosity. 
The scripts are designed to be run like 
````
.\RunTests.cmd "C:\Source\myRepo" 
````
Then it takes the folder as the root of the source code and it compiles it / runs all the tests that finds (searching by csproj).
For the test project it searches for the string "Test" in all the full path.

## Generate Nugets
In this second one the idea was to have an input list of the nugets that you want to generate and the script searches for the projects / builds them and generates the nuget and symbol packet.
The script is designed to be run like 
````
.\GenerateNugets.cmd "C:\Source\MyRepo" "C:\TMP" "Release"
````
It's not done as the other to run for all the projects / searching for something since some dependencies may arise and this way it can be customized which project to run first 

