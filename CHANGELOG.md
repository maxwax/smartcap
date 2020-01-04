# smartcap Versions

## 1.0.4

* Better output Reporting
* Calculate the number of powered on hours and report as days
* Bring INFO attention to attribute 5, Reallocated_Sector_Ct

## 1.0.3

* Report the filename being logged for each drive
* Use clean_text function to fix data text data from SMART attributes
* Special handling of attributes (187, 197, 198) known to suggest a failing drive when their value is > 0.

## 1.0.2

* Deploy to /usr/local/sbin not /usr/local/bin. Script requires root|sudo

## 1.0.1

* Rename script smartcap.sh to smartcap for consistency

## 1.0.0 Publish

* Initial release
