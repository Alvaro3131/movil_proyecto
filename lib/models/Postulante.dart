class Postulante {
  final int id_postulante;
  final String cod_alumno;
  final String h_comunitarias;
  final String h_clinicas;
  final String sol_activas;
  final int horas_comunitarias;
  final int horas_clinicas;

  Postulante(
      {required this.id_postulante,
      required this.cod_alumno,
      required this.h_comunitarias,
      required this.h_clinicas,
      required this.sol_activas,
      required this.horas_comunitarias,
      required this.horas_clinicas});
  factory Postulante.fromJson(Map<String, dynamic> json) {
    return Postulante(
        id_postulante: json['id_postulante'],
        cod_alumno: json['cod_alumno'],
        h_comunitarias: json['h_comunitarias'],
        h_clinicas: json['h_clinicas'],
        sol_activas: json['sol_activas'],
        horas_comunitarias: json['horas_comunitarias'],
        horas_clinicas: json['horas_clinicas']);
  }
}
