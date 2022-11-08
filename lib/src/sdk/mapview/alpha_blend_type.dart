// Copyright (c) 2019-2022 HERE Global B.V. and its affiliate(s).
// All rights reserved.
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

/// The alpha blend type applied to translucent map items.
enum AlphaBlendType {
    /// Blends only the top overlapping item color with the background.
    overwrite,
    /// Blends all overlapping item colors with the background.
    mix
}

// AlphaBlendType "private" section, not exported.

int sdkMapviewAlphablendtypeToFfi(AlphaBlendType value) {
  switch (value) {
  case AlphaBlendType.overwrite:
    return 0;
  case AlphaBlendType.mix:
    return 1;
  default:
    throw StateError("Invalid enum value $value for AlphaBlendType enum.");
  }
}

AlphaBlendType sdkMapviewAlphablendtypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return AlphaBlendType.overwrite;
  case 1:
    return AlphaBlendType.mix;
  default:
    throw StateError("Invalid numeric value $handle for AlphaBlendType enum.");
  }
}

void sdkMapviewAlphablendtypeReleaseFfiHandle(int handle) {}

final _sdkMapviewAlphablendtypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_AlphaBlendType_create_handle_nullable'));
final _sdkMapviewAlphablendtypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_AlphaBlendType_release_handle_nullable'));
final _sdkMapviewAlphablendtypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_AlphaBlendType_get_value_nullable'));

Pointer<Void> sdkMapviewAlphablendtypeToFfiNullable(AlphaBlendType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewAlphablendtypeToFfi(value);
  final result = _sdkMapviewAlphablendtypeCreateHandleNullable(_handle);
  sdkMapviewAlphablendtypeReleaseFfiHandle(_handle);
  return result;
}

AlphaBlendType? sdkMapviewAlphablendtypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewAlphablendtypeGetValueNullable(handle);
  final result = sdkMapviewAlphablendtypeFromFfi(_handle);
  sdkMapviewAlphablendtypeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewAlphablendtypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewAlphablendtypeReleaseHandleNullable(handle);

// End of AlphaBlendType "private" section.


