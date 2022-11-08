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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/map_arrow.dart';
import 'package:here_sdk/src/sdk/mapview/map_error.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker3_d.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker_cluster.dart';
import 'package:here_sdk/src/sdk/mapview/map_polygon.dart';
import 'package:here_sdk/src/sdk/mapview/map_polyline.dart';
import 'package:here_sdk/src/sdk/mapview/map_scheme.dart';
import 'package:here_sdk/src/sdk/mapview/visibility_state.dart';
import 'package:here_sdk/src/sdk/mapview/watermark_style.dart';
import 'package:meta/meta.dart';

/// Represents a map scene and exposes the functionality to manipulate its content.
///
/// ## Map schemes
///
/// The content of the displayed map and how it looks is specified by a
/// [MapScheme] which is set when loading a scene with [MapScene.loadSceneForMapScheme].
/// It is also possible to load your own custom map scheme from a file bundled
/// with your application.
///
/// ## Map features
///
/// Different map schemes offer different sets of features, for example showing traffic or 3D buildings.
/// Some features have multiple modes of operation, but most have only one.
/// [MapScene.getSupportedFeatures] can be used to check what features and modes are supported
/// for current scene. Features can be enabled using [MapScene.enableFeatures] and disabled
/// with [MapScene.disableFeatures]. Checking which features are currently enabled can be done using
/// [MapScene.getActiveFeatures]. For convenience, [MapFeatures] and [MapFeatureModes] hold
/// constants for feature and mode names.
///
/// The old way of controlling map features using [MapScene.setLayerVisibility] is deprecated
/// and should not be used at the same time as [MapScene.enableFeatures] and [MapScene.disableFeatures].
///
/// Note: This feature is in BETA state and thus there can be bugs and unexpected behavior.
/// Related APIs may change for new releases without a deprecation process.
///
/// ## Map layers
///
/// Map scheme is organized in layers, which can be controlled using [MapScene.setLayerVisibility].
/// It's possible to change the visibility state of any map layer as long as you know its name.
///
/// Layer visibility settings persist between scene reloading.
///
/// ## User content
///
/// User generated content can be visualised on the map using [MapMarker], [MapPolygon]
/// and [MapPolyline] (collectively referred to as "map items"). Those can be added to and removed
/// from the scene by respective add and remove methods.
abstract class MapScene {

  /// Asynchronously loads a map scene described by a specified map scheme.
  ///
  /// Any previous map scene config will be replaced.
  ///
  /// Map features enabled or disabled using [MapScene.enableFeatures]
  /// and [MapScene.disableFeatures] will be reset to defaults for the new
  /// scene configuration.
  ///
  /// Map features changed as a result of calling [MapScene.setLayerVisibility]
  /// will be preserved for the new scene configuration, if it supports those features.
  ///
  /// The callback is called on the main thread.
  ///
  /// [mapScheme] Map scheme.
  ///
  /// [callback] Optional callback that will receive the result of this operation.
  ///
  void loadSceneForMapScheme(MapScheme mapScheme, MapSceneLoadSceneCallback? callback);
  /// Asynchronously loads a map scene described by a specified json file.
  ///
  /// Any previous map scene config will be replaced.
  ///
  /// Map features enabled or disabled using [MapScene.enableFeatures]
  /// and [MapScene.disableFeatures] will be reset to defaults for the new
  /// scene configuration.
  ///
  /// Map features changed as a result of calling [MapScene.setLayerVisibility]
  /// will be preserved for the new scene configuration, if it supports those features.
  ///
  /// The callback is called on the main thread.
  ///
  /// [configurationFile] Map scheme configuration file. It must contain the whole scene configuration.
  /// In case it contains references to other files, they have to be reachable under
  /// the paths specified in the main configuration file.
  ///
  /// [callback] Optional callback that will receive the result of this operation.
  ///
  void loadSceneFromConfigurationFile(String configurationFile, MapSceneLoadSceneCallback? callback);
  /// Asynchronously loads a map scene described by a specified json file.
  ///
  /// The style of the
  /// HERE watermark matching the map scheme is specified. Any previous map scene config
  /// will be replaced.
  ///
  /// Map features enabled or disabled using [MapScene.enableFeatures]
  /// and [MapScene.disableFeatures] will be reset to defaults for the new
  /// scene configuration.
  ///
  /// Map features changed as a result of calling [MapScene.setLayerVisibility]
  /// will be preserved for the new scene configuration, if it supports those features.
  ///
  /// The callback is called on the main thread.
  ///
  /// [configurationFile] Map scheme configuration file. It must contain the whole scene configuration.
  /// In case it contains references to other files, they have to be reachable under
  /// the paths specified in the main configuration file.
  ///
  /// [watermarkStyle] The style for the HERE watermark, see [WatermarkStyle].
  ///
  /// [callback] Optional callback that will receive the result of this operation.
  ///
  void loadSceneFromConfigurationFileWithWatermarkStyle(String configurationFile, WatermarkStyle watermarkStyle, MapSceneLoadSceneCallback? callback);
  /// Adds a map polyline to this map scene.
  ///
  /// [mapPolyline] The map polyline to be added to this map scene.
  ///
  void addMapPolyline(MapPolyline mapPolyline);
  /// Removes a map polyline from this map scene.
  ///
  /// [mapPolyline] The map polyline to be removed from this map scene.
  ///
  void removeMapPolyline(MapPolyline mapPolyline);
  /// Adds a map arrow to this map scene.
  ///
  /// [mapArrow] The map arrow to be added to this map scene.
  ///
  void addMapArrow(MapArrow mapArrow);
  /// Removes a map arrow from this map scene.
  ///
  /// [mapArrow] The map arrow to be removed from this map scene.
  ///
  void removeMapArrow(MapArrow mapArrow);
  /// Adds a map marker to this map scene.
  ///
  /// Adding the same marker instance multiple times
  /// has no effect. Adding a marker that is already part of a map marker cluster has no effect.
  ///
  /// [marker] The marker to be added to this map scene.
  ///
  void addMapMarker(MapMarker marker);
  /// Adds multiple map markers to this map scene.
  ///
  /// Adding the same marker instances multiple times
  /// has no effect. Adding markers that are already part of a map marker cluster has no effect.
  ///
  /// [markers] The list of markers to be added to this map scene.
  ///
  void addMapMarkers(List<MapMarker> markers);
  /// Removes a map marker from this map scene.
  ///
  /// Removing a marker instance that is not
  /// a part of this scene or belongs to a marker cluster has no effect.
  ///
  /// [marker] The marker to be removed from this map scene.
  ///
  void removeMapMarker(MapMarker marker);
  /// Removes multiple map markers from this map scene.
  ///
  /// Removing marker instances that are not
  /// a part of this scene or belong to a marker cluster has no effect.
  ///
  /// [markers] The list of markers to be removed from this map scene.
  ///
  void removeMapMarkers(List<MapMarker> markers);
  /// Adds a map marker cluster to the map.
  ///
  /// Either the contained individual map markers or the
  /// cluster markers will be displayed. Adding the same map marker cluster instance multiple times
  /// has no effect.
  ///
  /// [cluster] The marker cluster to be added to this map scene.
  ///
  void addMapMarkerCluster(MapMarkerCluster cluster);
  /// Removes a map marker cluster from the map.
  ///
  /// Removing a map marker cluster that is not on this
  /// scene has no effect.
  ///
  /// [cluster] The marker cluster to be removed from this map scene.
  ///
  void removeMapMarkerCluster(MapMarkerCluster cluster);
  /// Adds a 3D map marker to this map scene.
  ///
  /// Does nothing if the marker instance was already added to the scene.
  ///
  /// [marker] The marker to be added to this map scene.
  ///
  void addMapMarker3d(MapMarker3D marker);
  /// Removes a 3D map marker from this map scene.
  ///
  /// Removing a marker instance that is not on this
  /// scene has no effect.
  ///
  /// [marker] The marker to be removed from this map scene.
  ///
  void removeMapMarker3d(MapMarker3D marker);
  /// Adds a map polygon to this map scene.
  ///
  /// [mapPolygon] The map polygon to be added to this map scene.
  ///
  void addMapPolygon(MapPolygon mapPolygon);
  /// Removes a map polygon from this map scene.
  ///
  /// [mapPolygon] The map polygon to be removed from this map scene.
  ///
  void removeMapPolygon(MapPolygon mapPolygon);
  /// Immediately changes the visibility of a specified map layer.
  ///
  /// For deprecated constants defined in [MapSceneLayers], this may result
  /// in changing the state of a map feature (see [MapFeatures]). For that reason,
  /// it is recommended not to mix it with usage of [MapScene.enableFeatures]
  /// and [MapScene.disableFeatures] as it may lead to unexpected behaviour.
  ///
  /// [layerName] The name of the map layer to be changed.
  ///
  /// [visibility] The new visibility state of the layer.
  ///
  void setLayerVisibility(String layerName, VisibilityState visibility);
  /// Gets map features that are currently active.
  ///
  /// Active features are features that are either
  /// enabled via a call to [MapScene.enableFeatures]/[MapScene.setLayerVisibility] or that are enabled by default in the scene.
  ///
  /// The key to the resulting map is the name of the feature
  /// and the value is the active mode.
  ///
  /// Result is empty if scene has not been loaded.
  ///
  /// Note: This feature is in BETA state and thus there can be bugs and unexpected behavior.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// Returns [Map<String, String>]. The map of active features.
  ///
  Map<String, String> getActiveFeatures();
  /// Gets features and all of their modes supported by the currently
  /// loaded scene configuration.
  ///
  /// The key to the resulting map is the name of the feature
  /// and the value is a list of modes for that feature.
  ///
  /// Result is empty if scene has not been loaded.
  ///
  /// Note: This feature is in BETA state and thus there can be bugs and unexpected behavior.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// Returns [Map<String, List<String>>]. The map of supported features and all their modes.
  ///
  Map<String, List<String>> getSupportedFeatures();
  /// Enables specified map features.
  ///
  /// Those will become active
  /// after next map redraw, meaning that [MapScene.getActiveFeatures] will
  /// return updated list of active features only after the redraw happens.
  ///
  /// Does not affect features that were not specified.
  /// Unsupported features are ignored.
  ///
  /// May cause the current map configuration to be reloaded.
  ///
  /// See [MapFeatures] for feature names and [MapFeatureModes] for
  /// feature mode names.
  ///
  /// Note: This feature is in BETA state and thus there can be bugs and unexpected behavior.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [features] The list of features to enable, key is the name of the feature
  /// (see [MapFeatures]), value specifies its mode (see [MapFeatureModes]).
  ///
  void enableFeatures(Map<String, String> features);
  /// Disables specified map features.
  ///
  /// Those will become inactive
  /// after next map redraw, meaning that [MapScene.getActiveFeatures] will
  /// return updated list of active features only after the redraw happens.
  ///
  /// Does not affect features that were not specified.
  /// Unsupported features are ignored.
  ///
  /// May cause the current map configuration to be reloaded.
  ///
  /// See [MapFeatures] for feature names.
  ///
  /// Note: This feature is in BETA state and thus there can be bugs and unexpected behavior.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [features] The names of features to disable (see [MapFeatures]).
  ///
  void disableFeatures(List<String> features);
  /// Sets visibility for embedded carto POIs (points of interest that are visible on the map,
  /// by default).
  ///
  /// For HERE standard map schemes all available POI categories are visible by
  /// default for each selected map scheme. Note that not all POI categories are available for
  /// all map schemes.
  ///
  /// Based on the given list of categories the number of shown carto POIs can be reduced.
  /// To find all possible POI category strings look into `here.sdk.search.PlaceCategory`.
  /// Note that it is enough to set a main category like "100" (eat-and-drink) to also affect
  /// sub categories such as "100-1000" (eat-and-drink-restaurant)
  /// and "100-1100" (eat-and-drink-coffee-tea).
  ///
  /// The POI visibility is a property of the map data itself. Once set it will be applied to
  /// all HERE standard map schemes and the selected categories will remain even when
  /// switching a map scheme. However, the set visibility is not persisted.
  ///
  /// [categoryIds] A list of POI categories that a visibility state is set for.
  ///
  /// [visibility] A selected visibility for specified POI categories.
  ///
  static void setPoiVisibility(List<String> categoryIds, VisibilityState visibility) => $prototype.setPoiVisibility(categoryIds, visibility);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapScene$Impl(Pointer<Void>.fromAddress(0));
}

/// A collection of map layer identifiers used in the [MapScene.setLayerVisibility] method.

class MapSceneLayers {
  /// 3D representation of buildings. Not supported for [MapScheme.satellite],
  /// [MapScheme.hybridDay] and [MapScheme.hybridNight].
  @Deprecated("Will be removed in v4.15.0. Use [MapFeatures.extrudedBuildings] together with [MapScene.enableFeatures] and [MapScene.disableFeatures] instead.")
  static final String extrudedBuildings = "heresdk_layer_extruded_buildings";

  /// The 2D footprint of buildings. Not supported for [MapScheme.satellite],
  /// [MapScheme.hybridDay] and [MapScheme.hybridNight].
  @Deprecated("Will be removed in v4.15.0. Use [MapFeatures.buildingFootprints] together with [MapScene.enableFeatures] and [MapScene.disableFeatures] instead.")
  static final String buildingFootprints = "heresdk_layer_building_footprints";

  /// Traffic flow speed. Not supported for [MapScheme.satellite].
  /// An online connection is required for the traffic flow to be shown.
  @Deprecated("Will be removed in v4.15.0. Use [MapFeatures.trafficFlow] together with [MapScene.enableFeatures] and [MapScene.disableFeatures] instead.")
  static final String trafficFlow = "heresdk_layer_traffic_flow";

  /// Traffic incidents. Not supported for [MapScheme.satellite].
  /// An online connection is required for the traffic incidents to be shown.
  @Deprecated("Will be removed in v4.15.0. Use [MapFeatures.trafficIncidents] together with [MapScene.enableFeatures] and [MapScene.disableFeatures] instead.")
  static final String trafficIncidents = "heresdk_layer_traffic_incidents";

  /// Vehicle restrictions. Not supported for [MapScheme.satellite].
  /// Requires map version 25 as minimum.
  /// If old map data is stored on disk, it might require updating using `MapUpdater`.
  @Deprecated("Will be removed in v4.15.0. Use [MapFeatures.vehicleRestrictions] together with [MapScene.enableFeatures] and [MapScene.disableFeatures] instead.")
  static final String vehicleRestrictions = "heresdk_layer_vehicle_restrictions";

  /// Safety and speed cameras. Not supported for [MapScheme.satellite].
  /// Showing and hiding this layer using [MapScene.setLayerVisibility] will
  /// leave the map unresponsive for a short moment because the scene configuration is reloaded.
  @Deprecated("Will be removed in v4.15.0. Use [MapFeatures.safetyCameras] together with [MapScene.enableFeatures] and [MapScene.disableFeatures] instead.")
  static final String safetyCameras = "heresdk_layer_safety_cameras";

  /// Textured landmarks. Not supported for [MapScheme.satellite],
  /// [MapScheme.hybridDay] and [MapScheme.hybridNight].
  /// Requires map version 25 as minimum.
  /// If old map data is stored on disk, it might require updating using `MapUpdater`.
  /// Showing and hiding this layer using [MapScene.setLayerVisibility] will
  /// leave the map unresponsive for a short moment because the scene configuration is reloaded.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  @Deprecated("Will be removed in v4.15.0. Use [MapFeatures.landmarks] together with [MapScene.enableFeatures] and [MapScene.disableFeatures] instead.")
  static final String landmarks = "heresdk_layer_landmarks";

}


// MapSceneLayers "private" section, not exported.

final _sdkMapviewMapsceneLayersCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_sdk_mapview_MapScene_Layers_create_handle'));
final _sdkMapviewMapsceneLayersReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_Layers_release_handle'));



Pointer<Void> sdkMapviewMapsceneLayersToFfi(MapSceneLayers value) {
  final _result = _sdkMapviewMapsceneLayersCreateHandle();
  return _result;
}

MapSceneLayers sdkMapviewMapsceneLayersFromFfi(Pointer<Void> handle) {
  try {
    return MapSceneLayers(
    );
  } finally {
  }
}

void sdkMapviewMapsceneLayersReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMapsceneLayersReleaseHandle(handle);

// Nullable MapSceneLayers

final _sdkMapviewMapsceneLayersCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_Layers_create_handle_nullable'));
final _sdkMapviewMapsceneLayersReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_Layers_release_handle_nullable'));
final _sdkMapviewMapsceneLayersGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_Layers_get_value_nullable'));

Pointer<Void> sdkMapviewMapsceneLayersToFfiNullable(MapSceneLayers? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapsceneLayersToFfi(value);
  final result = _sdkMapviewMapsceneLayersCreateHandleNullable(_handle);
  sdkMapviewMapsceneLayersReleaseFfiHandle(_handle);
  return result;
}

MapSceneLayers? sdkMapviewMapsceneLayersFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapsceneLayersGetValueNullable(handle);
  final result = sdkMapviewMapsceneLayersFromFfi(_handle);
  sdkMapviewMapsceneLayersReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapsceneLayersReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapsceneLayersReleaseHandleNullable(handle);

// End of MapSceneLayers "private" section.
/// Called on the main thread after `loadScene()` method finishes loading
/// the scene.
typedef MapSceneLoadSceneCallback = void Function(MapError?);

// MapSceneLoadSceneCallback "private" section, not exported.

final _sdkMapviewMapsceneLoadscenecallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_register_finalizer'));
final _sdkMapviewMapsceneLoadscenecallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_copy_handle'));
final _sdkMapviewMapsceneLoadscenecallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_release_handle'));
final _sdkMapviewMapsceneLoadscenecallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_create_proxy'));

class MapSceneLoadSceneCallback$Impl {
  final Pointer<Void> handle;
  MapSceneLoadSceneCallback$Impl(this.handle);

  void call(MapError? p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_call__MapError_'));
    final _p0Handle = sdkMapviewMaperrorToFfiNullable(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkMapviewMaperrorReleaseFfiHandleNullable(_p0Handle);

  }

}

int _sdkMapviewMapsceneLoadscenecallbackcallStatic(Object _obj, Pointer<Void> p0) {
  
  try {
    (_obj as MapSceneLoadSceneCallback)(sdkMapviewMaperrorFromFfiNullable(p0));
  } finally {
    sdkMapviewMaperrorReleaseFfiHandleNullable(p0);
  }
  return 0;
}

Pointer<Void> sdkMapviewMapsceneLoadscenecallbackToFfi(MapSceneLoadSceneCallback value) =>
  _sdkMapviewMapsceneLoadscenecallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_sdkMapviewMapsceneLoadscenecallbackcallStatic, __lib.unknownError)
  );

MapSceneLoadSceneCallback sdkMapviewMapsceneLoadscenecallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkMapviewMapsceneLoadscenecallbackCopyHandle(handle);
  final _impl = MapSceneLoadSceneCallback$Impl(_copiedHandle);
  final result = (MapError? p0) => _impl.call(p0);
  _sdkMapviewMapsceneLoadscenecallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapsceneLoadscenecallbackReleaseHandle(handle);

// Nullable MapSceneLoadSceneCallback

final _sdkMapviewMapsceneLoadscenecallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_create_handle_nullable'));
final _sdkMapviewMapsceneLoadscenecallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_release_handle_nullable'));
final _sdkMapviewMapsceneLoadscenecallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_get_value_nullable'));

Pointer<Void> sdkMapviewMapsceneLoadscenecallbackToFfiNullable(MapSceneLoadSceneCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapsceneLoadscenecallbackToFfi(value);
  final result = _sdkMapviewMapsceneLoadscenecallbackCreateHandleNullable(_handle);
  sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandle(_handle);
  return result;
}

MapSceneLoadSceneCallback? sdkMapviewMapsceneLoadscenecallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapsceneLoadscenecallbackGetValueNullable(handle);
  final result = sdkMapviewMapsceneLoadscenecallbackFromFfi(_handle);
  sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapsceneLoadscenecallbackReleaseHandleNullable(handle);

// End of MapSceneLoadSceneCallback "private" section.

// MapScene "private" section, not exported.

final _sdkMapviewMapsceneRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapScene_register_finalizer'));
final _sdkMapviewMapsceneCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_copy_handle'));
final _sdkMapviewMapsceneReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_release_handle'));

























/// @nodoc
@visibleForTesting
class MapScene$Impl extends __lib.NativeBase implements MapScene {

  MapScene$Impl(Pointer<Void> handle) : super(handle);

  @override
  void loadSceneForMapScheme(MapScheme mapScheme, MapSceneLoadSceneCallback? callback) {
    final _loadSceneForMapSchemeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_loadScene__MapScheme_LoadSceneCallback_'));
    final _mapSchemeHandle = sdkMapviewMapschemeToFfi(mapScheme);
    final _callbackHandle = sdkMapviewMapsceneLoadscenecallbackToFfiNullable(callback);
    final _handle = this.handle;
    _loadSceneForMapSchemeFfi(_handle, __lib.LibraryContext.isolateId, _mapSchemeHandle, _callbackHandle);
    sdkMapviewMapschemeReleaseFfiHandle(_mapSchemeHandle);
    sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandleNullable(_callbackHandle);

  }

  @override
  void loadSceneFromConfigurationFile(String configurationFile, MapSceneLoadSceneCallback? callback) {
    final _loadSceneFromConfigurationFileFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_loadScene__String_LoadSceneCallback_'));
    final _configurationFileHandle = stringToFfi(configurationFile);
    final _callbackHandle = sdkMapviewMapsceneLoadscenecallbackToFfiNullable(callback);
    final _handle = this.handle;
    _loadSceneFromConfigurationFileFfi(_handle, __lib.LibraryContext.isolateId, _configurationFileHandle, _callbackHandle);
    stringReleaseFfiHandle(_configurationFileHandle);
    sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandleNullable(_callbackHandle);

  }

  @override
  void loadSceneFromConfigurationFileWithWatermarkStyle(String configurationFile, WatermarkStyle watermarkStyle, MapSceneLoadSceneCallback? callback) {
    final _loadSceneFromConfigurationFileWithWatermarkStyleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_loadScene__String_WatermarkStyle_LoadSceneCallback_'));
    final _configurationFileHandle = stringToFfi(configurationFile);
    final _watermarkStyleHandle = sdkMapviewWatermarkstyleToFfi(watermarkStyle);
    final _callbackHandle = sdkMapviewMapsceneLoadscenecallbackToFfiNullable(callback);
    final _handle = this.handle;
    _loadSceneFromConfigurationFileWithWatermarkStyleFfi(_handle, __lib.LibraryContext.isolateId, _configurationFileHandle, _watermarkStyleHandle, _callbackHandle);
    stringReleaseFfiHandle(_configurationFileHandle);
    sdkMapviewWatermarkstyleReleaseFfiHandle(_watermarkStyleHandle);
    sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandleNullable(_callbackHandle);

  }

  @override
  void addMapPolyline(MapPolyline mapPolyline) {
    final _addMapPolylineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapPolyline__MapPolyline'));
    final _mapPolylineHandle = sdkMapviewMappolylineToFfi(mapPolyline);
    final _handle = this.handle;
    _addMapPolylineFfi(_handle, __lib.LibraryContext.isolateId, _mapPolylineHandle);
    sdkMapviewMappolylineReleaseFfiHandle(_mapPolylineHandle);

  }

  @override
  void removeMapPolyline(MapPolyline mapPolyline) {
    final _removeMapPolylineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapPolyline__MapPolyline'));
    final _mapPolylineHandle = sdkMapviewMappolylineToFfi(mapPolyline);
    final _handle = this.handle;
    _removeMapPolylineFfi(_handle, __lib.LibraryContext.isolateId, _mapPolylineHandle);
    sdkMapviewMappolylineReleaseFfiHandle(_mapPolylineHandle);

  }

  @override
  void addMapArrow(MapArrow mapArrow) {
    final _addMapArrowFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapArrow__MapArrow'));
    final _mapArrowHandle = sdkMapviewMaparrowToFfi(mapArrow);
    final _handle = this.handle;
    _addMapArrowFfi(_handle, __lib.LibraryContext.isolateId, _mapArrowHandle);
    sdkMapviewMaparrowReleaseFfiHandle(_mapArrowHandle);

  }

  @override
  void removeMapArrow(MapArrow mapArrow) {
    final _removeMapArrowFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapArrow__MapArrow'));
    final _mapArrowHandle = sdkMapviewMaparrowToFfi(mapArrow);
    final _handle = this.handle;
    _removeMapArrowFfi(_handle, __lib.LibraryContext.isolateId, _mapArrowHandle);
    sdkMapviewMaparrowReleaseFfiHandle(_mapArrowHandle);

  }

  @override
  void addMapMarker(MapMarker marker) {
    final _addMapMarkerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapMarker__MapMarker'));
    final _markerHandle = sdkMapviewMapmarkerToFfi(marker);
    final _handle = this.handle;
    _addMapMarkerFfi(_handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarkerReleaseFfiHandle(_markerHandle);

  }

  @override
  void addMapMarkers(List<MapMarker> markers) {
    final _addMapMarkersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapMarkers__ListOf_sdk_mapview_MapMarker'));
    final _markersHandle = harpSdkBindingslistofSdkMapviewMapmarkerToFfi(markers);
    final _handle = this.handle;
    _addMapMarkersFfi(_handle, __lib.LibraryContext.isolateId, _markersHandle);
    harpSdkBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(_markersHandle);

  }

  @override
  void removeMapMarker(MapMarker marker) {
    final _removeMapMarkerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapMarker__MapMarker'));
    final _markerHandle = sdkMapviewMapmarkerToFfi(marker);
    final _handle = this.handle;
    _removeMapMarkerFfi(_handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarkerReleaseFfiHandle(_markerHandle);

  }

  @override
  void removeMapMarkers(List<MapMarker> markers) {
    final _removeMapMarkersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapMarkers__ListOf_sdk_mapview_MapMarker'));
    final _markersHandle = harpSdkBindingslistofSdkMapviewMapmarkerToFfi(markers);
    final _handle = this.handle;
    _removeMapMarkersFfi(_handle, __lib.LibraryContext.isolateId, _markersHandle);
    harpSdkBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(_markersHandle);

  }

  @override
  void addMapMarkerCluster(MapMarkerCluster cluster) {
    final _addMapMarkerClusterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapMarkerCluster__MapMarkerCluster'));
    final _clusterHandle = sdkMapviewMapmarkerclusterToFfi(cluster);
    final _handle = this.handle;
    _addMapMarkerClusterFfi(_handle, __lib.LibraryContext.isolateId, _clusterHandle);
    sdkMapviewMapmarkerclusterReleaseFfiHandle(_clusterHandle);

  }

  @override
  void removeMapMarkerCluster(MapMarkerCluster cluster) {
    final _removeMapMarkerClusterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapMarkerCluster__MapMarkerCluster'));
    final _clusterHandle = sdkMapviewMapmarkerclusterToFfi(cluster);
    final _handle = this.handle;
    _removeMapMarkerClusterFfi(_handle, __lib.LibraryContext.isolateId, _clusterHandle);
    sdkMapviewMapmarkerclusterReleaseFfiHandle(_clusterHandle);

  }

  @override
  void addMapMarker3d(MapMarker3D marker) {
    final _addMapMarker3dFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapMarker3d__MapMarker3D'));
    final _markerHandle = sdkMapviewMapmarker3dToFfi(marker);
    final _handle = this.handle;
    _addMapMarker3dFfi(_handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarker3dReleaseFfiHandle(_markerHandle);

  }

  @override
  void removeMapMarker3d(MapMarker3D marker) {
    final _removeMapMarker3dFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapMarker3d__MapMarker3D'));
    final _markerHandle = sdkMapviewMapmarker3dToFfi(marker);
    final _handle = this.handle;
    _removeMapMarker3dFfi(_handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarker3dReleaseFfiHandle(_markerHandle);

  }

  @override
  void addMapPolygon(MapPolygon mapPolygon) {
    final _addMapPolygonFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapPolygon__MapPolygon'));
    final _mapPolygonHandle = sdkMapviewMappolygonToFfi(mapPolygon);
    final _handle = this.handle;
    _addMapPolygonFfi(_handle, __lib.LibraryContext.isolateId, _mapPolygonHandle);
    sdkMapviewMappolygonReleaseFfiHandle(_mapPolygonHandle);

  }

  @override
  void removeMapPolygon(MapPolygon mapPolygon) {
    final _removeMapPolygonFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapPolygon__MapPolygon'));
    final _mapPolygonHandle = sdkMapviewMappolygonToFfi(mapPolygon);
    final _handle = this.handle;
    _removeMapPolygonFfi(_handle, __lib.LibraryContext.isolateId, _mapPolygonHandle);
    sdkMapviewMappolygonReleaseFfiHandle(_mapPolygonHandle);

  }

  @override
  void setLayerVisibility(String layerName, VisibilityState visibility) {
    final _setLayerVisibilityFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint32), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapScene_setLayerVisibility__String_VisibilityState'));
    final _layerNameHandle = stringToFfi(layerName);
    final _visibilityHandle = sdkMapviewVisibilitystateToFfi(visibility);
    final _handle = this.handle;
    _setLayerVisibilityFfi(_handle, __lib.LibraryContext.isolateId, _layerNameHandle, _visibilityHandle);
    stringReleaseFfiHandle(_layerNameHandle);
    sdkMapviewVisibilitystateReleaseFfiHandle(_visibilityHandle);

  }

  @override
  Map<String, String> getActiveFeatures() {
    final _getActiveFeaturesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapScene_getActiveFeatures'));
    final _handle = this.handle;
    final __resultHandle = _getActiveFeaturesFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingsmapofStringToStringFromFfi(__resultHandle);
    } finally {
      harpSdkBindingsmapofStringToStringReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  Map<String, List<String>> getSupportedFeatures() {
    final _getSupportedFeaturesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapScene_getSupportedFeatures'));
    final _handle = this.handle;
    final __resultHandle = _getSupportedFeaturesFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingsmapofStringToHarpSdkBindingslistofStringFromFfi(__resultHandle);
    } finally {
      harpSdkBindingsmapofStringToHarpSdkBindingslistofStringReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void enableFeatures(Map<String, String> features) {
    final _enableFeaturesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_enableFeatures__MapOf_String_to_String'));
    final _featuresHandle = harpSdkBindingsmapofStringToStringToFfi(features);
    final _handle = this.handle;
    _enableFeaturesFfi(_handle, __lib.LibraryContext.isolateId, _featuresHandle);
    harpSdkBindingsmapofStringToStringReleaseFfiHandle(_featuresHandle);

  }

  @override
  void disableFeatures(List<String> features) {
    final _disableFeaturesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_disableFeatures__ListOf_String'));
    final _featuresHandle = harpSdkBindingslistofStringToFfi(features);
    final _handle = this.handle;
    _disableFeaturesFfi(_handle, __lib.LibraryContext.isolateId, _featuresHandle);
    harpSdkBindingslistofStringReleaseFfiHandle(_featuresHandle);

  }

  void setPoiVisibility(List<String> categoryIds, VisibilityState visibility) {
    final _setPoiVisibilityFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Uint32), void Function(int, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapScene_setPoiVisibility__ListOf_String_VisibilityState'));
    final _categoryIdsHandle = harpSdkBindingslistofStringToFfi(categoryIds);
    final _visibilityHandle = sdkMapviewVisibilitystateToFfi(visibility);
    _setPoiVisibilityFfi(__lib.LibraryContext.isolateId, _categoryIdsHandle, _visibilityHandle);
    harpSdkBindingslistofStringReleaseFfiHandle(_categoryIdsHandle);
    sdkMapviewVisibilitystateReleaseFfiHandle(_visibilityHandle);

  }


}

Pointer<Void> sdkMapviewMapsceneToFfi(MapScene value) =>
  _sdkMapviewMapsceneCopyHandle((value as __lib.NativeBase).handle);

MapScene sdkMapviewMapsceneFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapScene) return instance;

  final _copiedHandle = _sdkMapviewMapsceneCopyHandle(handle);
  final result = MapScene$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapsceneRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapsceneReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapsceneReleaseHandle(handle);

Pointer<Void> sdkMapviewMapsceneToFfiNullable(MapScene? value) =>
  value != null ? sdkMapviewMapsceneToFfi(value) : Pointer<Void>.fromAddress(0);

MapScene? sdkMapviewMapsceneFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapsceneFromFfi(handle) : null;

void sdkMapviewMapsceneReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapsceneReleaseHandle(handle);

// End of MapScene "private" section.


