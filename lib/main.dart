import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DocCard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var libNames = [
    'Python',
    'Numpy',
    'Matplotlib',
    'Seaborn',
    'Tensorflow',
    'Pytorch',
    'Keras',
    'Sklearn',
    'Scipy',
    'Fastai',
    'Opencv',
  ];
  var libImages = [
    'python.png',
    'numpy.png',
    'matplotlib.png',
    'seaborn.png',
    'tensorflow.png',
    'pytorch.png',
    'keras.png',
    'sklearn.png',
    'scipy.png',
    'fastai.png',
    'opencv.png',
  ];
  var libURLs = [
    'https://docs.python.org/3/',
    'https://numpy.org/doc/stable/',
    'https://matplotlib.org/contents.html#',
    'https://seaborn.pydata.org/api.html',
    'https://www.tensorflow.org/api_docs/python/tf',
    'https://pytorch.org/docs/stable/index.html',
    'https://keras.io/api/',
    'https://scikit-learn.org/stable/modules/classes.html',
    'https://www.scipy.org/docs.html',
    'https://docs.fast.ai/',
    'https://docs.opencv.org/master/d9/df8/tutorial_root.html',
  ];

  var categories = [
    'Macine Learning',
    'Numeric Data Handling',
    'Data Visualization',
    'Data Visualization',
    'Machine Learning',
    'Machine Learning',
    'Machine Learning',
    'Machine Learning',
    'Machine Learning',
    'Machine Learning',
    'Macine Learning',
  ];
  var catNames = [];
  var catImages = [];
  var catLinks = [];
  var currentCategory = 'All';

  bool darkModeStatus = true;
  bool catExpanded = false;
  Icon onIcon = Icon(Icons.brightness_3);
  Icon offIcon = Icon(Icons.brightness_4);
  Icon darkModeIcon = Icon(Icons.brightness_4);

  _HomeState() {
    catNames = libNames;
    catImages = libImages;
    catLinks = libURLs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: Text(
          'DocHunt',
          style: TextStyle(
            color: Colors.grey[200],
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 10.0,
        child: Container(
          color: Colors.black,
          child: ListView(
            children: <Widget>[
              Container(
                color: Colors.black,
                child: Column(
                  children: <Widget>[
                    DrawerHeader(
                      child: Icon(
                        Icons.person_pin,
                        color: Colors.white,
                        size: 100.0,
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Dark Mode',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          
                        ),
                        Switch(
                          inactiveTrackColor: Colors.grey,
                          activeColor: Colors.cyan,
                          value: darkModeStatus,
                          onChanged: (value) {
                            setState(() {
                              darkModeStatus = value;
                              if (value) {
                                print('Dark Mode Enabled');
                              } else {
                                print('Dark Mode Disabled');
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 2.0,
                    ),
                    ExpansionTile(
                      leading: Icon(Icons.category, color: Colors.white),
                      initiallyExpanded: false,
                      title: Text(
                        'Categories',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: <Widget>[
                        Divider(
                          color: Colors.grey,
                        ),
                        Container(
                          color: Colors.grey[800],
                          child: ListTile(
                            title: Text(
                              'All',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            leading: Icon(
                              Icons.label,
                              color: Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                currentCategory = 'All';
                                this.catNames = libNames;
                                this.catImages = libImages;
                                this.catLinks = libURLs;
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Container(
                          color: Colors.grey[800],
                          child: ListTile(
                            title: Text(
                              'Machine Learning',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            leading: Icon(
                              Icons.label,
                              color: Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                currentCategory = 'Machine Learning';
                                this.catNames = [];
                                this.catImages = [];
                                this.catLinks = [];
                                for (int i = 0; i < libNames.length; i++) {
                                  if (this.categories[i] ==
                                      this.currentCategory) {
                                    this.catNames.add(libNames[i]);
                                    this.catImages.add(libImages[i]);
                                    this.catLinks.add(libURLs[i]);
                                  }
                                }
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Divider(color: Colors.grey),
                        Container(
                          color: Colors.grey[800],
                          child: ListTile(
                            title: Text(
                              'Data Visualization',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            leading: Icon(
                              Icons.label,
                              color: Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                currentCategory = 'Data Visualization';
                                this.catNames = [];
                                this.catImages = [];
                                this.catLinks = [];
                                for (int i = 0; i < libNames.length; i++) {
                                  if (this.categories[i] ==
                                      this.currentCategory) {
                                    this.catNames.add(libNames[i]);
                                    this.catImages.add(libImages[i]);
                                    this.catLinks.add(libURLs[i]);
                                  }
                                }
//                                for(int i=0;i<libNames.length;i++)
//                                {
//                                  print(catNames.length);
//                                  print("\n");
//                                }
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Divider(color: Colors.grey),
                        Container(
                          color: Colors.grey[800],
                          child: ListTile(
                            title: Text(
                              'Numeric Data Handling',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            leading: Icon(
                              Icons.label,
                              color: Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                this.catNames = [];
                                this.catImages = [];
                                this.catLinks = [];
                                currentCategory = 'Numeric Data Handling';
                                for (int i = 0; i < libNames.length; i++) {
                                  if (this.categories[i] ==
                                      this.currentCategory) {
                                    this.catNames.add(libNames[i]);
                                    this.catImages.add(libImages[i]);
                                    this.catLinks.add(libURLs[i]);
                                  }
                                }
                                for (int i = 0; i < libNames.length; i++) {
                                  print(catNames.length);
                                  print("\n");
                                }
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Container(
                          color: Colors.grey[800],
                          child: ListTile(
                            title: Text(
                              'Other',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            leading: Icon(
                              Icons.label,
                              color: Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                currentCategory = 'Other';
                                catNames = [];
                                catImages = [];
                                catImages = [];
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 2.0,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.help,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Help',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      onTap: () {
                        showAboutDialog(
                            context: context,
                            applicationIcon: FlutterLogo(),
                            applicationName: 'DocHUNT',
                            applicationVersion: '0.0.1',
                            applicationLegalese:
                                'Developed By Vaibhav C. Kanade',
                            children: [
                              Text(
                                'This application is developed as a basic flutter project.',
                              ),
                              Text(
                                  'The app contains links to the documentations of various Python based libraries.'),
                              Text(
                                  'These documentations are divided into different categories.'),
                              Text(
                                  'The application can be use for finding all documentations of all the libraries at one place.'),
                            ]);
                      },
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 2.0,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: Text(
                        'About',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AboutUsPage(),
                        ));
                      },
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 2.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            // Create a grid with 2 columns in portrait mode, or 3 columns in
            // landscape mode.
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(catNames.length, (index) {
              return Center(
                child: DocCard('${catNames[index]}', '${catImages[index]}',
                    '${catLinks[index]}'),
              );
            }),
          );
        },
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'About',
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.orange[700],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/me.png'),
                radius: 60.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Vaibhav C. Kanade',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[400],
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              Text(
                'Connect',
                style: TextStyle(
                  color: Colors.blue[300],
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 10.0,
                  ),
                  IconButton(
                    icon: Icon(MdiIcons.facebook),
                    onPressed: () async {
                      print('Facebook...');
                      const url = 'https://www.facebook.com/vaibhavkanadehimself/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    color: Colors.blue,
                    iconSize: 50.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  IconButton(
                    icon: Icon(MdiIcons.instagram),
                    onPressed: () async {
                      const url = 'https://www.instagram.com/vaibhav_kanade_himself/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    color: Colors.pink[900],
                    iconSize: 50.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  IconButton(
                    icon: Icon(MdiIcons.twitter),
                    onPressed: () async {
                      const url = 'https://twitter.com/vaibhav_himself';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    color: Colors.blue[300],
                    iconSize: 50.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  IconButton(
                    icon: Icon(MdiIcons.linkedin),
                    onPressed: () async {
                      const url = 'https://www.linkedin.com/in/vaibhav-kanade-5892a7184/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    color: Colors.blue[600],
                    iconSize: 50.0,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
