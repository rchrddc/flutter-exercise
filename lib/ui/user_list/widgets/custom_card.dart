import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? imageUrl; // Allow null for imageUrl
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const CustomCard({
    super.key,
    this.imageUrl, // Make imageUrl optional
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: Color(0xFFE0E0E0),
            width: 1,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: imageUrl != null && imageUrl!.isNotEmpty
                    ? Image.network(
                        imageUrl!,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Image.asset(
                          'assets/images/default_avatar.png', // Default avatar path
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Image.asset(
                        'assets/images/default_avatar.png', // Default avatar path
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title with overflow handling
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1, // Only one line for the title
                    ),
                    SizedBox(height: 4),
                    // Subtitle with overflow handling
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1, // Only one line for the subtitle
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
