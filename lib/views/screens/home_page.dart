import 'package:demo_post_api/helper/api_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
          future: ApiHelper.apiHelper.getProducts(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              List data = snapShot.data ?? [];

              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(data[index]['name']),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ApiHelper.apiHelper.createProduct();
        },
      ),
    );
  }
}
