#!/bin/bash

# valida se aplicação está apta para o teste
out=`curl -I "https://www.w3schools.com" -s | grep "HTTP" | cut -d " " -f 2`

if [ "$out" == 200 ];
  then echo "OK App está pronto para testar";
elif [ "$out" != "200" ];
  then out=`curl -I "https://www.w3schools.com" -s | grep "HTTP" | cut -d " " -f 2`;
  while :
  do
    resp=`curl -I "www.w3schools.com" -s | grep "HTTP" | cut -d " " -f 2`
    echo "Está OK?"
    sleep 4
    if [ "$resp" == "200" ];
    then echo "Agora está OK";
      break;
    fi
  done
  echo "Começando o teste"
fi


# create default display
Xvfb :99 -ac -screen 0 1900x1200x16 &

# export default display
export DISPLAY=:99

# run test
bundle exec rspec --order defined spec/features/*

# if tests failed re-run
bundle exec rspec --order defined spec/features/* --only-failures
bundle exec rspec --order defined spec/features/* --only-failures