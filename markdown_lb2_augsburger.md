# Markdown LB2 Augsburger

## ST17e, Modul 300, M. Calisto

Ausführung Shell Script

* Git Bash öffnen
* In Repository Ordner wechseln
* Augsburger_LB2.sh ausführen

---

## Erklärung von Code
* Das Skript hat zwei "for" Schlaufen
  * Die erste "for" Schlaufe erstellt zwei Webserver und die zweite erstellt Datenbanken Server.
```
Installations Box von Vagrant Cloud:
config.vm.box = "kmm/ubuntu-xenial64"
```
```
Gibt Hyper-V als VM Provider an:
config.vm.provider "hyperv" do |h|
Bei Hyper-V müssen die commands mit h angegeben werden. Bei Virtualbox mit vb.
```
```
Die Shell in der VM -> Hier wird zum Beispiel Apache installiert:
config.vm.provision "shell", inline: <<-SHELL 
          sudo apt-get update
          sudo apt-get -y install apache2
        SHELL
```
```
Programmcode des HTML Files:
# index.html 
    cat <<%EOF% >index.html
    <html>
        <body>
            <h1>Startseite LB2 Aron Augsburger ${vm}</h1>
        </body>
    <html>
```
```
Installiert mysql Server und erstellt den Benutzer mysql:
sudo apt-get -y install mysql-server
          sudo useradd -m mysql
          echo mysql_passwort | passwd mysql --stdin
```
```
Hier wird die Firewall installiert und aktiviert. Ebenfalls der Port 80 zugelassen:
sudo apt-get -y install ufw
          sudo ufw enable
          sudo ufw allow 80/tcp
```
```
Hier wird die Firewall installiert und aktiviert. Ebenfalls der Port 3306 für alle zugelassen:
sudo apt-get -y install ufw
          sudo ufw enable
          sudo ufw allow from 0.0.0.0/0 to any port 3306
```









Code kann auch `so hervor gehoben` werden

> Backquote


[1]: http://sbb.ch "sbb"
[2]: http://tbz.ch "Technischen Berufsschule Zürich"

Die meisten Lernenden der [TBZ][2] kommen mit der [Bahn][2] zur Schule
