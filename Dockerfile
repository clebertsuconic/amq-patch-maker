FROM registry.redhat.io/amq7/amq-broker-rhel8:7.12.0
RUN rm -rf /opt/amq/lib
COPY lib /opt/amq/lib
# Define the user
USER 185
# Define the working directory
WORKDIR /home/jboss
# Define run cmd
CMD ["/opt/amq/bin/launch.sh", "start"]
