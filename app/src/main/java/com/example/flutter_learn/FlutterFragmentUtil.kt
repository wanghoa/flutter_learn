package com.example.flutter_learn

import android.content.Context
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin

object FlutterFragmentUtil {
    private const val HIDE_BOTTOM = "hideBottomBar"
    private const val CLOSE_CAMERA = "closeCamera"
    private const val TAG = "Flutter"

    fun createFlutterFragment(
        context: Context,
        name: String,
        initRoute: String = "/"
    ): FlutterFragment {
        val id = "${MainActivity.ENGINE_ID}"
        var flutterEngine = FlutterEngineCache.getInstance().get(id)
        if (null == flutterEngine) {
            flutterEngine = FlutterEngine(context)
            flutterEngine.navigationChannel.setInitialRoute(initRoute)
            flutterEngine.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
            FlutterEngineCache.getInstance().put(id, flutterEngine)
            setMethodChannel(context, flutterEngine)
        }
        flutterEngine.plugins.add(SharedPreferencesPlugin())
        return FlutterFragment.withCachedEngine(id).shouldAttachEngineToActivity(true)
            .build() as FlutterFragment

    }

    private fun setMethodChannel(context: Context, flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor,
            "CommonChannel"
        ).setMethodCallHandler { call, resutl ->
            when (call.method) {
                HIDE_BOTTOM -> {
                    (context as MainActivity).hideBottomButton(call.argument<Boolean>("hide") == true)
                }
                CLOSE_CAMERA ->{
                    (context as MainActivity).closeCamera()
                }
                else -> {
                    resutl.notImplemented()
                }

            }
        }


    }

}