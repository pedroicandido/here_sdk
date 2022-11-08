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

/// Holds constants for map feature modes, to be used with
/// [MapScene.enableFeatures].
///
/// See [MapFeatures] for constants representing feature names.

class MapFeatureModes {
  /// Default mode of a map feature. Can be used with any map feature.
  static final String defaultMode = "";

  /// All building footprints are shown.
  static final String buildingFootprintsAll = "all";

  /// All congestion zones are shown.
  static final String congestionZonesAll = "all";

  /// All extruded buildings are shown.
  static final String extrudedBuildingsAll = "all";

  /// All environmental zones are shown.
  static final String environmentalZonesAll = "all";

  /// Only available when Japan map is used.
  /// Traffic flow shows green lines depending on the region.
  /// In Japan green lines will not be shown,
  /// as if the [MapFeatureModes.trafficFlowWithoutFreeFlow] were used.
  /// In rest of the world, green lines will be shown, as if
  /// the [MapFeatureModes.trafficFlowWithFreeFlow] were used.
  @Deprecated("Will be removed in 4.15.0. Please use [MapFeatureModes.trafficFlowJapanWithoutFreeFlow] instead.")
  static final String trafficFlowRegionSpecific = "japan without free flow";

  /// Only available when Japan map is used.
  ///
  /// Traffic flow shows green lines depending on the region.
  ///
  /// In Japan green lines will not be shown,
  /// as if the [MapFeatureModes.trafficFlowWithoutFreeFlow] were used.
  ///
  /// In rest of the world, green lines will be shown, as if
  /// the [MapFeatureModes.trafficFlowWithFreeFlow] were used.
  static final String trafficFlowJapanWithoutFreeFlow = "japan without free flow";

  /// Traffic flow shows green lines when there is no
  /// traffic congestion.
  static final String trafficFlowWithFreeFlow = "with free flow";

  /// Traffic flow does not show green lines when there is no
  /// traffic congestion.
  static final String trafficFlowWithoutFreeFlow = "without free flow";

  /// All available traffic incidents are shown.
  static final String trafficIncidentsAll = "all";

  /// 3D landmarks are textured.
  static final String landmarksTextured = "textured";

  /// 3D landmarks have solid color.
  static final String landmarksTextureless = "textureless";

  /// Both active and inactive time-based restrictions are shown.
  static final String vehicleRestrictionsActiveAndInactive = "active & inactive";

  /// Both active and inactive restrictions are shown, but are visually different.
  static final String vehicleRestrictionsActiveAndInactiveDifferentiated = "active & inactive differentiated";

  /// Inactive time-based restrictions are not shown.
  static final String vehicleRestrictionsActive = "active";

  /// All types of safety cameras are shown. Includes speed, red light,
  /// red light + speed, bus lane, distance and speed section cameras.
  static final String safetyCamerasAll = "all";

}


// MapFeatureModes "private" section, not exported.

final _sdkMapviewMapfeaturemodesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_sdk_mapview_MapFeatureModes_create_handle'));
final _sdkMapviewMapfeaturemodesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapFeatureModes_release_handle'));



Pointer<Void> sdkMapviewMapfeaturemodesToFfi(MapFeatureModes value) {
  final _result = _sdkMapviewMapfeaturemodesCreateHandle();
  return _result;
}

MapFeatureModes sdkMapviewMapfeaturemodesFromFfi(Pointer<Void> handle) {
  try {
    return MapFeatureModes(
    );
  } finally {
  }
}

void sdkMapviewMapfeaturemodesReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMapfeaturemodesReleaseHandle(handle);

// Nullable MapFeatureModes

final _sdkMapviewMapfeaturemodesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapFeatureModes_create_handle_nullable'));
final _sdkMapviewMapfeaturemodesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapFeatureModes_release_handle_nullable'));
final _sdkMapviewMapfeaturemodesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapFeatureModes_get_value_nullable'));

Pointer<Void> sdkMapviewMapfeaturemodesToFfiNullable(MapFeatureModes? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapfeaturemodesToFfi(value);
  final result = _sdkMapviewMapfeaturemodesCreateHandleNullable(_handle);
  sdkMapviewMapfeaturemodesReleaseFfiHandle(_handle);
  return result;
}

MapFeatureModes? sdkMapviewMapfeaturemodesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapfeaturemodesGetValueNullable(handle);
  final result = sdkMapviewMapfeaturemodesFromFfi(_handle);
  sdkMapviewMapfeaturemodesReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapfeaturemodesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapfeaturemodesReleaseHandleNullable(handle);

// End of MapFeatureModes "private" section.


