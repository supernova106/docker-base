import jenkins.model.*
import hudson.security.*
import hudson.plugins.active_directory.*

def instance = Jenkins.getInstance()
String domain = 'corp.example.com'
String site = 'Example'
String server = 'eb2-dc5.corp.example.com:3268,eb2-dc6.corp.example.com:3268'
String bindName = ''
String bindPassword = ''
adrealm = new ActiveDirectorySecurityRealm(domain, site, bindName, bindPassword, server)
instance.setSecurityRealm(adrealm)
