// Copyright (c) 2018-2022 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'dart:ffi';
import 'package:here_sdk/src/_library_context.dart' as __lib;

/// @nodoc
enum VehicleType {
    car,
    truck,
    bicycle,
    bus,
    motocycle,
    scooter
}

// VehicleType "private" section, not exported.

int sdkTransportVehicletypeToFfi(VehicleType value) {
  switch (value) {
  case VehicleType.car:
    return 0;
  case VehicleType.truck:
    return 1;
  case VehicleType.bicycle:
    return 2;
  case VehicleType.bus:
    return 3;
  case VehicleType.motocycle:
    return 4;
  case VehicleType.scooter:
    return 5;
  default:
    throw StateError("Invalid enum value $value for VehicleType enum.");
  }
}

VehicleType sdkTransportVehicletypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return VehicleType.car;
  case 1:
    return VehicleType.truck;
  case 2:
    return VehicleType.bicycle;
  case 3:
    return VehicleType.bus;
  case 4:
    return VehicleType.motocycle;
  case 5:
    return VehicleType.scooter;
  default:
    throw StateError("Invalid numeric value $handle for VehicleType enum.");
  }
}

void sdkTransportVehicletypeReleaseFfiHandle(int handle) {}

final _sdkTransportVehicletypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_VehicleType_create_handle_nullable'));
final _sdkTransportVehicletypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleType_release_handle_nullable'));
final _sdkTransportVehicletypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleType_get_value_nullable'));

Pointer<Void> sdkTransportVehicletypeToFfiNullable(VehicleType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportVehicletypeToFfi(value);
  final result = _sdkTransportVehicletypeCreateHandleNullable(_handle);
  sdkTransportVehicletypeReleaseFfiHandle(_handle);
  return result;
}

VehicleType? sdkTransportVehicletypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportVehicletypeGetValueNullable(handle);
  final result = sdkTransportVehicletypeFromFfi(_handle);
  sdkTransportVehicletypeReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportVehicletypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportVehicletypeReleaseHandleNullable(handle);

// End of VehicleType "private" section.


