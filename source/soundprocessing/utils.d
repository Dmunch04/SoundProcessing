module soundprocessing.utils;

import dlib.audio.sound;
import dlib.audio.io.wav;

/++
 + Wrapper around dlib's loading function to load from a wav file
 +/
GenericSound loadWAVFile(string path)
{
    return loadWAV(path);
}

/++
 + Wrapper around dlib's saving function to save to a wav file
 +/
void saveWAVFile(string path, GenericSound sound)
{
    saveWAV (sound, path);
}