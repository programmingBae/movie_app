import 'package:equatable/equatable.dart';

class Theater extends Equatable {
  /// -------------------------------------------
  /// [Theater Class]
  /// This class is used to modeling theater data
  /// -------------------------------------------
  //* Property model
  final String name;

  //* Constructor model
  Theater(this.name);

  //* Passing property mdoel to list of object
  @override
  List<Object> get props => [name];
}

//* Generate dummy theaters data
List<Theater> dummyTheaters = [
  Theater("Bioskop 1"),
  Theater("Bioskop 2"),
  Theater("Bioskop 3"),
  Theater("Bioskop 4"),
  Theater("Bioskop 5"),
];
