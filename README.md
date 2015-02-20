Flask-Supervisord
=========================

This repo contains the code for a virtual machine via vagrant that is running two flask apps (each with their own virtualenv) using Supervisord on Centos 7.

I put this together experimenting with potential development environments for python apps.

The provision.sh script installs virtualenv, virtualenvwrapper and setups up the two virtualenv environments. It then installs and kicks off Supervisord.

The config for Supervisord is found in file supervisord.conf.

###Dependencies

This repos requires Vagrant and Virtualbox.

###To Begin

To create and log on to the virtual machine:

```
vagrant up
```
followed by:
```
vagrant ssh
```

To test that both flask apps are running:

```
curl localhost:8000
```
and
```
curl localhost:8001
```
### Editing the Apps

You can edit the flask app code in both flaskapp1 and flaskapp2 folders and the changes will automatically get picked up.

### App Status, Starting and Stoping

You can easily check the status of the apps using the command:

```
supervisorctl status
```
You can stop both apps at once with:

```
supervisorctl stop all
```

You can stop each individual app with:

```
supervisorctl stop flaskapp1
```

Or you can stop a list of apps:

```
supervisorctl stop flaskapp1 flaskapp2
```

The same goes for starting and restarting:

```
supervisorctl start flaskapp2
supervisorctl restart flaskapp2
```

You can also visit http://localhost:9001 to see the apps status, as well as a visual way to start and stop the apps.

If you get bored with typing supervisorctl every time, I have added the following supervisorctl aliases:

```
alias start='supervisorctl start'
alias stop='supervisorctl stop'
alias restart='supervisorctl restart'
alias status='supervisorctl status'
```

So start apps with:

```
start flaskapp1
start all
start flaskapp1 flaskapp2
```

Stop apps with:

```
stop flaskapp1
stop all
stop flaskapp1 flaskapp2
```

Restart with:

```
restart flaskapp1
restart all
restart flaskapp1 flaskapp2
```

Check status with:
```
status flaskapp1
status all
status flaskapp1 flaskapp2
```

###App Error and Log information

You can look at the logs for an app with the following command:

```
cat /vagrant/logs/flaskapp1.stderr
```
Or if you want you can view the logs in real time with:

```
tail -f /vagrant/logs/flaskapp1.stderr
```
