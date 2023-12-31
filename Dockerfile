FROM nikolaik/python-nodejs:python3.9-nodejs18
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY . /app/
WORKDIR /app/
RUN git clone https://github.com/anasty17/mirror-leech-telegram-bot
RUN cd mirror-leech-telegram-bot && pip3 install -r requirements-cli.txt
CMD cd mirror-leech-telegram-bot && bash start
