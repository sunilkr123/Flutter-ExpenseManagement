import 'package:flutter/foundation.dart';

class TransactionData {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  TransactionData(
      @required this.id,
      @required this.title,
      @required this.amount,
      @required this.date);
}