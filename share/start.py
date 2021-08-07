import os
import time

config = []
config.append(open("/usr/share/git-server/global.conf").read())

template = open("/usr/share/git-server/repo.conf").read()
for repo in os.listdir("/host/repos"):
    config.append(template.format(repo = repo))

open("/etc/lighttpd/lighttpd.conf", "w").write("\n\n".join(config))

print(os.popen("lighttpd -f /etc/lighttpd/lighttpd.conf").read())

while True:
    time.sleep(600)
