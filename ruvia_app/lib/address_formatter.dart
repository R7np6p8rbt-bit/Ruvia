import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> formatRuviaAddress(String value) async {
  print('RUVIA FORMAT ADDRESS LLAMADA: $value');

  final coordinates = value.split(',');

  if (coordinates.length != 2) {
    return value;
  }

  final latitude = double.tryParse(coordinates[0].trim());
  final longitude = double.tryParse(coordinates[1].trim());

  if (latitude == null || longitude == null) {
    return value;
  }

  try {
    final uri = Uri.https(
      'nominatim.openstreetmap.org',
      '/reverse',
      {
        'format': 'jsonv2',
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'zoom': '18',
        'addressdetails': '1',
      },
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      return value;
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final address = data['address'] as Map<String, dynamic>?;

    if (address == null) {
      return value;
    }

    final parts = <String>[];

    final road = address['road'];
    final houseNumber = address['house_number'];
    final neighbourhood =
        address['neighbourhood'] ?? address['suburb'];
    final city =
        address['city'] ??
        address['town'] ??
        address['village'];
    final state = address['state'];

    if (road != null && road.toString().trim().isNotEmpty) {
      var roadText = road.toString();

      if (houseNumber != null &&
          houseNumber.toString().trim().isNotEmpty) {
        roadText = '$roadText ${houseNumber.toString()}';
      }

      parts.add(roadText);
    }

    if (neighbourhood != null &&
        neighbourhood.toString().trim().isNotEmpty) {
      parts.add(neighbourhood.toString());
    }

    if (city != null && city.toString().trim().isNotEmpty) {
      parts.add(city.toString());
    }

    if (state != null && state.toString().trim().isNotEmpty) {
      parts.add(state.toString());
    }

    if (parts.isNotEmpty) {
      return parts.join(', ');
    }

    final displayName = data['display_name'];

    if (displayName != null &&
        displayName.toString().trim().isNotEmpty) {
      return displayName.toString();
    }
  } catch (e, stackTrace) {
    print('RUVIA ADDRESS ERROR: $e');
    print(stackTrace);
  }

  return value;
}
