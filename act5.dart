import 'dart:io';

void main() {
  stdout.write('Enter the file name: ');
  String? fileName = stdin.readLineSync();

  if (fileName != null) {
    readFileContents(fileName)
        .then((contents) => print('File contents:\n$contents'))
        .catchError((error) {
      print('Error: $error');
    });
  } else {
    print('No file name provided.');
  }
}

Future<String> readFileContents(String fileName) async {
  try {
    File file = File(fileName);
    if (!file.existsSync()) {
      throw FileSystemException('File not found');
    }

    return await file.readAsString();
  } catch (error) {
    throw Exception('Failed to read file: $error');
  }
}
