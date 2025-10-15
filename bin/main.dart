import 'dart:io';
import '../lib/banque.dart';
import '../lib/compte_courant.dart';
import '../lib/compte_epargne.dart';

void main() {
  var banque = Banque('Banque Flutter');

  var compte1 = CompteCourant('1001', 'Mohamed', 1000.0);
  var compte2 = CompteEpargne('2002', 'Lahbari', 5.0);

  banque.ajouterCompte(compte1);
  banque.ajouterCompte(compte2);

  while (true) {
    print('\n--- Menu ---');
    print('1. Afficher les comptes');
    print('2. Effectuer un dépôt');
    print('3. Effectuer un retrait');
    print('4. Afficher l\'historique d\'un compte');
    print('5. Calculer les intérêts pour un compte épargne');
    print('6. Quitter');
    print('------------');
    print('Votre choix: ');

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        banque.afficherComptes();
        break;
      case '2':
        print('Numéro du compte: ');
        var numero = stdin.readLineSync();
        print('Montant du dépôt: ');
        var montantStr = stdin.readLineSync();
        if (numero != null && montantStr != null) {
          var montant = double.tryParse(montantStr);
          if (montant != null) {
            banque.effectuerDepot(numero, montant);
          } else {
            print('Montant invalide.');
          }
        }
        break;
      case '3':
        print('Numéro du compte: ');
        var numero = stdin.readLineSync();
        print('Montant du retrait: ');
        var montantStr = stdin.readLineSync();
        if (numero != null && montantStr != null) {
          var montant = double.tryParse(montantStr);
          if (montant != null) {
            banque.effectuerRetrait(numero, montant);
          } else {
            print('Montant invalide.');
          }
        }
        break;
      case '4':
        print('Numéro du compte: ');
        var numero = stdin.readLineSync();
        if (numero != null) {
          banque.afficherOperationsCompte(numero);
        }
        break;
      case '5':
        print('Numéro du compte épargne: ');
        var numero = stdin.readLineSync();
        if (numero != null) {
          var compte = banque.rechercherCompte(numero);
          if (compte is CompteEpargne) {
            compte.calculerInteret();
            var interet = compte.lastOperation.montant;
            print('Intérêt de $interet MAD ajouté au compte épargne $numero.');
          } else {
            print('Compte épargne non trouvé.');
          }
        }
        break;
      case '6':
        print('Au revoir!');
        return;
      default:
        print('Choix invalide.');
    }
  }
}