import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    int index=ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text(
                '${homeProviderTrue!.homeModel!.articles![homeProviderTrue!.i].sorceModel!.name}',
                style: TextStyle(
                    fontSize: 18,
                    wordSpacing: 2,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFFD5530)),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Image.network(
                      '${homeProviderTrue!.homeModel!.articles![homeProviderTrue!.i].urlToImage}',
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Author   : ",
                    style: TextStyle(
                        fontSize: 18,
                        wordSpacing: 2,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFFD5530)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 228,
                    child: Text(
                      '${homeProviderTrue!.homeModel!.articles![homeProviderTrue!.i].author}',
                      style: TextStyle(
                        fontSize: 18,
                        wordSpacing: 2,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title      : ",
                    style: TextStyle(
                      fontSize: 18,
                      wordSpacing: 2,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFFD5530),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 230,
                    child: Text(
                      '${homeProviderTrue!.homeModel!.articles![homeProviderTrue!.i].title}',
                      style: TextStyle(
                        fontSize: 18,
                        wordSpacing: 2,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contant : ",
                    style: TextStyle(
                      fontSize: 18,
                      wordSpacing: 2,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFFD5530),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 230,
                    child: Text(
                      '${homeProviderTrue!.homeModel!.articles![homeProviderTrue!.i].content} ${homeProviderTrue!.homeModel!.articles![homeProviderTrue!.i].description}',
                      style: TextStyle(
                        fontSize: 18,
                        wordSpacing: 2,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 230,
                    child: Text(
                      '${homeProviderTrue!.homeModel!.articles![homeProviderTrue!.i].publishedAt}',
                      style: TextStyle(
                        fontSize: 18,
                        wordSpacing: 2,
                        color: Color(0XFFFD5530),
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'web',arguments: index);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 230,
                      child: Text(
                        'Click For More',
                        style: TextStyle(
                          fontSize: 18,
                          wordSpacing: 2,
                          color: Color(0XFFFD5530),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
