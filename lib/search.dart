import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; // Import the DashboardScreen
import 'planner.dart'; // Import the PlannerPage
import 'crud.dart'; // Import the CrudPage
import 'notification.dart'; // Import the NotificationPage
import 'profile.dart'; // Import the ProfilePage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        title: Text(
          '',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          SizedBox(width: 8),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.lightGreen.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.black),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search to Task',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.close, color: Colors.black),
                  SizedBox(width: 8),
                  Icon(Icons.view_list, color: Colors.black),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Task Header
            Text(
              'Task',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color:  Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // Task Week
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDayTile('S', '10', isActive: true),
                _buildDayTile('M', '11'),
                _buildDayTile('T', '12'),
                _buildDayTile('W', '13'),
                _buildDayTile('T', '14'),
                _buildDayTile('F', '15'),
                _buildDayTile('S', '16'),
              ],
            ),
            Divider(color: Colors.black, thickness: 1, height: 32),

            // Today Section
            Text(
              'Today',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // Task Card
            TaskCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Index for Search
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PlannerPage(
                        title: "Planner",
                        date: "Date",
                        startTime: "Start Time",
                        endTime: "End Time",
                        description: "Description",
                        category: "Category",
                      )),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CrudPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationPage()),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Planner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildDayTile(String day, String date, {bool isActive = false}) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            color: isActive ? Colors.green : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isActive ? Colors.green : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Text(
            date,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.lightGreen.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.computer, color: Colors.green, size: 32),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Project UAS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'My Daily Planner, Mobile Development',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '11:30 AM - 12:30 PM Mon, 10 January 2025',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
