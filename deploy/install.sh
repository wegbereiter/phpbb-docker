if [ -z $1 ]; then
    echo "Please specify an app name";
    exit 1
fi

rancher context switch Wegbereiter
rancher apps install -n phpbb ./deploy/chart $1
