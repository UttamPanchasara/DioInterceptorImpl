import 'package:flutter/material.dart';
import 'package:interceptor_impl/base/view_state.dart';
import 'package:interceptor_impl/data/presenter/userprofile_presenter.dart';

import 'entity/user_entity.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  UserProfilePresenter presenter = UserProfilePresenter();

  @override
  void initState() {
    super.initState();

    presenter.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random Profile',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {
              presenter.getUser();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: StreamBuilder<ViewState>(
                stream: presenter.getUserDataStream,
                builder: (context, snapshot) {
                  ViewState? state = snapshot.data;

                  if (state == null) {
                    return const Text('Yet to load user info!');
                  }

                  if (state.status == Status.kLoading) {
                    return const CircularProgressIndicator();
                  }

                  if (state.status == Status.kError) {
                    return Text(state.message ?? '');
                  }

                  UserEntity? user = state.data;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user?.fName ?? ''} ${user?.lName ?? ''}',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        user?.email ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
