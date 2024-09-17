enum OrderByEnum {
  nameDesc('-name', 'Nome Z-A'),
  nameAsc('name', 'Nome A-Z');

  final String value;
  final String desc;

  const OrderByEnum(this.value, this.desc);
}
