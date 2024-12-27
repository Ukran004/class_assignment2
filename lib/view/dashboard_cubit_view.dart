import 'package:class_assignment2/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            final options = [
              {
                "title": "Circle Area Cubit",
                "icon": Icons.circle,
                "color": Colors.blue,
                "action": () => context
                    .read<DashboardCubit>()
                    .openCircleAreaCubitView(context),
              },
              {
                "title": "Arithmetic Cubit",
                "icon": Icons.calculate,
                "color": Colors.orange,
                "action": () =>
                    context.read<DashboardCubit>().openArithmeticView(context),
              },
              {
                "title": "Simple Interest Cubit",
                "icon": Icons.monetization_on,
                "color": Colors.green,
                "action": () => context
                    .read<DashboardCubit>()
                    .openSimpleIntrestCubitView(context),
              },
            ];

            final option = options[index];

            return GestureDetector(
              onTap: option['action'] as VoidCallback,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        (option['color'] as Color).withOpacity(0.7),
                        option['color'] as Color,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: GridTile(
                    header: const SizedBox(height: 8),
                    footer: Center(
                      child: Text(
                        option['title'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        option['icon'] as IconData,
                        size: 64,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
