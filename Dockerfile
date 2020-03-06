#基础镜像为centos
FROM centos:7
RUN cd /tmp && \
    #安装wget
    yum -y install wget && \
    #下载安装包
    wget https://jaist.dl.sourceforge.net/project/openofficeorg.mirror/4.1.7/binaries/zh-CN/Apache_OpenOffice_4.1.7_Linux_x86-64_install-rpm_zh-CN.tar.gz && \
    #解压缩
    tar -xf Apache_OpenOffice*.tar.gz && \
    #安装OpenOffice
    yum install -y zh-CN/RPMS/*.rpm && \
    #安装JDK
    yum install -y java-1.8.0-openjdk.x86_64 && \
    #清除yum缓存
    yum clean all && \
    #删除压缩包、解压缩的文件
    rm -Rf Apache_OpenOffice*.tar.gz zh-CN
#暴露接口
EXPOSE 8100
#启动服务，占用8100端口
CMD /opt/openoffice4/program/soffice -headless -nofirststartwizard  -accept="socket,host=0.0.0.0,port=8100;urp;"
