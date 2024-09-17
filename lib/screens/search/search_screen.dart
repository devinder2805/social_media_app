import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMediaSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> imageUrls = [
    'assets/images/photo/photo-1.jpeg',
    'assets/images/photo/photo-2.jpeg',
    'assets/images/photo/photo-3.jpeg',
    'assets/images/photo/photo-4.jpeg',
    'assets/images/photo/photo-5.jpeg',
    'assets/images/photo/photo-6.jpeg',
    'assets/images/photo/photo-7.jpeg',
    'assets/images/photo/photo-8.jpeg',
    'assets/images/photo/photo-9.jpeg',
    'assets/images/photo/photo-10.jpeg',
    'assets/images/photo/photo-1.jpeg',
    'assets/images/photo/photo-2.jpeg',
    'assets/images/photo/photo-3.jpeg',
    'assets/images/photo/photo-4.jpeg',
    'assets/images/photo/photo-5.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.grey[500]),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[100],
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrls[index],
                fit: BoxFit.cover,
                //  },
              ),
            );
          },
        ),
      ),
    );
  }
}
