class AddState {
  final bool isSaved;      // ✅ обязательно по условию
  final String? errorText; // для "Заполните поле"

  const AddState({
    required this.isSaved,
    this.errorText,
  });

  factory AddState.initial() => const AddState(isSaved: false);

  AddState copyWith({
    bool? isSaved,
    String? errorText,
  }) {
    return AddState(
      isSaved: isSaved ?? this.isSaved,
      errorText: errorText,
    );
  }
}