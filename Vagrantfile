VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # ベースイメージ
  config.vm.box = "ubuntu-14.04"

  # ホスト名
  config.vm.hostname = "sccp-dev-env"

  # 共有フォルダ
  config.vm.synced_folder "work_space/", "/home/vagrant/work_space"

  # プロビジョニング時の実行プログラム
  config.vm.provision "shell", :path => "provision.sh"

  # 仮想メモリ割り当て
  config.vm.provider "virtualbox" do |vb|
 	vb.customize ["modifyvm", :id, "--memory", "1024"]
	vb.gui = true
  end

  # ポート設定
  config.vm.network "forwarded_port", guest: 9292, host: 9292
  config.vm.network "forwarded_port", guest: 5432, host: 5432


end
