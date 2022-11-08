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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;

/// Specifies the themes for the map style, map icons, and the labels on the map.
/// @nodoc
abstract class Theme {

}


// Theme "private" section, not exported.

final _sdkVenueStyleThemeRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_Theme_register_finalizer'));
final _sdkVenueStyleThemeCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_Theme_copy_handle'));
final _sdkVenueStyleThemeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_Theme_release_handle'));


class Theme$Impl extends __lib.NativeBase implements Theme {

  Theme$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkVenueStyleThemeToFfi(Theme value) =>
  _sdkVenueStyleThemeCopyHandle((value as __lib.NativeBase).handle);

Theme sdkVenueStyleThemeFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Theme) return instance;

  final _copiedHandle = _sdkVenueStyleThemeCopyHandle(handle);
  final result = Theme$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleThemeRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleThemeReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleThemeReleaseHandle(handle);

Pointer<Void> sdkVenueStyleThemeToFfiNullable(Theme? value) =>
  value != null ? sdkVenueStyleThemeToFfi(value) : Pointer<Void>.fromAddress(0);

Theme? sdkVenueStyleThemeFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleThemeFromFfi(handle) : null;

void sdkVenueStyleThemeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleThemeReleaseHandle(handle);

// End of Theme "private" section.


