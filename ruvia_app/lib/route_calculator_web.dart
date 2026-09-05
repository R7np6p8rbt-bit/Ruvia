import 'dart:js_interop';

@JS('getRuviaAddress')
external JSPromise<JSString> _getRuviaAddress(
  JSNumber latitude,
  JSNumber longitude,
);

@JS('calculateRuviaRoute')
external JSPromise<JSString> _calculateRuviaRoute(
  JSNumber originLat,
  JSNumber originLng,
  JSString destination,
);

Future<Map<String, dynamic>?> calculateRuviaRoute({
  required double originLat,
  required double originLng,
  required String destination,
}) async {
  final promise = _calculateRuviaRoute(
    originLat.toJS,
    originLng.toJS,
    destination.toJS,
  );

  final result = await promise.toDart;
  final json = result.toDart;

  final distanceMatch = RegExp(
    r'"distanceMeters"\s*:\s*(\d+(?:\.\d+)?)',
  ).firstMatch(json);

  final durationMatch = RegExp(
    r'"durationMillis"\s*:\s*(\d+(?:\.\d+)?)',
  ).firstMatch(json);

  if (distanceMatch == null) {
    return null;
  }

  final meters = double.tryParse(distanceMatch.group(1)!);

  if (meters == null) {
    return null;
  }

  final pathMatch = RegExp(
    r'"path"\s*:\s*\[(.*?)\]',
  ).firstMatch(json);

  final routePoints = <Map<String, double>>[];

  if (pathMatch != null) {
    final pointRegex = RegExp(
      r'\{"lat"\s*:\s*(-?\d+(?:\.\d+)?)\s*,\s*"lng"\s*:\s*(-?\d+(?:\.\d+)?)\}',
    );

    for (final match in pointRegex.allMatches(pathMatch.group(1)!)) {
      final lat = double.tryParse(match.group(1)!);
      final lng = double.tryParse(match.group(2)!);

      if (lat != null && lng != null) {
        routePoints.add({
          'lat': lat,
          'lng': lng,
        });
      }
    }
  }

  return {
    'distanceKm': meters / 1000,
    'durationMillis': durationMatch == null
        ? null
        : double.tryParse(durationMatch.group(1)!),
    'routePoints': routePoints,
  };
}


Future<String?> getRuviaAddress({
  required double latitude,
  required double longitude,
}) async {
  final promise = _getRuviaAddress(
    latitude.toJS,
    longitude.toJS,
  );

  final result = await promise.toDart;
  final address = result.toDart;

  if (address.trim().isEmpty) {
    return null;
  }

  return address;
}


Future<double?> calculateRouteDistanceKm({
  required double originLat,
  required double originLng,
  required String destination,
}) async {
  final promise = _calculateRuviaRoute(
    originLat.toJS,
    originLng.toJS,
    destination.toJS,
  );

  final result = await promise.toDart;
  final json = result.toDart;

  final match = RegExp(
    r'"distanceMeters"\s*:\s*(\d+(?:\.\d+)?)',
  ).firstMatch(json);

  if (match == null) {
    return null;
  }

  final meters = double.tryParse(match.group(1)!);

  if (meters == null) {
    return null;
  }

  return meters / 1000;
}
