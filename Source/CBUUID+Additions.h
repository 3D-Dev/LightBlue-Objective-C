//
//  CBUUID+Additions.h
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 17/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import <CoreBluetooth/CoreBluetooth.h>
/**
 The standard service UUID defined in the `Bluetooth Developer Portal` website.
 It will be used to create the standard service and obtain the standard service name.
 */
#define LBStandardServiceUUIDGenericAccess                [CBUUID UUIDWithString:@"1800"]
#define LBStandardServiceUUIDGenericAttribute             [CBUUID UUIDWithString:@"1801"]
#define LBStandardServiceUUIDImmediateAlert               [CBUUID UUIDWithString:@"1802"]
#define LBStandardServiceUUIDLinkLoss                     [CBUUID UUIDWithString:@"1803"]
#define LBStandardServiceUUIDTxPower                      [CBUUID UUIDWithString:@"1804"]
#define LBStandardServiceUUIDCurrentTimeService           [CBUUID UUIDWithString:@"1805"]
#define LBStandardServiceUUIDReferenceTimeUpdateService   [CBUUID UUIDWithString:@"1806"]
#define LBStandardServiceUUIDNextDSTChangeService         [CBUUID UUIDWithString:@"1807"]
#define LBStandardServiceUUIDGlucose                      [CBUUID UUIDWithString:@"1808"]
#define LBStandardServiceUUIDHealthThermometer            [CBUUID UUIDWithString:@"1809"]
#define LBStandardServiceUUIDDeviceInformation            [CBUUID UUIDWithString:@"180A"]
#define LBStandardServiceUUIDHeartRate                    [CBUUID UUIDWithString:@"180D"]
#define LBStandardServiceUUIDPhoneAlertStatusService      [CBUUID UUIDWithString:@"180E"]
#define LBStandardServiceUUIDBatterService                [CBUUID UUIDWithString:@"180F"]
#define LBStandardServiceUUIDBloodPressure                [CBUUID UUIDWithString:@"1810"]
#define LBStandardServiceUUIDAlertNotification            [CBUUID UUIDWithString:@"1811"]
#define LBStandardServiceUUIDHumanInterfaceDevice         [CBUUID UUIDWithString:@"1812"]
#define LBStandardServiceUUIDScanParameters               [CBUUID UUIDWithString:@"1813"]
#define LBStandardServiceUUIDRunningSpeedAndCadence       [CBUUID UUIDWithString:@"1814"]
#define LBStandardServiceUUIDAutomationIO                 [CBUUID UUIDWithString:@"1815"]
#define LBStandardServiceUUIDCyclingSpeedAndCadence       [CBUUID UUIDWithString:@"1816"]
#define LBStandardServiceUUIDCyclingPower                 [CBUUID UUIDWithString:@"1818"]
#define LBStandardServiceUUIDLocationAndNavigation        [CBUUID UUIDWithString:@"1819"]
#define LBStandardServiceUUIDEnvironmentalSensing         [CBUUID UUIDWithString:@"181A"]
#define LBStandardServiceUUIDBodyComposition              [CBUUID UUIDWithString:@"181B"]
#define LBStandardServiceUUIDUserData                     [CBUUID UUIDWithString:@"181C"]
#define LBStandardServiceUUIDWeightScale                  [CBUUID UUIDWithString:@"181D"]
#define LBStandardServiceUUIDBondManagement               [CBUUID UUIDWithString:@"181E"]
#define LBStandardServiceUUIDContinuousGlucoseMonitoring  [CBUUID UUIDWithString:@"181F"]
#define LBStandardServiceUUIDInternetProtocolSupport      [CBUUID UUIDWithString:@"1820"]
#define LBStandardServiceUUIDIndoorPositioning            [CBUUID UUIDWithString:@"1821"]
#define LBStandardServiceUUIDPulseOximeter                [CBUUID UUIDWithString:@"1822"]
#define LBStandardServiceUUIDHttpProxy                    [CBUUID UUIDWithString:@"1823"]
#define LBStandardServiceUUIDTransportDiscovery           [CBUUID UUIDWithString:@"1824"]
#define LBStandardServiceUUIDObjectTransfer               [CBUUID UUIDWithString:@"1825"]

/**
 The standard characteristic UUID define in the `Bluetooth Developer Portal` website.
 It will be used to create the standard characteristic and otain the standard characteristic name.
 */
#define LBStandardCharacteristicUUIDDeviceName                                      [CBUUID UUIDWithString:@"2A00"]
#define LBStandardCharacteristicUUIDAppearance                                      [CBUUID UUIDWithString:@"2A01"]
#define LBStandardCharacteristicUUIDPeripheralPrivacyFlag                           [CBUUID UUIDWithString:@"2A02"]
#define LBStandardCharacteristicUUIDReconnectionAddress                             [CBUUID UUIDWithString:@"2A03"]
#define LBStandardCharacteristicUUIDPeripheralPreferredConnectionParameters         [CBUUID UUIDWithString:@"2A04"]
#define LBStandardCharacteristicUUIDServiceChanged                                  [CBUUID UUIDWithString:@"2A05"]
#define LBStandardCharacteristicUUIDAlertLevel                                      [CBUUID UUIDWithString:@"2A06"]
#define LBStandardCharacteristicUUIDTxPowerLevel                                    [CBUUID UUIDWithString:@"2A07"]
#define LBStandardCharacteristicUUIDDateTime                                        [CBUUID UUIDWithString:@"2A08"]
#define LBStandardCharacteristicUUIDDayOfWeek                                       [CBUUID UUIDWithString:@"2A09"]
#define LBStandardCharacteristicUUIDDayDateTime                                     [CBUUID UUIDWithString:@"2A0A"]
#define LBStandardCharacteristicUUIDExactTime256                                    [CBUUID UUIDWithString:@"2A0C"]
#define LBStandardCharacteristicUUIDDSTOffset                                       [CBUUID UUIDWithString:@"2A0D"]
#define LBStandardCharacteristicUUIDTimeZone                                        [CBUUID UUIDWithString:@"2A0E"]
#define LBStandardCharacteristicUUIDLocalTimeInformation                            [CBUUID UUIDWithString:@"2A0F"]
#define LBStandardCharacteristicUUIDTimeWithDST                                     [CBUUID UUIDWithString:@"2A11"]
#define LBStandardCharacteristicUUIDTimeAccuracy                                    [CBUUID UUIDWithString:@"2A12"]
#define LBStandardCharacteristicUUIDTimeSource                                      [CBUUID UUIDWithString:@"2A13"]
#define LBStandardCharacteristicUUIDReferenceTimeInformation                        [CBUUID UUIDWithString:@"2A14"]
#define LBStandardCharacteristicUUIDTimeUpdateControlPoint                          [CBUUID UUIDWithString:@"2A16"]
#define LBStandardCharacteristicUUIDTimeUpdateState                                 [CBUUID UUIDWithString:@"2A17"]
#define LBStandardCharacteristicUUIDGlucoseMeasurement                              [CBUUID UUIDWithString:@"2A18"]
#define LBStandardCharacteristicUUIDBatteryLevel                                    [CBUUID UUIDWithString:@"2A19"]
#define LBStandardCharacteristicUUIDTemperatureMeasurement                          [CBUUID UUIDWithString:@"2A1C"]
#define LBStandardCharacteristicUUIDTemperatureType                                 [CBUUID UUIDWithString:@"2A1D"]
#define LBStandardCharacteristicUUIDIntermediateTemperature                         [CBUUID UUIDWithString:@"2A1E"]
#define LBStandardCharacteristicUUIDMeasurementInterval                             [CBUUID UUIDWithString:@"2A21"]
#define LBStandardCharacteristicUUIDBootKeyboardInputReport                         [CBUUID UUIDWithString:@"2A22"]
#define LBStandardCharacteristicUUIDSystemID                                        [CBUUID UUIDWithString:@"2A23"]
#define LBStandardCharacteristicUUIDModelNumberString                               [CBUUID UUIDWithString:@"2A24"]
#define LBStandardCharacteristicUUIDSerialNumberString                              [CBUUID UUIDWithString:@"2A25"]
#define LBStandardCharacteristicUUIDFirmwareRevisionString                          [CBUUID UUIDWithString:@"2A26"]
#define LBStandardCharacteristicUUIDHardwareRevisionString                          [CBUUID UUIDWithString:@"2A27"]
#define LBStandardCharacteristicUUIDSoftwareRevisionString                          [CBUUID UUIDWithString:@"2A28"]
#define LBStandardCharacteristicUUIDManufacturerNameString                          [CBUUID UUIDWithString:@"2A29"]
#define LBStandardCharacteristicUUIDIEEE11073_20601RegulatoryCertificationDataList  [CBUUID UUIDWithString:@"2A2A"]
#define LBStandardCharacteristicUUIDCurrentTime                                     [CBUUID UUIDWithString:@"2A2B"]
#define LBStandardCharacteristicUUIDMagneticDeclination                             [CBUUID UUIDWithString:@"2A2C"]
#define LBStandardCharacteristicUUIDScanRefresh                                     [CBUUID UUIDWithString:@"2A31"]
#define LBStandardCharacteristicUUIDBootKeyboardOutputReport                        [CBUUID UUIDWithString:@"2A32"]
#define LBStandardCharacteristicUUIDBootMouseInputReport                            [CBUUID UUIDWithString:@"2A33"]
#define LBStandardCharacteristicUUIDGlucoseMeasurementContext                       [CBUUID UUIDWithString:@"2A34"]
#define LBStandardCharacteristicUUIDBloodPressureMeasurement                        [CBUUID UUIDWithString:@"2A35"]
#define LBStandardCharacteristicUUIDIntermediateCuffPressure                        [CBUUID UUIDWithString:@"2A36"]
#define LBStandardCharacteristicUUIDHeartRateMeasurement                            [CBUUID UUIDWithString:@"2A37"]
#define LBStandardCharacteristicUUIDBodySensorLocation                              [CBUUID UUIDWithString:@"2A38"]
#define LBStandardCharacteristicUUIDHeartRateControlPoint                           [CBUUID UUIDWithString:@"2A39"]
#define LBStandardCharacteristicUUIDAlertStatus                                     [CBUUID UUIDWithString:@"2A3F"]
#define LBStandardCharacteristicUUIDRingerControlPoint                              [CBUUID UUIDWithString:@"2A40"]
#define LBStandardCharacteristicUUIDRingerSetting                                   [CBUUID UUIDWithString:@"2A41"]
#define LBStandardCharacteristicUUIDAlertCategoryIDBitMask                          [CBUUID UUIDWithString:@"2A42"]
#define LBStandardCharacteristicUUIDAlertCategoryID                                 [CBUUID UUIDWithString:@"2A43"]
#define LBStandardCharacteristicUUIDAlertNotificationControlPoint                   [CBUUID UUIDWithString:@"2A44"]
#define LBStandardCharacteristicUUIDUnreadAlertStatus                               [CBUUID UUIDWithString:@"2A45"]
#define LBStandardCharacteristicUUIDNewAlert                                        [CBUUID UUIDWithString:@"2A46"]
#define LBStandardCharacteristicUUIDSupportedNewAlertCategory                       [CBUUID UUIDWithString:@"2A47"]
#define LBStandardCharacteristicUUIDSupportedUnreadAlertCategory                    [CBUUID UUIDWithString:@"2A48"]
#define LBStandardCharacteristicUUIDBloodPressureFeature                            [CBUUID UUIDWithString:@"2A49"]
#define LBStandardCharacteristicUUIDHIDInformation                                  [CBUUID UUIDWithString:@"2A4A"]
#define LBStandardCharacteristicUUIDReportMap                                       [CBUUID UUIDWithString:@"2A4B"]
#define LBStandardCharacteristicUUIDHIDControlPoint                                 [CBUUID UUIDWithString:@"2A4C"]
#define LBStandardCharacteristicUUIDReport                                          [CBUUID UUIDWithString:@"2A4D"]
#define LBStandardCharacteristicUUIDProtocolMode                                    [CBUUID UUIDWithString:@"2A4E"]
#define LBStandardCharacteristicUUIDScanIntervalWindow                              [CBUUID UUIDWithString:@"2A4F"]
#define LBStandardCharacteristicUUIDPnPID                                           [CBUUID UUIDWithString:@"2A50"]
#define LBStandardCharacteristicUUIDGlucoseFeature                                  [CBUUID UUIDWithString:@"2A51"]
#define LBStandardCharacteristicUUIDRecordAccessControlPoint                        [CBUUID UUIDWithString:@"2A52"]
#define LBStandardCharacteristicUUIDRSCMeasurement                                  [CBUUID UUIDWithString:@"2A53"]
#define LBStandardCharacteristicUUIDRSCFeature                                      [CBUUID UUIDWithString:@"2A54"]
#define LBStandardCharacteristicUUIDSCControlPoint                                  [CBUUID UUIDWithString:@"2A55"]
#define LBStandardCharacteristicUUIDDigital                                         [CBUUID UUIDWithString:@"2A56"]
#define LBStandardCharacteristicUUIDAnalog                                          [CBUUID UUIDWithString:@"2A58"]
#define LBStandardCharacteristicUUIDAggregate                                       [CBUUID UUIDWithString:@"2A5A"]
#define LBStandardCharacteristicUUIDCSCMeasurement                                  [CBUUID UUIDWithString:@"2A5B"]
#define LBStandardCharacteristicUUIDCSCFeature                                      [CBUUID UUIDWithString:@"2A5C"]
#define LBStandardCharacteristicUUIDSensorLocation                                  [CBUUID UUIDWithString:@"2A5D"]
#define LBStandardCharacteristicUUIDPLXSpot_CheckMeasurement                        [CBUUID UUIDWithString:@"2A5E"]
#define LBStandardCharacteristicUUIDPLXContinuousMeasurement                        [CBUUID UUIDWithString:@"2A5F"]
#define LBStandardCharacteristicUUIDPLXFeatures                                     [CBUUID UUIDWithString:@"2A60"]
#define LBStandardCharacteristicUUIDCyclingPowerMeasurement                         [CBUUID UUIDWithString:@"2A63"]
#define LBStandardCharacteristicUUIDCyclingPowerVector                              [CBUUID UUIDWithString:@"2A64"]
#define LBStandardCharacteristicUUIDCyclingPowerFeature                             [CBUUID UUIDWithString:@"2A65"]
#define LBStandardCharacteristicUUIDCyclingPowerControlPoint                        [CBUUID UUIDWithString:@"2A66"]
#define LBStandardCharacteristicUUIDLocationAndSpeed                                [CBUUID UUIDWithString:@"2A67"]
#define LBStandardCharacteristicUUIDNavigation                                      [CBUUID UUIDWithString:@"2A68"]
#define LBStandardCharacteristicUUIDPositionQuality                                 [CBUUID UUIDWithString:@"2A69"]
#define LBStandardCharacteristicUUIDLNFeature                                       [CBUUID UUIDWithString:@"2A6A"]
#define LBStandardCharacteristicUUIDLNControlPoint                                  [CBUUID UUIDWithString:@"2A6B"]
#define LBStandardCharacteristicUUIDElevation                                       [CBUUID UUIDWithString:@"2A6C"]
#define LBStandardCharacteristicUUIDPressure                                        [CBUUID UUIDWithString:@"2A6D"]
#define LBStandardCharacteristicUUIDTemperature                                     [CBUUID UUIDWithString:@"2A6E"]
#define LBStandardCharacteristicUUIDHumidity                                        [CBUUID UUIDWithString:@"2A6F"]
#define LBStandardCharacteristicUUIDTrueWindSpeed                                   [CBUUID UUIDWithString:@"2A70"]
#define LBStandardCharacteristicUUIDTrueWindDirection                               [CBUUID UUIDWithString:@"2A71"]
#define LBStandardCharacteristicUUIDApparentWindSpeed                               [CBUUID UUIDWithString:@"2A72"]
#define LBStandardCharacteristicUUIDApparentWindDirection                           [CBUUID UUIDWithString:@"2A73"]
#define LBStandardCharacteristicUUIDGustFactor                                      [CBUUID UUIDWithString:@"2A74"]
#define LBStandardCharacteristicUUIDPollenConcentration                             [CBUUID UUIDWithString:@"2A75"]
#define LBStandardCharacteristicUUIDUVIndex                                         [CBUUID UUIDWithString:@"2A76"]
#define LBStandardCharacteristicUUIDIrradiance                                      [CBUUID UUIDWithString:@"2A77"]
#define LBStandardCharacteristicUUIDRainfall                                        [CBUUID UUIDWithString:@"2A78"]
#define LBStandardCharacteristicUUIDWindChill                                       [CBUUID UUIDWithString:@"2A79"]
#define LBStandardCharacteristicUUIDHeatIndex                                       [CBUUID UUIDWithString:@"2A7A"]
#define LBStandardCharacteristicUUIDDewPoint                                        [CBUUID UUIDWithString:@"2A7B"]
#define LBStandardCharacteristicUUIDDescriptorValueChanged                          [CBUUID UUIDWithString:@"2A7D"]
#define LBStandardCharacteristicUUIDAerobicHeartRateLowerLimit                      [CBUUID UUIDWithString:@"2A7E"]
#define LBStandardCharacteristicUUIDAerobicThreshold                                [CBUUID UUIDWithString:@"2A7F"]
#define LBStandardCharacteristicUUIDAge                                             [CBUUID UUIDWithString:@"2A80"]
#define LBStandardCharacteristicUUIDAnaerobicHeartRateLowerLimit                    [CBUUID UUIDWithString:@"2A81"]
#define LBStandardCharacteristicUUIDAnaerobicHeartRateUpperLimit                    [CBUUID UUIDWithString:@"2A82"]
#define LBStandardCharacteristicUUIDAnaerobicThreshold                              [CBUUID UUIDWithString:@"2A83"]
#define LBStandardCharacteristicUUIDAerobicHeartRateUpperLimit                      [CBUUID UUIDWithString:@"2A84"]
#define LBStandardCharacteristicUUIDDateOfBirth                                      [CBUUID UUIDWithString:@"2A85"]
#define LBStandardCharacteristicUUIDDateOfThresholdAssessment                       [CBUUID UUIDWithString:@"2A86"]
#define LBStandardCharacteristicUUIDEmailAddress                                    [CBUUID UUIDWithString:@"2A87"]
#define LBStandardCharacteristicUUIDFatHeartRateLowerLimit                          [CBUUID UUIDWithString:@"2A88"]
#define LBStandardCharacteristicUUIDFatBurnHeartRateUpperLimit                      [CBUUID UUIDWithString:@"2A89"]
#define LBStandardCharacteristicUUIDFirstName                                       [CBUUID UUIDWithString:@"2A8A"]
#define LBStandardCharacteristicUUIDFiveZoneHeartRateLimits                         [CBUUID UUIDWithString:@"2A8B"]
#define LBStandardCharacteristicUUIDGender                                          [CBUUID UUIDWithString:@"2A8C"]
#define LBStandardCharacteristicUUIDHeartRateMax                                    [CBUUID UUIDWithString:@"2A8D"]
#define LBStandardCharacteristicUUIDHeight                                          [CBUUID UUIDWithString:@"2A8E"]
#define LBStandardCharacteristicUUIDHipCircumference                                [CBUUID UUIDWithString:@"2A8F"]
#define LBStandardCharacteristicUUIDLastName                                        [CBUUID UUIDWithString:@"2A90"]
#define LBStandardCharacteristicUUIDMaximumRecommendedHeartRate                     [CBUUID UUIDWithString:@"2A91"]
#define LBStandardCharacteristicUUIDRestingHeartRate                                [CBUUID UUIDWithString:@"2A92"]
#define LBStandardCharacteristicUUIDSportTypeforAerobicandAnaerobicThresholds       [CBUUID UUIDWithString:@"2A93"]
#define LBStandardCharacteristicUUIDThreeZoneHeartRateLimits                        [CBUUID UUIDWithString:@"2A94"]
#define LBStandardCharacteristicUUIDTwoZoneHeartRateLimit                           [CBUUID UUIDWithString:@"2A95"]
#define LBStandardCharacteristicUUIDVO2Max                                          [CBUUID UUIDWithString:@"2A96"]
#define LBStandardCharacteristicUUIDWaistCircumference                              [CBUUID UUIDWithString:@"2A97"]
#define LBStandardCharacteristicUUIDWeight                                          [CBUUID UUIDWithString:@"2A98"]
#define LBStandardCharacteristicUUIDDatabaseChangeIncrement                         [CBUUID UUIDWithString:@"2A99"]
#define LBStandardCharacteristicUUIDUserIndex                                       [CBUUID UUIDWithString:@"2A9A"]
#define LBStandardCharacteristicUUIDBodyCompositionFeature                          [CBUUID UUIDWithString:@"2A9B"]
#define LBStandardCharacteristicUUIDBodyCompositionMeasurement                      [CBUUID UUIDWithString:@"2A9C"]
#define LBStandardCharacteristicUUIDWeightMeasurement                               [CBUUID UUIDWithString:@"2A9D"]
#define LBStandardCharacteristicUUIDWeightScaleFeature                              [CBUUID UUIDWithString:@"2A9E"]
#define LBStandardCharacteristicUUIDUserControlPoint                                [CBUUID UUIDWithString:@"2A9F"]
#define LBStandardCharacteristicUUIDMagneticFluxDensity2D                           [CBUUID UUIDWithString:@"2AA0"]
#define LBStandardCharacteristicUUIDMagneticFluxDensity3D                           [CBUUID UUIDWithString:@"2AA1"]
#define LBStandardCharacteristicUUIDLanguage                                        [CBUUID UUIDWithString:@"2AA2"]
#define LBStandardCharacteristicUUIDBarometricPressureTrend                         [CBUUID UUIDWithString:@"2AA3"]
#define LBStandardCharacteristicUUIDBondManagementControlPoint                      [CBUUID UUIDWithString:@"2AA4"]
#define LBStandardCharacteristicUUIDBondManagementFeature                           [CBUUID UUIDWithString:@"2AA5"]
#define LBStandardCharacteristicUUIDCentralAddressResolution                        [CBUUID UUIDWithString:@"2AA6"]
#define LBStandardCharacteristicUUIDCGMMeasurement                                  [CBUUID UUIDWithString:@"2AA7"]
#define LBStandardCharacteristicUUIDCGMFeature                                      [CBUUID UUIDWithString:@"2AA8"]
#define LBStandardCharacteristicUUIDCGMStatus                                       [CBUUID UUIDWithString:@"2AA9"]
#define LBStandardCharacteristicUUIDCGMSessionStartTime                             [CBUUID UUIDWithString:@"2AAA"]
#define LBStandardCharacteristicUUIDCGMSessionRunTime                               [CBUUID UUIDWithString:@"2AAB"]
#define LBStandardCharacteristicUUIDCGMSpecificOpsControlPoint                      [CBUUID UUIDWithString:@"2AAC"]
#define LBStandardCharacteristicUUIDIndoorPositioningConfiguration                  [CBUUID UUIDWithString:@"2AAD"]
#define LBStandardCharacteristicUUIDLatitude                                        [CBUUID UUIDWithString:@"2AAE"]
#define LBStandardCharacteristicUUIDLongitude                                       [CBUUID UUIDWithString:@"2AAF"]
#define LBStandardCharacteristicUUIDLocalNorthCoordinate                            [CBUUID UUIDWithString:@"2AB0"]
#define LBStandardCharacteristicUUIDLocalEastCoordinate                             [CBUUID UUIDWithString:@"2AB1"]
#define LBStandardCharacteristicUUIDFloorNumber                                     [CBUUID UUIDWithString:@"2AB2"]
#define LBStandardCharacteristicUUIDAltitude                                        [CBUUID UUIDWithString:@"2AB3"]
#define LBStandardCharacteristicUUIDUncertainty                                     [CBUUID UUIDWithString:@"2AB4"]
#define LBStandardCharacteristicUUIDLocationName                                    [CBUUID UUIDWithString:@"2AB5"]
#define LBStandardCharacteristicUUIDURI                                             [CBUUID UUIDWithString:@"2AB6"]
#define LBStandardCharacteristicUUIDHTTPHeaders                                     [CBUUID UUIDWithString:@"2AB7"]
#define LBStandardCharacteristicUUIDHTTPStatusCode                                  [CBUUID UUIDWithString:@"2AB8"]
#define LBStandardCharacteristicUUIDHTTPEntityBody                                  [CBUUID UUIDWithString:@"2AB9"]
#define LBStandardCharacteristicUUIDHTTPControlPoint                                [CBUUID UUIDWithString:@"2ABA"]
#define LBStandardCharacteristicUUIDHTTPSSecurity                                   [CBUUID UUIDWithString:@"2ABB"]
#define LBStandardCharacteristicUUIDTDSControlPoint                                 [CBUUID UUIDWithString:@"2ABC"]
#define LBStandardCharacteristicUUIDOTSFeature                                      [CBUUID UUIDWithString:@"2ABD"]
#define LBStandardCharacteristicUUIDObjectName                                      [CBUUID UUIDWithString:@"2ABE"]
#define LBStandardCharacteristicUUIDObjectType                                      [CBUUID UUIDWithString:@"2ABF"]
#define LBStandardCharacteristicUUIDObjectSize                                      [CBUUID UUIDWithString:@"2AC0"]
#define LBStandardCharacteristicUUIDObjectFirst_Created                             [CBUUID UUIDWithString:@"2AC1"]
#define LBStandardCharacteristicUUIDObjectLast_Modified                             [CBUUID UUIDWithString:@"2AC2"]
#define LBStandardCharacteristicUUIDObjectID                                        [CBUUID UUIDWithString:@"2AC3"]
#define LBStandardCharacteristicUUIDObjectProperties                                [CBUUID UUIDWithString:@"2AC4"]
#define LBStandardCharacteristicUUIDObjectActionControlPoint                        [CBUUID UUIDWithString:@"2AC5"]
#define LBStandardCharacteristicUUIDObjectListControlPoint                          [CBUUID UUIDWithString:@"2AC6"]
#define LBStandardCharacteristicUUIDObjectListFilter                                [CBUUID UUIDWithString:@"2AC7"]
#define LBStandardCharacteristicUUIDObjectChanged                                   [CBUUID UUIDWithString:@"2AC8"]

@interface CBUUID (Additions)
-(NSString *)name;
@end

