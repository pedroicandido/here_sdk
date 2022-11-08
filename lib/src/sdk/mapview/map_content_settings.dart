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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/transport/hazardous_material.dart';
import 'package:here_sdk/src/sdk/transport/truck_specifications.dart';
import 'package:here_sdk/src/sdk/transport/tunnel_category.dart';
import 'package:meta/meta.dart';

/// Provides settings regarding map data which are applied globally to all map views.
///
/// The settings
/// can already be changed before a map view instance is created.
abstract class MapContentSettings {

  /// Filters the displayed vehicle restrictions so that only the ones applicable to the specified
  /// criteria are shown when general display of vehicle restrictions is enabled.
  ///
  /// The display of vehicle restrictions can be enabled using [MapScene.enableFeatures] with
  /// [MapFeatures.vehicleRestrictions] or using the deprecated API [MapScene.setLayerVisibility]
  /// with [MapSceneLayers.vehicleRestrictions]. Using the deprecated layer API at the same time
  /// as the feature API is not supported.
  ///
  /// # Filtering rules for truck specifications
  ///
  /// Only restrictions applicable to the supplied truck specifications will be shows.
  ///
  /// Examples:
  /// - If the height in [MapContentSettings.filterVehicleRestrictions.truckSpecifications] is set to 200cm, then height restriction
  ///   icons with a height greater than 200cm will not be displayed
  /// - If the trailer count in [MapContentSettings.filterVehicleRestrictions.truckSpecifications] is set to 2, then trailer
  ///   restriction icons for a count greater than 2 will not be displayed.
  ///
  /// # Filtering rules for hazardous materials
  ///
  /// Only restrictions applicable to specified hazardous materials will be shown.
  ///
  /// Examples:
  /// - If the [MapContentSettings.filterVehicleRestrictions.hazardousMaterials] contains [HazardousMaterial.poison]
  ///   and [HazardousMaterial.gas], then only material restrictions
  ///   for poison and gas will be displayed.
  /// - If the [MapContentSettings.filterVehicleRestrictions.hazardousMaterials] list is empty, then no material restrictions
  ///   will be shown.
  /// - If the [MapContentSettings.filterVehicleRestrictions.hazardousMaterials] list is not suppled at all (is `null`), then
  ///   no material restrictions will be shown.
  ///
  /// # Filtering rules for tunnel category
  ///
  /// Specifying tunnel category means that:
  /// - The truck carries goods which could cause ONLY THE ADDITIONAL dangerous effects
  ///   described in specified tunnel category and above it.
  /// - The truck does NOT carry goods which could cause the dangerous effects described in
  ///   tunnel categories lower than the one specified.
  ///
  /// Example:
  /// If [MapContentSettings.filterVehicleRestrictions.tunnelCategory] is set to [TunnelCategory.d], then restrictionss for
  /// tunnel category D and E will be displayed, but not B and C.
  ///
  /// Note: This feature is in BETA state and thus there can be bugs and unexpected behavior.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [truckSpecifications] The size, weight, type and trailer count specifications to filter for, so that only
  /// restrictions which are relevant for the given specifications are displayed.
  ///
  /// [hazardousMaterials] The hazardous materials to filter for, so that only applicable restrictions are
  /// displayed. When the list is `null` or empty, then no material restrictions will
  /// be displayed.
  ///
  /// [tunnelCategory] The tunnel category to filter for, so that only applicable restrictions are
  /// displayed. If `null`, then no tunnel category restrictions will be displayed.
  ///
  static void filterVehicleRestrictions(TruckSpecifications truckSpecifications, List<HazardousMaterial>? hazardousMaterials, TunnelCategory? tunnelCategory) => $prototype.filterVehicleRestrictions(truckSpecifications, hazardousMaterials, tunnelCategory);
  /// Removes all filters regarding vehicle restrictions so that all restrictions will be displayed,
  /// when the display of vehicle restrictions is enabled using [MapScene.enableFeatures] with
  /// [MapFeatures.vehicleRestrictions] or using the deprecated API [MapScene.setLayerVisibility]
  /// with [MapSceneLayers.vehicleRestrictions].
  ///
  /// Using the deprecated layer API at the same time
  /// as the feature API is not supported.
  ///
  /// Note: This feature is in BETA state and thus there can be bugs and unexpected behavior.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  static void resetVehicleRestrictionFilter() => $prototype.resetVehicleRestrictionFilter();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapContentSettings$Impl(Pointer<Void>.fromAddress(0));
}


// MapContentSettings "private" section, not exported.

final _sdkMapviewMapcontentsettingsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapContentSettings_register_finalizer'));
final _sdkMapviewMapcontentsettingsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContentSettings_copy_handle'));
final _sdkMapviewMapcontentsettingsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContentSettings_release_handle'));




/// @nodoc
@visibleForTesting
class MapContentSettings$Impl extends __lib.NativeBase implements MapContentSettings {

  MapContentSettings$Impl(Pointer<Void> handle) : super(handle);

  void filterVehicleRestrictions(TruckSpecifications truckSpecifications, List<HazardousMaterial>? hazardousMaterials, TunnelCategory? tunnelCategory) {
    final _filterVehicleRestrictionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapContentSettings_filterVehicleRestrictions__TruckSpecifications_ListOf_sdk_transport_HazardousMaterial__TunnelCategory_'));
    final _truckSpecificationsHandle = sdkTransportTruckspecificationsToFfi(truckSpecifications);
    final _hazardousMaterialsHandle = heresdkMapviewHarpBindingslistofSdkTransportHazardousmaterialToFfiNullable(hazardousMaterials);
    final _tunnelCategoryHandle = sdkTransportTunnelcategoryToFfiNullable(tunnelCategory);
    _filterVehicleRestrictionsFfi(__lib.LibraryContext.isolateId, _truckSpecificationsHandle, _hazardousMaterialsHandle, _tunnelCategoryHandle);
    sdkTransportTruckspecificationsReleaseFfiHandle(_truckSpecificationsHandle);
    heresdkMapviewHarpBindingslistofSdkTransportHazardousmaterialReleaseFfiHandleNullable(_hazardousMaterialsHandle);
    sdkTransportTunnelcategoryReleaseFfiHandleNullable(_tunnelCategoryHandle);

  }

  void resetVehicleRestrictionFilter() {
    final _resetVehicleRestrictionFilterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('here_sdk_sdk_mapview_MapContentSettings_resetVehicleRestrictionFilter'));
    _resetVehicleRestrictionFilterFfi(__lib.LibraryContext.isolateId);

  }


}

Pointer<Void> sdkMapviewMapcontentsettingsToFfi(MapContentSettings value) =>
  _sdkMapviewMapcontentsettingsCopyHandle((value as __lib.NativeBase).handle);

MapContentSettings sdkMapviewMapcontentsettingsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapContentSettings) return instance;

  final _copiedHandle = _sdkMapviewMapcontentsettingsCopyHandle(handle);
  final result = MapContentSettings$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapcontentsettingsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapcontentsettingsReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcontentsettingsReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcontentsettingsToFfiNullable(MapContentSettings? value) =>
  value != null ? sdkMapviewMapcontentsettingsToFfi(value) : Pointer<Void>.fromAddress(0);

MapContentSettings? sdkMapviewMapcontentsettingsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcontentsettingsFromFfi(handle) : null;

void sdkMapviewMapcontentsettingsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcontentsettingsReleaseHandle(handle);

// End of MapContentSettings "private" section.


