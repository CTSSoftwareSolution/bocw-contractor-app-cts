import 'package:bocw_contractor_app/Presentation/screens/dashboard/dashboard_stat_card.dart';
import 'package:bocw_contractor_app/Presentation/screens/dashboard/dashboard_tabs.dart';
import 'package:bocw_contractor_app/Presentation/screens/project/add_project_screen.dart';
import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:bocw_contractor_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const CustomText(
            text: "Dashboard",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            textColor: whiteColor,
          ),
          backgroundColor: primaryColor,
          bottom: const TabBar(
            indicatorColor: whiteColor,
            labelColor: whiteColor,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: "Projects"),
              Tab(text: "Workers"),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              color: whiteColor,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  DashboardStatCard(title: "Workers", count: "120"),
                  DashboardStatCard(title: "Projects", count: "8"),
                  DashboardStatCard(title: "SAS", count: "5"),
                ],
              ),
            ),
            const Expanded(child: DashboardTabs()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddProjectScreen()),
            );
          },
          child: const Icon(Icons.add, color: whiteColor),
        ),
      ),
    );
  }
}
