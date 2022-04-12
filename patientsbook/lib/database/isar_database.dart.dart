import 'package:isar/isar.dart';

part 'isar_database.dart.g.dart';

@Collection()
class PastientDatas {
  @Id()
  int? id = Isar.autoIncrement;

  late String nom;
  late String prenom;
  late String sexe;

  late DateTime dateNaissance;
  late DateTime dateEntre;
  late DateTime? dateSortie;

  late String diagnostic;
  late String signeCliniques;
  late String protocolParaclinique;
  late String suitePostOperatoire;
  late String anticedents;
  late String scoreClassification;
  late String traitement;
  late String examenParaclinique;

  
}
