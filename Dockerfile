FROM registry-proxy.engineering.redhat.com/rh-osbs/amq-broker-7-amq-broker-712-openshift-rhel8:7.12.0-4
RUN rm -rf /opt/amq/lib
COPY lib /opt/amq/lib
# Define the user
USER 185
# Define the working directory
WORKDIR /home/jboss
# Define run cmd
CMD ["/opt/amq/bin/launch.sh", "start"]
