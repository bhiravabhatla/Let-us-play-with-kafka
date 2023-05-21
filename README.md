
### Create topic
kafka-topics --bootstrap-server BROKERURL --topic TOPICNAME --create --partitions NUMOFPARTITIONS --replication-factor REPLICATIONFACTOR

###### _Example_

<code>
kafka-topics --bootstrap-server 192.168.57.70:9092 --topic test --create --partitions 3 --replication-factor 3
</code>


### Describe Topic
kafka-topics --bootstrap-server BROKERURL --topic TOPICNAME --describe

###### _Example_

<code>
kafka-topics --bootstrap-server 192.168.57.70:9092 --topic test --describe
</code>

### Alter topic config
kafka-configs --bootstrap-server BROKERURL --alter --entity-type topics --entity-name TOPICNAME --add-config key=value

###### _Example_

<code>
kafka-configs --bootstrap-server 192.168.57.70:9092 --alter --entity-type topics --entity-name test --add-config segment.bytes=1000
</code>

### Getting partition metadata from zookeeper

get /brokers/topics/TopicName/partitions/PartitionNumber/state

###### _Example_

<code>
get /brokers/topics/test/partitions/0/state
</code>


### Produce message

kcat -b BROKERURL -P  -t TOPICNAME -p PARTITIONNUMBER

###### _Example_

<code>
kcat -b 192.168.57.70:9092 -P  -t test -p 0
</code>


### Consume message

kcat -b BROKERURL -G CONSUMERGROUPID TOPICS (space seperated)

###### _Example_

<code>
kcat -b 192.168.57.70:9092  -G testGroup1  test test-new
</code>

### Check  Consumer groups

kafka-consumer-groups --bootstrap-server BROKERURL --group CONSUMERGROUPID --describe

###### _Example_

<code>
 kafka-consumer-groups  --bootstrap-server 192.168.57.70:9092 --group testGroup1 --describe
</code>

### Check  Consumer group coordinator

kafka-consumer-groups --bootstrap-server BROKERURL --group CONSUMERGROUPID --describe --state

###### _Example_

<code>
 kafka-consumer-groups  --bootstrap-server 192.168.57.70:9092 --group testGroup1 --describe --state
</code>