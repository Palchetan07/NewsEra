import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:NewsEra/helper/data.dart';
import 'package:NewsEra/helper/widgets.dart';
import 'package:NewsEra/models/category_model.dart';
import 'package:NewsEra/screens/categories_news.dart';
import '../helper/news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _loading;
  var newslist;

  List<CategorieModel> categories = List<CategorieModel>();

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();

    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: _loading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                /// Categories
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 70,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          imageAssetUrl: categories[index].imageAssetUrl,
                          categoryName: categories[index].categorieName,
                        );
                      }),
                ),

                /// News Article
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: ListView.builder(
                      itemCount: newslist.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NewsTile(
                          imgUrl: newslist[index].urlToImage ?? "",
                          title: newslist[index].title ?? "",
                          desc: newslist[index].description ?? "",
                          content: newslist[index].content ?? "",
                          posturl: newslist[index].articleUrl ?? "",
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;

  CategoryCard({this.imageAssetUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryNews(
              newsCategory: categoryName.toLowerCase(),
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26
              ),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}















// import 'package:NewsEra/helper/data.dart';
// import 'package:NewsEra/helper/news.dart';
// import 'package:NewsEra/models/article_model.dart';
// import 'package:NewsEra/models/category_model.dart';
// import 'package:NewsEra/screens/article_news.dart';
// import 'package:NewsEra/sidebar/sidebar.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:NewsEra/screens/home.dart';
//
// class Mainpage extends StatefulWidget {
//   @override
//   _MainpageState createState() => _MainpageState();
// }
//
// class _MainpageState extends State<Mainpage> {
//   List<CategoryModel> categories = new List<CategoryModel>();
//   List<ArticleModel> articles = new List<ArticleModel>();
//
//   bool _loading =true;
//   @override
//   void initState() {
// //     TODO: implement initStat/e
//     super.initState();
//     categories = getCategories();
//     getNews();
//   }
//
//   getNews() async{
//     News newsClass = News();
//     await newsClass.getNews;
//     articles = newsClass.news;
//     setState(() {
//       _loading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "News",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(
//               "Era",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold, color: Color(0xFF40C4FF)),
//             )
//           ],
//         ),
//         elevation: 0.0,
//       ),
//       body: _loading
//           ? Center(
//               child: Container(
//               child: CircularProgressIndicator(),
//             ))
//           : SingleChildScrollView(
//             child: Container(
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 16.0),
//                       height: 120,
//                       child: ListView.builder(
//                         itemCount: categories.length,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) {
//                           return CategoryTile(
//                             categoryName: categories[index].categoryName,
//                             imageUrl: categories[index].imageUrl,
//                           );
//                         },
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(16),
//                       child: ListView.builder(
//                           itemCount: articles.length,
//                           shrinkWrap: true,
//                           physics: ClampingScrollPhysics(),
//                           itemBuilder: (context, index) {
//                             return BlogTile(
//                               imageUrl: articles[index].urlToimage,
//                               title: articles[index].title,
//                               desc: articles[index].description,
//                               url: articles[index].url,
//                             );
//                           }),
//                     )
//                   ],
//                 ),
//               ),
//           ),
//     );
//   }
// }
//
// class CategoryTile extends StatelessWidget {
//   final imageUrl, categoryName;
//
//   const CategoryTile({Key key, this.imageUrl, this.categoryName})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       child: Stack(
//         children: <Widget>[
//           ClipRRect(
//             borderRadius: BorderRadius.circular(6),
//             child: CachedNetworkImage(
//               imageUrl: imageUrl,
//               width: 120,
//               height: 60,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Container(
//             alignment: Alignment.center,
//             width: 120,
//             height: 60,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(6),
//               color: Colors.black26,
//             ),
//             child: Text(
//               categoryName,
//               style:
//                   TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class BlogTile extends StatelessWidget {
//   final String imageUrl, title, desc,url;
//
//   BlogTile({Key key, @required this.imageUrl, @required this.title, @required this.desc,@required this.url});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(onTap: (){
//       Navigator.push(context,MaterialPageRoute(builder: (context) => ArticleView()),
//
//     },
//       child: Container(
//           child: Column(
//         children: <Widget>[
//           Image.network(imageUrl),
//           Text(
//             title,
//             style: TextStyle(
//                 fontSize: 17, color: Colors.black87, fontWeight: FontWeight.w500),
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           Text(desc),
//         ],
//       )),
//     );
//   }
// }
