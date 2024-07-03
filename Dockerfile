#上から順に実行される

#python:3.11-slimの公式イメージをもとにする
FROM python:3.11-slim

#ビルド時に実行するコマンド jupyterをインストール
RUN pip install jupyterlab

#ホストOSのrequirements.txtをコンテナイメージの / にコピー
COPY requirements.txt /

#pip installコマンドを実行して/requirements.txtの内容をインストールする
RUN pip install -r /requirements.txt

WORKDIR /notebooks

#docker run コマンドで実行されるデフォルトのコマンド
#ルート権限でのアクセスを許可し、外部からのアクセスを許可し、ブラウザを立ち上げず、認証をスキップする
CMD ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--no-browser", "--NotebookApp.token=''"]


