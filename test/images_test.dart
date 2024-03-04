import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:skynet/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.frame3).existsSync(), isTrue);
    expect(File(Images.activenews).existsSync(), isTrue);
    expect(File(Images.announcement).existsSync(), isTrue);
    expect(File(Images.balance).existsSync(), isTrue);
    expect(File(Images.calendar).existsSync(), isTrue);
    expect(File(Images.calendarlogo).existsSync(), isTrue);
    expect(File(Images.callcenter).existsSync(), isTrue);
    expect(File(Images.car).existsSync(), isTrue);
    expect(File(Images.catlogo).existsSync(), isTrue);
    expect(File(Images.copylogo).existsSync(), isTrue);
    expect(File(Images.doveritelnyiplateg).existsSync(), isTrue);
    expect(File(Images.homeactive).existsSync(), isTrue);
    expect(File(Images.internet).existsSync(), isTrue);
    expect(File(Images.lightinglogo).existsSync(), isTrue);
    expect(File(Images.listviewphoto).existsSync(), isTrue);
    expect(File(Images.listviewphoto2).existsSync(), isTrue);
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.logoforsplash).existsSync(), isTrue);
    expect(File(Images.mbank).existsSync(), isTrue);
    expect(File(Images.megaPay).existsSync(), isTrue);
    expect(File(Images.more).existsSync(), isTrue);
    expect(File(Images.newstest).existsSync(), isTrue);
    expect(File(Images.newsunabled).existsSync(), isTrue);
    expect(File(Images.odengi).existsSync(), isTrue);
    expect(File(Images.optima).existsSync(), isTrue);
    expect(File(Images.pricelogo).existsSync(), isTrue);
    expect(File(Images.rsk).existsSync(), isTrue);
    expect(File(Images.sales).existsSync(), isTrue);
    expect(File(Images.sms).existsSync(), isTrue);
    expect(File(Images.story).existsSync(), isTrue);
    expect(File(Images.storyofoperation).existsSync(), isTrue);
    expect(File(Images.tele).existsSync(), isTrue);
    expect(File(Images.tick).existsSync(), isTrue);
    expect(File(Images.wallet).existsSync(), isTrue);
  });
}
