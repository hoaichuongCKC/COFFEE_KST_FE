// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'change_tab_categ_cubit.dart';

class ChangeTabCategState extends Equatable {
  final String currentTab;
  const ChangeTabCategState({required this.currentTab});

  @override
  List<Object> get props => [currentTab];

  ChangeTabCategState copyWith({
    String? currentTab,
  }) {
    return ChangeTabCategState(
      currentTab: currentTab ?? this.currentTab,
    );
  }
}
