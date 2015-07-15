FROM mottosso/mayabase-centos
 
MAINTAINER marcus@abstractfactory.io
 
# Download and unpack distribution first, Docker's caching
# mechanism will ensure that this only happens once.
RUN wget http://download.autodesk.com/us/support/files/maya_2016_service_pack_1/Autodesk_Maya_2016_SP1_EN_Linux_64bit.tgz -O maya.tgz && \
    mkdir /maya && tar -xvf maya.tgz -C /maya && \
    rm maya.tgz
 
WORKDIR /maya
 
# Install Maya
RUN rpm -Uvh *.rpm

# Setup environment
ENV MAYA_LOCATION=/usr/autodesk/maya2016-x64/
ENV PATH=$MAYA_LOCATION/bin:$PATH
 
# Cleanup
WORKDIR /root
RUN rm -r /maya
