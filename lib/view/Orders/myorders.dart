import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import '../../res/components/colors.dart';
import '../../res/components/verticalSpacing.dart';
import 'widgets/myOrdercard.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose of the TabController when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.blackColor,
          ),
        ),
        title: const Text(
          'My Order',
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColor.blackColor,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: SafeArea(
            child: TabBar(
              controller: _tabController, // Provide the TabController here
              indicatorColor: AppColor.primaryColor,
              labelColor: AppColor.primaryColor,
              unselectedLabelColor: AppColor.secondaryFontColor,
              tabs: const <Widget>[
                Tab(
                  text: 'All(12)',
                ),
                Tab(
                  text: 'Running(10)',
                ),
                Tab(
                  text: 'Previous(2)',
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          // Content for the "All" tab
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: myOrderCard(
                  ontap: () {
                    Navigator.pushNamed(context, RoutesName.myOrderHistory);
                  },
                ),
              )
            ],
          ),
          // Content for the "Running" tab
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: myOrderCard(
                  ontap: () {
                    Navigator.pushNamed(context, RoutesName.myOrderHistory);
                  },
                ),
              )
            ],
          ),
          // Content for the "Previous" tab
          Column(
            children: [
              const VerticalSpeacing(20.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: myOrderCard(
                  ontap: () {
                    Navigator.pushNamed(context, RoutesName.myOrderHistory);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
