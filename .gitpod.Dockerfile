FROM gitpod/workspace-postgres

USER root
RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && \
    dpkg -i erlang-solutions_2.0_all.deb && \
    apt-get update && \
    apt-get install -y erlang && \
    apt-get install -y esl-erlang && \
    apt-get install -y elixir && \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.5.3 --force && \ 
    mix local.rebar --force

USER 1001

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

CMD ["mix", "phx.server"]