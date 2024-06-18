class Transaction {
  String description;
  int amount;
  DateTime date;
  String? id;

  Transaction(
      {required this.description,
      required this.amount,
      required this.date,
      this.id});
}
