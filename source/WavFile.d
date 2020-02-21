module WavFile;

import dlib.audio.sound;

import Utils;

public class WavFile
{
    protected:
    GenericSound Sound;
    double Duration;
    uint Pitch;

    private:
    string FilePath;

    public:
    this (string FilePath)
    {
        this.Sound = LoadWAVFile (FilePath);
        this.Duration = Sound.duration;
        this.Pitch = Sound.sampleRate;

        this.FilePath = FilePath;
    }

    public void Save ()
    {
        Save (this.FilePath);
    }

    public void Save (string FilePath)
    {
        GenericSound NewSound = new GenericSound (
            cast (size_t) this.Sound.data.length,
            cast (ulong) this.Sound.sampleSize,
            this.Duration,
            this.Sound.channels,
            this.Pitch,
            this.Sound.bitDepth,
            this.Sound.sampleFormat
        );

        foreach (Index; 0 .. this.Sound.size)
        {
            NewSound[0, Index] = this.Sound[1, Index];
        }

        SaveWAVFile (FilePath, NewSound);
    }

    public GenericSound GetSound ()
    {
        return Sound;
    }

    public double GetDuration ()
    {
        return Duration;
    }

    public void SetDuration (double Duration)
    {
        this.Duration = Duration;
    }

    public uint GetPitch ()
    {
        return Pitch;
    }

    public void SetPitch (uint Pitch)
    {
        this.Pitch = Pitch;
    }
}