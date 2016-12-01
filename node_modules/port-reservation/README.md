# Port Reservation System

> allows to reserve network ports for later use

[![Circle CI](https://circleci.com/gh/Originate/port-reservation.svg?style=shield)](https://circleci.com/gh/Originate/port-reservation)
[![Coverage Status](https://coveralls.io/repos/github/Originate/port-reservation/badge.svg)](https://coveralls.io/github/Originate/port-reservation?branch=master)
[![Dependency Status](https://david-dm.org/originate/port-reservation.svg)](https://david-dm.org/originate/port-reservation)
[![devDependency Status](https://david-dm.org/originate/port-reservation/dev-status.svg)](https://david-dm.org/originate/port-reservation#info=devDependencies)

This library is a thin wrapper around
[PortFinder](https://github.com/indexzero/node-portfinder).
It guarantees that
ports that have been provided to a client
are considered "reserved",
and are not provided again
in future requests for more free ports.
Even if a reserved port is currently not used.

This is useful
for example
when it takes a while
to start up the processes
that use these ports.


## Development

see our [developer documentation](CONTRIBUTING.md)
