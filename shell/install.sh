#!/bin/bash


opt_env=no
read -p "Install Env [y/n]: " opt_env

opt_mysql=no
read -p "Install MySQL [y/n]: " opt_mysql

opt_etcd=no
read -p "Install Etcd [y/n]: " opt_etcd

opt_prom=no
read -p "Install Prometheus [y/n]: " opt_prom

opt_go=no
read -p "Install Golang [y/n]: " opt_go

opt_graf_db=no
read -p "Install Grafana Database [y/n]: " opt_graf_db

opt_graf=no
read -p "Install Grafana [y/n]: " opt_graf

opt_juno_db=no
read -p "Install Juno Database [y/n]: " opt_juno_db

opt_juno_mock=no
read -p "Install Juno Mock [y/n]: " opt_juno_mock

opt_juno_admin=no
read -p "Install Juno Admin [y/n]: " opt_juno_admin


opt_juno_agent=no
read -p "Install Juno Agent [y/n]: " opt_juno_agent


opt_pprof=no
read -p "Install Pprof [y/n]: " opt_pprof


install=no
read -p "Start the installation [y/n]: " install

if [ "$install" != "y" ];then
  exit
fi


if [ "$opt_env" == "y" ];then
./install_dir.sh
./install_env.sh
./install_juno.sh
fi

if [ "$opt_mysql" == "y" ];then
  ./install_mysql.sh
  sleep 2
fi

if [ "$opt_go" == "y" ];then
  ./install_go.sh
fi

if [ "$opt_etcd" == "y" ];then
  ./install_etcd.sh
fi

if [ "$opt_prom" == "y" ];then
  ./install_prometheus.sh
fi

if [ "$opt_graf_db" == "y" ];then
  ./install_grafana_database.sh
fi

if [ "$opt_graf" == "y" ];then
  ./install_grafana.sh
fi

# juno admin must at head
if [ "$opt_juno_admin" == "y" ];then
  ./install_juno_admin.sh
fi

if [ "$opt_juno_db" == "y" ];then
  ./install_juno_database.sh
fi

if [ "$opt_juno_mock" == "y" ];then
  ./install_juno_mock.sh
fi


if [ "$opt_juno_agent" == "y" ];then
  ./install_juno_agent.sh
fi



if [ "$opt_pprof" == "y" ];then
  ./install_pprof.sh
fi
