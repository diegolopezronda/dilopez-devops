FROM sonatype/nexus3 
EXPOSE 8081 8081 
ENV INSTALL4J_ADD_VM_PARAMS="-Xms512M -Xmx2G -XX:MaxDirectMemorySize=10G -Djava.util.prefs.userRoot=/nexus-data/javaprefs"
CMD sh -c ${SONATYPE_DIR}/start-nexus-repository-manager.sh 
