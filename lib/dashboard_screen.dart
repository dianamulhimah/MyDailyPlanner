import 'package:flutter/material.dart';
import 'planner.dart'; // Import the PlannerPage
import 'search.dart'; // Import the SearchPage
import 'crud.dart'; // Import the CrudPage
import 'notification.dart'; // Import the NotificationPage
import 'profile.dart'; // Import the ProfilePage

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello Diana!",
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Have a nice day.",
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: FilterButton(text: "My Plan", isActive: true),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: FilterButton(text: "In-progress"),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: FilterButton(text: "Completed"),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "Today",
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TaskCard(
                    title: "My Daily Planner, Mobile Development",
                    date: "Mon, 10 January 2025",
                    time: "11:30 AM - 12:30 PM",
                    width: screenWidth * 0.7,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlannerPage(
                                  title: "My Daily Planner, Mobile Development",
                                  date: "Mon, 10 January 2025",
                                  startTime: "11:30 AM",
                                  endTime: "12:30 PM",
                                  description:
                                      "My Daily Planner, Mobile Development",
                                  category: "Development",
                                )),
                      );
                    },
                  ),
                  SizedBox(width: 16),
                  TaskCard(
                    title: "Front-End Development",
                    date: "Mon, 10 January 2025",
                    time: "1:30 PM - 3:30 PM",
                    width: screenWidth * 0.7,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlannerPage(
                                  title: "Front-End Development",
                                  date: "Mon, 10 January 2025",
                                  startTime: "1:30 PM",
                                  endTime: "3:30 PM",
                                  description: "Front-End Development",
                                  category: "Development",
                                )),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              "Upcoming Plan",
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            UpcomingEventCard(
              title: "Code-A-thon",
              description: "Fraternity of Young Innovators",
              date: "Mon, 10 July 2025",
              time: "10:30 AM - 12:30 PM",
              width: screenWidth,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
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
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isActive;

  FilterButton({required this.text, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.green[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final double width;
  final VoidCallback onTap;

  TaskCard({
    required this.title,
    required this.date,
    required this.time,
    required this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.task, color: Colors.green, size: 32),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(date, style: TextStyle(color: Colors.grey[600])),
            Text(time, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}

class UpcomingEventCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String time;
  final double width;

  UpcomingEventCard({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.event, color: Colors.green, size: 32),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(description, style: TextStyle(color: Colors.grey[600])),
                SizedBox(height: 8),
                Text("$date\n$time", style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
