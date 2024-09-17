import 'package:flutter/material.dart';
// import 'package:pixa/screens/profile/editprofilescreen.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  final String bio;
  final String profileImageUrl;
  final int posts;
  final int followers;
  final int following;

  ProfileScreen({
    super.key,
    required this.userName,
    required this.bio,
    required this.profileImageUrl,
    required this.posts,
    required this.followers,
    required this.following,
  });

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage:
                        NetworkImage('assets/images/photo/photo-1.jpeg'),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildStatColumn('Posts', posts),
                            _buildStatColumn('Followers', followers),
                            _buildStatColumn('Following', following),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to EditProfileScreen
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => EditProfileScreen(),
                            //   ),
                            // );
                          },
                          child: Text('Edit Profile'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Bio Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    bio,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Grid View for Posts
            _buildPostsGrid(),
          ],
        ),
      ),
    );
  }

  // Build Stats Column (Posts, Followers, Following)
  Widget _buildStatColumn(String label, int number) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  // Build Grid of Posts
  Widget _buildPostsGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: imageUrls.length, // Number of posts to display
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey[300], // Placeholder color for the post
            child: Image.asset(
              imageUrls[index], // Placeholder image for posts
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
