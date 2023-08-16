# Nested Virt Vagrant

ネストされた仮想化環境をVagrantで用意するためのVagrantfileなどのutil

## 事前準備
Vagrant及びVagrant Libvirt Providerをinstallする必要があります

- [Install Vagrant](https://developer.hashicorp.com/vagrant/docs/installation)
- [Installation - Vagrant Libvirt Documentation](https://vagrant-libvirt.github.io/vagrant-libvirt/installation.html)

## 実行方法
1. このレポジトリをクローンする
1. クローンしたプロジェクトの`l1-vagrant`に移動
1. `vagrant up`でL1 Linuxの仮想環境を用意する。このとき、`l2-vagrant`の内容もコピーされ、L1 Linux内にL0 Linuxも立ち上がる
1. `vagrant ssh`でL1 Linuxにログインする
1. L1 Linux内の`~/l2-linux`に移動して`vagrant ssh`することでL0 Linuxにログインする

## Provisioning
`l1-vagrant`及び`l2-vagrant`内の`init.sh`ファイルが仮想マシン作成時に実行される。`init-user.sh`は`init.sh`が実行後、マシンを再起動させてからユーザー権限で実行される。
この内容を変更して仮想マシンに再度適用したい場合は`vagrant provision`コマンドを実行する。

## Networking
ネットワークブリッジ作成のため、`l1-vagrant/Vagrantfile`内に以下のような記述があります。
```
    # enable network bridge
    # Ref: https://developer.hashicorp.com/vagrant/docs/networking/public_network
    l1.vm.network "public_network", bridge: "enp7s0", dev: "enp7s0"
```
この`bridge`や`dev`で指定されているインターフェースが存在しない場合、`vagrant up`が成功しないのでインターフェース名は適宜書き換えてください。
また、ネットワークブリッジが不要な場合はこの行をコメントアウトしてください