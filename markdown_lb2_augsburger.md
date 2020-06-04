# Markdown LB2 Augsburger

## ST17e, Modul 300, M. Calisto

Ausführung Shell Script

* Git Bash öffnen
* In Repository Ordner wechseln
* ./Augsburger_LB2.sh ausführen

---

## Erklärung von Code
* Das Skript hat zwei "for" Schlaufen
  * Die erste "for" Schlaufe erstellt zwei Webserver und die zweite erstellt Datenbanken Server.


Installations Box von Vagrant Cloud:
```
config.vm.box = "kmm/ubuntu-xenial64"
```
Gibt Hyper-V als VM Provider an:
```
config.vm.provider "hyperv" do |h|

Bei Hyper-V müssen die commands mit h angegeben werden. Bei Virtualbox mit vb.
```
Dieser Ordner wird mit dem vagrant-VM Verzeichnis synchronisiert. Das selbe hat es für die DB-Server auch einfach /var/lib/mysql:
```
config.vm.synced_folder ".", "/var/www/html"
```
Die Shell in der VM -> Hier wird zum Beispiel Apache installiert:
```
config.vm.provision "shell", inline: <<-SHELL 
          sudo apt-get update
          sudo apt-get -y install apache2
        SHELL
```
Programmcode des HTML Files:
```
# index.html 
    cat <<%EOF% >index.html
    <html>
        <body>
            <h1>Startseite LB2 Aron Augsburger ${vm}</h1>
        </body>
    <html>
```
Installiert mysql Server und erstellt den Benutzer mysql:
```
sudo apt-get -y install mysql-server
          sudo useradd -m mysql
          echo mysql_passwort | passwd mysql --stdin
```
Hier wird die Firewall installiert und aktiviert. Ebenfalls der Port 80 zugelassen:
```
sudo apt-get -y install ufw
          sudo ufw enable
          sudo ufw allow 80/tcp
```
Hier wird die Firewall installiert und aktiviert. Ebenfalls der Port 3306 für alle zugelassen:
```
sudo apt-get -y install ufw
          sudo ufw enable
          sudo ufw allow from 0.0.0.0/0 to any port 3306
```

---

## Umgebung
* Das Shellscript erstellt zwei Webserver und zwei DB-Server.
* Die VMs laufen auf Hyper-V.

---

## Sicherheit
* Die Firewall hat die Ports 80 und 3306 geöffnet.
  * Port 80:
    * Wird für die Webserver benötigt.
  * Port 3306:
    * Wird für die DB-Server benötigt, und ist offen für alle.
