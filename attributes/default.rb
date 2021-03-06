#
# Cookbook Name:: tomcat
# Attributes:: default
#
# Copyright 2010, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

default["tomcat"]["port"] = 8080
default["tomcat"]["proxy_port"] = nil
default["tomcat"]["ssl_port"] = 8443
default["tomcat"]["ssl_proxy_port"] = nil
default["tomcat"]["ajp_port"] = 8009
default["tomcat"]["catalina_options"] = ""
default["tomcat"]["java_options"] = "-Xmx128M -Djava.awt.headless=true"
default["tomcat"]["use_security_manager"] = false
default["tomcat"]["authbind"] = "no"
default["tomcat"]["deploy_manager_apps"] = true
default["tomcat"]["ssl_cert_file"] = nil
default["tomcat"]["ssl_key_file"] = nil
default["tomcat"]["ssl_chain_files"] = [ ]
default["tomcat"]["keystore_file"] = "keystore.jks"
default["tomcat"]["keystore_type"] = "jks"
# The keystore and truststore passwords will be generated by the
# openssl cookbook's secure_password method in the recipe if they are
# not otherwise set. Do not hardcode passwords in the cookbook.
#default["tomcat"]["keystore_password"] = nil
#default["tomcat"]["truststore_password"] = nil
default["tomcat"]["truststore_file"] = nil
default["tomcat"]["truststore_type"] = "jks"
default["tomcat"]["certificate_dn"] = "cn=localhost"
default["tomcat"]["loglevel"] = "INFO"
default["tomcat"]["tomcat_auth"] = "true"

case platform
when "centos","redhat","fedora"
  set["tomcat"]["user"] = "tomcat"
  set["tomcat"]["group"] = "tomcat"
  set["tomcat"]["home"] = "/usr/share/tomcat6"
  set["tomcat"]["base"] = "/usr/share/tomcat6"
  set["tomcat"]["config_dir"] = "/etc/tomcat6"
  set["tomcat"]["log_dir"] = "/var/log/tomcat6"
  set["tomcat"]["tmp_dir"] = "/var/cache/tomcat6/temp"
  set["tomcat"]["work_dir"] = "/var/cache/tomcat6/work"
  set["tomcat"]["context_dir"] = "#{tomcat["config_dir"]}/Catalina/localhost"
  set["tomcat"]["webapp_dir"] = "/var/lib/tomcat6/webapps"
  set["tomcat"]["keytool"] = "/usr/lib/jvm/java/bin/keytool"
  set["tomcat"]["endorsed_dir"] = "#{tomcat["home"]}/lib/endorsed"
when "debian","ubuntu"
  set["tomcat"]["user"] = "tomcat6"
  set["tomcat"]["group"] = "tomcat6"
  set["tomcat"]["home"] = "/usr/share/tomcat6"
  set["tomcat"]["base"] = "/var/lib/tomcat6"
  set["tomcat"]["config_dir"] = "/etc/tomcat6"
  set["tomcat"]["log_dir"] = "/var/log/tomcat6"
  set["tomcat"]["tmp_dir"] = "/tmp/tomcat6-tmp"
  set["tomcat"]["work_dir"] = "/var/cache/tomcat6"
  set["tomcat"]["context_dir"] = "#{tomcat["config_dir"]}/Catalina/localhost"
  set["tomcat"]["webapp_dir"] = "/var/lib/tomcat6/webapps"
  set["tomcat"]["keytool"] = "/usr/lib/jvm/default-java/bin/keytool"
  set["tomcat"]["endorsed_dir"] = "#{tomcat["home"]}/lib/endorsed"
else
  set["tomcat"]["user"] = "tomcat6"
  set["tomcat"]["group"] = "tomcat6"
  set["tomcat"]["home"] = "/usr/share/tomcat6"
  set["tomcat"]["base"] = "/var/lib/tomcat6"
  set["tomcat"]["config_dir"] = "/etc/tomcat6"
  set["tomcat"]["log_dir"] = "/var/log/tomcat6"
  set["tomcat"]["tmp_dir"] = "/tmp/tomcat6-tmp"
  set["tomcat"]["work_dir"] = "/var/cache/tomcat6"
  set["tomcat"]["context_dir"] = "#{tomcat["config_dir"]}/Catalina/localhost"
  set["tomcat"]["webapp_dir"] = "/var/lib/tomcat6/webapps"
  set["tomcat"]["keytool"] = "keytool"
  set["tomcat"]["endorsed_dir"] = "#{tomcat["home"]}/lib/endorsed"
end
