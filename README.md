# UKP Amazon Mechanical Turk utilities

This project contains various convenience utilities for Amazon
Mechanical Turk (AMT) requesters.

To compile the utilities, you need Maven.  To run the utilities, you
need a Bourne-compatible shell and a Java runtime environment.

## Compilation

```
mvn clean compile assembly:single
```

## Usage

For detailed usage instructions for a script, invoke it without any
command-line options.

### `approveSubmitted.sh`

This script takes an AMT results file and approves all assignments
with a status of "Submitted".  It runs much faster than the official
`approveWork.sh` script which attempts to approve all assignments
regardless of their status.

### `extendRejected.sh`

This script takes an AMT results file and determines how many rejected
assignments there are for each HIT.  Then it adds a corresponding
number of assignments for those HITs.

### `rejectWorker.sh`

This script takes an AMT results file and a worker ID, and then
rejects all submitted assignments by that worker.

### `setHITLocales.sh`

This script updates the locale qualification of existing HITs.  Unlike
the AMT command-line utilities, you can specify more than one locale.
For example, you can restrict your HITs to workers in the United
States, Germany, and Hungary by passing a locale value of `us,de,hu`.

## Contact

[Tristan Miller](mailto:miller@ukp.informatik.tu-darmstadt.de)

https://www.ukp.tu-darmstadt.de/

https://www.tu-darmstadt.de/
