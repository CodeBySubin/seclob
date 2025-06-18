import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seclob/core/constants/constants.dart';
import 'package:seclob/core/routes/routes.dart';
import 'package:seclob/core/utils/storage_helper.dart';
import 'package:seclob/features/home/presentation/viewmodel/home_view_model.dart';
import 'package:seclob/features/profile/presentation/viewmodel/profile_viewmodel.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isDarkMode = false;
  bool isNotificationEnabled = false;
  @override
  void initState() {
    Future.microtask(
      () =>
          Provider.of<ProfileViewModel>(
            context,
            listen: false,
          ).fetchUserProfile(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        return Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          appBar: AppBar(
            backgroundColor: const Color(0xFF7B2CBF),
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF782FF8),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24.r,
                            backgroundImage: const AssetImage(AppImage.profile),
                            backgroundColor: Colors.grey[300],
                            child: const Icon(Icons.person, color: Colors.grey),
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.user!.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                provider.user!.email,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 24.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20.h),

                      _buildMenuItem(
                        icon: Icons.person_outline,
                        title: 'Profile',
                        hasArrow: true,
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: Icons.dark_mode_outlined,
                        title: 'Darkmode',
                        hasToggle: true,
                        toggleValue: isDarkMode,
                        onToggleChanged: (value) {
                          setState(() {
                            isDarkMode = value;
                          });
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.notifications_outlined,
                        title: 'Notification',
                        hasToggle: true,
                        toggleValue: isNotificationEnabled,
                        onToggleChanged: (value) {
                          setState(() {
                            isNotificationEnabled = value;
                          });
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.account_balance_outlined,
                        title: 'Bank Account',
                        hasArrow: true,
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: Icons.help_outline,
                        title: 'Help & Support',
                        hasArrow: true,
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: Icons.description_outlined,
                        title: 'Consumer policies',
                        hasArrow: true,
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: Icons.logout_outlined,
                        title: 'Log out',
                        isLogout: true,
                        onTap: _showLogoutDialog,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMenuItem({
    required icon,
    required String title,
    bool hasArrow = false,
    bool hasToggle = false,
    bool toggleValue = false,
    Function(bool)? onToggleChanged,
    VoidCallback? onTap,
    bool isLogout = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: hasToggle ? null : onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 4.w),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 24.sp,
                  color: isLogout ? Colors.red : Colors.black87,
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: isLogout ? Colors.red : Colors.black87,
                    ),
                  ),
                ),
                if (hasArrow)
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.sp,
                    color: Colors.grey[600],
                  ),
                if (hasToggle)
                  Transform.scale(
                    scale: 0.8,
                    child: Container(
                      width: 18.w,
                      height: 20.h,
                      color: Colors.amber,
                      child: Switch(
                        value: toggleValue,
                        onChanged: onToggleChanged,
                        activeColor: const Color(0xFF7B2CBF),
                        inactiveThumbColor: Colors.grey[400],
                        inactiveTrackColor: Colors.grey[300],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppIcons.feature),
              SizedBox(height: 12.h),
              Text(
                'Log Out',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              Text(
                'Are you sure you want to log out?',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        backgroundColor: AppColor.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: const Color.fromARGB(255, 216, 212, 212),
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () {
                        _logout();
                      },
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _logout() async {
    await SecureStorageHelper.deleteToken();
    context.go(AppRoutes.login);
  }
}
