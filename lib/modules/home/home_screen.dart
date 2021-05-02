import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggel_client/data/source/local_source/secure_storage.dart';
import 'package:toggel_client/shared/cubit/app_cubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context
            .read<AppCubit>()
            .titles[context.watch<AppCubit>().currentIndex]),
        actions: [
          IconButton(
            icon: Icon(
              Icons.brightness_4_outlined,
            ),
            onPressed: () async {
              context.read<AppCubit>().changeAppMode();
            },
          ),
        ],
      ),
      body: context
          .read<AppCubit>()
          .screens[context.watch<AppCubit>().currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: context.watch<AppCubit>().currentIndex,
          onTap: (index) {
            context.read<AppCubit>().changeIndex(index);
          },
          items: context.read<AppCubit>().bottomItems),
    );
  }
}
