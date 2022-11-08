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
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/mapdata/ocm_segment_id.dart';
import 'package:here_sdk/src/sdk/routing/segment_reference.dart';
import 'package:meta/meta.dart';

/// A SegmentReferenceConvertor provides possibility to convert mapmatched instances of
/// [SegmentReference] to corresponding instances of [OcmSegmentId].
/// @nodoc
abstract class SegmentReferenceConvertor {
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] A SDKEngine instance.
  ///
  factory SegmentReferenceConvertor(SDKNativeEngine sdkEngine) => $prototype.make(sdkEngine);

  /// The [OcmSegmentId] for provided [SegmentReference].
  ///
  OcmSegmentId? getOcmSegmentId(SegmentReference segmentReference);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SegmentReferenceConvertor$Impl(Pointer<Void>.fromAddress(0));
}


// SegmentReferenceConvertor "private" section, not exported.

final _sdkMapdataSegmentreferenceconvertorRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapdata_SegmentReferenceConvertor_register_finalizer'));
final _sdkMapdataSegmentreferenceconvertorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentReferenceConvertor_copy_handle'));
final _sdkMapdataSegmentreferenceconvertorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentReferenceConvertor_release_handle'));


final _makeReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentReferenceConvertor_make__SDKNativeEngine_return_release_handle'));
final _makeReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentReferenceConvertor_make__SDKNativeEngine_return_get_result'));
final _makeReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentReferenceConvertor_make__SDKNativeEngine_return_get_error'));
final _makeReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentReferenceConvertor_make__SDKNativeEngine_return_has_error'));



/// @nodoc
@visibleForTesting
class SegmentReferenceConvertor$Impl extends __lib.NativeBase implements SegmentReferenceConvertor {

  SegmentReferenceConvertor$Impl(Pointer<Void> handle) : super(handle);


  SegmentReferenceConvertor make(SDKNativeEngine sdkEngine) {
    final _result_handle = _make(sdkEngine);
    final _result = SegmentReferenceConvertor$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapdataSegmentreferenceconvertorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(SDKNativeEngine sdkEngine) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapdata_SegmentReferenceConvertor_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _makeFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_makeReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _makeReturnGetError(__callResultHandle);
        _makeReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _makeReturnGetResult(__callResultHandle);
    _makeReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  OcmSegmentId? getOcmSegmentId(SegmentReference segmentReference) {
    final _getOcmSegmentIdFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapdata_SegmentReferenceConvertor_getOcmSegmentId__SegmentReference'));
    final _segmentReferenceHandle = sdkRoutingSegmentreferenceToFfi(segmentReference);
    final _handle = this.handle;
    final __resultHandle = _getOcmSegmentIdFfi(_handle, __lib.LibraryContext.isolateId, _segmentReferenceHandle);
    sdkRoutingSegmentreferenceReleaseFfiHandle(_segmentReferenceHandle);
    try {
      return sdkMapdataOcmsegmentidFromFfiNullable(__resultHandle);
    } finally {
      sdkMapdataOcmsegmentidReleaseFfiHandleNullable(__resultHandle);

    }

  }


}

Pointer<Void> sdkMapdataSegmentreferenceconvertorToFfi(SegmentReferenceConvertor value) =>
  _sdkMapdataSegmentreferenceconvertorCopyHandle((value as __lib.NativeBase).handle);

SegmentReferenceConvertor sdkMapdataSegmentreferenceconvertorFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SegmentReferenceConvertor) return instance;

  final _copiedHandle = _sdkMapdataSegmentreferenceconvertorCopyHandle(handle);
  final result = SegmentReferenceConvertor$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapdataSegmentreferenceconvertorRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapdataSegmentreferenceconvertorReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapdataSegmentreferenceconvertorReleaseHandle(handle);

Pointer<Void> sdkMapdataSegmentreferenceconvertorToFfiNullable(SegmentReferenceConvertor? value) =>
  value != null ? sdkMapdataSegmentreferenceconvertorToFfi(value) : Pointer<Void>.fromAddress(0);

SegmentReferenceConvertor? sdkMapdataSegmentreferenceconvertorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapdataSegmentreferenceconvertorFromFfi(handle) : null;

void sdkMapdataSegmentreferenceconvertorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataSegmentreferenceconvertorReleaseHandle(handle);

// End of SegmentReferenceConvertor "private" section.


