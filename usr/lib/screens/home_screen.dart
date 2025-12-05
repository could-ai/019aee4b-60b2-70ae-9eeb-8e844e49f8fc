import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: 'ابحث عن منتجات...',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              suffixIcon: const Icon(Icons.camera_alt_outlined, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Categories Row
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryItem(Icons.local_offer, 'عروض', Colors.orange),
                  _buildCategoryItem(Icons.games, 'ألعاب', Colors.blue),
                  _buildCategoryItem(Icons.phone_android, 'هواتف', Colors.purple),
                  _buildCategoryItem(Icons.checkroom, 'أزياء', Colors.pink),
                  _buildCategoryItem(Icons.home, 'منزل', Colors.green),
                ],
              ),
            ),
            
            const SizedBox(height: 10),

            // Welcome Deal Banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF4747), Color(0xFFFF8F00)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'عرض الترحيب',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'خصم يصل إلى 90% للطلب الأول',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'تسوق الآن',
                      style: TextStyle(
                        color: Color(0xFFFF4747),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Product Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 6, // Mock items
                itemBuilder: (context, index) {
                  return _buildProductCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildProductCard(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Placeholder
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              ),
              child: Center(
                child: Icon(Icons.image, size: 50, color: Colors.grey[400]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'منتج رائع ومميز رقم ${index + 1}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      'SAR ',
                      style: TextStyle(fontSize: 10, color: Color(0xFFFF4747)),
                    ),
                    Text(
                      '${(index + 1) * 25}.00',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF4747),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: const Text(
                    'شحن مجاني',
                    style: TextStyle(fontSize: 10, color: Color(0xFFFF4747)),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'تم بيع 500+',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
