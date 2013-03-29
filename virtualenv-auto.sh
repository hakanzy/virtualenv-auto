########## Run Auto Virtualenvs ##########
# USAGE for config: project_source_folder::project_virtualenv_folder
folders="
/home/user/projects/project_name::/home/user/virtualenvs/project_name
/home/user/projects/foobar::/home/user/.virtuals/foobar
"

function cd () {
        builtin cd "$@"
        cdir=$(pwd)

        for folder in $folders; do
                prdir=$(echo $folder | awk -F'::' '{print $1}')
                vrdir=$(echo $folder | awk -F'::' '{print $2}')

                if [[ $cdir =~ ^$prdir ]] && [[ $VIRTUAL_ENV != $vrdir ]] && [ -f "$vrdir/bin/activate" ]; then
                        source $vrdir/bin/activate
                fi
        done
}
########## Run Auto Virtualenvs ##########
