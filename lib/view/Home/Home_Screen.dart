import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/widgets/categoryWidget.dart';
import 'package:ecommerece/view/filters/filters.dart';
import 'package:ecommerece/view_model/service/home_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../view_model/home_view_model.dart';
import 'pro_loved/Widgets/pro_loved_card.dart';
import 'repository/home_repository.dart';
import 'widgets/storeWidget.dart';

class HomeScreen extends StatefulWidget {
  final List<Products> products;

  const HomeScreen({super.key, required this.products});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeRepository homeRepository = HomeRepository();
  @override
  void initState() {
    super.initState();
    Provider.of<HomeRepositoryProvider>(context, listen: false).getHomeProd();
  }

  @override
  Widget build(BuildContext context) {
    // final userPrefrences = Provider.of<UserViewModel>(context, listen: false);
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpeacing(20.0),
              ListTile(
                horizontalTitleGap: 16.0,
                leading: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.profile,
                    );
                  },
                  child: const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/474x/e7/a9/4b/e7a94b352d281a23d847a13352be652c.jpg',
                        scale: 0.1),
                  ),
                ),
                title: const Text(
                  'Wellcome',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: AppColor.fontColor,
                      fontFamily: 'CenturyGothic'),
                ),
                subtitle: const Text(
                  'Rayees khan',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: AppColor.fontColor,
                      fontFamily: 'CenturyGothic'),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.notification);
                    },
                    icon: const Icon(
                      Icons.notifications_rounded,
                      color: AppColor.blackColor,
                      size: 30.0,
                    )),
              ),
              const VerticalSpeacing(27.0),
              SizedBox(
                height: 60,
                width: (MediaQuery.of(context).size.width) - 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search Here",
                    helperStyle: const TextStyle(color: AppColor.fieldBgColor),
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
                                builder: (context) => const FilterPopUp()));
                      },
                      icon: const Icon(
                        Icons.tune_sharp,
                        color: AppColor.fontColor,
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalSpeacing(16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Store',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'CenturyGothic',
                      color: AppColor.fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.storeScreen);
                    },
                    child: const Text(
                      'see more',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'CenturyGothic',
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const VerticalSpeacing(13.0),
              const StoreWidget(),
              const VerticalSpeacing(13.0),
              const StoreWidget(),
              const VerticalSpeacing(16.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'CenturyGothic',
                      color: AppColor.fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'see more',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'CenturyGothic',
                        color: AppColor.fontColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const VerticalSpeacing(16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCart('All'),
                    CategoryCart('Jakits'),
                    CategoryCart('Shirt'),
                    CategoryCart('Woman'),
                    CategoryCart('Jakits'),
                    CategoryCart('Shirt'),
                    CategoryCart('Woman'),
                  ],
                ),
              ),
              const VerticalSpeacing(16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Populars',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'CenturyGothic',
                      color: AppColor.fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.popularsScreen);
                    },
                    child: const Text(
                      'see more',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'CenturyGothic',
                        color: AppColor.fontColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Consumer<HomeViewModel>(builder: (context, value, _) {
                switch (value.allProd.status) {
                  case Status.LOADING:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.ERROR:
                    return Center(
                        child: Text(value.allProd.message.toString()));
                  case Status.COMPLETED:
                    return ListView.builder(
                        itemCount: 1,
                        // value.allProd.data!.productsTopRated.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              child: ListTile(
                                leading: Image.network(
                                  value.allProd.data!.productsTopRated[index]
                                      .thumbnailImage
                                      .toString(),
                                  errorBuilder: (context, error, stack) {
                                    return const Center(
                                      child: Icon(
                                        Icons.error,
                                        color: AppColor.errorColor,
                                      ),
                                    );
                                  },
                                ),
                                title: Text(value
                                    .allProd.data!.productsTopRated[index].title
                                    .toString()),
                                subtitle: Text(value
                                    .allProd.data!.productsTopRated[index].slug
                                    .toString()),
                                trailing: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(value.allProd.data!
                                        .productsTopRated[index].price
                                        .toString()),
                                    Text(value.allProd.data!
                                        .productsTopRated[index].discount
                                        .toString()),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });

                  default:
                }
                return Container();
              }),
              // Top Rated Popular Cart
              const VerticalSpeacing(16.0),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemExtent: MediaQuery.of(context).size.width / 2.2,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        height: 200,
                        width: 168,
                        color: const Color(0xffF9F9F9),
                        child: Column(children: [
                          const VerticalSpeacing(8),
                          Container(
                            height: 100,
                            width: 146,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/coat.png"),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      // isLike = !isLike;
                                    });
                                  },
                                  child: const Icon(Icons.favorite,
                                      color: AppColor.primaryColor
                                      // : const Color(0xfff6f6f6f6),
                                      ),
                                )
                              ],
                            ),
                          ),
                          const VerticalSpeacing(7),
                          const Padding(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Upper winter",
                                  style: TextStyle(
                                    fontFamily: 'CenturyGothic',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.fontColor,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 12,
                                    ),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        fontFamily: 'CenturyGothic',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                        color: AppColor.fontColor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const VerticalSpeacing(4),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      "\$600",
                                      style: TextStyle(
                                        fontFamily: 'CenturyGothic',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                        color: AppColor.fontColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "\$900",
                                      style: TextStyle(
                                        fontFamily: 'CenturyGothic',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                        color: AppColor.fontColor,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 18,
                                      width: 44,
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "View",
                                          style: TextStyle(
                                            fontFamily: 'CenturyGothic',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]),
                      ),
                    );
                  },
                ),
              ),
              const VerticalSpeacing(20.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Our new items',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'CenturyGothic',
                      color: AppColor.fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.newItemsScreen);
                    },
                    child: const Text(
                      'see more',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'CenturyGothic',
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),

              // New productsNew Cart
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Consumer<HomeRepositoryProvider>(
                  builder: (context, homeRepo, child) {
                    // Check if the data has been loaded
                    if (homeRepo.homeRepository.newProducts.isEmpty) {
                      // If data is not yet available, you might want to show a loading indicator
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      // If data is available, display it using a ListView.builder
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeRepo.homeRepository.newProducts.length,
                        itemExtent: MediaQuery.of(context).size.width / 2.2,
                        itemBuilder: (BuildContext context, int index) {
                          Products product =
                              homeRepo.homeRepository.newProducts[index];

                          // Display ProLovedCard for each product
                          return ProLovedCard(
                              fun: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutesName.productdetail,
                                  // Pass the selected product to the product detail screen
                                  // arguments: product,
                                );
                              },
                              name: product.title,
                              rating: product.averageReview,
                              price: product.price,
                              discount: product.discount);
                        },
                      );
                    }
                  },
                ),
              ),

              const VerticalSpeacing(30.0),
            ],
          ),
        ],
      ),
    )));
  }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Scaffold(
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     title: InkWell(
    //         onTap: () {
    //           userPrefrences.removerUser().then((value) {
    //             Navigator.pushNamed(context, RoutesName.login);
    //           });
    //         },
    //         child: const Center(
    //             child: Text(
    //           'LogOut',
    //         ))),
    //   ),
    //   body: ChangeNotifierProvider(
    //     create: (BuildContext context) => homeViewModel,
    //     child: Consumer<HomeViewModel>(builder: (context, value, _) {
    //       switch (value.allProd.status) {
    //         case Status.LOADING:
    //           return const Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         case Status.ERROR:
    //           return Center(child: Text(value.allProd.message.toString()));
    //         case Status.COMPLETED:
    //           return ListView.builder(
    //               itemCount: value.allProd.data!.allProducts.length,
    //               itemBuilder: (context, index) {
    //                 return Padding(
    //                   padding: const EdgeInsets.all(5.0),
    //                   child: Card(
    //                     child: ListTile(
    //                       leading: Image.network(
    //                         value
    //                             .allProd.data!.allProducts[index].thumbnailImage
    //                             .toString(),
    //                         errorBuilder: (context, error, stack) {
    //                           return const Center(
    //                             child: Icon(
    //                               Icons.error,
    //                               color: AppColor.errorColor,
    //                             ),
    //                           );
    //                         },
    //                       ),
    //                       title: Text(value
    //                           .allProd.data!.allProducts[index].title
    //                           .toString()),
    //                       subtitle: Text(value
    //                           .allProd.data!.allProducts[index].slug
    //                           .toString()),
    //                       trailing: Column(
    //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                         children: [
    //                           Text(value.allProd.data!.allProducts[index].price
    //                               .toString()),
    //                           Text(value
    //                               .allProd.data!.allProducts[index].discount
    //                               .toString()),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               });

    //         default:
    //       }
    //       return Container();
    //     }),
    //   ),
    // );
  