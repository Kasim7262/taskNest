import 'package:flutter/material.dart';
import 'package:tasknest/models/task_model.dart';
import 'package:tasknest/screens/login_page.dart';
import 'package:tasknest/screens/task_page.dart';

import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../services/quote_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService firestoreService = FirestoreService();
  final QuoteService quoteService = QuoteService();
  final AuthService authService = AuthService();

  String quote = '';
  String author = '';

  @override
  void initState() {
    super.initState();
    getQuote();
  }

  void getQuote() async {
    var data = await quoteService.fetchQuote();

    setState(() {
      quote = data['content'];
      author = data['author'];
    });
  }

  void logout() async {
    await authService.logout();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      quote,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(author),
                  ],
                ),
              ),
            ),
            SizedBox(height: 11,),
            Expanded(child: StreamBuilder(stream: firestoreService.getTasks(), builder: (context,snapshot){
              if(!snapshot.hasData){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              var tasks = snapshot.data!.docs;

              return ListView.builder(
                itemCount: tasks.length,
                  itemBuilder: (context,index){
                var taskData = tasks[index];

                TaskModel task = TaskModel.fromMap(taskData.data() as Map<String, dynamic>, taskData.id,);

                return Container();
              });
            }))
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TaskPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
