module Utils;

import dlib.audio.sound;
import dlib.audio.io.wav;

GenericSound LoadWAVFile (string Path)
{
    return loadWAV (Path);
}

void SaveWAVFile (string Path, GenericSound Sound)
{
    saveWAV (Sound, Path);
}