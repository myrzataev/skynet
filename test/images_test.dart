import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:skynet/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.frame3).existsSync(), isTrue);
    expect(File(Images.activenews).existsSync(), isTrue);
    expect(File(Images.announcement).existsSync(), isTrue);
    expect(File(Images.attention).existsSync(), isTrue);
    expect(File(Images.balance).existsSync(), isTrue);
    expect(File(Images.balancetwo).existsSync(), isTrue);
    expect(File(Images.calendar).existsSync(), isTrue);
    expect(File(Images.calendarlogo).existsSync(), isTrue);
    expect(File(Images.callcenter).existsSync(), isTrue);
    expect(File(Images.car).existsSync(), isTrue);
    expect(File(Images.catlogo).existsSync(), isTrue);
    expect(File(Images.closeicon).existsSync(), isTrue);
    expect(File(Images.connectionlost).existsSync(), isTrue);
    expect(File(Images.copylogo).existsSync(), isTrue);
    expect(File(Images.dots).existsSync(), isTrue);
    expect(File(Images.doveritelnyiplateg).existsSync(), isTrue);
    expect(File(Images.empty).existsSync(), isTrue);
    expect(File(Images.homeactive).existsSync(), isTrue);
    expect(File(Images.internet).existsSync(), isTrue);
    expect(File(Images.internetdown).existsSync(), isTrue);
    expect(File(Images.key).existsSync(), isTrue);
    expect(File(Images.lightinglogo).existsSync(), isTrue);
    expect(File(Images.listviewphoto).existsSync(), isTrue);
    expect(File(Images.listviewphoto2).existsSync(), isTrue);
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.logoforsplash).existsSync(), isTrue);
    expect(File(Images.logout).existsSync(), isTrue);
    expect(File(Images.mbank).existsSync(), isTrue);
    expect(File(Images.mbanktwo).existsSync(), isTrue);
    expect(File(Images.megaPay).existsSync(), isTrue);
    expect(File(Images.more).existsSync(), isTrue);
    expect(File(Images.newstest).existsSync(), isTrue);
    expect(File(Images.newsunabled).existsSync(), isTrue);
    expect(File(Images.odengi).existsSync(), isTrue);
    expect(File(Images.odengitwo).existsSync(), isTrue);
    expect(File(Images.optima).existsSync(), isTrue);
    expect(File(Images.phone).existsSync(), isTrue);
    expect(File(Images.placeholder).existsSync(), isTrue);
    expect(File(Images.pricelogo).existsSync(), isTrue);
    expect(File(Images.quality).existsSync(), isTrue);
    expect(File(Images.rsk).existsSync(), isTrue);
    expect(File(Images.sales).existsSync(), isTrue);
    expect(File(Images.server).existsSync(), isTrue);
    expect(File(Images.sms).existsSync(), isTrue);
    expect(File(Images.splashscreen).existsSync(), isTrue);
    expect(File(Images.story).existsSync(), isTrue);
    expect(File(Images.storyofoperation).existsSync(), isTrue);
    expect(File(Images.tele).existsSync(), isTrue);
    expect(File(Images.tick).existsSync(), isTrue);
    expect(File(Images.wallet).existsSync(), isTrue);
  });
}
