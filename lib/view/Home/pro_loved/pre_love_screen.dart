import 'package:ecommerece/repository/preloved_ui_repository.dart';
import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/res/preloved_enums.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:ecommerece/view/Home/pro_loved/Widgets/default_section.dart';
import 'package:ecommerece/view/Home/pro_loved/Widgets/search_section.dart';
import 'package:ecommerece/view/Home/widgets/filter_products.dart';
import 'package:ecommerece/view/filters/filters.dart';
import 'package:ecommerece/view_model/preloved_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreLoveScreen extends StatefulWidget {
  const PreLoveScreen({super.key});

  @override
  State<PreLoveScreen> createState() => _PreLoveScreenState();
}

class _PreLoveScreenState extends State<PreLoveScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<PrelovedRepositoryProvider>(context, listen: false)
        .fetchPrelovedProducts(
      context,
    );
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: const Text(
          "Pro Loved",
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.fontColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.fontColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => const DashBoardScreen(),
              ),
            );
          },
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: (MediaQuery.of(context).size.width) - 40,
                child: Consumer<PrelovedRepositoryProvider>(
                  builder: (context, preLoved, _) {
                    return TextFormField(
                      controller: searchController,
                      onChanged: (value) {
                        if (searchController.text.length == 1) {
                          preLoved.searchAndFetchData(value,
                              preLoved.prelovedRepository.prelovedProducts);
                          Provider.of<PrelovedUiRepository>(context,
                                  listen: false)
                              .switchToType(PrelovedUiType.SearchSection);
                        } else {
                          Provider.of<PrelovedUiRepository>(context,
                                  listen: false)
                              .switchToType(
                            PrelovedUiType.DefaultSection,
                          );
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Search Here",
                        helperStyle:
                            const TextStyle(color: AppColor.fieldBgColor),
                        filled: true,
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FilterPopUp(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.tune_sharp,
                            color: AppColor.fontColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const VerticalSpeacing(20),
              Consumer<PrelovedUiRepository>(
                builder: (context, uiState, _) {
                  Widget selectedWidget;

                  switch (uiState.selectedType) {
                    case PrelovedUiType.SearchSection:
                      selectedWidget = const SearchPreLovedSection();
                      break;
                    case PrelovedUiType.FilterSection:
                      selectedWidget = const FilterProducts();
                      break;

                    case PrelovedUiType.DefaultSection:
                      selectedWidget = const DefaultPrelovedSection();
                      break;
                  }

                  return selectedWidget;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
