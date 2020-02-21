module source.app;

import WavFile;

void main ()
{
    // Test 1
    WavFile AudioTest1 = new WavFile ("Assets/Sound1.wav");
    AudioTest1.SetPitch (30_000);
    AudioTest1.SetDuration (AudioTest1.GetSound ().duration + 1);
    AudioTest1.Save ("Assets/Result1.wav");

    // Test 2
    WavFile AudioTest2 = new WavFile ("Assets/Sound2.wav");
    AudioTest2.SetPitch (78_000);
    AudioTest2.SetDuration (AudioTest2.GetSound ().duration - 1);
    AudioTest2.Save ("Assets/Result2.wav");
}