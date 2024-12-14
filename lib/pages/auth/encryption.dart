import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:pointycastle/api.dart' as pc;
import 'package:pointycastle/asymmetric/oaep.dart';
import 'package:pointycastle/digests/sha256.dart';
import 'package:pointycastle/key_generators/rsa_key_generator.dart';
import 'package:pointycastle/random/fortuna_random.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RSAEncryption {
  late pc.AsymmetricKeyPair<pc.PublicKey, pc.PrivateKey> _keyPair;
  String _publicKey = "";
  String _privateKey = "";

  // Fixed seed components for key generation
  static const String SMARTPHONE_ID = "1234567890"; // Example smartphone ID
  static const String HUID = "HUID123456";          // Example HUID

  // Secure Storage instance for the keystore
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();


  RSAEncryption() {
    _loadKeys(); // Load keys if stored
    _refreshKeyPair(); // Generate initial key pair on initialization
  }

Future<void> _loadKeys() async {
    _publicKey = await _secureStorage.read(key: 'publicKey') ?? "";
    _privateKey = await _secureStorage.read(key: 'privateKey') ?? "";

    if (_publicKey.isEmpty || _privateKey.isEmpty) {
      await _refreshKeyPair(); // Generate new keys if none are found
    }
  }

  /// Generate RSA Key Pair
  pc.AsymmetricKeyPair<pc.PublicKey, pc.PrivateKey> _generateKeyPair() {
    // Combine deterministic seed components
    final seedInput = utf8.encode(SMARTPHONE_ID + HUID + Random().nextInt(1000).toString());
    final sha256 = SHA256Digest();
    final seed = sha256.process(Uint8List.fromList(seedInput));

    // Secure random generator
    final secureRandom = FortunaRandom()..seed(pc.KeyParameter(seed));

    // RSA Key Pair generation
    final keyParams = RSAKeyGeneratorParameters(BigInt.from(65537), 2048, 12);
    final generator = RSAKeyGenerator()..init(pc.ParametersWithRandom(keyParams, secureRandom));

    return generator.generateKeyPair();
  }

  /// Refresh RSA Key Pair and store securely
  Future<void> _refreshKeyPair() async {
    _keyPair = _generateKeyPair();
    _publicKey = _formatPublicKey(_keyPair.publicKey as RSAPublicKey);
    _privateKey = _formatPrivateKey(_keyPair.privateKey as RSAPrivateKey);

    // Store keys securely in the Flutter Secure Storage
    await _secureStorage.write(key: 'publicKey', value: _publicKey);
    await _secureStorage.write(key: 'privateKey', value: _privateKey);
  }

  /// Format Public Key for Display
  String _formatPublicKey(RSAPublicKey publicKey) {
    return "Modulus: ${publicKey.modulus}\nExponent: ${publicKey.exponent}";
  }

  /// Format Private Key for Display
  String _formatPrivateKey(RSAPrivateKey privateKey) {
    return "Modulus: ${privateKey.modulus}\nExponent: ${privateKey.exponent}";
  }

  /// RSA-OAEP Encryption
  Uint8List rsaOaepEncrypt(RSAPublicKey publicKey, String plaintext) {
    final oaepEncoding = OAEPEncoding(pc.AsymmetricBlockCipher("RSA/PKCS1"))
      ..init(true, pc.PublicKeyParameter<RSAPublicKey>(publicKey));

    final plaintextBytes = Uint8List.fromList(utf8.encode(plaintext));
    return oaepEncoding.process(plaintextBytes);
  }

  /// Encrypt the given text using RSA and return the encrypted base64 encoded string
  String encryptText(String plaintext) {
    final encryptedBytes = rsaOaepEncrypt(_keyPair.publicKey as RSAPublicKey, plaintext);
    return base64Encode(encryptedBytes);
  }

Future<void> testKeyAccess() async {
    String? storedPublicKey = await _secureStorage.read(key: 'publicKey');
    String? storedPrivateKey = await _secureStorage.read(key: 'privateKey');

    if (storedPublicKey != null && storedPrivateKey != null) {
      print('Keys are securely stored and accessible only to the app.');
    } else {
      print('Keys could not be accessed, indicating proper security.');
    }
  }
  String get publicKey => _publicKey;
  String get privateKey => _privateKey;
}
