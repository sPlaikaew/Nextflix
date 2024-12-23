import 'package:flutter/material.dart';
import 'package:nextflix/core/utils/widgets/image_list.dart';

import '../../../../data/model/movies.dart';

class CollectionPage extends StatefulWidget {
  final Movie movie;
  const CollectionPage({super.key, required this.movie});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return ImageList(
      movies: widget.movie.collections!,
    );
  }
}
