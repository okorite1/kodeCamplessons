import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String? name;
  final String? email;
  const ProfileScreen({this.name, this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,

        //App bar section
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.more_horiz,
                color: Color.fromARGB(255, 57, 17, 167),
              ),
            ),
          ],
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // PROFILE HEADER SECTION
                // Avatar + Statistics
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // User profile image
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 5),
                        ),
                        child: CircleAvatar(
                          radius: 32,
                          foregroundImage: NetworkImage(
                            'https://i.pravatar.cc/150',
                          ),
                        ),
                      ),

                      // Recipe count
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            textAlign: TextAlign.center,
                            'Recipe',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 63, 63, 64),
                            ),
                          ),
                          SizedBox(height: 8),
                          Center(
                            child: Text(
                              '4',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Followers count
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            textAlign: TextAlign.center,
                            'Followers',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 63, 63, 64),
                            ),
                          ),
                          SizedBox(height: 8),
                          Center(
                            child: Text(
                              '100',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Following count
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            textAlign: TextAlign.center,
                            'Following',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 48, 48, 48),
                            ),
                          ),
                          SizedBox(height: 8),
                          Center(
                            child: Text(
                              '50',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // USER INFORMATION SECTION
                // Name, Occupation, Bio
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          name!, //assigning the name
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          email!, //assigning email
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 63, 63, 64),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Private Chef',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 63, 63, 64),
                          ),
                        ),
                        Text(
                          'Passionate about food and life',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 63, 63, 64),
                          ),
                        ),

                        // View more bio details
                        Text(
                          'More...',
                          style: TextStyle(fontSize: 12, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // TAB NAVIGATION SECTION
                // Recipe | Videos | Tag
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          'Recipe',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          'Videos',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          'Tag',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),

                // RECIPE IMAGE CARD #1
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'images/dish_one.jpg',
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // RECIPE IMAGE CARD #2
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'images/dish_two.jpg',
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
