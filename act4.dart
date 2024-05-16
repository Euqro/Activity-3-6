import 'dart:convert';
import 'dart:io';
import 'dart:async';

void main() {
  fetchCovidData().then((data) {
    print('COVID-19 Data:');
    print(data);
  }).catchError((error) {
    print('Error fetching COVID-19 data: $error');
  });
}

Future<List<dynamic>> fetchCovidData() async {
  final String apiUrl = 'https://covid-193.p.rapidapi.com/countries';

  HttpClient httpClient = HttpClient();

  try {
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(apiUrl));
    request.headers.add(
        'x-rapidapi-key', '7a62c84b10msh7fc7179c5d2d120p1a2d03jsn775f58735de3');
    HttpClientResponse response = await request.close();

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }

    String responseBody = await response.transform(utf8.decoder).join();
    Map<String, dynamic> jsonData = json.decode(responseBody);

    httpClient.close();

    // Assuming the JSON response contains a field named 'response' that contains the actual data
    return jsonData['response'];
  } catch (error) {
    httpClient.close();
    throw Exception('Failed to fetch data: $error');
  }
}
