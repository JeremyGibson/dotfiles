# Heroku 
hrmanage() {
  heroku local:run python manage.py "$@"
}

hrmanages() {
    heroku run python manage.py "$@" --app csis-reconasia-bravo
}

hrmanagep() {
    heroku run python manage.py "$@" --app csis-reconasia-alfa
}

hrdb() {
    heroku local:run python manage.py dbshell
}

hrshell() {
    heroku local:run python manage.py shell -i ipython
}

hrdeploystaging() {
    git push staging staging:master
}

hrdeployproduction() {
    git push production master
}

dcclean() {
    docker rmi -f $(docker images -f "dangling=true" -q)
}

gs() {
    git status
}

gcv() {
    git commit -v
}

nbook() {
    jupyter-lab
}

new-branch() {
    git checkout develop
    git pull
    git checkout -b "$@"
}

run_tests() {
    ./manage.py test --parallel
}

rs() {
    ./manage.py runserver
}

staging_mmh() {
    ssh 174.129.122.129
}

prod_mmh() {
    ssh 3.209.35.94
}

dcmaint() {
    dc run db_maint bash
}

kbctl() {
    ~/Bin/kubectl "$@"
}

##Kubernetes stuff for RATOM
PODS= $(kubectl get pods | awk '{print $1}' | grep api)
IFS='\n' read -r -a pods <<< $PODS

kbshell() {
    kubectl exec -it ${pods[0]} -- /bin/bash
}
