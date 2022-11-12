import 'package:flutter/material.dart';
import 'package:projectagc/localisation/localization_constant.dart';
import 'package:projectagc/providers/providerBpc.dart';
import 'package:projectagc/providers/providerCustumer.dart';
import 'package:provider/provider.dart';
import '../../../themes/constants.dart';

class StatutBpc extends StatefulWidget {
  const StatutBpc({super.key});

  @override
  State<StatutBpc> createState() => _StatutBpcState();
}

class _StatutBpcState extends State<StatutBpc> {
  bool _isloading = false;
  List? _listBpc;

  @override
  void initState() {
    super.initState();
    getBonPriseCharge();
  }

  Future<void> getBonPriseCharge() async {
    _listBpc = ['fdfd'];
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProviderCustumer auth = Provider.of<ProviderCustumer>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        title: Center(
          child: Text(
            getTranslated(context, 'statut_title'),
            style: TextStyle(color: scaffoldbackground),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          Image.asset(
            "assets/images/png/agc1.png",
            height: 40,
            width: 40,
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<BPCProvider>(builder: (context, bpc, _) {
              return Container(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                child: ListView.separated(
                    itemBuilder: (((context, index) {
                      return InkWell(
                        onTap: () {
                          print('Taper');
                        },
                        child: Card(
                          child: ListTile(
                            title: Text('Nom :'),
                            subtitle: Text('Suite :'),
                          ),
                        ),
                      );
                    })),
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                    itemCount: 5),
              );
            }),
    );
  }
}


/**import '../../models/coursier/coursierApi.dart';
import '../../services/service.dart';
import '../Home/Home.dart';

class DeliveryMan extends StatefulWidget {
  const DeliveryMan({Key? key}) : super(key: key);

  @override
  State<DeliveryMan> createState() => _DeliveryManState();
}

class _DeliveryManState extends State<DeliveryMan> {
  List<Coursier>? _coursiers;
  Coursier? _currentCoursier;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getCoursier();
  }

  Future<void> getCoursier() async {
    _coursiers = await CourserApi.getCoursiers();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        Text(
          'Delivery Man',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<CoursProvider>(builder: (context, cours, _) {
              return Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: ListView.separated(
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        cours.getCoursier(_coursiers![index].coursierId!).then(
                          (value) {
                            if (value['statut'] == true) {
                              setState(() {
                                _currentCoursier = value['coursier'];
                              });
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return cours.getStatut == Statut.getting
                                      ? const CircularProgressIndicator()
                                      : ShowDialogueFunc(
                                          nom: _currentCoursier!.first_name,
                                          prenom: _currentCoursier!.last_name,
                                          phone: _currentCoursier!.phone_number,
                                          email: _currentCoursier!.email,
                                          image: _currentCoursier!.image!,
                                          vehicule: _currentCoursier!.transport,
                                          start: _currentCoursier!.rating,
                                          occupation:
                                              _currentCoursier!.occupation);
                                },
                              );
                            } else {
                              print('Error of getting');
                            }
                          },
                        );
                      },
                      child: Card(
                        elevation: 0.5,
                        child: ListTile(
                          leading: ClipOval(
                            child: Container(
                              padding: null,
                              height: 110,
                              width: 80,
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    '${Api_services.imageUrlCoursier2}/${_coursiers![index].image}'),
                              ),
                            ),
                          ),
                          title: Text(
                            _coursiers![index].first_name,
                            style: GoogleFonts.poppins(
                              color: blue_button,
                            ),
                          ),
                          subtitle:
                              Text(_coursiers![index].phone_number.toString()),
                          trailing: _coursiers![index].occupation == "true"
                              ? Text(
                                  'Occupé',
                                  style: GoogleFonts.poppins(color: red_button),
                                )
                              : Text(
                                  'Libre',
                                  style:
                                      GoogleFonts.poppins(color: Colors.green),
                                ),
                        ),
                      ),
                    );
                  }),
                  itemCount: _coursiers!.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),
              );
            }),
    );
  }
} */
