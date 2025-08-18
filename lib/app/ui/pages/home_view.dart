import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_app/app/ui/widgets/basic_view_layout.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicViewLayout(
      headerTitle: '내정보',
      bottomButton: Text("시작하기"),
      child: const Center(child: Text('Welcome to the Home Page!')),
    );
  }
}
