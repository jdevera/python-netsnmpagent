# python-netsnmpagent Module

Copyright (c) 2013 Pieter Hollants <pieter@hollants.com>
Licensed under the GNU Public License (GPL) version 3


## WHAT IS IT?

python-netsnmpagent is a Python module that facilitates writing Net-SNMP subagents in Python. Subagents connect to a locally running Master agent (snmpd) over a Unix domain socket (eg. "/var/run/agentx/master") and using the AgentX protocol (RFC2747). They implement custom Management Information Base (MIB) modules that extend the local node's MIB tree. Usually, this requires writing a MIB as well, ie. a text file that specifies the structure, names and data types of the information within the MIB module.

python-netsnmpagent was written after a lot of frustration trying to fix the python-agentx module hosted on Sourceforge. I fixed some smaller issues there but when it came to making sure that you could actually walk the whole MIB, not just the variables registered, I realized that it would not make much sense to reimplement the complete behavior of a proper SNMP agent when the NetSNMP API actually can handle those things for you. Also, to be honest, I don't get python-agentx's design :-)

python-netsnmpagent, by contrast, in the first line focusses on making the net-snmp C agent API accessible from Python. Though I will try not to just pass through every library call 1:1 but wrap them in a useful manner.

net-snmp itself also comes with a Python module (see the "python" subdirectory in the source distribution), however it seems to offer bindings that implement the client side only, not the agent side.


## REQUIREMENTS

python-netsnmpagent requires the net-snmp libraries to be installed. The runtime libraries are enough, development files are not necessary.

Tested versions include 5.4.2 (included with SUSE Linux Enterprise Server 11 SP2), 5.4.3 (included with Ubuntu 12.04 LTS) and net-snmp 5.7.3 (included with openSUSE 12.3). While the intent is to support both net-snmp 5.4.x and 5.7.x versions at least for the near future, I want to avoid double code paths whereever possible. I therefore have to stick to the net-snmp 5.4.x way of things at certain places indicated by code comments.


## DOWNLOAD

The PyPI page with distribution archives is available at

  http://pypi.python.org/pypi/netsnmpagent

Binary RPMs for SuSE distributions are available via search.opensuse.org and the Open Build Service Project page at

  https://build.opensuse.org/package/show?package=python-netsnmpagent&project=home%3Apfhllnts

If you wish to follow development more closely clone the GitHub repo:

  https://github.com/pief/python-netsnmpagent.git


## INSTALLATION

If you do not use a ready package for your Linux distribution, you can install directly from source using

```
  python setup.py install
```

This will most probably require appropriate rights (eg. being "root").


## EXAMPLE USAGE

The "examples" subdirectory contains well-commented example agents that should give you a quickstart on how to use python-netsnmpagent. Read the `README` file contained there for a short introduction on the different examples.


## API

The Python API has not really been documented yet. For now, please see the example agents' source code for info on how to use the python-netsnmpagent module.


## TESTS

python-netsnmpagent now comes with integration tests to test the net-snmp integration. Type `make tests` to run them. See tests/README for the reasons why `nosetests` can't be run directly.


## TODO

 - notifications/traps
 - more tests


## CREDITS

python-netsnmpagent was inspired by python-agentx, courtesy of Bozhin Zafirov <bozhin@abv.bg>. I blatantly ripped some ideas and some lines of code, shame on me.

SNMP contexts support and various other additions were implemented by Steven Hiscocks <steven@hiscocks.me.uk>.

The bug that DisplayStrings/OctetStrings got truncated when trying to update them with a string larger that the original InitVal was hunted down and fixed by Max "mk23" Kalika <max.kalika+projects@gmail.com>.
