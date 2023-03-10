import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie),
              const SizedBox(
                height: 5,
              ),
              _Overview(movie),
              const SizedBox(
                height: 10,
              ),
              CastingCards(movie.id)
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar(this.movie);

  //const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          color: Colors.black12,
          child: Text(
            movie.title,
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage('${movie.fullBackdropPath}'),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle(this.movie);
  //const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            //color: Colors.red,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width - 170),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(fontSize: 30),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    movie.originalTitle,
                    style: TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${movie.voteAverage}',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview(this.movie);
  //const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
