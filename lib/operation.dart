
class Operation {
  String type;
  double montant;
  DateTime date;

  Operation(this.type, this.montant) : date = DateTime.now();

  @override
  String toString() {
    return 'Operation{type: \$type, montant: \$montant, date: \$date}';
  }
}
