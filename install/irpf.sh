#!/bin/bash -e

if [ -z $(java -version 2>&1 | grep 'version "1.7') ]; then
    echo -e "\033[31m~~~~~> Error: Java 1.7 is required <~~~~~\033[0m"
    exit 1
fi

irpf=2016/IRPF2016Linux-x86_64v1.2.bin
receitanet=Receitanet-1.07-x64.bin

pushd $(mktemp -d)
  wget -qO irpf.bin \
       downloadirpf.receita.fazenda.gov.br/irpf/$irpf
  chmod +x irpf.bin
  ./irpf.bin

  wget -qO receitanet.bin \
       www.receita.fazenda.gov.br/publico/programas/receitanet/$receitanet
  chmod +x receitanet.bin
  ./receitanet.bin

  echo 'java -jar /usr/local/IRPF2016/irpf.jar' &> /dev/null \
      | sudo tee /bin/irpf
popd
