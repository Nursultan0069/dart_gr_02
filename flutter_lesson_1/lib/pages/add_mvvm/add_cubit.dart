import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_state.dart';
import 'add_view_model.dart';

class AddCubit extends Cubit<AddState> {
  final AddViewModel vm;

  AddCubit(this.vm) : super(AddState.initial());

  
  Future<void> addTodo(String title) async {
    final text = title.trim();

    if (text.isEmpty) {
      emit(state.copyWith(errorText: 'Заполните поле'));
      return;
    }

    emit(state.copyWith(errorText: null));

    await vm.addTodo(text);

    emit(state.copyWith(isSaved: true));
  }

  void clearError() {
    if (state.errorText != null) {
      emit(state.copyWith(errorText: null));
    }
  }
}