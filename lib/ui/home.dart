import 'package:app_movies/models/movie.dart';
import 'package:app_movies/movie_ui/movie_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {

  final List<Movie> movieList = Movie.getMovies();

  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I Am Legend",
    "300",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings",
    "Vikings",
    "Vikings"

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (
              BuildContext context, int index ){
            return Stack(children:<Widget>[

              movieCard(movieList[index], context),

              Positioned(
                  top: 10.0,
                  child: movieImage(movieList[index].images[0]))
            ]);

            // return Card(
            //   elevation: 4.5,
            //   color: Colors.white,
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: NetworkImage(movieList[index].images[0]),
            //             fit: BoxFit.cover
            //           ),
            //           color: Colors.blue,
            //           borderRadius: BorderRadius.circular(13.9)
            //         ),
            //         child: null,
            //       ),
            //     ),
            //     trailing: Text("..."),
            //     title: Text(movieList[index].title),
            //     subtitle: Text("${movieList[index].title}"),
            //     onTap: () {
            //       Navigator.push(
            //           context, MaterialPageRoute(
            //           builder: (context) => MovieListViewDetails(
            //             movieName: movieList.elementAt(index).title, movie: movieList[index],) ) );
            //     },
            //     //onTap: () => debugPrint("Movie name: ${movies.elementAt(index)}") ,
            //   ),
            // );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,
              bottom: 8.0, left: 54.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(movie.title,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                    Text("Rating: ${movie.imdbRating} / 10",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Released: ${movie.released}"),
                    Text(movie.runtime,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.grey,
                        )),
                    Text(movie.rated,
                        style: mainTextStyle()

                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(
            builder: (context) => MovieListViewDetails(
              movieName: movie.title, movie: movie,) ) );
      },
    );
  }
  TextStyle mainTextStyle() {
    return TextStyle(
        fontSize: 13.0,
        color: Colors.grey
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(imageUrl ?? "https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg"),
            fit: BoxFit.cover
        ),
      ),
    );
  }

}




// New route (screen or page)
class MovieListViewDetails extends StatelessWidget {

  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),

      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MoveDetailsCast(movie: movie),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.images),
        ],
      ),
      // body: Center(
      //   child: Container(
      //     child: RaisedButton(
      //       child: Text("Go back ${this.movie.director}"),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}