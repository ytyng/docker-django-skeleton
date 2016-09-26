~~~~~~~~~~~~~~~~~~~~~~
docker-django-skeleton
~~~~~~~~~~~~~~~~~~~~~~

* Docker
* Django1.10
* Python3
* uwsgi
* nginx
* PyCharm

code sample.

reference: https://github.com/dockerfiles/django-uwsgi-nginx


想定する環境
-----------------------

* macOS
* PyCharm + Bash Support
* Docker Toolbox



Dockerイメージの作成
-----------------------

docker/docker-01-build.sh

PyCharm で右クリック → Run でOK


PyCharm 設定
-----------------------

## PyCharm のインタプリタで Docker の Python を指定する

PyCharm → Preferences → 検索: interpreter

Project Interpreter が出てきます。

ここで、右上の「...」ボタンをクリックし、Add Remote を選択。

Configure Remote Python Interpreter になるので、
「Docker」を選択、Image name は docker-django-skeleton:latest を選択してください。

それと、Python interpreter path: は python となっていますが、python3 に変更します。

すると、Docker 内の Python 環境を認識します。すごい!


## Djangoサポートを有効にする

Preferences で、検索: django

Language & Frameworks の Django が出て来るので選択し、Enable Django Support にチェック。

Django project root: manage.py のある、docker-django-skeleton
Settings: docker_django_skeleton/settings/local.py
OKをクリック


## Project Structure を設定する

Preferences で、検索: structure

manage.py のある、docker-django-skeleton を選択し、Source をクリック → OK



## migrate

次は、./manage.py migrate をします。
docker コンテナ内なので、./manage.py を実行するのも少し面倒ですが、docker ディレクトリの中に manage.sh を作ってあるのでこれを使います。

$ cd docker
$ ./manage.sh

Type 'manage.py help <subcommand>' for help on a specific subcommand.

Available subcommands:

[auth]
    changepassword
    createsuperuser

[django]
    check
    compilemessages
...

$ ./manage.sh migrate
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, sessions
Running migrations:
  Applying contenttypes.0001_initial... OK
  Applying auth.0001_initial... OK
  Applying admin.0001_initial... OK
...

Docker の環境でマイグレーションしてくれました。

## テストサーバの起動

PyCharm の右上、Run/Debug の選択をクリックし、Edit Configurations...

Run/Debug Configurations ダイアログで、左上の + をクリック

Django server を選択

Host: には、0.0.0.0 を入力(重要)
Name: は適当に (例: runserver )
→ OK

出来た runserver 実行環境が選択されている状態で、虫(デバッグ) ボタンを押下

System check identified no issues (0 silenced).
September 26, 2016 - 09:54:15
Django version 1.10.1, using settings 'docker_django_skeleton.settings.local'
Starting development server at http://0.0.0.0:8000/
Quit the server with CONTROL-C.

となりますので、0.0.0.0:8000 をクリックするとブラウザが起動し、Docker マシーンにリダイレクトされてページが表示されます。
デバッガも有効な状態ですので、ブレイクポイントが使えます。すごい!



