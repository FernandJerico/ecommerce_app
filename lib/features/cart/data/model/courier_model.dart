// ignore_for_file: public_member_api_docs, sort_constructors_first
class Courier {
  final String code;
  final String name;

  Courier({
    required this.code,
    required this.name,
  });

  @override
  String toString() => name;
}

List<Courier> couriers = [
  Courier(code: 'jne', name: 'JNE'),
  Courier(code: 'sicepat', name: 'Sicepat'),
  Courier(code: 'jnt', name: 'J&T'),
];

const String subdistrictOrigin = '2105';
