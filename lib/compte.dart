import './operation.dart';

abstract class Compte {
  String numero;
  String proprietaire;
  double solde;
  List<Operation> operations;

  Compte(this.numero, this.proprietaire) : solde = 0, operations = [];

  void deposer(double montant) {
    solde += montant;
    operations.add(Operation('Depot', montant));
  }

  void retirer(double montant);

  void calculerInteret();

  void afficherHistorique() {
    print('Historique du compte n°$numero ($proprietaire):');
    for (var op in operations) {
      print('- ${op.type} de ${op.montant} MAD le ${op.date}');
    }
  }

  void afficherDetails() {
    print('Compte n°$numero | Propriétaire: $proprietaire | Solde: $solde MAD');
  }

  Operation get lastOperation => operations.last;
}
