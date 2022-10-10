import 'package:equatable/equatable.dart';

class AppSectionModel extends Equatable {
  final String title;

  @override
  List<Object> get props => [title];

  const AppSectionModel(this.title);
}