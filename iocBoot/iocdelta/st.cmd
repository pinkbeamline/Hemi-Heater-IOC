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
## Heater 1
drvModbusAsynConfigure(    "HM1_RWord",          "HM",            1,              3,             0x1000,            2,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure(    "HM1_WWord",          "HM",            1,              6,             0x1001,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_RBinary1",          "HM",            1,              2,             0x0800,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_RBinary2",          "HM",            1,              2,             0x0813,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WBinary1",          "HM",            1,              5,             0x0813,           16,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM1_WBinary2",          "HM",            1,              5,             0x0814,           16,        0,        0, "Hemi-Delta")
## Heater 2
drvModbusAsynConfigure(    "HM2_RWord",          "HM",            2,              3,             0x1000,            2,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure(    "HM2_WWord",          "HM",            2,              6,             0x1001,            1,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_RBinary1",          "HM",            2,              2,             0x0800,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_RBinary2",          "HM",            2,              2,             0x0813,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WBinary1",          "HM",            2,              5,             0x0813,           16,        0,        0, "Hemi-Delta")
drvModbusAsynConfigure( "HM2_WBinary2",          "HM",            2,              5,             0x0814,           16,        0,        0, "Hemi-Delta")
## Heater 3
drvModbusAsynConfigure(    "HM3_RWord",          "HM",            3,              3,             0x1000,            8,        0,     1000, "Hemi-Delta")
drvModbusAsynConfigure(    "HM3_WWord",          "HM",            3,              6,             0x1001,            1,        0,        0, "Hemi-Delta")
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

#dbLoadTemplate("hemi1.substitutions")
##dbLoadTemplate("hemi2.substitutions")
dbLoadTemplate("hemi3.substitutions")

iocInit

## Start any sequence programs
#seq sncxxx,"user=epics"
