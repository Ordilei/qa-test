FROM ruby:2.3-onbuild

ENV LANG C.UTF-8

# Set working directory
WORKDIR /app

# Added dependencies file
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN apt-get update
RUN apt-get install -y wget ruby curl unzip bzip2 xvfb xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic
RUN gem install bundler
RUN bundle install

#install firefox
RUN wget -P /usr/local http://ftp.mozilla.org/pub/firefox/releases/51.0/linux-x86_64/en-US/firefox-51.0.tar.bz2
RUN tar -jxvf /usr/local/firefox-51.0.tar.bz2 -C /usr/local/
RUN ln -s /usr/local/firefox/firefox /usr/bin/firefox

#install chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update
RUN apt-get install -y google-chrome-stable

#install geckdriver e chromedriver
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.11.0/geckodriver-v0.11.0-linux64.tar.gz
RUN tar xvzf geckodriver-v0.11.0-linux64.tar.gz
RUN chmod +x geckodriver
RUN mv geckodriver /usr/local/bin/geckodriver

RUN wget http://chromedriver.storage.googleapis.com/2.32/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN chmod +x chromedriver
RUN mv chromedriver /usr/local/bin/chromedriver

ADD . /app/
RUN chmod +x /app/scripts/start-test.sh
CMD ["./scripts/start-test.sh"]