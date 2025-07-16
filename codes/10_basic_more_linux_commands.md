# 연습문제 1: 기본 파일 시스템 탐색
**1-1. 디렉토리 이동**
1. 현재 위치 확인 및 이동
2. 현재 작업 디렉터pw리의 절대 경로를 출력하시오.
3. 홈 디렉터리로 이동하시오.
4. 루트 디렉터리(/)로 이동하시오.
5. 다시 홈 디렉터리로 돌아가시오.

```sh
[mk@localhost ~]$ pwd
/home/mk
[mk@localhost ~]$ cd /home/mk/
[mk@localhost ~]$ ls
Desktop    Downloads  Pictures  Templates
Documents  Music      Public    Videos
[mk@localhost ~]$ cd /
[mk@localhost /]$ ls
afs   dev   lib    mnt   root  srv  usr
bin   etc   lib64  opt   run   sys  var
boot  home  media  proc  sbin  tmp
[mk@localhost /]$ cd /home/mk/
[mk@localhost ~]$ ls
Desktop    Downloads  Pictures  Templates
Documents  Music      Public    Videos
```

**1-2. 디렉터리 내용 확인**
1. 현재 디렉터리의 파일과 폴더 목록을 출력하시오.
2. 숨김 파일을 포함한 모든 파일의 상세 정보를 출력하시오.

```sh
[mk@localhost ~]$ ls
Desktop    Downloads  Pictures  Templates
Documents  Music      Public    Videos
[mk@localhost ~]$ ls -alh
total 20K
drwx------. 14 mk   mk   4.0K Jul 16 10:52 .
drwxr-xr-x.  3 root root   16 Jul 16 10:52 ..
-rw-r--r--.  1 mk   mk     18 Apr 30  2024 .bash_logout
-rw-r--r--.  1 mk   mk    141 Apr 30  2024 .bash_profile
-rw-r--r--.  1 mk   mk    492 Apr 30  2024 .bashrc
drwx------.  7 mk   mk    179 Jul 16 10:52 .cache
drwxr-xr-x.  9 mk   mk   4.0K Jul 16 10:52 .config
drwxr-xr-x.  2 mk   mk      6 Jul 16 10:52 Desktop
drwxr-xr-x.  2 mk   mk      6 Jul 16 10:52 Documents
drwxr-xr-x.  2 mk   mk      6 Jul 16 10:52 Downloads
drwx------.  4 mk   mk     32 Jul 16 10:52 .local
drwxr-xr-x.  4 mk   mk     39 Jul 16 10:12 .mozilla
drwxr-xr-x.  2 mk   mk      6 Jul 16 10:52 Music
drwxr-xr-x.  2 mk   mk      6 Jul 16 10:52 Pictures
drwxr-xr-x.  2 mk   mk      6 Jul 16 10:52 Public
drwxr-xr-x.  2 mk   mk      6 Jul 16 10:52 Templates
drwxr-xr-x.  2 mk   mk      6 Jul 16 10:52 Videos
```
3. /etc 디렉터리의 내용을 확인하시오.
```sh
[mk@localhost ~]$ ls /etc/
accountsservice          makedumpfile.conf.sample
adjtime                  man_db.conf
aliases                  mcelog
alsa                     microcode_ctl
alternatives             mime.types
anacrontab               mke2fs.conf
appstream.conf           modprobe.d
asound.conf              modules-load.d
at.deny                  motd
audit                    motd.d
authselect               mtab
avahi                    multipath
bash_completion.d        nanorc
bashrc                   netconfig
bindresvport.blacklist   NetworkManager
binfmt.d                 networks
bluetooth                nftables
brlapi.key               nsswitch.conf
brltty                   nsswitch.conf.bak
brltty.conf              nvme
chromium                 openldap
chrony.conf              opt
chrony.keys              os-release
cifs-utils               ostree
cockpit                  PackageKit
containers               pam.d
cron.d                   papersize
cron.daily               passwd
cron.deny                passwd-
cron.hourly              pbm2ppa.conf
cron.monthly             pinforc
crontab                  pkcs11
cron.weekly              pkgconfig
crypto-policies          pki
crypttab                 plymouth
csh.cshrc                pm
csh.login                pnm2ppa.conf
cups                     polkit-1
cupshelpers              popt.d
dbus-1                   printcap
dconf                    profile
debuginfod               profile.d
default                  protocols
depmod.d                 pulse
dhcp                     qemu-ga
DIR_COLORS               ras
DIR_COLORS.lightbgcolor  rc.d
dnf                      rc.local
dnsmasq.conf             redhat-release
dnsmasq.d                request-key.conf
dracut.conf              request-key.d
dracut.conf.d            resolv.conf
egl                      rocky-release
enscript.cfg             rocky-release-upstream
environment              rpc
ethertypes               rpm
exports                  rsyncd.conf
favicon.png              rsyslog.conf
filesystems              rsyslog.d
firefox                  rwtab.d
firewalld                samba
flatpak                  sane.d
fonts                    sasl2
foomatic                 security
fprintd.conf             selinux
fstab                    services
fuse.conf                sestatus.conf
fwupd                    setroubleshoot
gcrypt                   sgml
gdm                      shadow
geoclue                  shadow-
glvnd                    shells
gnupg                    skel
GREP_COLORS              smartmontools
groff                    sos
group                    speech-dispatcher
group-                   ssh
grub2.cfg                ssl
grub.d                   sssd
gshadow                  statetab.d
gshadow-                 subgid
gss                      subgid-
host.conf                subuid
hostname                 subuid-
hosts                    sudo.conf
hp                       sudoers
inittab                  sudoers.d
inputrc                  sudo-ldap.conf
iscsi                    sysconfig
issue                    sysctl.conf
issue.d                  sysctl.d
issue.net                systemd
kdump                    system-release
kdump.conf               system-release-cpe
kernel                   terminfo
keys                     tmpfiles.d
keyutils                 tpm2-tss
krb5.conf                trusted-key.key
krb5.conf.d              tuned
ld.so.cache              udev
ld.so.conf               udisks2
ld.so.conf.d             updatedb.conf
libaudit.conf            UPower
libblockdev              usb_modeswitch.conf
libibverbs.d             vconsole.conf
libnl                    vimrc
libpaper.d               virc
libreport                vmware-tools
libssh                   vulkan
libuser.conf             wgetrc
locale.conf              wireplumber
localtime                wpa_supplicant
login.defs               X11
logrotate.conf           xattr.conf
logrotate.d              xdg
lsm                      xml
lvm                      yum
machine-id               yum.conf
magic                    yum.repos.d
mailcap
```

<br>

# 연습문제 2: 디렉터리 및 파일 생성

**2-1. 디렉터리 구조 생성 다음과 같은 디렉터리 구조를 생성하시오:**
```
practice/
├── documents/
│   ├── reports/ls
│   └── notes/
├── images/
└── backup/
```

```sh
[mk@localhost ~]$ mkdir -p practice/documents/reports/ls practice/documents/notes practice/images practice/backup
```

**2-2. 파일 생성 및 내용 작성**
1. practice/documents/ 디렉터리에 readme.txt 파일을 생성하고 "Hello Linux!"라는 내용을 작성하시오.
2. practice/notes/ 디렉터리에 memo.txt 파일을 생성하고 "Linux 명령어 연습 중"이라는 내용을 작성하시오.

```sh
[mk@localhost ~]$ echo "Hello Linux!" >  practice/documents/readme.txt
[mk@localhost ~]$ echo "Linux 명령어 연습 중" > practice/documents/notes/memo.txt
```

<br>

# 연습문제 3: 파일 내용 확인 및 조작
**3-1. 파일 내용 출력**
1. 앞서 생성한 readme.txt 파일의 내용을 출력하시오.
2. memo.txt 파일의 내용을 출력하시오.

```sh
[mk@localhost ~]$ cat practice/documents/readme.txt 
Hello Linux!
[mk@localhost ~]$ cat practice/documents/notes/memo.txt 
Linux 명령어 연습 중
```

**3-2. 파일 복사**
1. readme.txt 파일을 backup/ 디렉터리에 복사하시오.
2. documents/ 디렉터리 전체를 backup/ 디렉터리에 복사하시오.

```sh
[mk@localhost ~]$ cp practice/documents/readme.txt practice/backup/
[mk@localhost ~]$ cp -r practice/documents/ practice/backup/
```

<br>

# 연습문제 4: 파일 이동 및 이름 변경
**4-1. 파일 이동**
1. memo.txt 파일을 documents/ 디렉터리로 이동하시오.
2. images/ 디렉터리를 practice/media/로 이름을 변경하시오. 

```sh
[mk@localhost practice]$ cp backup/documents/notes/memo.txt documents/
[mk@localhost practice]$ mv images/ media
```

**4-2. 파일 이름 변경**
1. readme.txt를 introduction.txt로 이름을 변경하시오.
2. memo.txt를 study_notes.txt로 이름을 변경하시오.

```sh
[mk@localhost practice]$ mv documents/readme.txt documents/introduction.txt
[mk@localhost practice]$ mv documents/memo.txt documents/study_notes.txt
[mk@localhost practice]$ ls documents/
introduction.txt  notes  reports  study_notes.txt
```

<br>

# 연습문제 5: 종합 실습
**5-1. 프로젝트 디렉터리 생성 <br>
다음 요구사항에 따라 프로젝트 디렉터리를 생성하시오:**
1. my_project/라는 최상위 디렉터리 생성
2. 하위에 src/, docs/, tests/, config/ 디렉터리 생성

```sh
[mk@localhost practice]$ mkdir -p my_project/src my_project/docs my_project/tests my_project/config
```

3. src/ 디렉터리에 main.py 파일 생성 (내용: "# Main Python File")
4. docs/ 디렉터리에 README.md 파일 생성 (내용: "# My Project Documentation")
5. config/ 디렉터리에 settings.conf 파일 생성 (내용: "# Configuration File")

```sh
[mk@localhost practice]$ echo "# Main Python File" > my_project/src/main.py
[mk@localhost practice]$ echo "# My Project Documentation" > my_project/docs/README.md
[mk@localhost practice]$ echo "# Configuration File" > my_project/config/settings.conf

# 확인
[mk@localhost practice]$ cat my_project/src/main.py 
# Main Python File
[mk@localhost practice]$ cat my_project/docs/README.md 
# My Project Documentation
[mk@localhost practice]$ cat my_project/config/settings.conf 
# Configuration File
```

**5-2. 백업 및 정리**
1. 전체 my_project/ 디렉터리를 my_project_backup/으로 복사하시오.
2. my_project/src/main.py 파일을 my_project/src/app.py로 이름을 변경하시오.

```sh
[mk@localhost practice]$ cp -r my_project/ my_project_backup/
[mk@localhost practice]$ mv my_project/src/main.py my_project/src/app.py

# 확인
[mk@localhost practice]$ ls my_project/src/
app.py
```

3. my_project/docs/README.md 파일을 my_project/ 디렉터리로 이동하시오.
```sh
[mk@localhost practice]$ mv my_project/docs/README.md my_project
[mk@localhost practice]$ ls my_project
config  docs  README.md  src  tests
```
