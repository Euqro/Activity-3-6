import 'dart:io';

void main() {
  String inputFilePath = 'numbers.txt';

  String outputFilePath = 'result.txt';

  File inputFile = File(inputFilePath);

  Future<List<String>> linesFuture = inputFile.readAsLines();

  linesFuture.then((List<String> lines) {
    List<int> numbers = [];

    for (String line in lines) {
      try {
        int number = int.parse(line);
        numbers.add(number);
      } catch (e) {
        print('Error parsing line as integer: $e');
      }
    }

    int sum = numbers.reduce((value, element) => value + element);

    File outputFile = File(outputFilePath);

    outputFile.writeAsString('$sum').then((_) {
      print('Sum saved to $outputFilePath');
    }).catchError((e) {
      print('Error writing sum to file: $e');
    });
  }).catchError((e) {
    print('Error reading file: $e');
  });
}
