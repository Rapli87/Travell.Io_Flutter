import 'package:flutter/material.dart';
import 'package:travel_io/models/size.dart';
import 'package:travel_io/screens/home_screen.dart';
import 'package:travel_io/screens/onBoarding.dart';
import 'package:travel_io/theme.dart';
import 'package:travel_io/widgets/size_card.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  int id;
  String image;
  String name;
  int price;
  int pricePromo;
  int price2;
  int price4;
  int pricetamb;
  String note;
  bool isPromo;

  DetailScreen(this.id, this.image, this.name, this.price, this.pricePromo,
      this.note, this.isPromo, this.price2, this.price4, this.pricetamb,
      {Key? key})
      : super(key: key);

  @override
  State<DetailScreen> createState() =>
      // ignore: no_logic_in_create_state
      _DetailScreen(id, image, name, price, pricePromo, note, isPromo, price2,
          price4, pricetamb);
}

class _DetailScreen extends State<DetailScreen> {
  int _id;
  String _image;
  String _name;
  int _price;
  int _pricePromo;
  int _price2;
  int _price4;
  int _pricetamb;
  String _note;
  bool _isPromo;

  _DetailScreen(
      this._id,
      this._image,
      this._name,
      this._price,
      this._pricePromo,
      this._note,
      this._isPromo,
      this._price2,
      this._price4,
      this._pricetamb);

  launchUrl(String url) async {
    launch(url);
  }

  int i = 1;

  int dataPrice = 28000;
  int dataPricePromo = 22000;

  int price = 28000;
  int pricePromo = 22000;

  bool isMini = true;
  bool isSedang = true;
  bool isBesar = true;
  bool isSuperBesar = true;

  void _minus() {
    setState(() {
      if (i > 1) {
        i--;
        if (isMini == true) {
          this._price = ((_price2 * i) - (_price2)) + (_price2);
          this._pricePromo = ((_pricetamb * i) - (_pricetamb)) + (_pricetamb);
        } else if (isSedang == false) {
          return null;
        }
      }
    });
  }

  void _plus() {
    setState(() {
      if (i <= 6) {
        i++;

        if (isMini == true) {
          this._price = _price2 * i;
          this._pricePromo = _pricetamb * i;
        }
      }
    });
  }

  void _clickMini() {
    setState(() {
      this._price = _price2 * i;
      this._pricePromo = _pricetamb * i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              _image,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       InkWell(
            //         onTap: () {
            //           Navigator.pushReplacement(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (_) => OnboardingScreen()));
            //         }, //to login screen. We will update later
            //         child: Image.asset('assets/btn_back.png', width: 40),
            //       ),
            //       InkWell(
            //         onTap: () {},
            //         child: Image.asset('assets/btn_share.png', width: 40),
            //       ),
            //     ],
            //   ),
            // ),
            ListView(
              children: [
                const SizedBox(height: 264),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image.asset(
                            //   'assets/promo.png',
                            //   width: 60,
                            // ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  _name,
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: blackColor,
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: _minus,
                                  child: Image.asset(
                                    'assets/minus.png',
                                    width: 34,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  '$i',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: blackColor,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                InkWell(
                                  onTap: _plus,
                                  child: Image.asset(
                                    'assets/plus.png',
                                    width: 34,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(this._price),
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: greyColor,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(this._pricePromo),
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: yellowColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Keuntungan:',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                InkWell(
                                  onTap: _clickMini,
                                  child: SizeCard(
                                    Size(
                                      id: 1,
                                      name: 'Dokumentasi Perjalanan',
                                      isActive: isMini,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                InkWell(
                                  child: SizeCard(
                                    Size(
                                      id: 2,
                                      name: 'Menyenangkan',
                                      isActive: isSedang,
                                    ),
                                  ),
                                ),
                                // const SizedBox(width: 12),
                                // InkWell(
                                //   child: SizeCard(
                                //     Size(
                                //       id: 3,
                                //       name: 'Besar',
                                //       isActive: isBesar,
                                //     ),
                                //   ),
                                // ),
                                // const SizedBox(width: 12),
                                // InkWell(
                                //   child: SizeCard(
                                //     Size(
                                //       id: 4,
                                //       name: 'Super Besar',
                                //       isActive: isSuperBesar,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Deskrpisi Destinasi',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                _note,
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: greyColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Lokasi Travell.Io',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                    'https://goo.gl/maps/wwBiXGXDjvLAeqHt7');
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/store.png',
                                    width: 50,
                                  ),
                                  const SizedBox(width: 18),
                                  Text(
                                    'Jl.Raya Mastrip 4\nJember,Jawa Timur',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: greyColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.chevron_right,
                                      color: greyColor,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: MediaQuery.of(context).size.width,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  bottom: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                elevation: 0,
                                focusElevation: 0,
                                hoverElevation: 0,
                                disabledElevation: 0,
                                highlightElevation: 0,
                                onPressed: () {
                                  launchUrl(
                                      'https://wa.me/6285156264563?text=Saya%20Pesan%20Paket%20$_name%20$i%20Hari%20Mulai Tanggal ... %20Sampai dengan tanggal ...%20(Rp.$_pricePromo)');
                                },
                                color: yellowColor,
                                child: Text(
                                  'Beli',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
