import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seclob/core/constants/app_image.dart';
import 'package:seclob/features/home/presentation/view/widgets/home_header_Section.dart';
import 'package:seclob/features/home/presentation/view/widgets/service/service.dart';
import 'package:seclob/features/home/presentation/view/widgets/slider/slider.dart';
import 'package:seclob/features/home/presentation/viewmodel/home_view_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
    @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<HomeViewModel>(context, listen: false).fetchBalances());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              HomeHeaderSection(amount: provider.balances.first.balance.toString()),
              CardSlider(cardImage: [AppImage.bigSale, AppImage.bigSale]),
              ServicesGrid(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AppImage.rfer),
              ),
            ],
          ),
        );
      },
    );
  }
}
