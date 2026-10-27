import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; // Import the DashboardScreen
import 'planner.dart'; // Import the PlannerPage
import 'crud.dart'; // Import the CrudPage
import 'profile.dart'; // Import the ProfilePage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _showPopup = true;

  void _removePopup() {
    setState(() {
      _showPopup = false;
    });
  }

  void _navigateToPlanner() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlannerPage(
          title: "Project UAS",
          date: "Mon, 10 July 2025",
          startTime: "10:30 AM",
          endTime: "12:30 PM",
          description: "Fraternity of Young Innovators",
          category: "Event",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notifikasi',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent',
              style: TextStyle(
                color: Colors.green.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            NotificationCard(),
            NotificationCard(),
            SizedBox(height: 16),
            if (_showPopup)
              Expanded(
                  child: NotificationPopup(
                      onClose: _removePopup, onAccept: _navigateToPlanner)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Index for Notification
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
}

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.event, color: Colors.green, size: 32),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Project UAS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '11:30 AM - 12:30 PM',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                '3 hours to go',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NotificationPopup extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onAccept;

  const NotificationPopup(
      {Key? key, required this.onClose, required this.onAccept})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.lightGreen.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Project UAS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                '10 mins to go',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: onClose,
              ),
            ],
          ),
          SizedBox(height: 8),
          Image.network(
            'https://via.placeholder.com/150',
            fit: BoxFit.cover,
            height: 100,
          ),
          SizedBox(height: 8),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            style: TextStyle(color: Colors.grey.shade700),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: onClose,
                child: Text(
                  'Dismiss',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              ElevatedButton.icon(
                onPressed: onAccept,
                icon: Icon(Icons.calendar_today, size: 16),
                label: Text('Accept'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
