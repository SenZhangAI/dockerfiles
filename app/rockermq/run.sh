echo "'conf/broker.conf' 文件中最好指定IP为本机IP，dockerIP会有问题"
echo "例如ifconfig 查到本机IP后 设置 brokerIP1=192.168.101.5 "

docker-compose up

