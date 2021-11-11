set -e

function test_heasoft() {
    which fstatistic
    fstatistic --version
}

function test_xspec() {
    python -c 'import xspec; print(xspec.__file__)'
}

function test_xmmselect() {
    xmmselect --version
}

for f in $(< $BASH_SOURCE awk -F'[() ]' '/^function +test_/ {print $2}') ; do
    echo -e "\n\ttesting $f ... "
    echo -e "\t--------------------------"

    logfile=$f.log 


    if $f > $logfile 2>&1; then
        echo -e "$f \e[32mPASSED\e[0m"
    else
        echo -e "$f \e[31mFAILED\e[0m"
        cat $logfile
    fi
done

