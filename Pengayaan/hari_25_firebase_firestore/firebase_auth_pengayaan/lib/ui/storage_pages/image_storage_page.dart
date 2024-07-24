import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '/logic/cubit/images_cubit.dart';

class ImageStoragePage extends StatefulWidget {
  const ImageStoragePage({super.key});

  @override
  State<ImageStoragePage> createState() => _ImageStoragePageState();
}

class _ImageStoragePageState extends State<ImageStoragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Materi Firebase Storage"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: BlocBuilder<ImagesCubit, ImagesState>(
          builder: (context, state) {
            return ListView(
              children: [
                // gambar upload
                Visibility(
                  visible: state.linkGambar != null,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
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
                  padding: const EdgeInsets.all(16),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: state.isLoading
                        ? CircularProgressIndicator(
                            value: state.uploadProgress,
                            backgroundColor: Colors.grey,
                          )
                        : ElevatedButton.icon(
                            onPressed: () async {
                              await pickImage();
                            },
                            label: const Text("Upload Gambar"),
                          ),
                  ),
                ),
                // link hasil upload
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SelectableText.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: "Link Hasil Upload: "),
                        TextSpan(
                          text: state.linkGambar ?? '-',
                          style: TextStyle(color: Colors.blue.shade800),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image?.path != null) {
      // ignore: use_build_context_synchronously
      context.read<ImagesCubit>().uploadImage(path: image!.path);
    }
  }
}
