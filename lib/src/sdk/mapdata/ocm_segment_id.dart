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
import 'package:here_sdk/src/sdk/routing/travel_direction.dart';

/// OCM Segment ID of particular matched [SegmentReference] from OCM map,
/// represented in form: Tile + Local ID's + travel direction of segment.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
/// @nodoc

class OcmSegmentId {
  /// Here tile partition id (Morton-encoding + level indicator) of the segment.
  int tilePartitionId;

  /// Local ID of the segment inside the OCM tile.
  int localId;

  /// Travel direction of the segment.
  TravelDirection travelDirection;

  OcmSegmentId._(this.tilePartitionId, this.localId, this.travelDirection);
  OcmSegmentId()
    : tilePartitionId = 0, localId = 0, travelDirection = TravelDirection.bidirectional;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OcmSegmentId) return false;
    OcmSegmentId _other = other;
    return tilePartitionId == _other.tilePartitionId &&
        localId == _other.localId &&
        travelDirection == _other.travelDirection;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + tilePartitionId.hashCode;
    result = 31 * result + localId.hashCode;
    result = 31 * result + travelDirection.hashCode;
    return result;
  }
}


// OcmSegmentId "private" section, not exported.

final _sdkMapdataOcmsegmentidCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Int32, Uint32),
    Pointer<Void> Function(int, int, int)
  >('here_sdk_sdk_mapdata_OcmSegmentId_create_handle'));
final _sdkMapdataOcmsegmentidReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_OcmSegmentId_release_handle'));
final _sdkMapdataOcmsegmentidGetFieldtilePartitionId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_OcmSegmentId_get_field_tilePartitionId'));
final _sdkMapdataOcmsegmentidGetFieldlocalId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_OcmSegmentId_get_field_localId'));
final _sdkMapdataOcmsegmentidGetFieldtravelDirection = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_OcmSegmentId_get_field_travelDirection'));



Pointer<Void> sdkMapdataOcmsegmentidToFfi(OcmSegmentId value) {
  final _tilePartitionIdHandle = (value.tilePartitionId);
  final _localIdHandle = (value.localId);
  final _travelDirectionHandle = sdkRoutingTraveldirectionToFfi(value.travelDirection);
  final _result = _sdkMapdataOcmsegmentidCreateHandle(_tilePartitionIdHandle, _localIdHandle, _travelDirectionHandle);
  
  
  sdkRoutingTraveldirectionReleaseFfiHandle(_travelDirectionHandle);
  return _result;
}

OcmSegmentId sdkMapdataOcmsegmentidFromFfi(Pointer<Void> handle) {
  final _tilePartitionIdHandle = _sdkMapdataOcmsegmentidGetFieldtilePartitionId(handle);
  final _localIdHandle = _sdkMapdataOcmsegmentidGetFieldlocalId(handle);
  final _travelDirectionHandle = _sdkMapdataOcmsegmentidGetFieldtravelDirection(handle);
  try {
    return OcmSegmentId._(
      (_tilePartitionIdHandle), 
      (_localIdHandle), 
      sdkRoutingTraveldirectionFromFfi(_travelDirectionHandle)
    );
  } finally {
    
    
    sdkRoutingTraveldirectionReleaseFfiHandle(_travelDirectionHandle);
  }
}

void sdkMapdataOcmsegmentidReleaseFfiHandle(Pointer<Void> handle) => _sdkMapdataOcmsegmentidReleaseHandle(handle);

// Nullable OcmSegmentId

final _sdkMapdataOcmsegmentidCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_OcmSegmentId_create_handle_nullable'));
final _sdkMapdataOcmsegmentidReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_OcmSegmentId_release_handle_nullable'));
final _sdkMapdataOcmsegmentidGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_OcmSegmentId_get_value_nullable'));

Pointer<Void> sdkMapdataOcmsegmentidToFfiNullable(OcmSegmentId? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapdataOcmsegmentidToFfi(value);
  final result = _sdkMapdataOcmsegmentidCreateHandleNullable(_handle);
  sdkMapdataOcmsegmentidReleaseFfiHandle(_handle);
  return result;
}

OcmSegmentId? sdkMapdataOcmsegmentidFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapdataOcmsegmentidGetValueNullable(handle);
  final result = sdkMapdataOcmsegmentidFromFfi(_handle);
  sdkMapdataOcmsegmentidReleaseFfiHandle(_handle);
  return result;
}

void sdkMapdataOcmsegmentidReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataOcmsegmentidReleaseHandleNullable(handle);

// End of OcmSegmentId "private" section.


