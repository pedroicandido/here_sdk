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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/ev_connector_experimental.dart';

/// @nodoc

class EvChargingAttributesExperimental {
  /// List of EV pool groups of connectors. Each group is defined by a common charging connector type
  /// and max power level. The numberOfConnectors field contains the number of connectors in the group.
  List<EvConnectorExperimental>? connectors;

  /// Total number of charging connectors in the EV charging pool
  int? totalNumberOfConnectors;

  String? brand;

  String? lastUpdateTimestamp;

  EvChargingAttributesExperimental(this.connectors, this.totalNumberOfConnectors, this.brand, this.lastUpdateTimestamp);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EvChargingAttributesExperimental) return false;
    EvChargingAttributesExperimental _other = other;
    return DeepCollectionEquality().equals(connectors, _other.connectors) &&
        totalNumberOfConnectors == _other.totalNumberOfConnectors &&
        brand == _other.brand &&
        lastUpdateTimestamp == _other.lastUpdateTimestamp;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(connectors);
    result = 31 * result + totalNumberOfConnectors.hashCode;
    result = 31 * result + brand.hashCode;
    result = 31 * result + lastUpdateTimestamp.hashCode;
    return result;
  }
}


// EvChargingAttributesExperimental "private" section, not exported.

final _sdkSearchEvchargingattributesexperimentalCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingAttributesExperimental_create_handle'));
final _sdkSearchEvchargingattributesexperimentalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingAttributesExperimental_release_handle'));
final _sdkSearchEvchargingattributesexperimentalGetFieldconnectors = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingAttributesExperimental_get_field_connectors'));
final _sdkSearchEvchargingattributesexperimentalGetFieldtotalNumberOfConnectors = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingAttributesExperimental_get_field_totalNumberOfConnectors'));
final _sdkSearchEvchargingattributesexperimentalGetFieldbrand = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingAttributesExperimental_get_field_brand'));
final _sdkSearchEvchargingattributesexperimentalGetFieldlastUpdateTimestamp = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingAttributesExperimental_get_field_lastUpdateTimestamp'));



Pointer<Void> sdkSearchEvchargingattributesexperimentalToFfi(EvChargingAttributesExperimental value) {
  final _connectorsHandle = heresdkSearchCommonBindingslistofSdkSearchEvconnectorexperimentalToFfiNullable(value.connectors);
  final _totalNumberOfConnectorsHandle = intToFfiNullable(value.totalNumberOfConnectors);
  final _brandHandle = stringToFfiNullable(value.brand);
  final _lastUpdateTimestampHandle = stringToFfiNullable(value.lastUpdateTimestamp);
  final _result = _sdkSearchEvchargingattributesexperimentalCreateHandle(_connectorsHandle, _totalNumberOfConnectorsHandle, _brandHandle, _lastUpdateTimestampHandle);
  heresdkSearchCommonBindingslistofSdkSearchEvconnectorexperimentalReleaseFfiHandleNullable(_connectorsHandle);
  intReleaseFfiHandleNullable(_totalNumberOfConnectorsHandle);
  stringReleaseFfiHandleNullable(_brandHandle);
  stringReleaseFfiHandleNullable(_lastUpdateTimestampHandle);
  return _result;
}

EvChargingAttributesExperimental sdkSearchEvchargingattributesexperimentalFromFfi(Pointer<Void> handle) {
  final _connectorsHandle = _sdkSearchEvchargingattributesexperimentalGetFieldconnectors(handle);
  final _totalNumberOfConnectorsHandle = _sdkSearchEvchargingattributesexperimentalGetFieldtotalNumberOfConnectors(handle);
  final _brandHandle = _sdkSearchEvchargingattributesexperimentalGetFieldbrand(handle);
  final _lastUpdateTimestampHandle = _sdkSearchEvchargingattributesexperimentalGetFieldlastUpdateTimestamp(handle);
  try {
    return EvChargingAttributesExperimental(
      heresdkSearchCommonBindingslistofSdkSearchEvconnectorexperimentalFromFfiNullable(_connectorsHandle), 
      intFromFfiNullable(_totalNumberOfConnectorsHandle), 
      stringFromFfiNullable(_brandHandle), 
      stringFromFfiNullable(_lastUpdateTimestampHandle)
    );
  } finally {
    heresdkSearchCommonBindingslistofSdkSearchEvconnectorexperimentalReleaseFfiHandleNullable(_connectorsHandle);
    intReleaseFfiHandleNullable(_totalNumberOfConnectorsHandle);
    stringReleaseFfiHandleNullable(_brandHandle);
    stringReleaseFfiHandleNullable(_lastUpdateTimestampHandle);
  }
}

void sdkSearchEvchargingattributesexperimentalReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchEvchargingattributesexperimentalReleaseHandle(handle);

// Nullable EvChargingAttributesExperimental

final _sdkSearchEvchargingattributesexperimentalCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingAttributesExperimental_create_handle_nullable'));
final _sdkSearchEvchargingattributesexperimentalReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingAttributesExperimental_release_handle_nullable'));
final _sdkSearchEvchargingattributesexperimentalGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingAttributesExperimental_get_value_nullable'));

Pointer<Void> sdkSearchEvchargingattributesexperimentalToFfiNullable(EvChargingAttributesExperimental? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchEvchargingattributesexperimentalToFfi(value);
  final result = _sdkSearchEvchargingattributesexperimentalCreateHandleNullable(_handle);
  sdkSearchEvchargingattributesexperimentalReleaseFfiHandle(_handle);
  return result;
}

EvChargingAttributesExperimental? sdkSearchEvchargingattributesexperimentalFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchEvchargingattributesexperimentalGetValueNullable(handle);
  final result = sdkSearchEvchargingattributesexperimentalFromFfi(_handle);
  sdkSearchEvchargingattributesexperimentalReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchEvchargingattributesexperimentalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchEvchargingattributesexperimentalReleaseHandleNullable(handle);

// End of EvChargingAttributesExperimental "private" section.


