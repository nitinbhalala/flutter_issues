import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

String formatDate(String date) {
  final DateTime parsedDate = DateTime.parse(date);
  final DateFormat formatter = DateFormat('MM-dd-yyyy');
  return formatter.format(parsedDate);
}

class PreferencesService {
  static final PreferencesService _instance = PreferencesService._internal();

  static SharedPreferences? prefs;

  factory PreferencesService() {
    return _instance;
  }

  PreferencesService._internal();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Set a string value
  Future<bool> setString(String key, String value) async {
    return await prefs!.setString(key, value);
  }

  // Get a string value
  String? getString(String key) {
    return prefs!.getString(key);
  }

  // Set an integer value
  Future<bool> setInt(String key, int value) async {
    return await prefs!.setInt(key, value);
  }

  // Get an integer value
  int? getInt(String key) {
    return prefs!.getInt(key);
  }

  // Set a boolean value
  Future<bool> setBool(String key, bool value) async {
    return await prefs!.setBool(key, value);
  }

  // Get a boolean value
  bool? getBool(String key) {
    return prefs!.getBool(key);
  }
}

List categories = [
  {
    "title": "BreakFast",
    "image": "",
  },
  {
    "title": "Vegetable",
    "image": "",
  },
  {
    "title": "Milk",
    "image": "",
  },
  {
    "title": "Egg",
    "image": "",
  },
];

List milk = [
  {
    'title': 'Amul Milk',
    'time': '8 mints',
    'subTitle': '500 ml',
    'price': '₹ 27',
    'images': []
  },
  {
    'title': 'Amul Paneer',
    'time': '12 mints',
    'subTitle': '200 g',
    'price': '₹ 80',
    'images': []
  },
  {
    'title': 'Amul Ghee',
    'time': '26 mints',
    'subTitle': '905 g',
    'price': '₹ 800',
    'images': []
  },
  {
    'title': 'Amul Dahi',
    'time': '24 mints',
    'subTitle': '200 g',
    'price': '₹ 159',
    'images': []
  },
  {
    'title': 'Amul Lassi',
    'time': '12 mints',
    'subTitle': '250 ml',
    'price': '₹ 84',
    'images': []
  },
];

List vegetables = [
  {
    'title': 'Cabbage',
    'time': '08 mints',
    'subTitle': '250 g',
    'price': '₹ 78',
    'images': []
  },
  {
    'title': 'Onion',
    'time': '18 mints',
    'subTitle': '500 g',
    'price': '₹ 150',
    'images': []
  },
  {
    'title': 'Tomato',
    'time': '28 mints',
    'subTitle': '275 g',
    'price': '₹ 180',
    'images': []
  },
  {
    'title': 'Potato',
    'time': '35 mints',
    'subTitle': '500 g',
    'price': '₹ 145',
    'images': []
  },
  {
    'title': 'Radish',
    'time': '05 mints',
    'subTitle': '150 g',
    'price': '₹ 120',
    'images': []
  },
];
