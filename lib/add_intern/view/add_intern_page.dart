import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_tracker/add_intern/view/add_intern_view.dart';
import 'package:internship_tracker/repository/repository.dart';

import '../bloc/add_intern_bloc.dart';

class AddInternPage extends StatelessWidget {
  const AddInternPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddInternBloc(repository: context.read<InternshipRepository>())),
      ],
      child: const AddInternView(),
    );
  }
}
