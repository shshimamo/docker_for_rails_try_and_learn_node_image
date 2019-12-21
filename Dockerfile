FROM ruby:2.6.1-stretch

# アプリケーションを配置するディレクトリ
WORKDIR /app

# Bundlerでgemをインストールする
ARG BUNDLE_INSTALL_ARGS="-j 4"
COPY Gemfile Gemfile.lock ./
RUN bundle install ${BUNDLE_INSTALL_ARGS}

# nodeのイメージからNode.jsとYarnをコピーする
COPY --from=node:10.15.3-stretch /usr/local/ /usr/local/
COPY --from=node:10.15.3-stretch /opt/ /opt/

# エントリーポイントを設定する
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# アプリケーションのファイルをコピーする
COPY . ./

# サービスを実行するコマンドとポートを設定する
CMD ["rails", "server", "-b", "0.0.0.0"]
EXPOSE 3000
