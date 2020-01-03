# smartcap

A simple script to gather the output of smartmontools' 'smartctl' program.

This shares some critical information about drive health related to bad sectors
to the screen as well as recording comprehensive health to a log file for a
long term history.

```
sudo ./smartcap.sh /dev/sdb

Drive is Seagate-Laptop-HDD, ST320LT012-9WS14C, W0VC0D60, 2.5-inches

ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  4 Start_Stop_Count        0x0032   090   090   020    Old_age   Always       -       10652
  5 Reallocated_Sector_Ct   0x0033   100   100   036    Pre-fail  Always       -       0

ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
187 Reported_Uncorrect      0x0032   100   100   000    Old_age   Always       -       0
196 Reallocated_Event_Count 0x000f   099   099   030    Pre-fail  Always       -       1722 (3041 0)
197 Current_Pending_Sector  0x0012   100   100   000    Old_age   Always       -       0
198 Offline_Uncorrectable   0x0010   100   100   000    Old_age   Offline      -       0
```

## Features

* Simple, only needs to know what drive you want to review
* Quick review for identification of bad drives

## Requirements

Requires [smartmontools](https://www.smartmontools.org/)

## Installation

* Use the install.sh script to deploy it to /usr/local/bin

## Log File Contents

```
ls -l ~/smartlogs/
total 16
-rw-r--r--. 1 maxwell root 16102 Jan  3 16:33 Seagate-Laptop-HDD.ST320LT012-9WS14C.W0VC0D60.2.5-inches.2020-0103
```

```
cat ~/smartlogs/Seagate-Laptop-HDD.ST320LT012-9WS14C.W0VC0D60.2.5-inches.2020-0103
smartctl 7.0 2019-03-31 r4903 [x86_64-linux-5.3.16-300.fc31.x86_64] (local build)
Copyright (C) 2002-18, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF INFORMATION SECTION ===
Model Family:     Seagate Laptop HDD
Device Model:     ST320LT012-9WS14C
Serial Number:    W0VC0D60
LU WWN Device Id: 5 000c50 06a042d95
Firmware Version: 0001LVM1
User Capacity:    320,072,933,376 bytes [320 GB]
Sector Sizes:     512 bytes logical, 4096 bytes physical
Rotation Rate:    5400 rpm
Form Factor:      2.5 inches
Device is:        In smartctl database [for details use: -P show]
ATA Version is:   ATA8-ACS T13/1699-D revision 4
SATA Version is:  SATA 2.6, 3.0 Gb/s (current: 3.0 Gb/s)
Local Time is:    Fri Jan  3 16:33:24 2020 MST
SMART support is: Available - device has SMART capability.
SMART support is: Enabled
AAM feature is:   Unavailable
APM level is:     128 (minimum power consumption without standby)
Rd look-ahead is: Enabled
Write cache is:   Enabled
DSN feature is:   Unavailable
ATA Security is:  Disabled, NOT FROZEN [SEC1]
Wt Cache Reorder: Unknown

=== START OF READ SMART DATA SECTION ===
SMART Status not supported: Incomplete response, ATA output registers missing
SMART overall-health self-assessment test result: PASSED
Warning: This result is based on an Attribute check.

General SMART Values:
Offline data collection status:  (0x00)	Offline data collection activity
					was never started.
					Auto Offline Data Collection: Disabled.
Self-test execution status:      (   0)	The previous self-test routine completed
					without error or no self-test has ever
					been run.
Total time to complete Offline
data collection: 		(    0) seconds.
Offline data collection
capabilities: 			 (0x73) SMART execute Offline immediate.
					Auto Offline data collection on/off support.
					Suspend Offline collection upon new
					command.
					No Offline surface scan supported.
					Self-test supported.
					Conveyance Self-test supported.
					Selective Self-test supported.
SMART capabilities:            (0x0003)	Saves SMART data before entering
					power-saving mode.
					Supports SMART auto save timer.
Error logging capability:        (0x01)	Error logging supported.
					General Purpose Logging supported.
Short self-test routine
recommended polling time: 	 (   1) minutes.
Extended self-test routine
recommended polling time: 	 (  83) minutes.
Conveyance self-test routine
recommended polling time: 	 (   2) minutes.
SCT capabilities: 	       (0x1031)	SCT Status supported.
					SCT Feature Control supported.
					SCT Data Table supported.

SMART Attributes Data Structure revision number: 10
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAGS    VALUE WORST THRESH FAIL RAW_VALUE
  1 Raw_Read_Error_Rate     POSR--   117   099   034    -    123532688
  3 Spin_Up_Time            PO----   099   099   000    -    0
  4 Start_Stop_Count        -O--CK   090   090   020    -    10652
  5 Reallocated_Sector_Ct   PO--CK   100   100   036    -    0
  7 Seek_Error_Rate         POSR--   066   060   030    -    47291182838
  9 Power_On_Hours          -O--CK   098   098   000    -    1786 (59 38 0)
 10 Spin_Retry_Count        PO--C-   100   100   097    -    0
 12 Power_Cycle_Count       -O--CK   098   098   020    -    2729
184 End-to-End_Error        -O--CK   100   100   099    -    0
187 Reported_Uncorrect      -O--CK   100   100   000    -    0
188 Command_Timeout         -O--CK   100   100   000    -    65537
189 High_Fly_Writes         -O-RCK   100   100   000    -    0
190 Airflow_Temperature_Cel -O---K   070   052   045    -    30 (Min/Max 21/30)
191 G-Sense_Error_Rate      -O--CK   100   100   000    -    1346
192 Power-Off_Retract_Count -O--CK   100   100   000    -    71
193 Load_Cycle_Count        -O--CK   088   088   000    -    24681
194 Temperature_Celsius     -O---K   030   048   000    -    30 (0 13 0 0 0)
196 Reallocated_Event_Count POSR--   099   099   030    -    1722 (2786 0)
197 Current_Pending_Sector  -O--C-   100   100   000    -    0
198 Offline_Uncorrectable   ----C-   100   100   000    -    0
199 UDMA_CRC_Error_Count    -OSRCK   200   200   000    -    1
254 Free_Fall_Sensor        -O--CK   100   100   000    -    0
                            ||||||_ K auto-keep
                            |||||__ C event count
                            ||||___ R error rate
                            |||____ S speed/performance
                            ||_____ O updated online
                            |______ P prefailure warning

General Purpose Log Directory Version 1
SMART           Log Directory Version 1 [multi-sector log support]
Address    Access  R/W   Size  Description
0x00       GPL,SL  R/O      1  Log Directory
0x01           SL  R/O      1  Summary SMART error log
0x02           SL  R/O      5  Comprehensive SMART error log
0x03       GPL     R/O      5  Ext. Comprehensive SMART error log
0x06           SL  R/O      1  SMART self-test log
0x07       GPL     R/O      1  Extended self-test log
0x09           SL  R/W      1  Selective self-test log
0x10       GPL     R/O      1  NCQ Command Error log
0x11       GPL     R/O      1  SATA Phy Event Counters log
0x21       GPL     R/O      1  Write stream error log
0x22       GPL     R/O      1  Read stream error log
0x80-0x9f  GPL,SL  R/W     16  Host vendor specific log
0xa1       GPL,SL  VS      20  Device vendor specific log
0xa2       GPL     VS    2248  Device vendor specific log
0xa8       GPL,SL  VS      65  Device vendor specific log
0xa9       GPL,SL  VS       1  Device vendor specific log
0xab       GPL     VS       1  Device vendor specific log
0xb0       GPL     VS    2864  Device vendor specific log
0xbd-0xbf  GPL     VS   65535  Device vendor specific log
0xc0       GPL,SL  VS       1  Device vendor specific log
0xe0       GPL,SL  R/W      1  SCT Command/Status
0xe1       GPL,SL  R/W      1  SCT Data Transfer

SMART Extended Comprehensive Error Log Version: 1 (5 sectors)
No Errors Logged

SMART Extended Self-test Log Version: 1 (1 sectors)
Num  Test_Description    Status                  Remaining  LifeTime(hours)  LBA_of_first_error
# 1  Vendor (0x50)       Completed without error       00%       174         -
# 2  Short offline       Completed without error       00%       174         -
# 3  Vendor (0x50)       Aborted by host               90%       104         -
# 4  Short offline       Completed without error       00%       103         -
# 5  Vendor (0x50)       Completed without error       00%         0         -

SMART Selective self-test log data structure revision number 1
 SPAN  MIN_LBA  MAX_LBA  CURRENT_TEST_STATUS
    1        0        0  Not_testing
    2        0        0  Not_testing
    3        0        0  Not_testing
    4        0        0  Not_testing
    5        0        0  Not_testing
Selective self-test flags (0x0):
  After scanning selected spans, do NOT read-scan remainder of disk.
If Selective self-test is pending on power-up, resume after 0 minute delay.

SCT Status Version:                  3
SCT Version (vendor specific):       522 (0x020a)
Device State:                        Active (0)
Current Temperature:                    30 Celsius
Power Cycle Min/Max Temperature:     21/30 Celsius
Lifetime    Min/Max Temperature:     13/49 Celsius
Under/Over Temperature Limit Count:   0/9
Vendor specific:
00 00 00 00 00 00 00 00 00 00 02 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

SCT Temperature History Version:     2
Temperature Sampling Period:         1 minute
Temperature Logging Interval:        11 minutes
Min/Max recommended Temperature:      0/ 0 Celsius
Min/Max Temperature Limit:            0/ 0 Celsius
Temperature History Size (Index):    128 (90)

Index    Estimated Time   Temperature Celsius
  91    2020-01-02 17:15    37  ******************
  92    2020-01-02 17:26    38  *******************
  93    2020-01-02 17:37    39  ********************
  94    2020-01-02 17:48    40  *********************
  95    2020-01-02 17:59    40  *********************
  96    2020-01-02 18:10    40  *********************
  97    2020-01-02 18:21    38  *******************
  98    2020-01-02 18:32    36  *****************
  99    2020-01-02 18:43    36  *****************
 100    2020-01-02 18:54    39  ********************
 101    2020-01-02 19:05     ?  -
 102    2020-01-02 19:16    34  ***************
 103    2020-01-02 19:27     ?  -
 104    2020-01-02 19:38    33  **************
 105    2020-01-02 19:49     ?  -
 106    2020-01-02 20:00    33  **************
 107    2020-01-02 20:11     ?  -
 108    2020-01-02 20:22    32  *************
 109    2020-01-02 20:33     ?  -
 110    2020-01-02 20:44    32  *************
 111    2020-01-02 20:55     ?  -
 112    2020-01-02 21:06    35  ****************
 113    2020-01-02 21:17     ?  -
 114    2020-01-02 21:28    34  ***************
 115    2020-01-02 21:39     ?  -
 116    2020-01-02 21:50    34  ***************
 117    2020-01-02 22:01     ?  -
 118    2020-01-02 22:12    28  *********
 119    2020-01-02 22:23     ?  -
 120    2020-01-02 22:34    26  *******
 121    2020-01-02 22:45     ?  -
 122    2020-01-02 22:56    32  *************
 123    2020-01-02 23:07     ?  -
 124    2020-01-02 23:18    26  *******
 125    2020-01-02 23:29     ?  -
 126    2020-01-02 23:40    29  **********
 127    2020-01-02 23:51     ?  -
   0    2020-01-03 00:02    28  *********
   1    2020-01-03 00:13     ?  -
   2    2020-01-03 00:24    31  ************
   3    2020-01-03 00:35    32  *************
   4    2020-01-03 00:46    34  ***************
   5    2020-01-03 00:57    34  ***************
   6    2020-01-03 01:08    36  *****************
   7    2020-01-03 01:19    40  *********************
   8    2020-01-03 01:30     ?  -
   9    2020-01-03 01:41    36  *****************
  10    2020-01-03 01:52     ?  -
  11    2020-01-03 02:03    28  *********
  12    2020-01-03 02:14     ?  -
  13    2020-01-03 02:25    24  *****
  14    2020-01-03 02:36     ?  -
  15    2020-01-03 02:47    36  *****************
  16    2020-01-03 02:58     ?  -
  17    2020-01-03 03:09    30  ***********
  18    2020-01-03 03:20     ?  -
  19    2020-01-03 03:31    32  *************
  20    2020-01-03 03:42     ?  -
  21    2020-01-03 03:53    27  ********
  22    2020-01-03 04:04     ?  -
  23    2020-01-03 04:15    23  ****
  24    2020-01-03 04:26    24  *****
  25    2020-01-03 04:37    32  *************
  26    2020-01-03 04:48    34  ***************
  27    2020-01-03 04:59     ?  -
  28    2020-01-03 05:10    26  *******
  29    2020-01-03 05:21     ?  -
  30    2020-01-03 05:32    30  ***********
  31    2020-01-03 05:43    31  ************
  32    2020-01-03 05:54    35  ****************
  33    2020-01-03 06:05     ?  -
  34    2020-01-03 06:16    36  *****************
  35    2020-01-03 06:27     ?  -
  36    2020-01-03 06:38    28  *********
  37    2020-01-03 06:49     ?  -
  38    2020-01-03 07:00    24  *****
  39    2020-01-03 07:11     ?  -
  40    2020-01-03 07:22    28  *********
  41    2020-01-03 07:33     ?  -
  42    2020-01-03 07:44    26  *******
  43    2020-01-03 07:55    27  ********
  44    2020-01-03 08:06    36  *****************
  45    2020-01-03 08:17    39  ********************
  46    2020-01-03 08:28     ?  -
  47    2020-01-03 08:39    28  *********
  48    2020-01-03 08:50     ?  -
  49    2020-01-03 09:01    26  *******
  50    2020-01-03 09:12     ?  -
  51    2020-01-03 09:23    26  *******
  52    2020-01-03 09:34     ?  -
  53    2020-01-03 09:45    27  ********
  54    2020-01-03 09:56     ?  -
  55    2020-01-03 10:07    26  *******
  56    2020-01-03 10:18     ?  -
  57    2020-01-03 10:29    25  ******
  58    2020-01-03 10:40     ?  -
  59    2020-01-03 10:51    24  *****
  60    2020-01-03 11:02     ?  -
  61    2020-01-03 11:13    36  *****************
  62    2020-01-03 11:24    36  *****************
  63    2020-01-03 11:35    39  ********************
  64    2020-01-03 11:46     ?  -
  65    2020-01-03 11:57    40  *********************
  66    2020-01-03 12:08     ?  -
  67    2020-01-03 12:19    36  *****************
  68    2020-01-03 12:30     ?  -
  69    2020-01-03 12:41    36  *****************
  70    2020-01-03 12:52    36  *****************
  71    2020-01-03 13:03    36  *****************
  72    2020-01-03 13:14    37  ******************
  73    2020-01-03 13:25     ?  -
  74    2020-01-03 13:36    27  ********
  75    2020-01-03 13:47     ?  -
  76    2020-01-03 13:58    27  ********
  77    2020-01-03 14:09     ?  -
  78    2020-01-03 14:20    28  *********
  79    2020-01-03 14:31     ?  -
  80    2020-01-03 14:42    26  *******
  81    2020-01-03 14:53     ?  -
  82    2020-01-03 15:04    21  **
  83    2020-01-03 15:15    25  ******
  84    2020-01-03 15:26    28  *********
  85    2020-01-03 15:37    29  **********
  86    2020-01-03 15:48    30  ***********
 ...    ..(  3 skipped).    ..  ***********
  90    2020-01-03 16:32    30  ***********

SCT Error Recovery Control command not supported

Device Statistics (GP/SMART Log 0x04) not supported

Pending Defects log (GP Log 0x0c) not supported

SATA Phy Event Counters (GP Log 0x11)
ID      Size     Value  Description
0x000a  2            3  Device-to-host register FISes sent due to a COMRESET
0x0001  2            0  Command failed due to ICRC error
0x0003  2            0  R_ERR response for device-to-host data FIS
0x0004  2            0  R_ERR response for host-to-device data FIS
0x0006  2            0  R_ERR response for device-to-host non-data FIS
0x0007  2            0  R_ERR response for host-to-device non-data FIS


smartctl 7.0 2019-03-31 r4903 [x86_64-linux-5.3.16-300.fc31.x86_64] (local build)
Copyright (C) 2002-18, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF READ SMART DATA SECTION ===
SMART Attributes Data Structure revision number: 10
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  1 Raw_Read_Error_Rate     0x000f   117   099   034    Pre-fail  Always       -       123532688
  3 Spin_Up_Time            0x0003   099   099   000    Pre-fail  Always       -       0
  4 Start_Stop_Count        0x0032   090   090   020    Old_age   Always       -       10652
  5 Reallocated_Sector_Ct   0x0033   100   100   036    Pre-fail  Always       -       0
  7 Seek_Error_Rate         0x000f   066   060   030    Pre-fail  Always       -       47291182838
  9 Power_On_Hours          0x0032   098   098   000    Old_age   Always       -       1786 (60 37 0)
 10 Spin_Retry_Count        0x0013   100   100   097    Pre-fail  Always       -       0
 12 Power_Cycle_Count       0x0032   098   098   020    Old_age   Always       -       2729
184 End-to-End_Error        0x0032   100   100   099    Old_age   Always       -       0
187 Reported_Uncorrect      0x0032   100   100   000    Old_age   Always       -       0
188 Command_Timeout         0x0032   100   100   000    Old_age   Always       -       65537
189 High_Fly_Writes         0x003a   100   100   000    Old_age   Always       -       0
190 Airflow_Temperature_Cel 0x0022   070   052   045    Old_age   Always       -       30 (Min/Max 21/30)
191 G-Sense_Error_Rate      0x0032   100   100   000    Old_age   Always       -       1346
192 Power-Off_Retract_Count 0x0032   100   100   000    Old_age   Always       -       71
193 Load_Cycle_Count        0x0032   088   088   000    Old_age   Always       -       24681
194 Temperature_Celsius     0x0022   030   048   000    Old_age   Always       -       30 (0 13 0 0 0)
196 Reallocated_Event_Count 0x000f   099   099   030    Pre-fail  Always       -       1722 (3041 0)
197 Current_Pending_Sector  0x0012   100   100   000    Old_age   Always       -       0
198 Offline_Uncorrectable   0x0010   100   100   000    Old_age   Offline      -       0
199 UDMA_CRC_Error_Count    0x003e   200   200   000    Old_age   Always       -       1
254 Free_Fall_Sensor        0x0032   100   100   000    Old_age   Always       -       0

```
