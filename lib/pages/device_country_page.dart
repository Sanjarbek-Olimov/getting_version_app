import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class DeviceCountryPage extends StatefulWidget {
  static const String id = "device_country_page";

  const DeviceCountryPage({Key? key}) : super(key: key);

  @override
  _DeviceCountryPageState createState() => _DeviceCountryPageState();
}

class _DeviceCountryPageState extends State<DeviceCountryPage> {
  late String country;
  late String countryCode;
  bool isLoading = false;

  Future<void> _getData() async {
    setState(() {
      getCountryCodeName();
    });
  }

  Future<void> getCountryCodeName() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> address =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placeMark = address.first;
    setState(() {
      countryCode = placeMark.isoCountryCode!;
      country = placeMark.country!;
      isLoading = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getCountryCodeName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Country Picker"),
          centerTitle: true,
        ),
        body: isLoading
            ? RefreshIndicator(
                onRefresh: _getData,
                child: buildContainer(context),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }

  Container buildContainer(BuildContext context) {
    return Container(
      key: ObjectKey(countryCode),
      padding: const EdgeInsets.only(top: 15),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.87,
            child: Card(
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                    hintText: country,
                    hintStyle: const TextStyle(color: Colors.black),
                    border: const OutlineInputBorder(borderSide: BorderSide())),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: IntlPhoneField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(borderSide: BorderSide())),
                initialCountryCode: countryCode,
                onCountryChanged: (state) {
                  setState(() {
                    country = state.name;
                  });
                },
              )),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
