enum MonthEnum {
  jan,
  fev,
  mar,
  abr,
  mai,
  jun,
  jul,
  ago,
  set,
  out,
  nov,
  dez;

  String get fullName {
    switch (name) {
      case 'jan':
        return 'Janeiro';
      case 'fev':
        return 'Fevereiro';
      case 'mar':
        return 'Março';
      case 'abr':
        return 'Abril';
      case 'mai':
        return 'Maio';
      case 'jun':
        return 'Junho';
      case 'jul':
        return 'Julho';
      case 'ago':
        return 'Agosto';
      case 'set':
        return 'Setembro';
      case 'out':
        return 'Outubro';
      case 'nov':
        return 'Novembro';
      case 'dez':
        return 'Dezembro';
      default:
        return '';
    }
  }
}
