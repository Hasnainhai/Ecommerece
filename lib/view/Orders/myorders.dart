import 'package:flutter/material.dart';
import '../../res/components/colors.dart';
import '../../res/components/verticalSpacing.dart';
import 'widgets/myOrdercard.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // String formatDateAndTime(String time) {
  //   DateTime dateTime = DateTime.parse(time);
  //   String formattedDateTime =
  //       "${DateFormat.MMMd().format(dateTime)},${DateFormat.y().format(dateTime)},${DateFormat.jm().format(dateTime)}";
  //   return formattedDateTime;
  // }

  @override
  void initState() {
    super.initState();
    // Initialize the TabController with the number of tabs
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
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(70.0), // Adjust the height as needed
          child: SafeArea(
            child: Column(
              children: <Widget>[
                TabBar(
                  indicatorColor:
                      AppColor.primaryColor, // Color of the selection indicator
                  labelColor: AppColor
                      .primaryColor, // Color of the selected tab's label
                  unselectedLabelColor: AppColor.fieldBgColor,
                  tabs: <Widget>[
                    Tab(
                      text: 'All',
                    ),
                    Tab(text: 'Running'),
                    Tab(text: 'Previous'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        // Provide the TabController
        controller: _tabController,
        children: const <Widget>[
          // Content for the "All" tab
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: myOrderCard(),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: myOrderCard(),
              )
            ],
          ),

          // Content for the "Previous" tab
          Column(
            children: [
              VerticalSpeacing(20.0),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: myOrderCard(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
