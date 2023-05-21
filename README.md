### Install kafka playground

```shell
make setup
```

### Commands to play with kafka

#### Create topic
kafka-topics --bootstrap-server BROKERURL --topic TOPICNAME --create --partitions NUMOFPARTITIONS --replication-factor REPLICATIONFACTOR

###### _Example_

```shell
kafka-topics --bootstrap-server 192.168.57.70:9092 --topic test --create --partitions 3 --replication-factor 3
```

#### Describe Topic
kafka-topics --bootstrap-server BROKERURL --topic TOPICNAME --describe

###### _Example_

```shell
kafka-topics --bootstrap-server 192.168.57.70:9092 --topic test --describe
```

#### Alter topic config
kafka-configs --bootstrap-server BROKERURL --alter --entity-type topics --entity-name TOPICNAME --add-config key=value

###### _Example_

```shell
kafka-configs --bootstrap-server 192.168.57.70:9092 --alter --entity-type topics --entity-name test --add-config segment.bytes=1000
```

#### Getting partition metadata from zookeeper

get /brokers/topics/TopicName/partitions/PartitionNumber/state

###### _Example_

```shell
get /brokers/topics/test/partitions/0/state
```


#### Produce message

kcat -b BROKERURL -P  -t TOPICNAME -p PARTITIONNUMBER

###### _Example_

```shell
kcat -b 192.168.57.70:9092 -P  -t test -p 0
```


#### Consume message

kcat -b BROKERURL -G CONSUMERGROUPID TOPICS (space seperated)

###### _Example_

```shell
kcat -b 192.168.57.70:9092  -G testGroup1  test test-new
```

#### Check  Consumer groups

kafka-consumer-groups --bootstrap-server BROKERURL --group CONSUMERGROUPID --describe

###### _Example_

```shell
 kafka-consumer-groups  --bootstrap-server 192.168.57.70:9092 --group testGroup1 --describe
```

#### Check consumer group coordinator

kafka-consumer-groups --bootstrap-server BROKERURL --group CONSUMERGROUPID --describe --state

###### _Example_

```shell
 kafka-consumer-groups  --bootstrap-server 192.168.57.70:9092 --group testGroup1 --describe --state
```

#### Dump log contents

```shell
 cd /var/lib/kafka/data/test-0/
 kafka-run-class kafka.tools.DumpLogSegments --files 00000000000000000000.log --print-data-log

```