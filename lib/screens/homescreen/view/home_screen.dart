import 'package:flutter/material.dart';
import 'package:newsapi/screens/homescreen/provider/home_provider.dart';
import 'package:provider/provider.dart';
import '../model/home_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;
  TextEditingController txtcontry = TextEditingController();
  var items = ['INDIA', 'AUSTRALIA', 'CANADA', 'United State'];
  var buisness = ['sport', 'business', 'education'];
  var contryList = ['in', 'au', 'cn', 'us'];

  @override
  Widget build(BuildContext context) {
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'InterNational News',
            style: TextStyle(color: Colors.black),
          ),
          // actions: [
          //   Container(
          //     width: 360,
          //     child: Row(
          //       children: [
          //         SizedBox(
          //           width: 10,
          //         ),
          //         AnimatedContainer(
          //           duration: Duration(seconds: 5),
          //           width: (homeProviderFalse!.anim == true) ? 250 : 180,
          //           curve: Curves.ease,
          //           height: 50,
          //           alignment: Alignment.center,
          //           child: (homeProviderTrue!.anim == false)
          //               ? Text('InterNational News',
          //                   style: TextStyle(
          //                       color: Colors.black,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 20))
          //               : TextFormField(
          //                   controller: txtcontry,
          //                   decoration: InputDecoration(
          //                     enabledBorder: OutlineInputBorder(
          //                       borderRadius: BorderRadius.circular(10),
          //                       borderSide: BorderSide(color: Colors.black),
          //                     ),
          //                     focusedBorder: OutlineInputBorder(
          //                       borderRadius: BorderRadius.circular(10),
          //                       borderSide: BorderSide(color: Colors.black),
          //                     ),
          //                   ),
          //                 ),
          //         ),
          //         Expanded(child: SizedBox()),
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: IconButton(
          //             onPressed: () {
          //               homeProviderTrue!.animChange();
          //               String name=txtcontry.text;
          //               homeProviderFalse!.newsJsonParsing(name);
          //             },
          //             icon: Icon(
          //               Icons.search,
          //               color: Colors.black,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ],
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.hasError}');
            } else if (snapshot.hasData) {
              HomeModel? homeModel = snapshot.data;
              List<ArticalModel>? articalList = homeModel!.articles;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownButton(
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: InkWell(
                                onTap: () {
                                  homeProviderTrue!.ChangeCountry(
                                      contryList[items.indexOf(items)]);
                                },
                                child: Text(items)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          homeProviderTrue!.Dropdownvalue(value.toString());
                        },
                        value: homeProviderTrue!.dropdownvalue,
                        icon: Icon(Icons.sort),
                      ),
                      InkWell(
                        onTap: () {
                          homeProviderTrue!.ChangeBusiness('sport');
                        },
                        child: Container(
                          height: 35,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Color(0XFFFD5530),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Sport',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          homeProviderTrue!.ChangeBusiness('business');
                        },
                        child: Container(
                          height: 35,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Color(0XFFFD5530),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Business',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          homeProviderTrue!.ChangeBusiness('education');
                        },
                        child: Container(
                          height: 35,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Color(0XFFFD5530),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Education',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            homeProviderFalse!.ChangeIndex(index);
                            Navigator.pushNamed(context, 'data',
                                arguments: index);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 230,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Color(0XFFFD5530), width: 1.5),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${homeModel!.articles![index].author}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          wordSpacing: 2,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0XFFFD5530)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${homeModel!.articles![index].title}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          wordSpacing: 2,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  child: Image.network(
                                      '${homeModel!.articles![index].urlToImage}',
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      itemCount: articalList!.length,
                    ),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
          future: homeProviderFalse!.newsJsonParsing(
              contry: '${homeProviderTrue!.country}',
              business: '${homeProviderTrue!.buisness}'),
        ),
      ),
    );
  }
}
