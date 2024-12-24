import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> posts = [];
  TextEditingController _postController = TextEditingController();

  final List<String> storyImages = [
    'assets/img1.jpg',
    'assets/img3.jpg',
    'assets/img4.jpg',
    'assets/img5.jpg',
    'assets/img6.jpg',
    'assets/img7.jpg',
    'assets/img9.jpg',
    'assets/img10.jpg',
    'assets/img11.jpg',
    'assets/img12.jpg',
    'assets/img13.jpg',
    'assets/img14.jpg',
    'assets/img15.jpg',
    'assets/img16.jpg',
    'assets/img21.jpg',
    'assets/img22.jpg',
    'assets/img23.jpg',
  ];

  final List<String> userNames = [
    'Azka', 'Ayesha', 'Dua', 'Momna', 'Ali', 'Azka', 'Zoha', 'Minahil'
  ];

  final List<String> userAvatars = [
    'assets/avatar1.jpg', 'assets/avatar2.jpg', 'assets/avatar3.jpg',
    'assets/avatar4.jpg', 'assets/avatar5.jpg', 'assets/avatar6.jpg',
    'assets/avatar7.jpg', 'assets/avatar8.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'facebook',
          style: TextStyle(color: Colors.blueAccent, fontSize: 30),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.message, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navigation Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(icon: Icon(Icons.home, color: Colors.blue), onPressed: () {}),
                IconButton(icon: Icon(Icons.ondemand_video, color: Colors.black), onPressed: () {}),
                IconButton(icon: Icon(Icons.shop_2_sharp, color: Colors.black), onPressed: () {}),
                IconButton(icon: Icon(Icons.group, color: Colors.black), onPressed: () {}),
                IconButton(icon: Icon(Icons.notifications, color: Colors.black), onPressed: () {}),
                IconButton(icon: Icon(Icons.menu, color: Colors.black), onPressed: () {}),
              ],
            ),
            Divider(color: Colors.grey, thickness: 2, height: 25),

            // Stories Section
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: storyImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(storyImages[index]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            left: 10,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(userAvatars[index % userAvatars.length]),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Text(
                              userNames[index % userNames.length],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(color: Colors.grey, thickness: 1),

            // Post Section: Azka Rehman
            buildPost(
              context,
              userName: 'Azka Rehman',
              timeAgo: '1 hour ago',
              avatar: 'assets/img13.jpg',
              content:
              'Chasing sunset collecting memories',
              image: 'assets/image8.jpg',
            ),


            buildPost(
              context,
              userName: 'Momna Harram',
              timeAgo: '5 hours ago',
              avatar: 'assets/img21.jpg',
              content:
              'silence speaks louder than words',

              image: 'assets/img21.jpg',
            ),


            buildPost(
              context,
              userName: 'Minahil Fatima',
              timeAgo: '3 hours ago',
              avatar: 'assets/img22.jpg',
              content:
              'The future belongs to those who believe in themselves',
              image: 'assets/img22.jpg',
            ),


            buildPost(
              context,
              userName: 'Sadia Khan',
              timeAgo: '7 hours ago',
              avatar: 'assets/img23.jpg',
              content:
              'Lost in the moment,found in the vibe',
              image: 'assets/img23.jpg',
            ),
          ],
        ),
      ),
    );
  }


  Widget buildPost(
      BuildContext context, {
        required String userName,
        required String timeAgo,
        required String avatar,
        required String content,
        required String image,
      }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(avatar),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    timeAgo,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Spacer(),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
          SizedBox(height: 10),
          // Post Content
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
