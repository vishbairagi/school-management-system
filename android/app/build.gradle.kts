plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}
android {
    namespace = "com.example.school_management"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    defaultConfig {
        applicationId = "com.example.school_management"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    compileOptions {
        // Enable Java 8+ features
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
        isCoreLibraryDesugaringEnabled = true

    }

    // Kotlin compiler options
    kotlinOptions {
        jvmTarget = "1.8"
    }

    // Enable desugaring for Java 8+ APIs
    buildFeatures {
        // nothing else needed here
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}
dependencies {
    implementation("androidx.core:core-ktx:1.12.0")
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
flutter {
    source = "../.."
}
