import 'package:flutter/material.dart';
/// Flutter code sample for [NavigationBar].
void main() => runApp(const NavigationBarApp());
class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false  ,
        home:
    NavigationExample());
  }
}
class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});
  @override
  State<NavigationExample> createState() => _NavigationExampleState();}
class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Women Fashon',selectionColor: Colors.cyanAccent,),

        ),
        bottomNavigationBar: NavigationBar(
          labelBehavior: labelBehavior,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;});},
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.bookmark_border),
              label: 'Home',),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart),
              label: 'Shopping',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.bookmark_border),
              label: 'Save',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person),
              label: 'Me',),
          ],
        ));
  }}
class Mymatrial extends StatefulWidget {


  @override
  State<Mymatrial> createState() => _MymatrialState();
}

class _MymatrialState extends State<Mymatrial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Women wear'),
            actions: []));}}
class CustomSearchDelegate extends SearchDelegate{
  List<String> searchTerms =[
    'Dress',
    'juket',
    'Skirt',
  ];
  @override
  List< IconButton> buildActions(BuildContext context){
    return[
      IconButton(
        icon: const Icon((Icons.clear),
        ), onPressed: () {
        query ='';
      },
      )];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  IconButton(
      icon: const Icon((Icons.arrow_back),
      ), onPressed: () {
      close(context, null);
    },
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var wear in searchTerms){
      if (wear.toLowerCase().contains(query.toLowerCase())){
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
        var result =matchQuery[index];
        return const MaterialApp(
          debugShowCheckedModeBanner: false,);
      },);}

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var wear in searchTerms){
      if (wear.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(wear);
      }
    }
    return  ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
        var result =matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );}}