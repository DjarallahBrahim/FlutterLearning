class patient {
  final String id;
  final String nom;
  final String prenom;
  final String sex;
  final DateTime dateNaissance;
  final DateTime dateEntre;
  final DateTime? dateSortie;
  final String diagnostic;
  final String signeCliniques;
  final String protocolParaclinique;
  final String suitePostOperatoire;
  final String anticedents;
  final String scoreClassification;
  final String traitement;
  final String examenParaclinique;

  patient(
      this.id,
      this.nom,
      this.prenom,
      this.sex,
      this.dateNaissance,
      this.dateEntre,
      this.dateSortie,
      this.diagnostic,
      this.signeCliniques,
      this.protocolParaclinique,
      this.suitePostOperatoire,
      this.anticedents,
      this.scoreClassification,
      this.traitement,
      this.examenParaclinique);
}
