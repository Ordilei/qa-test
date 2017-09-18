[![N|Solid](http://static.catho.com.br/svg/site/logoCathoB2c.svg)](http://www.catho.com.br)
# Teste para vaga de QA 

## Arquitetura dos testes
### Ferramentas
 - linguagem Ruby
 - Rspec
 - Selenium
 - xvfb
 - docker
 - capybara
 - faker

### Estrutura
 - Page Object para estruturar o script de testes.
 - usando Xvfb para emular uma interface dentro do container(não é necessário caso queria rodar local, não emulando uma interface). 

Foi centralizado a execução dos scripts em um shell scrip, que está na pasta scripts esse script e foi estruturado para fazer uma validação no serviço, e verificar se o mesmo está retornando 200 para certificar se o teste pode começar a executar. Ao executar se algum teste falha é executado novamente para certificar se não foi uma oscilação eo mesmo falhar, ele tenta até 2 vezes re-executar o teste se ele quebrar é porque tem realmente algo errado. 

### Como executar os testes
Para executar os testes podemos fazer de 2 formas uma local e outra para executar dentro do CI(Jenkins, Travis e etc...).
##### Executando local
Para executar local você precisa ter a seguintes ferramentas instaladas:
- firefox(51+) ou chrome(ultima versão)
- geckodriver ou chromedriver
- Ruby 2.3.5
- bundler

Após clonar o projeto em seu diretório de trabalho é preciso executar esse comando antes de de começar:

``` gem install bundler```

Logo em seguida você deverá executar um ```bundle inatall``` 

##### Instalando o geckodriver
Mac OS
```brew install geckodriver```

Linux 

```wget https://github.com/mozilla/geckodriver/releases/download/v0.11.0/geckodriver-v0.11.0-linux64.tar.gz```

```tar xvzf geckodriver-v0.11.0-linux64.tar.gz```

```chmod +x geckodriver```

```mv geckodriver /usr/local/bin/geckodriver```

Para executar os testes local é preciso passar o seguinte comando:

```bundle exec rspec spec/features/test_form.rb```

##### Usando um Ci para executar os testes
Para executar em seu CI basta você ter apenas o docker instalado nele e executar o seguintes comandos:

Obs: É preciso ter o docker instalado onde será executado os testes 

[https://docs.docker.com/engine/installation/]

Para buildar sua imagem e gerar o container que irá executar os testes
``` docker build . -f scripts/Dockerfile -t test-catho ```

Após feito o build da imagem executamos o seguinte comando para rodar os testes
`` docker run test-catho``
### Referências

Lista de referências utilizadas para estruturar os testes.

| Ferramenta | README |
| ------ | ------ |
| Capybara | [https://github.com/teamcapybara/capybara/blob/master/README.md] |
| Rspec | [https://github.com/rspec/rspec/blob/master/README.md] |
| Selenium | [http://www.seleniumhq.org/docs/] |
| Xvfb | [https://www.x.org/archive/X11R7.6/doc/man/man1/Xvfb.1.xhtml] |
| Docker | [https://docs.docker.com/] |

