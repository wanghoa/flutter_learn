import 'package:camera/camera.dart';
import 'package:flutter_learn_module/channel_util.dart';
import 'package:get/get.dart';

class CameraPageController extends GetxController {
  var _cameraIndex = 0.obs;
  var _recording = false.obs;
  var _flash = false.obs;

  CameraController? _cameraController;
  late List<CameraDescription> _cameras;
  var _cameraControllerObs = Rx<CameraController?>(null);

  void onTapClose() {
// 调用MethodChannel 通知Native 关闭flutter 容器
    ChannelUtil.closeCamera();
  }

  void init() {
    //1.等待camera 初始化
    availableCameras().then((value) {
      _cameras = value;
      _initCameraController();
    });
  }

  CameraController? get cameraController => _cameraControllerObs.value;

  int get cameraIndex => _cameraIndex.value;

  bool get flash => _flash.value;

  set flash(bool enable) => _flash.value = enable;

  set cameraIndex(int cameraIndex) => _cameraIndex.value = cameraIndex;

  bool get recording => _recording.value;

  set recording(bool recording) => _recording.value = recording;

  void _initCameraController() {
    //2.选择具体camera 来创建cameraController
    _cameraController =
        CameraController(_cameras[cameraIndex], ResolutionPreset.max);
    //3.等待cameraController初始化
    _cameraController?.initialize().then((_) {
      _cameraControllerObs.value = _cameraController;
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            break;
          default:
            break;
        }
      }
    });
  }

  void onSwitchCamera() {
    if (_cameras.length > 1) {
      cameraIndex = cameraIndex == 0 ? 1 : 0;
      _initCameraController();
    }
  }

  Future<void> takePhotoAndUpload() async {
    if (recording) {
      recording = false;
      XFile? file = await _cameraController?.stopVideoRecording();
      print('video_path: ${file!.path}');
    } else {
      recording = true;
      _cameraController?.startVideoRecording();
    }
  }
}
