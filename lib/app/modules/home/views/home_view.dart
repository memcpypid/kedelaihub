import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kedelai_hub/app/modules/components/bottom_navigation.dart';
import 'package:kedelai_hub/app/modules/components/cart_view.dart';
// import 'package:kedelai_hub/app/modules/components/live_chat.dart';
import 'package:kedelai_hub/app/modules/components/notification_view.dart';
import 'package:kedelai_hub/app/modules/components/stock_product.dart';
import 'package:kedelai_hub/app/modules/components/tracking_order_view.dart';
import 'package:kedelai_hub/app/modules/profile/controllers/profile_controller.dart';
import '../controllers/home_controller.dart';
// import '../components/bottom_navigation.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final ProfileController _profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          'KEDELAI HUB',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        //foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari Produk',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Banner Placeholder
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 16),

            // Welcome Text
            const Text(
              'SELAMAT DATANG',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Grid of Options
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildGridItem('Tracking Order', 'assets/images/kedelai.png',
                      () {
                    Get.to(() => const TrackingOrderView());
                  }),
                  _buildGridItem('Stock Product', 'assets/images/kedelai.png',
                      () {
                    Get.to(() => const StockProductView());
                  }),
                  _buildGridItem(
                      'Bulk Package', 'assets/images/kedelai.png', () {}),
                  _buildGridItem(
                      'About Product', 'assets/images/kedelai.png', () {}),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarComponent(
        currentIndex: 0, // Set the current selected index
        onTap: (index) {
          switch (index) {
            case 0:
              Get.offAndToNamed('/home');
              break;
            case 1:
              print(_profileController.selectedRole);
              if (_profileController.selectedRole.value == 'Penjual') {
                Get.toNamed('/livechat');
              } else {
                Get.off(() => const CartView());
              }

              break;
            case 2:
              Get.off(() => const NotificationView());
              break;
            case 3:
              Get.offAndToNamed('/profile');
              break;
            default:
          }
          // Handle tap events to switch screens
          print('Cek Index: $index');
        },
      ),
    );
  }

  Widget _buildGridItem(String title, String imagePath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap, // Callback ketika item ditekan
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
