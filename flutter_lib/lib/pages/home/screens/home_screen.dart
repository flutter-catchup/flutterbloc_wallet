import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/posts_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Home'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is PostsLoading) {
            return CircularProgressIndicator();
          } else if (state is PostsError) {
            return Text(state.error);
          } else if (state is PostsLoaded) {
            final posts = state.response;

            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Container(
                    height: 150,
                    width: double.infinity,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('ID: ${post.id}', style: TextStyle(fontSize: 16)),
                        Text('title: ${post.title}',
                            style: TextStyle(fontSize: 16)),
                        Text(
                          'Body: ${post.body}',
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                });
          }
          return const Text('Something Went Wrong');
        },
      ),
    );
  }
}
