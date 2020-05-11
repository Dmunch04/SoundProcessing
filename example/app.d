module example.app;

import std.stdio;

// TODO: Import sound processing

/*
void main ()
{
    version(unittest)
    {
        // Test 1
        WavFile test1 = new WavFile("Assets/Sound1.wav");
        test1.setPitch(30_000);
        test1.setDuration(test1.sound().duration + 1);
        test1.save("Assets/Result1.wav");

        // Test 2
        WavFile test2 = new WavFile("Assets/Sound2.wav");
        test2.setPitch(78_000);
        test2.setDuration(test2.sound().duration - 1);
        test2.save("Assets/Result2.wav");

        // Test 3
        test1.combine(test2);
        test1.save("Assets/Combined1.wav");

        // Test 4
        test2.combine(test1);
        test2.save("Assets/Combined2.wav");
    }
}
*/

/*
version(unittest)
{
    // Test 1
    WavFile test1 = new WavFile("Assets/Sound1.wav");
    test1.setPitch(30_000);
    test1.setDuration(test1.sound().duration + 1);
    test1.save("Assets/Result1.wav");

    // Test 2
    WavFile test2 = new WavFile("Assets/Sound2.wav");
    test2.setPitch(78_000);
    writeln(test2.duration());
    test2.setDuration(test2.sound().duration - 1);
    test2.save("Assets/Result2.wav");

    // Test 3
    test1.combine(test2);
    test1.save("Assets/Combined1.wav");

    // Test 4
    test2.combine(test1);
    test2.save("Assets/Combined2.wav");
}
*/