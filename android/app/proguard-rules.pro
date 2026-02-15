# Google ErrorProne annotations
-keep class com.google.errorprone.annotations.** { *; }

# Javax annotations
-keep class javax.annotation.** { *; }
-keep class javax.annotation.concurrent.** { *; }

-dontwarn javax.annotation.Nullable
-dontwarn javax.annotation.concurrent.GuardedBy
-dontwarn javax.lang.model.element.Modifier
