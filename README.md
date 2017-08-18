# UKP Amazon Mechanical Turk utilities

This project contains various convenience utilities for Amazon
Mechanical Turk (AMT) requesters.

## Requirements

To compile the utilities, you need [Maven](https://maven.apache.org/).
To run the utilities, you need a Bourne-compatible shell, a Java
runtime environment, and
the
[Amazon Mechanical Turk Command Line Tools](https://requester.mturk.com/developer/tools/clt) version
1.3.1.  (Using more recent versions of the Command Line Tools may also
work, but we have not tested this.)  The Amazon Mechanical Turk
Command Line Tools must be in your `PATH`.

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
earlier versions of the AMT command-line utilities, you can specify
more than one locale.  For example, you can restrict your HITs to
workers in the United States, Germany, and Hungary by passing a locale
value of `us,de,hu`.
([Amazon apparently added this feature to the command-line tools in Version 1.3.3,](https://forums.aws.amazon.com/thread.jspa?messageID=755218&#755218)
so if you are using that version or later, then you probably do not
need this script.)

## Contact

[Tristan Miller](mailto:miller@ukp.informatik.tu-darmstadt.de),
[Ubiquitous Knowledge Processing (UKP) Lab](https://www.ukp.tu-darmstadt.de/),
[Technische Universität Darmstadt](https://www.tu-darmstadt.de/)
