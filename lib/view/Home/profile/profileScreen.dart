import 'package:flutter/material.dart';

import '../../../res/components/colors.dart';
import '../../../res/components/verticalSpacing.dart';
import 'widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final TextEditingController _addressTextController =
  //     TextEditingController(text: "");
  // @override
  // void dispose() {
  //   _addressTextController.dispose();
  //   super.dispose();
  // }

  // String? _email;
  // String? _name;
  // String? address;
  // String? _pImage;
  // bool _isLoading = false;
  // final User? user = authInstance.currentUser;
  // String defaultProfile =
  //     'https://t4.ftcdn.net/jpg/00/64/67/27/360_F_64672736_U5kpdGs9keUll8CRQ3p3YaEv2M6qkVY5.jpg';
  // @override
  // void initState() {
  //   getUserData();
  //   super.initState();
  // }

  // Future<void> getUserData() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   final googleAuth = FirebaseAuth.instance.currentUser;
  //   // if (googleAuth != null) {
  //   _name = googleAuth!.displayName;
  //   _email = googleAuth.email;
  //   _pImage = googleAuth.photoURL;
  //   setState(() {
  //     _isLoading = false;
  //   });
  //   // }
  //   // else {
  //   if (user != null) {
  //     try {
  //       String _uid = user!.uid;
  //       final DocumentSnapshot userDoc = await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(_uid)
  //           .get();
  //       if (userDoc != null || userDoc.data() != null) {
  //         _email = userDoc.get('email');
  //         _name = userDoc.get('name');
  //         _pImage = userDoc.get('profilePic');
  //       }
  //     } catch (error) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     } finally {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   }
  //   // }
  // }

  final double tHeight = 200.0;
  final double top = 130.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: const Text(
          'Profile ',
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColor.whiteColor,
          ),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back,
          color: AppColor.blackColor,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                _buildCoverBar(),
                Positioned(
                  child: _buildProfile(),
                ),
                // Positioned(
                //   top: tHeight - top / 2 - 10,
                //   child: _builProfileContainer(),
                // ),
              ],
            ),
            const VerticalSpeacing(55.0),
            _buildProfileFeatures(),
          ],
        ),
      ),
    );
  }

  _buildCoverBar() {
    return Container(
      height: tHeight,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
        color: AppColor.primaryColor,
      ),
    );
  }

  _buildProfile() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              'https://i.pinimg.com/474x/e7/a9/4b/e7a94b352d281a23d847a13352be652c.jpg'),
        ),
        VerticalSpeacing(16.0),
        Text.rich(
          TextSpan(
            text: '  Alizay\n',
            style: TextStyle(
              fontFamily: 'CenturyGothic',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.whiteColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'ID: 1540580',
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.w200,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // _builProfileContainer() {
  //   return Container(
  //     height: top,
  //     width: 350,
  //     color: AppColor.whiteColor,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         profileCenterBtns(
  //           ontap: () {
  //             Navigator.pushNamed(context, RoutesName.myOrder);
  //           },
  //           tColor: const Color(0xff6AA9FF),
  //           bColor: const Color(0xff005AD5),
  //           icon: Icons.local_shipping_outlined,
  //           title: 'My All',
  //           subtitle: 'Order',
  //         ),
  //         profileCenterBtns(
  //           ontap: () {
  //             Navigator.pushNamed(context, RoutesName.promosOffer);
  //           },
  //           tColor: const Color(0xffFF6A9F),
  //           bColor: const Color(0xffD50059),
  //           icon: Icons.card_giftcard_outlined,
  //           title: 'Offer &',
  //           subtitle: 'Promos',
  //         ),
  //         profileCenterBtns(
  //           ontap: () {
  //             Navigator.pushNamed(context, RoutesName.deliveryAddress);
  //           },
  //           tColor: const Color(0xff6DF5FC),
  //           bColor: const Color(0xff3CB6BB),
  //           icon: Icons.home_outlined,
  //           title: 'Delivery',
  //           subtitle: 'Address',
  //         ),
  //       ],
  //     ),
  //   );
  // }

  _buildProfileFeatures() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.44,
      width: MediaQuery.of(context).size.width * 0.9,
      color: AppColor.fieldBgColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              children: [
                ProfileWidgets(
                    ontap: () {},
                    tColor: const Color(0xff6DF5FC),
                    bColor: const Color(0xff46C5CA),
                    icon: Icons.person_outline,
                    trIcon: Icons.arrow_forward_ios,
                    title: 'Dashboard'),
                const Divider(),
                ProfileWidgets(
                    ontap: () {},
                    tColor: const Color(0xffDF9EF5),
                    bColor: const Color(0xffA24ABF),
                    icon: Icons.notifications_outlined,
                    trIcon: Icons.arrow_forward_ios,
                    title: 'order'),
                const Divider(),
                ProfileWidgets(
                  ontap: () {},
                  tColor: const Color(0xff6DF5FC),
                  bColor: const Color(0xff46C5CA),
                  icon: Icons.settings_outlined,
                  trIcon: Icons.arrow_forward_ios,
                  title: 'bidding request',
                ),
                const Divider(),
                ProfileWidgets(
                  ontap: () {},
                  tColor: const Color(0xffDF9EF5),
                  bColor: const Color(0xffA24ABF),
                  icon: Icons.wallet_outlined,
                  trIcon: Icons.arrow_forward_ios,
                  title: 'wishlist',
                ),
                const Divider(),
                ProfileWidgets(
                  ontap: () {},
                  tColor: const Color(0xff6DF5FC),
                  bColor: const Color(0xff46C5CA),
                  icon: Icons.home_outlined,
                  trIcon: Icons.arrow_forward_ios,
                  title: 'address',
                ),
                const Divider(),
                ProfileWidgets(
                  ontap: () {},
                  tColor: const Color(0xffFF9CCB),
                  bColor: const Color(0xffEC4091),
                  icon: Icons.logout_outlined,
                  trIcon: Icons.arrow_forward_ios,
                  title: 'track order',
                ),
                const Divider(),
                ProfileWidgets(
                  ontap: () {},
                  tColor: const Color(0xff6DF5FC),
                  bColor: const Color(0xff46C5CA),
                  icon: Icons.logout_outlined,
                  trIcon: Icons.arrow_forward_ios,
                  title: 'logout',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
