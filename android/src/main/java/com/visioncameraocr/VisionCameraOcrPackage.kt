package com.visioncameraocr

import com.facebook.react.ReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ViewManager
import com.mrousavy.camera.frameprocessors.FrameProcessorPluginRegistry

class VisionCameraOcrPackage : ReactPackage {
  companion object {
    init {
        FrameProcessorPluginRegistry.addFrameProcessorPlugin("scanText") { proxy, options ->
            VisionCameraTextRecognitionPlugin(proxy, options)
        }
        FrameProcessorPluginRegistry.addFrameProcessorPlugin("translate") { proxy, options ->
            VisionCameraOcrTranslatorPlugin(proxy, options)
        }
    }
}
  override fun createNativeModules(reactContext: ReactApplicationContext): List<NativeModule> {
    return listOf( RemoveLanguageModel(reactContext),VisionCameraOcrModule(reactContext))
  }

  override fun createViewManagers(reactContext: ReactApplicationContext): List<ViewManager<*, *>> {
    return emptyList()
  }
}
