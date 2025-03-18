import 'package:flutter/material.dart';
import '../EX-1-START-CODE/provider/courses_provider.dart';
import 'repositories/courses_mock_repository.dart';
import 'repositories/courses_repository.dart';
import 'package:provider/provider.dart';
import 'screens/course_list_screen.dart';

void main() {
  // Create repository
  CoursesRepository coursesRepository = CoursesMockRepository();

  runApp(
    ChangeNotifierProvider(
      create: (context) => CoursesProvider(repository: coursesRepository),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CourseListScreen(),
      ),
    ),
  );
}