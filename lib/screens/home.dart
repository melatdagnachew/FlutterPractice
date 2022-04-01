import 'package:flutter/material.dart';
import 'package:interview/data/user.dart';
import 'package:interview/data/mock_data.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var allUsers = User.fromJsonToList(allData());
    var selectedUsers = allUsers;
    final _key = GlobalKey<FormState>();
    _getUserAvatar(url) {
      return CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: url == null
            ? Icon(
                Icons.warning,
              )
            : Image(
                image: NetworkImage(url),
                errorBuilder: (ctx, obj, stackTrace) => Icon(
                  Icons.warning,
                ),
              ),
        radius: 40,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _key,
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onEditingComplete: () {
                    print(searchController.text.toString());
                    selectedUsers = allUsers
                        .where((user) =>
                            user.fullName.contains(searchController.text))
                        .toList();
                    setState(() {});
                  },
                  // controller: searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: selectedUsers.length,
                itemBuilder: (context, index) {
                  final user = selectedUsers[index];
                  return ListTile(
                    minLeadingWidth: 50,
                    leading: _getUserAvatar(user.avatar),
                    title: Text(user.firstName + ' ' + user.lastName),
                    subtitle: Text(user.role),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var newUser = User(
              id: "b32ec56c-21bb-4b7b-a3a0-635b8bca1f9d",
              avatar: null,
              firstName: "James",
              lastName: "May",
              email: "ssaull1c@tripod.com",
              role: "Developer");
        },
        tooltip: 'Add new',
        child: Icon(Icons.add),
      ),
    );
  }
}
