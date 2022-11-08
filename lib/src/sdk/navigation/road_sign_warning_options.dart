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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/navigation/general_warning_road_sign_type.dart';
import 'package:here_sdk/src/sdk/navigation/road_sign_category.dart';
import 'package:here_sdk/src/sdk/navigation/road_sign_type.dart';
import 'package:here_sdk/src/sdk/navigation/road_sign_vehicle_type.dart';

/// Road sign warning options.
///
/// Set the options to [NavigatorInterface.roadSignWarningOptions] for filtering of road sign notifications.

class RoadSignWarningOptions {
  /// The list of road sign types for which a warning will be given. If the list is empty, road signs are not filtered by type.
  List<RoadSignType> typesFilter;

  /// The list of road sign categories for which a warning will be given. If the list is empty, road signs are not filtered by category.
  List<RoadSignCategory> categoriesFilter;

  /// The list of road sign general warning types for which a warning will be given. If the list is empty, road signs are not filtered by general warning type.
  List<GeneralWarningRoadSignType> generalWarningTypesFilter;

  /// The list of road sign vehicle types for which a warning will be given. If the list is empty, road signs are not filtered by vehicle type.
  List<RoadSignVehicleType> vehicleTypesFilter;

  RoadSignWarningOptions._(this.typesFilter, this.categoriesFilter, this.generalWarningTypesFilter, this.vehicleTypesFilter);
  RoadSignWarningOptions()
    : typesFilter = [], categoriesFilter = [], generalWarningTypesFilter = [], vehicleTypesFilter = [];
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RoadSignWarningOptions) return false;
    RoadSignWarningOptions _other = other;
    return DeepCollectionEquality().equals(typesFilter, _other.typesFilter) &&
        DeepCollectionEquality().equals(categoriesFilter, _other.categoriesFilter) &&
        DeepCollectionEquality().equals(generalWarningTypesFilter, _other.generalWarningTypesFilter) &&
        DeepCollectionEquality().equals(vehicleTypesFilter, _other.vehicleTypesFilter);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(typesFilter);
    result = 31 * result + DeepCollectionEquality().hash(categoriesFilter);
    result = 31 * result + DeepCollectionEquality().hash(generalWarningTypesFilter);
    result = 31 * result + DeepCollectionEquality().hash(vehicleTypesFilter);
    return result;
  }
}


// RoadSignWarningOptions "private" section, not exported.

final _sdkNavigationRoadsignwarningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_create_handle'));
final _sdkNavigationRoadsignwarningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_release_handle'));
final _sdkNavigationRoadsignwarningoptionsGetFieldtypesFilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_get_field_typesFilter'));
final _sdkNavigationRoadsignwarningoptionsGetFieldcategoriesFilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_get_field_categoriesFilter'));
final _sdkNavigationRoadsignwarningoptionsGetFieldgeneralWarningTypesFilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_get_field_generalWarningTypesFilter'));
final _sdkNavigationRoadsignwarningoptionsGetFieldvehicleTypesFilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_get_field_vehicleTypesFilter'));



Pointer<Void> sdkNavigationRoadsignwarningoptionsToFfi(RoadSignWarningOptions value) {
  final _typesFilterHandle = heresdkNavigationBindingslistofSdkNavigationRoadsigntypeToFfi(value.typesFilter);
  final _categoriesFilterHandle = heresdkNavigationBindingslistofSdkNavigationRoadsigncategoryToFfi(value.categoriesFilter);
  final _generalWarningTypesFilterHandle = heresdkNavigationBindingslistofSdkNavigationGeneralwarningroadsigntypeToFfi(value.generalWarningTypesFilter);
  final _vehicleTypesFilterHandle = heresdkNavigationBindingslistofSdkNavigationRoadsignvehicletypeToFfi(value.vehicleTypesFilter);
  final _result = _sdkNavigationRoadsignwarningoptionsCreateHandle(_typesFilterHandle, _categoriesFilterHandle, _generalWarningTypesFilterHandle, _vehicleTypesFilterHandle);
  heresdkNavigationBindingslistofSdkNavigationRoadsigntypeReleaseFfiHandle(_typesFilterHandle);
  heresdkNavigationBindingslistofSdkNavigationRoadsigncategoryReleaseFfiHandle(_categoriesFilterHandle);
  heresdkNavigationBindingslistofSdkNavigationGeneralwarningroadsigntypeReleaseFfiHandle(_generalWarningTypesFilterHandle);
  heresdkNavigationBindingslistofSdkNavigationRoadsignvehicletypeReleaseFfiHandle(_vehicleTypesFilterHandle);
  return _result;
}

RoadSignWarningOptions sdkNavigationRoadsignwarningoptionsFromFfi(Pointer<Void> handle) {
  final _typesFilterHandle = _sdkNavigationRoadsignwarningoptionsGetFieldtypesFilter(handle);
  final _categoriesFilterHandle = _sdkNavigationRoadsignwarningoptionsGetFieldcategoriesFilter(handle);
  final _generalWarningTypesFilterHandle = _sdkNavigationRoadsignwarningoptionsGetFieldgeneralWarningTypesFilter(handle);
  final _vehicleTypesFilterHandle = _sdkNavigationRoadsignwarningoptionsGetFieldvehicleTypesFilter(handle);
  try {
    return RoadSignWarningOptions._(
      heresdkNavigationBindingslistofSdkNavigationRoadsigntypeFromFfi(_typesFilterHandle), 
      heresdkNavigationBindingslistofSdkNavigationRoadsigncategoryFromFfi(_categoriesFilterHandle), 
      heresdkNavigationBindingslistofSdkNavigationGeneralwarningroadsigntypeFromFfi(_generalWarningTypesFilterHandle), 
      heresdkNavigationBindingslistofSdkNavigationRoadsignvehicletypeFromFfi(_vehicleTypesFilterHandle)
    );
  } finally {
    heresdkNavigationBindingslistofSdkNavigationRoadsigntypeReleaseFfiHandle(_typesFilterHandle);
    heresdkNavigationBindingslistofSdkNavigationRoadsigncategoryReleaseFfiHandle(_categoriesFilterHandle);
    heresdkNavigationBindingslistofSdkNavigationGeneralwarningroadsigntypeReleaseFfiHandle(_generalWarningTypesFilterHandle);
    heresdkNavigationBindingslistofSdkNavigationRoadsignvehicletypeReleaseFfiHandle(_vehicleTypesFilterHandle);
  }
}

void sdkNavigationRoadsignwarningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRoadsignwarningoptionsReleaseHandle(handle);

// Nullable RoadSignWarningOptions

final _sdkNavigationRoadsignwarningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_create_handle_nullable'));
final _sdkNavigationRoadsignwarningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_release_handle_nullable'));
final _sdkNavigationRoadsignwarningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_get_value_nullable'));

Pointer<Void> sdkNavigationRoadsignwarningoptionsToFfiNullable(RoadSignWarningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRoadsignwarningoptionsToFfi(value);
  final result = _sdkNavigationRoadsignwarningoptionsCreateHandleNullable(_handle);
  sdkNavigationRoadsignwarningoptionsReleaseFfiHandle(_handle);
  return result;
}

RoadSignWarningOptions? sdkNavigationRoadsignwarningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRoadsignwarningoptionsGetValueNullable(handle);
  final result = sdkNavigationRoadsignwarningoptionsFromFfi(_handle);
  sdkNavigationRoadsignwarningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRoadsignwarningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRoadsignwarningoptionsReleaseHandleNullable(handle);

// End of RoadSignWarningOptions "private" section.


