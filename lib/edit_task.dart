import 'package:flutter/material.dart';

class EditTaskPage extends StatefulWidget {
  final Map<String, String>? task;

  const EditTaskPage({Key? key, this.task}) : super(key: key);

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;
  late TextEditingController _descriptionController;
  String _selectedCategory = 'Design';

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?['title'] ?? '');
    _dateController = TextEditingController(text: widget.task?['date'] ?? '');
    _startTimeController =
        TextEditingController(text: widget.task?['startTime'] ?? '');
    _endTimeController =
        TextEditingController(text: widget.task?['endTime'] ?? '');
    _descriptionController =
        TextEditingController(text: widget.task?['description'] ?? '');
    _selectedCategory = widget.task?['category'] ?? 'Design';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      final editedTask = {
        'title': _titleController.text,
        'date': _dateController.text,
        'startTime': _startTimeController.text,
        'endTime': _endTimeController.text,
        'description': _descriptionController.text,
        'category': _selectedCategory,
      };
      Navigator.pop(context, editedTask);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Plan',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Title',
                  style: TextStyle(
                    color: Colors.green[200],
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _titleController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.green[900],
                    border: InputBorder.none,
                    hintText: 'Design Changes',
                    hintStyle: TextStyle(color: Colors.white70),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Date
                Text(
                  'Date',
                  style: TextStyle(
                    color: Colors.green[200],
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _dateController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.green[900],
                    border: InputBorder.none,
                    hintText: 'Oct 24, 2025',
                    hintStyle: TextStyle(color: Colors.white70),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Start Time & End Time
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time',
                            style: TextStyle(
                              color: Colors.green[200],
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            controller: _startTimeController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.green[900],
                              border: InputBorder.none,
                              hintText: '01:22 pm',
                              hintStyle: TextStyle(color: Colors.white70),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 12),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a start time';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'End Time',
                            style: TextStyle(
                              color: Colors.green[200],
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            controller: _endTimeController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.green[900],
                              border: InputBorder.none,
                              hintText: '03:20 pm',
                              hintStyle: TextStyle(color: Colors.white70),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 12),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an end time';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Description
                Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.green[200],
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.green[900],
                    border: InputBorder.none,
                    hintText: 'Enter task description...',
                    hintStyle: TextStyle(color: Colors.white70),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Category
                Text(
                  'Category',
                  style: TextStyle(
                    color: Colors.green[200],
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _buildCategoryChip('Design',
                        isSelected: _selectedCategory == 'Design'),
                    _buildCategoryChip('Meeting',
                        isSelected: _selectedCategory == 'Meeting'),
                    _buildCategoryChip('Coding',
                        isSelected: _selectedCategory == 'Coding'),
                    _buildCategoryChip('BDE',
                        isSelected: _selectedCategory == 'BDE'),
                    _buildCategoryChip('Testing',
                        isSelected: _selectedCategory == 'Testing'),
                    _buildCategoryChip('Quick call',
                        isSelected: _selectedCategory == 'Quick call'),
                  ],
                ),
                SizedBox(height: 30),

                // Save Task Button
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[800],
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _saveTask,
                      child: Text(
                        'Save Plan',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
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

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.green[800] : Colors.green[200],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
