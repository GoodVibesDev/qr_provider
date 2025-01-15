import 'package:barcode/barcode.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final body = id;
  final qr = Barcode.qrCode();
  final svg = qr.toSvg(body, width: 300, height: 300);

  return Response.bytes(
    body: svg.codeUnits,
    headers: {
      'Content-Type': 'image/svg',
    },
  );
}
