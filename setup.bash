
wd="$(pwd)"
bashrc="$HOME/.bashrc"
gitovr="$HOME/git-override"

cd "$(dirname "$0")"
gp="$(pwd)"


if [ ! -f "$bashrc" ]
then
    echo "Error: $bashrc does not exist" 1>&2
    exit 101
fi

if [ ! -d "$gitovr" ]
then
    mkdir "$gitovr"
    if [ $? != 0 ]
    then
        exit 102
    fi
    cd "$gitovr"
    ln -s "$gp/git-check" git
fi


path="$(grep -e '^\s*export\s\s*PATH=' "$bashrc" | tr '=' ' ' | tr '"' ' ' | awk '{print $3}')"
if [ ! "$path" ]
then
    path="$PATH"
fi
if [[ "$path" != *":$gitovr:"* ]]
then
    if [[ "$path" != "$gitovr:"* ]]
    then
        echo "Adding replacement PATH to end of $bashrc: $gitovr:$PATH"        
        echo "export PATH=\"$gitovr:$path\"" >> "$bashrc"
    fi
fi

cd $wd
