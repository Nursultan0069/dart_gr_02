import 'package:flutter/material.dart';
import '../main.dart';
import 'add_mvvm/add_cubit.dart';
import 'add_mvvm/add_state.dart';
import 'add_mvvm/add_view_model.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController _controller = TextEditingController();

  AddCubit? cubit;
  bool _isCubitInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isCubitInitialized) {
      final repo = InheritedRepo.of(context);
      cubit = AddCubit(AddViewModel(repo));

      cubit!.stream.listen((state) {
        if (!mounted) return;

        if (state.isSaved) {
          Navigator.pop(context, true);
        } else {
          setState(() {});
        }
      });

      _isCubitInitialized = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    cubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF2F2F7);
    const blue = Color(0xFF007AFF);

    final AddState state = cubit?.state ?? AddState.initial();

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Новая задача',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Color(0x22000000),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(23, 32, 23, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'введите название задачи',
                  hintStyle: TextStyle(color: Colors.black54),
                ),
                onChanged: (_) {
                  cubit?.clearError();
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 8),
            if (state.errorText != null)
              Text(
                state.errorText!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(23, 12, 23, 20),
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: blue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                cubit?.addTodo(_controller.text);
              },
              child: const Text(
                'Сохранить',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}