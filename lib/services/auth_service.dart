import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../features/categories/model/category_model.dart';
import '../features/home_screen/model/model.dart';
import '../features/login/models/login_model.dart';
import '../features/profile/models/profile_model.dart';
import '../features/register/presentation/models/register_model.dart';

class LoginApiService {
  static const String baseUrl = 'https://master-market.masool.net/api';

  Future<LoginResponseModel> login(String phoneEmail, String password, String oneSignalId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'phone_email': phoneEmail,
        'password': password,
        'onesignal_id': oneSignalId,
      }),
    );

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}
class RegisterApiService {
  final String baseUrl = 'https://master-market.masool.net/api';

  // دالة إرسال طلب التسجيل
  Future<Map<String, dynamic>> registerUser(RegisterModel registerModel) async {
    final url = Uri.parse('$baseUrl/register');

    var request = http.MultipartRequest('POST', url);

    // إضافة الحقول المطلوبة
    request.fields['name'] = registerModel.name;
    request.fields['mobile'] = registerModel.mobile;
    request.fields['email'] = registerModel.email;
    request.fields['password'] = registerModel.password;
    request.fields['c_password'] = registerModel.confirmPassword;
    request.fields['onesignal_id'] = registerModel.onesignalId;

    // إضافة الملف (الصورة) إذا كانت موجودة
    if (registerModel.profilePhotoPath.isNotEmpty) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'profile_photo_path', // يجب أن يتطابق مع المفتاح المستخدم في Postman
          registerModel.profilePhotoPath,
        ),
      );
    }

    // إضافة الهيدرز
    request.headers['Accept'] = 'application/json';
    request.headers['client_id'] = '964ad058-e46a-431c-8dfe-de44e05a2002';
    request.headers['client_secret'] = 'cR8kOgGXbS19cdrZ1tAJYt2qeUXxTIW9oXxLeQS7';

    // إرسال الطلب
    var response = await request.send();
    var responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return jsonDecode(responseBody);
    } else {
      throw Exception('فشل في تسجيل المستخدم: $responseBody');
    }
  }
}

class ProfileApiService {
  static const String baseUrl = 'https://master-market.masool.net/api';

  Future<ProfileModel> fetchProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final url = Uri.parse('$baseUrl/profile');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return ProfileModel.fromJson(data);
    } else {
      throw Exception('Failed to load profile');
    }
  }
}


class AdvertisementService {
  static const String apiUrl = 'https://master-market.masool.net/api/advertising/t/ar/0';

  Future<List<Advertisement>> fetchAdvertisements() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body)['data'];
      return data.map((json) => Advertisement.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load advertisements');
    }
  }
}

class CategoryService {
  final String baseUrl = 'https://master-market.masool.net/api';

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories/t/ar/0/0'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['result']) {
        List<dynamic> data = jsonData['data'];
        return data.map((category) => Category.fromJson(category)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } else {
      throw Exception('Failed to connect to the API');
    }
  }
}
class CategoryDetailsService {
  final String baseUrl = 'https://master-market.masool.net/api';

  Future<List<SubCategory>> fetchCategoryDetails(int categoryId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/categories/get_with_sub/ar/0/0'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['result']) {
          List<dynamic> data = jsonData['data'];
          // ابحث عن الفئة بالم ID المحدد
          var categoryData = data.firstWhere((category) => category['id'] == categoryId, orElse: () => null);
          if (categoryData != null) {
            // تحويل الفئة إلى كائن SubCategory
            return (categoryData['sub_cat'] as List<dynamic>).map((detail) => SubCategory.fromJson(detail)).toList();
          } else {
            throw Exception('Category not found');
          }
        } else {
          throw Exception('Failed to load category details: ${jsonData['error_message']}');
        }
      } else {
        throw Exception('Failed to connect to the API: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
