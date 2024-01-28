FROM amazonlinux
WORKDIR /app
RUN yum update -y
RUN yum install nginx java-11* -y
RUN yum install -y gcc-c++ make \
    && curl -sL https://rpm.nodesource.com/setup_18.x | bash - \
    && yum install -y git nodejs
RUN git clone https://github.com/PintoAdi/Frontend_contact_list.git . \
    && npm install
RUN npm run build
RUN cp -r /app/dist/contact-ui/* /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
