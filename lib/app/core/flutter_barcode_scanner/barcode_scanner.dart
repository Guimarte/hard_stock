import 'package:barcode_scan2/model/android_options.dart';
import 'package:barcode_scan2/model/scan_options.dart';
import 'package:barcode_scan2/platform_wrapper.dart';

class BarcodeScan {
  Future<void> scanBarcodeNormal() async {
    final result = await BarcodeScanner.scan(
      options: ScanOptions(
        strings: {
          'cancel': "cancel",
          'flash_on': "Flash_on",
          'flash_off': "Flash_off",
        },

        autoEnableFlash: false,
        android: AndroidOptions(),
      ),
    );
    print("TESTE TESTE TESTE");
    print(result.rawContent);
  }
}
