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

/// Specifies possible errors that may result from map downloading/prefetching.
class MapLoaderError {
  final int index;
  const MapLoaderError._(this.index);

  /// The requested resource is not found.

  static const resourceNotFound = MapLoaderError._(0);
  /// There's a problem with an ongoing download or update: If an operation is in a paused state,
  /// you can resume or cancel it. If no operation is in a paused state: Either wait for active
  /// downloads to finish, or cancel existing [MapDownloader] requests and
  /// call [MapDownloader.getInitialPersistentMapStatus]. If there is a
  /// problem, call [MapDownloader.repairPersistentMap] to repair before
  /// continuing with other [MapDownloader] operations.
  /// This error may occur when an on-going or paused operation prevents the requested task.

  static const notReady = MapLoaderError._(1);
  /// The request passed invalid arguments.

  static const invalidArgument = MapLoaderError._(2);
  /// The request was cancelled (usually by the user).

  static const operationCancelled = MapLoaderError._(3);
  /// All tiles of requested regions were already installed, no need for any download.

  static const alreadyInstalled = MapLoaderError._(4);
  /// The request exceeded the timeout limit.

  static const timeOut = MapLoaderError._(5);
  /// The requested service is unavailable.

  static const serviceUnavailable = MapLoaderError._(6);
  /// The access is denied due to invalid credentials.

  static const accessDenied = MapLoaderError._(7);
  /// Too many requests sent in a given amount of time.
  @Deprecated("Will be removed in v4.14.0. Use [MapLoaderError.requestLimitReached] enum instead.")

  static const tooManyRequests = MapLoaderError._(8);
  /// A network connection error has happened.

  static const networkConnectionError = MapLoaderError._(9);
  /// The operation is forbidden, make sure your credentials grant the necessary permissions.

  static const forbidden = MapLoaderError._(10);
  /// Downloaded map data is invalid or a [RegionId] passed to the method
  /// [MapDownloader.deleteRegions] is incorrect.

  static const mapDataError = MapLoaderError._(11);
  /// Received unexpected response from the backend. It means the response is malformed or
  /// server returned an internal error. Try repeating the request.

  static const unexpectedServerResponse = MapLoaderError._(12);
  /// Error occured inside the map manager and might be related to network issues. Try
  /// repeating the request.

  static const mapManagerError = MapLoaderError._(13);
  /// The data to process is incomplete, failed decoding the tile.

  static const incompleteData = MapLoaderError._(14);
  /// The conditions to access the service are not satisfied. Check if correct
  /// [RegionId] was passed to [MapDownloader.downloadRegions].

  static const serviceAccessFailed = MapLoaderError._(15);
  /// Internal error occured.

  static const internalError = MapLoaderError._(16);
  /// Online operation is not permitted because offline mode is enabled.

  static const offline = MapLoaderError._(17);
  /// A cache IO error occured.

  static const cacheIoError = MapLoaderError._(18);
  /// Protected cache is corrupted. It can be a result of downloading the map in the background
  /// and the OS killing the application at that time. Use method
  /// [MapDownloader.getInitialPersistentMapStatus] to get the status of the
  /// map and method repair_persistent_map in the MapDownloader to try to fix the cache if it is
  /// broken.

  static const protectedCacheCorrupted = MapLoaderError._(19);
  /// Operation on the protected cache cannot be done due to required migration.
  /// Call [MapDownloader.repairPersistentMap] to perform migration.

  static const migrationRequired = MapLoaderError._(20);
  /// Method is invoked on object connected to the disposed SDKNativeEngine.

  static const operationAfterDispose = MapLoaderError._(21);
  /// Request limit reached for set a credentials for a particular period of time.

  static const requestLimitReached = MapLoaderError.tooManyRequests;
}

// MapLoaderError "private" section, not exported.

int sdkMaploaderMaploadererrorToFfi(MapLoaderError value) {
  switch (value) {
  case MapLoaderError.resourceNotFound:
    return 1;
  case MapLoaderError.notReady:
    return 2;
  case MapLoaderError.invalidArgument:
    return 3;
  case MapLoaderError.operationCancelled:
    return 4;
  case MapLoaderError.alreadyInstalled:
    return 5;
  case MapLoaderError.timeOut:
    return 6;
  case MapLoaderError.serviceUnavailable:
    return 7;
  case MapLoaderError.accessDenied:
    return 8;
  case MapLoaderError.tooManyRequests:
    return 9;
  case MapLoaderError.networkConnectionError:
    return 10;
  case MapLoaderError.forbidden:
    return 11;
  case MapLoaderError.mapDataError:
    return 12;
  case MapLoaderError.unexpectedServerResponse:
    return 13;
  case MapLoaderError.mapManagerError:
    return 14;
  case MapLoaderError.incompleteData:
    return 15;
  case MapLoaderError.serviceAccessFailed:
    return 16;
  case MapLoaderError.internalError:
    return 17;
  case MapLoaderError.offline:
    return 18;
  case MapLoaderError.cacheIoError:
    return 19;
  case MapLoaderError.protectedCacheCorrupted:
    return 20;
  case MapLoaderError.migrationRequired:
    return 21;
  case MapLoaderError.operationAfterDispose:
    return 22;
  default:
    throw StateError("Invalid enum value $value for MapLoaderError enum.");
  }
}

MapLoaderError sdkMaploaderMaploadererrorFromFfi(int handle) {
  switch (handle) {
  case 1:
    return MapLoaderError.resourceNotFound;
  case 2:
    return MapLoaderError.notReady;
  case 3:
    return MapLoaderError.invalidArgument;
  case 4:
    return MapLoaderError.operationCancelled;
  case 5:
    return MapLoaderError.alreadyInstalled;
  case 6:
    return MapLoaderError.timeOut;
  case 7:
    return MapLoaderError.serviceUnavailable;
  case 8:
    return MapLoaderError.accessDenied;
  case 9:
    return MapLoaderError.tooManyRequests;
  case 10:
    return MapLoaderError.networkConnectionError;
  case 11:
    return MapLoaderError.forbidden;
  case 12:
    return MapLoaderError.mapDataError;
  case 13:
    return MapLoaderError.unexpectedServerResponse;
  case 14:
    return MapLoaderError.mapManagerError;
  case 15:
    return MapLoaderError.incompleteData;
  case 16:
    return MapLoaderError.serviceAccessFailed;
  case 17:
    return MapLoaderError.internalError;
  case 18:
    return MapLoaderError.offline;
  case 19:
    return MapLoaderError.cacheIoError;
  case 20:
    return MapLoaderError.protectedCacheCorrupted;
  case 21:
    return MapLoaderError.migrationRequired;
  case 22:
    return MapLoaderError.operationAfterDispose;
  default:
    throw StateError("Invalid numeric value $handle for MapLoaderError enum.");
  }
}

void sdkMaploaderMaploadererrorReleaseFfiHandle(int handle) {}

final _sdkMaploaderMaploadererrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_maploader_MapLoaderError_create_handle_nullable'));
final _sdkMaploaderMaploadererrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapLoaderError_release_handle_nullable'));
final _sdkMaploaderMaploadererrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapLoaderError_get_value_nullable'));

Pointer<Void> sdkMaploaderMaploadererrorToFfiNullable(MapLoaderError? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderMaploadererrorToFfi(value);
  final result = _sdkMaploaderMaploadererrorCreateHandleNullable(_handle);
  sdkMaploaderMaploadererrorReleaseFfiHandle(_handle);
  return result;
}

MapLoaderError? sdkMaploaderMaploadererrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderMaploadererrorGetValueNullable(handle);
  final result = sdkMaploaderMaploadererrorFromFfi(_handle);
  sdkMaploaderMaploadererrorReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderMaploadererrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderMaploadererrorReleaseHandleNullable(handle);

// End of MapLoaderError "private" section.


