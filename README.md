RinAction
=========

Sample code and exercise from the book "R in action".

Installation R
--------------

1. edit your /etc/apt/source.list by adding the following lines
```python
## This is for R package
## http://cran.stat.ucla.edu/index.html
deb http://cran.stat.ucla.edu/bin/linux/ubuntu utopic/
```

2. type the following commands in your terminal
```bash
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get install r-base
```
