import 'package:aladeep/core/services/url_launcher_service.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  final List<FooterLink> quickLinks;
  final Map<IconData, String> socialLinks;

  const FooterSection({
    super.key,
    required this.quickLinks,
    required this.socialLinks,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: const Color(0xFF0D2A3A),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// Logo
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "الأديب",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Description
            const Text(
              "منصة الأديب التعليمية، خيارك الأول للوصول للدرجة النهائية",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 20),

            /// Social Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: socialLinks.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: InkWell(
                    onTap: () => UrlLauncherService.open(entry.value),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        entry.key,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            /// Title
            const Text(
              "روابط سريعة",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 16),

            /// Links
            Column(
              children: quickLinks.map((link) {
                return ListTile(
                  onTap: () => UrlLauncherService.open(link.url),
                  title: Text(
                    link.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            /// Support
            const Text(
              "الدعم الفني والاشتراكات",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}