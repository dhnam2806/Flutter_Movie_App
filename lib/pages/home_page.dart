import 'package:flutter/material.dart';
import 'package:movieapp/const/colors.dart';
import 'package:movieapp/pages/popular_page.dart';
import 'package:movieapp/pages/upcoming_page.dart';

import '../models/movie.dart';
import 'custom_navbar.dart';
import 'trending_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movies = [];
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.person,
            size: 32,
          ),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hello, User',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              'What do you want to watch today?',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: searchColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white54,
                        size: 28,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )),
          const UpComing(),
          const TrendingPage(),
          const PopularPage(),
        ],
      )),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
