import 'package:flutter/material.dart';
import 'package:deliveryapp/color_scheme.dart';

void main() => runApp(MyApp());
//Theme.of(context).textTheme.titleLarge

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        textTheme: TextTheme(
          headlineSmall: TextStyle(
            color: lightColorScheme.onSurface,
          ),
          titleLarge: TextStyle(
            color: lightColorScheme.onSurface,
          ),
          titleMedium: TextStyle(
            color: lightColorScheme.onSurface,
          ),
          titleSmall: TextStyle(
            color: lightColorScheme.onSurface,
          ),
        ),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int activePage = 1;
  late PageController _pageController;
  List<String> texts = ['Burgers', 'Bakery', 'Beverage'];
  List<IconData> icons = [
    Icons.settings,
    Icons.bakery_dining,
    Icons.emoji_food_beverage_rounded
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.4, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Panera Bread',
                      style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
              SizedBox(height: 30.0),
              SizedBox(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                    itemCount: 3,
                    pageSnapping: true,
                    controller: _pageController,
                    onPageChanged: (page) {
                      setState(() {
                        activePage = page;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(icons[index]),
                            Text(
                              texts[index],
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          border: Border.all(
                              width: 1.5,
                              color: Theme.of(context).colorScheme.outline),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 30.0),
              SizedBox(
                height: 420.0,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildFoodDisplay();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildFoodDisplay() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image(
            image: AssetImage('assets/images/plain_bagel.jpg'),
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 30.0),
        ListTile(
          title: Text('Plain Bagel',
              style: Theme.of(context).textTheme.titleMedium),
          subtitle: SizedBox(
            height: 50.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Text(
                      'Freshly backed bagel that is flavored with brown sugar and molasses',
                      style: Theme.of(context).textTheme.titleSmall),
                ),
                SizedBox(height: 15.0),
                Text('1.49 ~ 280 Cal',
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ),
          trailing: CircleAvatar(
            radius: 18.0,
            backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
            child: Center(
              child: Icon(Icons.add),
            ),
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}
