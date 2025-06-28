import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import '../features/profileScreen/data/model/profile_model.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();


  Rx<ProfileModel?> profile = Rx<ProfileModel?>(null);
  RxString selectedGender = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isSaving = false.obs;


  String get userId => 'current_user_id';

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    mobileNumberController.dispose();
    dateOfBirthController.dispose();
    super.onClose();
  }


  Future<void> loadProfile() async {
    try {
      isLoading.value = true;


      final doc = await _firestore.collection('profiles').doc("Msh5iUAUUHZ9tIoxaEAc").get();

      if (doc.exists) {
        final profileData = ProfileModel.fromJson(doc.data()!);
        profile.value = profileData;


        box.write('user_profile', profileData.toJson());


        _updateControllers(profileData);
      } else {

        final localData = box.read('user_profile');
        if (localData != null) {
          final profileData = ProfileModel.fromJson(localData);
          profile.value = profileData;
          _updateControllers(profileData);
        }
      }
    } catch (e) {

      final localData = box.read('user_profile');
      if (localData != null) {
        final profileData = ProfileModel.fromJson(localData);
        profile.value = profileData;
        _updateControllers(profileData);
      }
      Get.snackbar(
        'Error',
        'Failed to load profile data',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Update form controllers with profile data
  void _updateControllers(ProfileModel profileData) {
    fullNameController.text = profileData.fullName;
    emailController.text = profileData.email;
    mobileNumberController.text = profileData.mobileNumber;
    dateOfBirthController.text = profileData.dateOfBirth;
    selectedGender.value = profileData.gender;
  }


  Future<void> updateProfile() async {
    try {
      isSaving.value = true;

      final updatedProfile = ProfileModel(

        fullName: fullNameController.text.trim(),
        email: emailController.text.trim(),
        mobileNumber: mobileNumberController.text.trim(),
        dateOfBirth: dateOfBirthController.text.trim(),
        gender: selectedGender.value,
      );


      await _firestore.collection('profiles').doc(userId).set(updatedProfile.toJson());


      box.write('user_profile', updatedProfile.toJson());


      profile.value = updatedProfile;

      Get.snackbar(
        'Success',
        'Profile updated successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update profile',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isSaving.value = false;
    }
  }


  void setDateOfBirth(String date) {
    dateOfBirthController.text = date;
  }


  void setGender(String gender) {
    selectedGender.value = gender;
  }


  bool validateForm() {
    if (fullNameController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter your full name');
      return false;
    }
    if (emailController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter your email');
      return false;
    }
    if (!GetUtils.isEmail(emailController.text.trim())) {
      Get.snackbar('Error', 'Please enter a valid email');
      return false;
    }
    if (mobileNumberController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter your mobile number');
      return false;
    }
    if (dateOfBirthController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please select your date of birth');
      return false;
    }
    if (selectedGender.value.isEmpty) {
      Get.snackbar('Error', 'Please select your gender');
      return false;
    }
    return true;
  }


  void onUpdateProfile() {
    if (validateForm()) {
      updateProfile();
    }
  }
}
