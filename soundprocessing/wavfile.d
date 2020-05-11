module soundprocessing;

import std.conv;

import dlib.audio.sound;

import soundprocessing.utils;

/++
 + The WavFile class
 +/
public class WavFile
{
    /++
     + Constructs a new `WavFile` object by arguments
     +/
    public static WavFile construct(double duration, uint pitch, string path = "")
    {
        throw new Exception("Method not implemented yet!");
    }

    private {
        GenericSound _sound;
        double _duration;
        uint _pitch;
        size_t _dataSize;
        WavFile[] _files;
        string _filePath;
    }

    public {
        /++
         + The `GenericSound` object for the file
         +/
        @property GenericSound sound() { return _sound; }

        /++
         + The duration of the sound (seconds)
         +/
        @property double duration() { return _duration; }

        /++
         + The pitch of the sound (sample rate)
         +/
        @property uint pitch() { return _pitch; }

        /++
         + The total data size for the file (including all sub files)
         +/
        @property size_t dataSize() { return _dataSize; }

        /++
         + An array of all sub files in the file
         +/
        @property WavFile[] files() { return _files; }

        /++
         + The path of the wav file. If the `WavFile(GenericSound)` constructor is used, the default value is ""
         +/
        @property string filePath() { return _filePath; }
    }

    /++
     + Takes in a path to the wav file to be read from
     +/
    this(string path)
    {
        this(loadWAVFile(path));
    }

    /++
     + Takes in a sound object and constructs the file using the sound
     +/
    this(GenericSound sound)
    {
        this._sound = sound;
        this._duration = _sound.duration;
        this._pitch = _sound.sampleRate;
        this._dataSize = sound.data.length.to!size_t;
        this._files = new WavFile[1];
        _files[0] = this;

        this._filePath = "";
    }

    /++
     + Saves the object into a file. `path`'s default value is the objects file path
     +/
    public void save(string path = _filePath)
    {
        if (path.length == 0) throw new Exception("Output path may not be empty!");

        GenericSound newSound = new GenericSound(
            _dataSize,
            _sound.sampleSize.to!ulong,
            _duration,
            _sound.channels,
            _pitch,
            _sound.bitDepth,
            _sound.sampleFormat
        );

        int total = 0;
        foreach (WavFile file; _files)
        {
            GenericSound sound = file.sound();
            foreach (ulong i; 0..sound.size)
            {
                newSound[0, total] = sound[1, i];
                total++;
            }
        }

        saveWAVFile(path, newSound);
    }

    /++
     + Combines the file's sound with another file's sound
     +/
    public void combine(WavFile target)
    {
        // TODO: We should also include all `target`'s sub files?

        _dataSize += target.dataSize();

        WavFile[] tempFiles = _files;
        _files = new WavFile[tempFiles.length + 1];

        foreach (ulong i; 0..tempFiles.length)
        {
            _files[i] = tempFiles[i];
        }

        _files[tempFiles.length] = target;
    }

    /++
     + Sets the play duration (seconds)
     +/
    public void setDuration(double duration)
    {
        _duration = duration;
    }

    /++
     + Sets the pitch (sample rate)
     +/
    public void setPitch(uint pitch)
    {
        _pitch = pitch;
    }
}

unittest
{
    WavFile test1 = new WavFile("Assets/Sound1.wav");
    test1.setPitch(30_000);
    test1.setDuration(test1.sound().duration + 1);
    
    WavFile test2 = new WavFile("Assets/Sound2.wav");
    test2.setPitch(78_000);
    writeln(test2.duration());
    test2.setDuration(test2.sound().duration - 1);

    test1.combine(test2);
    test1.save("Assets/UnittestCombined1.wav");

    test2.combine(test1);
    test2.save("Assets/UnittestCombined2.wav");
}