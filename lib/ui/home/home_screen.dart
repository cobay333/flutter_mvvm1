import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeScreen({super.key, required this.viewModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
          child: ChangeNotifierProvider<HomeViewModel>(
            create: (context) => widget.viewModel,
            child: Consumer<HomeViewModel>(
              builder: (context, value, _) {
                return switch (value.state) {
                  LoadingState() => Center(child: CircularProgressIndicator()),
                  SuccessState() => Text("Success"),
                  FailureState() => Text(
                    (widget.viewModel.state as FailureState).message,
                  ),
                };
              },
            ),
          ),
        ),
      ),
    );
  }
}
