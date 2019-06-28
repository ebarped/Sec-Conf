#! /bin/sh
mkdir mysqltuner
cd mysqltuner
wget http://mysqltuner.com/mysqltuner.pl
wget https://raw.githubusercontent.com/major/MySQLTuner-perl/master/basic_passwords.txt -O basic_passwords.txt
wget https://raw.githubusercontent.com/major/MySQLTuner-perl/master/vulnerabilities.csv -O vulnerabilities.csv
chmod +x mysqltuner.pl
./mysqltuner.pl
