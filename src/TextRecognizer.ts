import { NativeModules, Platform } from 'react-native';
import type { PhotoOptions, Text } from './types';

export async function TextRecognizer(options: PhotoOptions): Promise<Text> {
  const { TextRecognizerModule } = NativeModules;
  const { uri, orientation } = options;
  if (!uri) {
    throw Error("Can't resolve img uri");
  }
  if (Platform.OS === 'ios') {
    return await TextRecognizerModule.process(
      uri.replace('file://', ''),
      orientation || 'portrait'
    );
  } else {
    return await TextRecognizerModule.process(uri);
  }
}
