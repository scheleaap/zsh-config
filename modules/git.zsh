alias git-log="git log --graph --all --date=format:'%a %Y-%m-%d %H:%M' --pretty=format:' %C(blue bold)%h%C(reset) %C(white bold)%s%C(reset) %C(dim white)%an%C(reset)%n ↪  %C(dim green)%ar%C(reset) %C(dim cyan)%ad%C(reset)%C(auto)%d%C(reset)'"
alias git-hash='git rev-parse HEAD'

# find template in files folder
# git config --global commit.template ~/git_commit_template.txt


# npm install --global commitizen
# npm install --global cz-conventional-changelog
# echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc

# npm install --global conventional-changelog-cli

# npm install --global conventional-recommended-bump

function git-repository-version-latest {
  git describe --all --tags --match 'v*' --first-parent --abbrev=0 | sed 's|^v||'
}

function git-repository-version-bump-recommendation {
  latest_version=$(git-repository-version-latest)
  latest_version_array=($(echo "$latest_version" | grep -E -o "[^.-]+" ))
  latest_version_array[4]=$(echo "$latest_version" | sed "s|^[^-]*||" )

  next_version_array=($latest_version_array)
  if [ -n "$(git log --grep '^BREAKING CHANGE')" ]; then
    echo "major"
  elif [ -n "$(git log --grep '^feat')" ]; then
    echo "minor"
  else
    echo "patch"
  fi
}

function git-repository-version-next {
  latest_version=$(git-repository-version-latest)
  latest_version_array=($(echo "$latest_version" | grep -E -o "[^.-]+" ))
  latest_version_array[4]=$(echo "$latest_version" | sed "s|^[^-]*||" )

  next_version_bump_recommendation=$(git-repository-version-bump-recommendation)
  next_version_array=($latest_version_array)
  if [ "$next_version_bump_recommendation" = "major" ]; then
    next_version_array[1]=$((${next_version_array[1]}+1))
    next_version_array[2]=0
    next_version_array[3]=0
  elif [ "$next_version_bump_recommendation" = "minor" ]; then
    next_version_array[2]=$((${next_version_array[2]}+1))
    next_version_array[3]=0
  else
    next_version_array[3]=$((${next_version_array[3]}+1))
  fi

  next_version="${next_version_array[1]}.${next_version_array[2]}.${next_version_array[3]}${next_version_array[4]}"
  echo "$next_version"
}

function git-repository-version-compare {
  current_version=$1
  current_version_array=($(echo "$current_version" | grep -E -o "[^.-]+" ))

  next_version=$(git-repository-version-next)
  next_version_array=($(echo "$next_version" | grep -E -o "[^.-]+" ))

  if [ ${current_version_array[1]} -lt ${next_version_array[1]} ] \
  || [ ${current_version_array[2]} -lt ${next_version_array[2]} ] \
  || [ ${current_version_array[3]} -lt ${next_version_array[3]} ]; then
    >&2 echo "version needs to be at least $next_version"
    return 1
  fi
}

function git-delete-remote-branch {
  remote_branch=$1
  git push origin --delete ${remote_branch}
}

function git-delete-tag {
  tag=$1
  git tag -d $1
  git push origin :refs/tags/$1
}

function git-prune-branches-and-tags {
  git fetch --tags --progress origin "+refs/heads/*:refs/remotes/origin/*" --prune
}
