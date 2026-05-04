alias generate_icons='for i in `cat manifest.json| jq -r ".icons" | jq -r "keys[]"`; do cp assets/WSJ.png assets/icon$i.png && sips -Z $i assets/icon$i.png; done'

git_init() {
  current_dir=$PWD
  current_dir_name="${PWD##*/}"
  if [ -z "$1" ]; then
    # No argument provided, using default
    current_dir_name="${PWD##*/}"
  else
    current_dir_name="$1"
  fi
  git_origin="/Users/umairashraf/.mounty/My Passport/MacBook Pro M1/umairashraf/Develop/$current_dir_name"
  mkdir -p "$git_origin"
  if [ -d "$git_origin" ]; then
    cd "$git_origin"
    git init --bare
    cd "$current_dir"
    if [ -d "$current_dir/.git" ]; then
    else
      git init
    fi
    if git config --get "remote.mypassport.url" > /dev/null; then
    else
      git remote add mypassport "$git_origin"
    fi
  fi
}
