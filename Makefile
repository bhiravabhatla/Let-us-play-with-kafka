.PHONY: *

KAFKA_BROKER:=192.168.57.70:9092
KAFKA_TOPICS:=kafka-topics --bootstrap-server $(KAFKA_BROKER)

define CHECK_VIRTUALBOX_INSTALLATION
@which VirtualBox > /dev/null || (echo "Please install virtualbox before proceeding - https://www.virtualbox.org/wiki/Downloads"; exit 1)
endef

prerequisites:
	@$(call CHECK_VIRTUALBOX_INSTALLATION)
	brew install kcat kafka vagrant ansible@6

provision:
	vagrant up

install-confluent-platform:
	/usr/local/opt/ansible@6/bin/ansible-galaxy install confluent.platform
	ANSIBLE_PYTHON_INTERPRETER=/bin/python3 ANSIBLE_HOST_KEY_CHECKING=False /usr/local/opt/ansible@6/bin/ansible-playbook -i hosts.yml -v all.yml

create-topic/%:
	$(KAFKA_TOPICS) --topic $(@F) --create --partitions 3 --replication-factor 3

list-topics:
	$(KAFKA_TOPICS) --list

setup: prerequisites provision install-confluent-platform create-topic/test list-topics
