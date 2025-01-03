import { useState, useEffect } from 'react';
import { Text, View, StyleSheet } from 'react-native';
import {
  useCameraDevice,
  useFrameProcessor,
  Camera,
} from 'react-native-vision-camera';
import { useTextRecognition } from 'react-native-vision-camera-ocr';
import { useRunOnJS } from 'react-native-worklets-core';
import type { TextRecognitionOptions } from '../../src/types';

export default function App() {

  const [hasPermission, setHasPermission] = useState(false);
  const [ocr, setOcr] = useState(null);
  const device = useCameraDevice('back');

  const options : TextRecognitionOptions = { language: 'latin' };
  const { scanText } = useTextRecognition(options);

  const updateResults = useRunOnJS(data => {
    console.log(data);
    setOcr(data);
  }, []);

  useEffect(() => {
    (async () => {
      const status = await Camera.requestCameraPermission();
      setHasPermission(status?.toString() === 'authorized' || status?.toString() === 'granted');
    })();
  }, []);

  const frameProcessor = useFrameProcessor(frame => {
    'worklet';

    const data = scanText(frame);

    updateResults(data);

  }, []);

  return device !== undefined && hasPermission ? (
    <>
      <Camera
        style={styles.cameraLayout}
        frameProcessor={frameProcessor}
        device={device}
        isActive={true}
      />
    </>
  ) : (
    <View>
      <Text>No available cameras</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  cameraLayout: {
    position: 'absolute',
    left: 0,
    top: 10,
    right: 0,
    bottom: 10,
  },
  closeCameraLayoutIcon: {
    position: 'absolute',
    bottom: 25,
    padding: 16,
    right: 20,
    left: 20,
    borderRadius: 20,
    alignItems: 'center',
  },
});

