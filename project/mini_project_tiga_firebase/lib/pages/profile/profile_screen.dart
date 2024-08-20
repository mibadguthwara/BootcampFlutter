// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '/pages/auth/login_screen.dart';
import '../../../logic/profile/user_bloc.dart';
import '../../logic/auth/auth_bloc.dart';
import '../../logic/cubit/images_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _logout(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const LoginScreen()), // Ganti dengan login screen-mu
      );
    } catch (e) {
      // Handle logout error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error logging out: $e')),
      );
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image?.path != null) {
      context.read<ImagesCubit>().uploadImage(path: image!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocBuilder<ImagesCubit, ImagesState>(
              builder: (context, state) {
                return Column(
                  children: [
                    // gambar upload
                    Visibility(
                      visible: state.linkGambar != null,
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          height: 200,
                          state.linkGambar ?? '',
                          loadingBuilder: (context, child, chunk) {
                            final loaded = (chunk?.cumulativeBytesLoaded ?? 0);
                            final expected = (chunk?.expectedTotalBytes ?? 0);

                            if (loaded < expected) {
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: CircularProgressIndicator(
                                  value: loaded / expected,
                                ),
                              );
                            }
                            return child;
                          },
                        ),
                      ),
                    ),
                    // button pilih gambar
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: state.isLoading
                            ? CircularProgressIndicator(
                                value: state.uploadProgress,
                                backgroundColor: Colors.grey,
                              )
                            // : ElevatedButton.icon(
                            //     onPressed: () async {
                            //       await pickImage();
                            //     },
                            //     label: const Text("Upload Gambar"),
                            //     icon: const Icon(Icons.upload_rounded),
                            //   ),
                            : InkWell(
                                onTap: () async {
                                  await pickImage();
                                },
                                child: const Text("Upload Image"),
                              ),
                      ),
                    ),
                  ],
                );
              },
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return state.errorMessage.isNotEmpty
                    ? Text("Error : ${state.errorMessage}")
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.amber,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: ListTile(
                            title: Text(
                              "${state.userData?.email}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${state.userData?.uid}",
                              style: const TextStyle(fontSize: 12),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Logout'),
                                      content: const Text(
                                          'Apakah kamu yakin akan keluar dari akun?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Batal'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            _logout(context);
                                          },
                                          child: const Text('Ya'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.logout),
                            ),
                          ),
                        ),
                      );
              },
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                // print(state.toString());
                if (state is UserLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is UserError) {
                  final messageError = state.error;
                  return Center(
                    child: Text(messageError),
                  );
                }
                if (state is UserByIdLoaded) {
                  final user = state.user;
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Profile Info",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                              isDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return SizedBox(
                                                  height: 130,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      ListTile(
                                                        title: const Text(
                                                          "Profile",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        trailing: IconButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: const Icon(Icons
                                                              .close_outlined),
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 14,
                                                                vertical: 5),
                                                        child: Text(
                                                          "This information appears on public pages and can be seen by other users.",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(Icons.info_outline))
                                    ],
                                  ),
                                  Table(
                                    children: [
                                      TableRow(
                                        children: [
                                          const Text("Name"),
                                          Text(
                                            "${user.name['firstname']} ${user.name['lastname']}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          const Text("Username"),
                                          Text(
                                            user.username,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Private Info",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                              isDismissible: false,
                                              context: context,
                                              builder: (
                                                BuildContext context,
                                              ) {
                                                return SizedBox(
                                                  height: 130,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      ListTile(
                                                        title: const Text(
                                                          "Private",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        trailing: IconButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: const Icon(Icons
                                                              .close_outlined),
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 14,
                                                                vertical: 5),
                                                        child: Text(
                                                          "This information is personal. Only you can see it and it cannot be shared with anyone.",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(Icons.info_outline))
                                    ],
                                  ),
                                  Table(
                                    children: [
                                      TableRow(
                                        children: [
                                          const Text("Password"),
                                          Text(
                                            user.password,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          const Text("Email"),
                                          Text(
                                            user.email,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          const Text("Phone"),
                                          Text(
                                            user.phone,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          const Text("Street"),
                                          Text(
                                            user.address['street'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          const Text("City"),
                                          Text(
                                            user.address['city'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          const Text("Zip Code"),
                                          Text(
                                            user.address['zipcode'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          const Text("Geo Location"),
                                          Text(
                                            // '${user.address}',
                                            'Lat: ${user.address['geolocation']['lat']}\nLong: ${user.address['geolocation']['long']}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
