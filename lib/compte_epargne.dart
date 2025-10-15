import './compte.dart';
import './operation.dart';

class CompteEpargne extends Compte {
  double tauxInteret;

  CompteEpargne(String numero, String proprietaire, this.tauxInteret)
      : super(numero, proprietaire);

  @override
  void retirer(double montant) {
    if (solde >= montant) {
      solde -= montant;
      operations.add(Operation('Retrait', montant));
      print('Retrait de $montant MAD effectué sur le compte $numero.');
    } else {
      print('Retrait non autorisé: solde insuffisant');
    }
  }

  @override
  void calculerInteret() {
    double interet = solde * tauxInteret / 100;
    solde += interet;
    operations.add(Operation('Interet', interet));
  }
}