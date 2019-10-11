#!../../bin/linux-x86_64/delta

## You may have to change delta to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/delta.dbd"
delta_registerRecordDeviceDriver pdbbase

# Use the following commands for TCP/IP
#drvAsynIPPortConfigure(const char *portName,
#                       const char *hostInfo,
#                       unsigned int priority,
#                       int noAutoConnect,
#                       int noProcessEos);
# This line is for Modbus TCP
drvAsynIPPortConfigure("HM","172.17.10.75:4005",0,0,0)
asynOctetSetInputEos("HM",0,"\r\n")
asynOctetSetOutputEos("HM",0,"\r\n")

#modbusInterposeConfig(const char *portName,
#                      modbusLinkType linkType,
#                      int timeoutMsec,
#                      int writeDelayMsec)
# link types:
# 0: TCP/IP
# 1: RTU
# 2: ASCII
# This line is for Modbus TCP
modbusInterposeConfig("HM",2,2000,0)

# Word access at Modbus address 1000
# Access 41 words as inputs.
# Function code=23 (r/w)
# default data type unsigned integer.
# drvModbusAsynConfigure(   "portName", "tcpPortName", slaveAddress, modbusFunction, modbusStartAddress, modbusLength, dataType, pollMsec,    "plcType")

###  Heater 1  #########################################################################################################################################
drvModbusAsynConfigure(    "HM1_RWord",          "HM",            1,              3,             0x1000,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure(   "HM1_RWord2",          "HM",            1,              3,             0x1030,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure(   "HM1_RWord3",          "HM",            1,              3,             0x1009,            4,        0,     5000, "Hemi-Delta")
drvModbusAsynConfigure(   "HM1_RWord7",          "HM",            1,              3,             0x2000,            8,        0,     5000, "Hemi-Delta")
drvModbusAsynConfigure(   "HM1_RWord8",          "HM",            1,              3,             0x2080,            8,        0,     5000, "Hemi-Delta")
drvModbusAsynConfigure(    "HM1_WWord",          "HM",            1,              6,             0x1001,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(   "HM1_WWord1",          "HM",            1,              6,             0x1004,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(   "HM1_WWord2",          "HM",            1,              6,             0x1005,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WWord_pb",          "HM",            1,              6,             0x1009,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WWord_ti",          "HM",            1,              6,             0x100A,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WWord_td",          "HM",            1,              6,             0x100B,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure("HM1_WWord_int",          "HM",            1,              6,             0x100C,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WWordSP0",          "HM",            1,              6,             0x2000,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WWordSP1",          "HM",            1,              6,             0x2001,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WWordSP2",          "HM",            1,              6,             0x2002,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WWordSP3",          "HM",            1,              6,             0x2003,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WWordSP4",          "HM",            1,              6,             0x2004,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WWordSP5",          "HM",            1,              6,             0x2005,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WWordSP6",          "HM",            1,              6,             0x2006,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WWordSP7",          "HM",            1,              6,             0x2007,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM1_WWordT0",          "HM",            1,              6,             0x2080,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM1_WWordT1",          "HM",            1,              6,             0x2081,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM1_WWordT2",          "HM",            1,              6,             0x2082,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM1_WWordT3",          "HM",            1,              6,             0x2083,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM1_WWordT4",          "HM",            1,              6,             0x2084,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM1_WWordT5",          "HM",            1,              6,             0x2085,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM1_WWordT6",          "HM",            1,              6,             0x2086,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM1_WWordT7",          "HM",            1,              6,             0x2087,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_RBinary1",          "HM",            1,              2,             0x0800,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_RBinary2",          "HM",            1,              2,             0x0813,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WBinary1",          "HM",            1,              5,             0x0813,           16,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WBinary2",          "HM",            1,              5,             0x0814,           16,        0,        0, "Hemi-Delta")
###  Heater 2  #########################################################################################################################################
drvModbusAsynConfigure(    "HM2_RWord",          "HM",            2,              3,             0x1000,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure(   "HM2_RWord2",          "HM",            2,              3,             0x1030,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure(   "HM2_RWord3",          "HM",            2,              3,             0x1009,            4,        0,     5000, "Hemi-Delta")
drvModbusAsynConfigure(   "HM2_RWord7",          "HM",            2,              3,             0x2000,            8,        0,     5000, "Hemi-Delta")
drvModbusAsynConfigure(   "HM2_RWord8",          "HM",            2,              3,             0x2080,            8,        0,     5000, "Hemi-Delta")
drvModbusAsynConfigure(    "HM2_WWord",          "HM",            2,              6,             0x1001,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(   "HM2_WWord1",          "HM",            2,              6,             0x1004,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(   "HM2_WWord2",          "HM",            2,              6,             0x1005,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WWord_pb",          "HM",            2,              6,             0x1009,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WWord_ti",          "HM",            2,              6,             0x100A,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WWord_td",          "HM",            2,              6,             0x100B,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure("HM2_WWord_int",          "HM",            2,              6,             0x100C,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WWordSP0",          "HM",            2,              6,             0x2000,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WWordSP1",          "HM",            2,              6,             0x2001,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WWordSP2",          "HM",            2,              6,             0x2002,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WWordSP3",          "HM",            2,              6,             0x2003,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WWordSP4",          "HM",            2,              6,             0x2004,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WWordSP5",          "HM",            2,              6,             0x2005,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WWordSP6",          "HM",            2,              6,             0x2006,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WWordSP7",          "HM",            2,              6,             0x2007,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM2_WWordT0",          "HM",            2,              6,             0x2080,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM2_WWordT1",          "HM",            2,              6,             0x2081,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM2_WWordT2",          "HM",            2,              6,             0x2082,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM2_WWordT3",          "HM",            2,              6,             0x2083,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM2_WWordT4",          "HM",            2,              6,             0x2084,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM2_WWordT5",          "HM",            2,              6,             0x2085,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM2_WWordT6",          "HM",            2,              6,             0x2086,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM2_WWordT7",          "HM",            2,              6,             0x2087,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_RBinary1",          "HM",            2,              2,             0x0800,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_RBinary2",          "HM",            2,              2,             0x0813,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WBinary1",          "HM",            2,              5,             0x0813,           16,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WBinary2",          "HM",            2,              5,             0x0814,           16,        0,        0, "Hemi-Delta")

###  Heater 3  #########################################################################################################################################
drvModbusAsynConfigure(    "HM3_RWord",          "HM",            3,              3,             0x1000,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure(   "HM3_RWord2",          "HM",            3,              3,             0x1030,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure(   "HM3_RWord3",          "HM",            3,              3,             0x1009,            4,        0,     5000, "Hemi-Delta")
##drvModbusAsynConfigure(   "HM3_RWord4",          "HM",            3,              3,             0x1040,            1,        0,     3000, "Hemi-Delta")
##drvModbusAsynConfigure(   "HM3_RWord6",          "HM",            3,              3,             0x1060,            1,        0,     3000, "Hemi-Delta")
drvModbusAsynConfigure(   "HM3_RWord7",          "HM",            3,              3,             0x2000,            8,        0,     5000, "Hemi-Delta")
drvModbusAsynConfigure(   "HM3_RWord8",          "HM",            3,              3,             0x2080,            8,        0,     5000, "Hemi-Delta")
drvModbusAsynConfigure(    "HM3_WWord",          "HM",            3,              6,             0x1001,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(   "HM3_WWord1",          "HM",            3,              6,             0x1004,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(   "HM3_WWord2",          "HM",            3,              6,             0x1005,            1,        0,        0, "Hemi-Delta")
##drvModbusAsynConfigure(   "HM3_WWord3",          "HM",            3,              6,             0x1040,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_WWord_pb",          "HM",            3,              6,             0x1009,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_WWord_ti",          "HM",            3,              6,             0x100A,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_WWord_td",          "HM",            3,              6,             0x100B,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure("HM3_WWord_int",          "HM",            3,              6,             0x100C,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_WWordSP0",          "HM",            3,              6,             0x2000,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_WWordSP1",          "HM",            3,              6,             0x2001,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_WWordSP2",          "HM",            3,              6,             0x2002,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_WWordSP3",          "HM",            3,              6,             0x2003,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_WWordSP4",          "HM",            3,              6,             0x2004,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_WWordSP5",          "HM",            3,              6,             0x2005,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_WWordSP6",          "HM",            3,              6,             0x2006,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_WWordSP7",          "HM",            3,              6,             0x2007,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM3_WWordT0",          "HM",            3,              6,             0x2080,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM3_WWordT1",          "HM",            3,              6,             0x2081,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM3_WWordT2",          "HM",            3,              6,             0x2082,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM3_WWordT3",          "HM",            3,              6,             0x2083,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM3_WWordT4",          "HM",            3,              6,             0x2084,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM3_WWordT5",          "HM",            3,              6,             0x2085,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM3_WWordT6",          "HM",            3,              6,             0x2086,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure(  "HM3_WWordT7",          "HM",            3,              6,             0x2087,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_RBinary1",          "HM",            3,              2,             0x0800,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_RBinary2",          "HM",            3,              2,             0x0813,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_WBinary1",          "HM",            3,              5,             0x0813,           16,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM3_WBinary2",          "HM",            3,              5,             0x0814,           16,        0,        0, "Hemi-Delta")

# Enable ASYN_TRACEIO_HEX on modbus server
#asynSetTraceIOMask("HM",0,4)
dbLoadRecords("$(ASYN)/db/asynRecord.db","P=PINK:HEMI:,R=asyn,PORT=HM,ADDR=0,OMAX=128,IMAX=128")

## Load record instances
#dbLoadRecords("db/hemi.db","BL=PINK,DEV=HEMI2")

cd "${TOP}/iocBoot/${IOC}"

dbLoadTemplate("hemi1.substitutions")
dbLoadTemplate("hemi2.substitutions")
dbLoadTemplate("hemi3.substitutions")

set_savefile_path("${TOP}/iocBoot/${IOC}/autosave")
set_pass0_restoreFile("auto_settings.sav")

iocInit

create_monitor_set("auto_settings.req", 30, "BL=PINK")
## Start any sequence programs
#seq sncxxx,"user=epics"
