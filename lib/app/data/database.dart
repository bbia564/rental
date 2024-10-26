import 'dart:math';
import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:rental_manager/app/data/equipment_models.dart';
import 'package:rental_manager/app/modules/ball_page/controllers/ball_page_controller.dart';
import 'package:rental_manager/app/modules/other_page/controllers/other_page_controller.dart';
import 'package:rental_manager/app/modules/rental_page/controllers/rental_page_controller.dart';
import 'package:rental_manager/app/modules/tools/local_manager.dart';
import 'package:sqflite/sqflite.dart';
import 'package:rental_manager/assets/assets.dart';

class RMDatabase extends GetxService {
  late Database db;
  String lastTime = "";
  Future<RMDatabase> init() async {
    await initDB();
    return this;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'rm_db.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createTable(db);
    });

    await createInitilData();
  }

  createTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS balls_table (id INTEGER PRIMARY KEY AUTOINCREMENT ,  name TEXT, brand TEXT, photo TEXT, localphoto TEXT, repertory INT,    createTime INT)');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS others_table (id INTEGER PRIMARY KEY AUTOINCREMENT ,  name TEXT, brand TEXT,  photo TEXT, localphoto TEXT, repertory INT,    createTime INT)');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS rental_detail_list (id INTEGER PRIMARY KEY AUTOINCREMENT, emid INT, days INT , rentalName TEXT , rentalphone TEXT , type INT , overdue INT ,name TEXT, brand TEXT,  photo TEXT, localphoto TEXT, repertory INT, createTime INT, FOREIGN KEY (emid) REFERENCES balls_table(id))');
  }

  insertEmModel(RMequipmentModel model, {bool isBalls = true}) async {
    var databasesPath = await getDatabasesPath();

    final tablename = isBalls ? 'balls_table' : 'others_table';
    String path = join(databasesPath, 'rm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.insert(tablename, {
      'name': model.name,
      'brand': model.brand,
      'photo': model.photo,
      'localphoto': model.localphoto,
      'repertory': model.repertory,
      'createTime': model.createTime,
    });
  }

  insertRENTALModel(RMrentalModel model) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'rm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.insert('rental_detail_list', {
      'name': model.name,
      'brand': model.brand,
      'photo': model.photo,
      'localphoto': model.localphoto,
      'rentalphone': model.rentalphone,
      'days': model.days,
      'type': model.type,
      "overdue": model.overdue,
      'rentalName': model.rentalName,
      'repertory': model.repertory,
      'createTime': model.createTime,
    });
  }

  updateRentalModel(RMrentalModel item) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'rm_db.db');

    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});

    await db.update(
        'rental_detail_list',
        {
          "overdue": item.overdue,
        },
        where: 'id = ?',
        whereArgs: [
          item.id,
        ]);
  }

  Future<void> createInitilRentalData() async {
    final items = [
      {
        "name": "Basketball",
        "brand": "Wilson",
        "repertory": 10,
        "photo": "",
        "localphoto": Assets.willsonBall,
      },
      {
        "name": "Basketball",
        "brand": "Anta",
        "photo": "",
        "localphoto": Assets.antaBall,
        "repertory": 10,
      },
      {
        "name": "Wall bars",
        "brand": "Capgemini",
        "repertory": 10,
        "photo": "",
        "localphoto": Assets.dangang,
      },
      {
        "name": "Shuttlecock",
        "brand": "ZiHu",
        "repertory": 10,
        "photo": "",
        "localphoto": Assets.jianzi,
      }
    ];

    final count = 5 + Random().nextInt(6);
    for (var i = 0; i < count; i++) {
      final index = Random().nextInt(items.length);
      final rentModel1 = RMrentalModel.fromJson(items[index]);
      rentModel1.rentalName = faker.person.name();
      rentModel1.rentalphone = faker.phoneNumber.us();
      rentModel1.repertory = 1 + Random().nextInt(8);
      rentModel1.overdue = i > 4 ? 1 : 0;
      rentModel1.type = 0;
      rentModel1.days = 5 + Random().nextInt(20);
      rentModel1.createTime =
          DateTime(2023, 1 + Random().nextInt(12), 1 + Random().nextInt(31))
              .millisecond;

      final rentModel = RMrentalModel.fromJson(items[index]);
      rentModel.rentalName = faker.person.name();
      rentModel.rentalphone = faker.phoneNumber.random
          .fromPattern(['##########', '##########', '+1-###-###-####']);
      rentModel.repertory = 1 + Random().nextInt(8);
      rentModel.overdue = 0;
      rentModel.type = 1;
      rentModel.days = 100 + Random().nextInt(80);
      rentModel.createTime =
          DateTime(2024, 7 + Random().nextInt(5), 1 + Random().nextInt(31))
              .millisecond;

      await insertRENTALModel(rentModel1);
      await insertRENTALModel(rentModel);
    }
  }

  Future<void> createInitilData() async {
    final hasData = RMSharedPreferences.getBool("has_initail_data") ?? false;
    if (hasData) {
      reloadHomeData();
      return;
    }

    await Future.delayed(const Duration(milliseconds: 100));

    final now = DateTime.now().millisecondsSinceEpoch;
    final balls = [
      {
        "name": "Basketball",
        "brand": "Wilson",
        "repertory": 10,
        "photo": "",
        "localphoto": Assets.willsonBall,
      },
      {
        "name": "Basketball",
        "brand": "Anta",
        "photo": "",
        "localphoto": Assets.antaBall,
        "repertory": 10,
      },
      {
        "name": "Football",
        "brand": "Adidas",
        "repertory": 10,
        "photo": "",
        "localphoto": Assets.adiBall,
      },
      {
        "name": "Football",
        "brand": "Nick",
        "repertory": 10,
        "photo": "",
        "localphoto": Assets.nikeBall,
      },
    ];

    final others = [
      {
        "name": "Dumbbell",
        "brand": "IMS",
        "repertory": 10,
        "photo": "",
        "localphoto": Assets.yaling,
      },
      {
        "name": "Exercise mat",
        "brand": "KYLIN",
        "photo": "",
        "localphoto": Assets.yujiadian,
        "repertory": 10,
      },
      {
        "name": "Wall bars",
        "brand": "Capgemini",
        "repertory": 10,
        "photo": "",
        "localphoto": Assets.dangang,
      },
      {
        "name": "Shuttlecock",
        "brand": "ZiHu",
        "repertory": 10,
        "photo": "",
        "localphoto": Assets.jianzi,
      },
    ];

    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'rm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});

    for (var i = 0; i < balls.length; i++) {
      final ballModel = RMequipmentModel.fromJson(balls[i]);
      ballModel.repertory = 10 + Random().nextInt(30);

      final otherModel = RMequipmentModel.fromJson(others[i]);
      otherModel.repertory = 100 + Random().nextInt(30);

      await insertEmModel(ballModel);
      await insertEmModel(otherModel, isBalls: false);
    }

    await createInitilRentalData();

    RMSharedPreferences.putBool("has_initail_data", true);

    reloadHomeData();
  }

  void reloadHomeData() async {
    if (Get.isRegistered<BallPageController>()) {
      Get.find<BallPageController>().getBalls();
    }

    if (Get.isRegistered<OtherPageController>()) {
      Get.find<OtherPageController>().getAllDatas();
    }

    if (Get.isRegistered<RentalPageController>()) {
      Get.find<RentalPageController>().getRentalDetail();
    }
  }

  clean() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'rm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.delete('balls_table');
    await db.delete('others_table');
    await db.delete('rental_detail_list');
    reloadHomeData();
  }

  Future<List<RMequipmentModel>> getEquipments({bool isBalls = true}) async {
    final tablename = isBalls ? 'balls_table' : 'others_table';
    var databasesPath = await getDatabasesPath();

    String path = join(databasesPath, 'rm_db.db');

    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    var result = await db.query(tablename, orderBy: 'id DESC');
    return result.map((e) => RMequipmentModel.fromJson(e)).toList();
  }

  Future<List<RMrentalModel>> getAllRentalDetal() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'rm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    var result = await db.query('rental_detail_list', orderBy: 'id DESC');
    return result.map((e) => RMrentalModel.fromJson(e)).toList();
  }
}
