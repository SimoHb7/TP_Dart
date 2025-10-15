import './compte.dart';

class Banque {
  String nom;
  List<Compte> comptes;

  Banque(this.nom) : comptes = [];

  void ajouterCompte(Compte compte) {
    comptes.add(compte);
    print('Compte ajouté: n°${compte.numero} (${compte.proprietaire})');
  }

  Compte? rechercherCompte(String numero) {
    try {
      return comptes.firstWhere((c) => c.numero == numero);
    } catch (e) {
      return null;
    }
  }

  void effectuerDepot(String numero, double montant) {
    var compte = rechercherCompte(numero);
    if (compte != null) {
      compte.deposer(montant);
      print('Dépôt de $montant MAD effectué sur le compte $numero.');
    } else {
      print('Compte non trouvé.');
    }
  }

  void effectuerRetrait(String numero, double montant) {
    var compte = rechercherCompte(numero);
    if (compte != null) {
      compte.retirer(montant);
    } else {
      print('Compte non trouvé.');
    }
  }

  void afficherOperationsCompte(String numero) {
    var compte = rechercherCompte(numero);
    if (compte != null) {
      compte.afficherHistorique();
    } else {
      print('Compte non trouvé.');
    }
  }

  void afficherComptes() {
    print('=== Comptes de la banque $nom ===');
    for (var compte in comptes) {
      compte.afficherDetails();
    }
  }
}
