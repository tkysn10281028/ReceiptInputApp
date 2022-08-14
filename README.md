## Jenkinsインストール及びサーバ構築と初期設定

### Javaのインストール
```
sudo amazon-linux-extras install java-openjdk11   
```
### Jenkinsのインストール
```
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum info jenkins
```
yum info jenkinsの表示結果でjenkinsは利用できませんと出ていなければ成功 installできる状態になっている   
※centos7にのみ有効な方法。他のLinuxの場合は別途調べる。

追記：   
このダウンロード方法だとAWSの環境でダウンロードしようとしたら文字コードがANSIになってしまいあとの工程で詰むので、warファイルを公式からdownloadする方法がいいかも
→
文字コード問題発生時には、/etc/sysconfig/jenkinsへプロパティ「JAVA_ARGS」を設定。
https://qiita.com/LowSE01/items/3e39bf6f86e6884d69b1

```
sudo yum install jenkins
```
これでインストールはOK   

### Apacheインストール

```
sudo yum install httpd
```
インストールできたら/etc/httpd/conf.d/myapp.confを追加して以下を記載   

```
<VirtualHost *:80>
    ServerName サーバーのパス
    ProxyPass / http://localhost:8080/
    ProxyPassReverse / http://localhost:8080/ 
</VirtualHost>
```

終わったら以下の2つを実行してjenkins及びapacheを動作させてサーバーにブラウザからログイン   

```
sudo systemctl enable httpd
sudo systemctl enable jenkins
sudo systemctl start httpd
sudo systemctl start jenkins
```
参考：
https://weblabo.oscasierra.net/jenkins-install-centos7/

### jenkins初期設定
1. 以下のコマンドをサーバーのコマンドラインで実行して得られたパスを初期画面に入力(環境によって違うかも)
```
cat /var/lib/jenkins/secrets/initialAdminPassword
```
2. PlugInは理由なければrecommendedを使用
3. ユーザー名とパスを入力
4. 入力終わって他の画面飛ばせば完了
### PlugIn追加(追加予定あるかも)
1. Jenkinsのホーム画面→プラグインの管理→利用可能タブを選択
2. GoLangと検索してGo PlugInをダウンロード
3. jenkinsをrestartしたら有効化する
4. Global Tool ConfigurationでGoを追加の欄が出ているはずなので、お好みのバージョンを選択して保存する

### ジョブ追加
1. フリースタイルプロジェクトを選択
2. ビルド開始前にワークスペースを削除する Set up Go programming language tools の２項目にチェック
3. 一旦保存(Github連携などの設定は後述)

## JenkinsとGitHubの連携設定方法
色々サイトがあったが一番上が一番正確。ただところどころ足りないところがあるので他サイトで適宜補う。
https://developer.aiming-inc.com/infra/jenkins-github-webhook-collaboration/#outline__4_2
https://qiita.com/hika7719/items/4cb50366a4d9fc8415f6
https://stackoverflow.com/questions/15214977/cloning-git-repo-causes-error-host-key-verification-failed-fatal-the-remote/29380672#29380672
https://qiita.com/tz2i5i_ebinuma/items/528ea5163bb2df379852

### Jenkins側設定及びgithub web hooks
https://developer.aiming-inc.com/infra/jenkins-github-webhook-collaboration/#outline__4_2
の手順で大体OK(jenkins標準WebHookのやつ)
ただ、GitHubとSSH接続する設定をしていないのでGithub側の送信は失敗しているはず。

### jenkinsユーザーでgithubにsshできるようにする
https://qiita.com/hika7719/items/4cb50366a4d9fc8415f6   
を参考にやればできる。ただ記述や設定が足りない箇所があるので記載。
1. jenkinsユーザーのbashが有効になっていないので別途設定する。   
cat /etc/passwdでjenkinsの欄がbin/falseになっていたらbin/bashに書き換えする   
2. 上記サイトでもちらっと書いているが、普通にやると最後のsudo -u jenkins ssh -T git@ssh.github.comのところでpermission deniedされる。以下ステップを試してみる
3. 所有者をjenkinsユーザーにする
```
sudo chown jenkins id_rsa
```
4. known_hostsにGitHubを追加
https://stackoverflow.com/questions/15214977/cloning-git-repo-causes-error-host-key-verification-failed-fatal-the-remote/29380672#29380672

5. jenkinsの権限変更
git cloneした場合にdefaultのjenkinsの権限はmkdirできる権限がないのでgit cloneしようとしても失敗してしまう。jenkinsの権限を変更する必要がある(というかmkdirしたいディレクトリの所有者を変える)
```
cd jenkinsのジョブのディレクトリ
chown jenkins ジョブのディレクトリ
```

6. fail
