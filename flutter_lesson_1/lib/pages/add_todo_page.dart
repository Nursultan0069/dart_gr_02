import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/todo_repository.dart';
import 'add_mvvm/add_cubit.dart';
import 'add_mvvm/add_state.dart';
import 'add_mvvm/add_view_model.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF2F2F7);
    const blue = Color(0xFF007AFF);

    return BlocProvider(
      create: (_) {
        final repo = context.read<ToDoRepository>();
        return AddCubit(AddViewModel(repo));
      },
      child: BlocListener<AddCubit, AddState>(
        listenWhen: (p, c) => p.isSaved != c.isSaved,
        listener: (context, state) {
          if (state.isSaved) {
            Navigator.pop(context, true); // сигнал для Home обновиться
          }
        },
        child: Scaffold(
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
              child: Divider(height: 1, thickness: 1, color: Color(0x22000000)),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(23, 32, 23, 0),
            child: BlocBuilder<AddCubit, AddState>(
              buildWhen: (p, c) => p.errorText != c.errorText,
              builder: (context, state) {
                return Column(
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
                        onChanged: (_) => context.read<AddCubit>().clearError(),
                        onSubmitted: (_) => context.read<AddCubit>().addTodo(_controller.text),
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
                );
              },
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
                  onPressed: () => context.read<AddCubit>().addTodo(_controller.text),
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
        ),
      ),
    );
  }
}