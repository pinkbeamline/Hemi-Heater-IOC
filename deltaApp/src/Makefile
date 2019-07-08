TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = delta
# delta.dbd will be created and installed
DBD += delta.dbd

# delta.dbd will be made up from these files:
delta_DBD += base.dbd

# Include dbd files from all support applications:
delta_DBD += asyn.dbd
delta_DBD += drvAsynIPPort.dbd
delta_DBD += modbusSupport.dbd
delta_DBD += calc.dbd

# Add all the support libraries needed by this IOC
delta_LIBS += asyn
delta_LIBS += modbus
delta_LIBS += calc

# delta_registerRecordDeviceDriver.cpp derives from delta.dbd
delta_SRCS += delta_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
delta_SRCS_DEFAULT += deltaMain.cpp
delta_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#delta_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
delta_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
