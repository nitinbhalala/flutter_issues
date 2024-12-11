import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

bool isUpdate = false;

String noNetMsg = 'No internet connection. Please try again!';

String formatDate(String date) {
  final DateTime parsedDate = DateTime.parse(date);
  final DateFormat formatter = DateFormat('MM-dd-yyyy');
  return formatter.format(parsedDate);
}

Future<void> launchUrls(url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
