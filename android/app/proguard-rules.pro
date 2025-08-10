# Keep OkHttp3
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**

# Keep Okio
-keep class okio.** { *; }
-dontwarn okio.**

# Keep Retrofit (if used)
-keep class retrofit2.** { *; }
-dontwarn retrofit2.**
