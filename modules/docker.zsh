function docker-connect {
  docker exec -i -t $1 sh
}

function docker-clean-images {
  docker rmi -f $(docker images --all --quiet)
}

function docker-clean-containers {
  docker rm $(docker ps --filter "status=exited" --quiet)
}

function docker-kill-clean {
  if [ "$(docker ps -q)" != "" ]; then
    echo "Kill running containers"
    docker kill $(docker ps --quiet)
    echo
  fi
  if [ "$(docker ps -aq)" != "" ]; then
    echo 'Remove all containers'
    docker rm $(docker ps --quiet --all)
    echo
  fi
  #docker network rm $(docker network ls --filter driver=bridge | grep -v -E -e "(NETWORK ID .*|.*\s+bridge\s+bridge\s+.*)" | sed -r 's/(\w+).*/\1/')
  docker network rm $(docker network ls --filter driver=bridge --quiet)
  docker volume rm $(docker volume ls -qf dangling=true) 
  echo
}

# docker run -it --rm alpine /bin/sh
