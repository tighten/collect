#!/usr/bin/env bash

##
 # Include dotfiles on file operations
 #
shopt -s dotglob

##
 # App
 #
function main()
{
    echo "Upgrading..."

    prepareEnvironment

    displayVariables

    cleanDirectories

    downloadRepository

    extractZip

    copyClasses

    copyContracts

    copyTraits

    copyStubs

    downloadTests

    renameNamespace

    fillAliases

    cleanupDir

    runTests
}

##
 # Prepare the environment
 #
function prepareEnvironment()
{
    ##
     # Define all variables
     #
    rootDir=.
    baseDir=${rootDir}/src
    vendor=laravel
    project=framework
    oldNamespace='Illuminate'
    newNamespace='Tightenco\\Collect'
    newDir='Collect'
    repository=https://github.com/$vendor/$project.git

    getCurrentVersionFromGitHub

    repositoryDir=${rootDir}/$project-${collectionVersion}
    repositorySrcDir=${repositoryDir}/src
    collectionZip=${rootDir}/$project-${collectionVersion}.zip
    collectionZipUrl=https://github.com/$vendor/$project/archive/v${collectionVersion}.zip
    oldNamespaceDir=${repositorySrcDir}/${oldNamespace}
    newNamespaceDir=${baseDir}/${newDir}
    testsDir=${rootDir}/tests
    testsBaseUrl=https://raw.githubusercontent.com/${vendor}/${project}/v${collectionVersion}/tests
    stubsDir=${rootDir}/stubs
    aliasFile=${baseDir}/${newDir}/Support/alias.php
carriageReturn="
"

    classes=(
        'Support/Collection'
        'Support/Arr'
        'Support/Carbon'
        'Support/HigherOrderCollectionProxy'
        'Support/HigherOrderTapProxy'
        'Support/HtmlString'
        'Support/Optional'
        'Support/Str'
        'Support/Debug/Dumper'
        'Support/Debug/HtmlDumper'
    )

    traits=(
        'Support/Traits/Macroable.php'
    )

    contracts=(
        'Contracts/Support/Arrayable.php'
        'Contracts/Support/Jsonable.php'
        'Contracts/Support/Htmlable.php'
    )

    tests=(
        'Support/SupportCollectionTest.php'
        'Support/SupportArrTest.php'
        'Support/SupportMacroableTest.php'
        'Support/SupportStrTest.php'
        'Support/SupportCarbonTest.php'
    )

    stubs=(
        'src/Collect/Support/helpers.php'
        'src/Collect/Support/alias.php'
        'tests/bootstrap.php'
    )
}

##
 # Display all variables
 #
function displayVariables()
{
    echo
    echo "-- Variables"
    echo "---------------------------------------------"

    echo baseDir = ${baseDir}
    echo collectionVersion = ${collectionVersion}
    echo repositoryDir = ${repositoryDir}
    echo repositorySrcDir = ${repositorySrcDir}
    echo collectionZip = ${collectionZip}
    echo baseDir = ${baseDir}
    echo oldNamespace = ${oldNamespace}
    echo newNamespace = ${newNamespace}
    echo oldNamespaceDir = ${oldNamespaceDir}
    echo newNamespaceDir = ${newNamespaceDir}
    echo testsDir = ${testsDir}
    echo testsBaseUrl = ${testsBaseUrl}

    echo "---------------------------------------------"
}

##
 # Clean the destination directory
 #
function cleanDirectories()
{
    echo "Cleaning ${baseDir} and ${testsDir}/Support..."

    if [ -d ${baseDir} ]; then
        rm -rf ${baseDir}
    fi

    if [ -d ${testsDir}/Support ]; then
        rm -rf ${testsDir}
    fi

    if [ -d ${repositoryDir} ]; then
        rm -rf ${repositoryDir}
    fi
}

##
 # Download a new version
 #
function downloadRepository()
{
    echo "-- Downloading ${collectionZipUrl} to ${baseDir}"

    wget ${collectionZipUrl} -O ${collectionZip} >/dev/null 2>&1
}

##
 # Extract from compressed file
 #
function extractZip()
{
    echo "-- Extracting $project.zip..."

    unzip ${collectionZip} -d ${rootDir} >/dev/null 2>&1

    rm ${collectionZip}
}

##
 # Copy classes
 #
function copyClasses()
{
    echo "-- Copying classes and contracts..."

    for class in ${classes[@]}; do
        echo "Copying ${oldNamespaceDir}.php/${class}.php..."

        mkdir -p $(dirname ${newNamespaceDir}/${class})

        cp ${oldNamespaceDir}/${class}.php ${newNamespaceDir}/${class}.php
    done
}

##
 # Move contracts
 #
function copyContracts()
{
    echo "-- Copying contracts..."

    for contract in ${contracts[@]}; do
        echo "Copying ${oldNamespaceDir}.php/${contract}..."

        mkdir -p $(dirname ${newNamespaceDir}/${contract})

        cp ${oldNamespaceDir}/${contract} ${newNamespaceDir}/${contract}
    done
}

##
 # Move traits
 #
function copyTraits()
{
    echo "-- Copying traits..."

    for trait in ${traits[@]}; do
        echo "Copying ${oldNamespaceDir}.php/${trait}..."

        mkdir -p $(dirname ${newNamespaceDir}/${trait})

        cp ${oldNamespaceDir}/${trait} ${newNamespaceDir}/${trait}
    done
}

##
 # Copy classes and contracts
 #
function copyStubs()
{
    echo "-- Copying stubs..."

    for stub in ${stubs[@]}; do
        echo "Copying ${stubsDir}/${stub} to ${rootDir}/${stub}..."

        mkdir -p $(dirname ${rootDir}/${stub})

        cp ${stubsDir}/${stub} ${rootDir}/${stub}
    done
}

##
 # Fill the alias.php file with the list of aliases
 #
function fillAliases()
{
    echo "-- Filling aliases.php..."

    indent='    '
    aliases='CARRIAGERETURN'

    for class in ${classes[@]}; do
        aliases="${aliases}${indent}${oldNamespace}/${class}::class => ${newNamespace}/${class}::class,CARRIAGERETURN"
    done

    aliases=${aliases//\//\\\\}

    sed -i "" -e "s|/\*--- ALIASES ---\*/|${aliases}|g" $aliasFile
    sed -i "" -e "s|CARRIAGERETURN|\\${carriageReturn}|g" $aliasFile
}

##
 # Copy tests to our tests dir
 #
function getCurrentVersionFromGitHub()
{
    echo Getting current version from $repository...

    collectionVersion=$(git ls-remote $repository | grep tags/ | grep -v {} | cut -d \/ -f 3 | cut -d v -f 2 | sort --version-sort | tail -1)

    echo Upgrading to $vendor/$project $collectionVersion
}

##
 # Download tests to tests dir
 #
function downloadTests()
{
    echo "-- Copying tests..."

    tests=(
        'Support/SupportCollectionTest.php'
        'Support/SupportArrTest.php'
        'Support/SupportMacroableTest.php'
        'Support/SupportStrTest.php'
        'Support/SupportCarbonTest.php'
    )

    for test in ${tests[@]}; do
        echo "---- Downloading test ${testsBaseUrl}/${test} to ${testsDir}/${test}..."

        mkdir -p $(dirname ${testsDir}/${test})

        wget ${testsBaseUrl}/${test} -O ${testsDir}/${test} >/dev/null 2>&1
    done
}

##
 # Rename namespace on all files
 #
function renameNamespace()
{
    echo "-- Renaming namespace from $oldNamespace to $newNamespace..."

    find ${newNamespaceDir} -name "*.php" -exec sed -i "" -e "s|${oldNamespace}|${newNamespace}|g" {} \;
    find ${testsDir} -name "*.php" -exec sed -i "" -e "s|${oldNamespace}|${newNamespace}|g" {} \;
}

##
 # Clenup dir
 #
function cleanupDir()
{
    echo "-- Cleaning up ${repositoryDir}..."

    rm -rf ${repositoryDir}
}

##
 # Run tests
 #
function runTests()
{
    echo "-- Running tests..."

    if [ -f ${rootDir}/composer.lock ]; then
        rm ${rootDir}/composer.lock
    fi

    if [ -d ${rootDir}/vendor ]; then
        rm -rf ${rootDir}/vendor
    fi

    composer install

    vendor/bin/phpunit
}

##
 # Run the app
 #
main $@
