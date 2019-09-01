#  to use you can call it like -> ./RunTests.sh "C:\Source\myRepo"

echo "-------------------------------------------------------------------------------"
echo "We are on"
echo "-------------------------------------------------------------------------------"

echo $1
cd $1

echo "-------------------------------------------------------------------------------"
echo "BUILD"
echo "-------------------------------------------------------------------------------"

for p in $(find -name '*.csproj'); do 
    echo  "-->"$p"<--";
    if dotnet build $p --configuration Release --verbosity q | grep -q "Build succeeded."; then 
     echo "Build succeeded.";
    else 
     echo "Build FAILED.";
     fi 
done

echo "-------------------------------------------------------------------------------"
echo "Run Tests"
echo "-------------------------------------------------------------------------------"

for p in $(find -wholename '**/*Test*/*.csproj'); do 
    echo  "-->"$p"<--";
    if dotnet test $p  --configuration Release --no-build --verbosity q | grep -q "Test Run Successful"; then 
     echo "Test Run Successful";
    else 
     echo "Test Run FAILED.";
     fi 
done