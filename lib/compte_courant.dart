import './compte.dart';
import './operation.dart';

class CompteCourant extends Compte {
  double decouvert;

  CompteCourant(String numero, String proprietaire, this.decouvert)
      : super(numero, proprietaire);

  @override
  void retirer(double montant) {
    if (solde - montant >= -decouvert) {
      solde -= montant;
      operations.add(Operation('Retrait', montant));
      print('Retrait de $montant MAD effectué sur le compte $numero.');
    } else {
      print('Retrait non autorisé: découvert dépassé');
    }
  }

  @override
  void calculerInteret() {
    // Aucun intérêt pour le compte courant
  }
}