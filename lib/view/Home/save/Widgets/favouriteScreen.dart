import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:ecommerece/view/Home/save/Widgets/save_card.dart';
import 'package:ecommerece/view_model/service/save_product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SaveProductRepositoryProvider>(context, listen: false)
        .getCachedProducts();
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
        child: Consumer<SaveProductRepositoryProvider>(
          builder: (context, cartRepoProvider, child) {
            List<Map<String, dynamic>> cartItems =
                cartRepoProvider.saveRepository.saveList;

            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  if (index < cartItems.length) {
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: SaveCard(
                          name: cartItems[index]['name'],
                          price: cartItems[index]['price'],
                          image: cartItems[index]['image'],
                          id: cartItems[index]['productId'],
                        )
                        // CartWidget(
                        //   onpress: () {
                        //     Provider.of<CartRepositoryProvider>(context,
                        //             listen: false)
                        //         .deleteProduct(
                        //             cartItems[index]['productId']);
                        //     Provider.of<CartRepositoryProvider>(context,
                        //             listen: false)
                        //         .getCachedProducts();
                        //   },
                        //   productId: cartItems[index]['productId'],
                        //   name: cartItems[index]['name'],
                        //   image: cartItems[index]['image'],
                        //   price: cartItems[index]['price'],
                        //   quantity: cartItems[index]['quantity'],
                        //   individualPrice: cartItems[index]
                        //           ['individualTotal'] ??
                        //       cartItems[index]['price'].toString(),
                        // ),
                        );
                  } else {
                    return const SizedBox.shrink(
                      child: Center(
                        child: Text("No Products to Show"),
                      ),
                    );
                  }
                },
              ),
            );
          },
        ),
        //  Consumer<SaveProductRepositoryProvider>(
        //     builder: (context, cartRepoProvider, child) {
        //   List<Map<String, dynamic>> cartItems =
        //       cartRepoProvider.saveRepository.saveList;
        //   return ListView.builder(
        //     itemCount: cartRepoProvider.saveRepository.saveList.length,
        //     itemBuilder: (context, index) {
        //       Map<String, dynamic> item = cartItems[index];

        //       return
        // SaveCard(
        //         name: item['name'],
        //         price: item['price'],
        //         image: item['image'],
        //         id: '',
        //       );
        //     },
        //   );
        // })
      )),
    );
  }
}
