(
MIDIClient.init;
MIDIIn.connectAll;
~midiOut = MIDIOut.newByName("IAC Driver", "Bus 1"); //change this to your output
)

~midiOut.noteOn(0, 64, 90); // send a note as a test
~midiOut.noteOff(0, 44, 90); // turn that note off
~midiOut.control(0, 14, 127); // chan, ccNum, ccVal value test, good for mapping

(
Pdef(
	\pat,
        Pbind(
		\type, \midi,
		\midiout, ~midiOut,
		\degree, Pseq([
            Scale.harmonicMinor,
            Scale.aeolian,
            Scale.harmonicMinor,
            Scale.minor,
            Scale.melodicMinor
        ], inf),
		\degree, Pseq([ 0, 5, 3, 6, 7, 1, 2, 4 ], inf),
		\amp, Pseq([ (1/2), (1/1), (3/4), (1/4), (1/8) ], inf),
		\dur, Pseq([
            (1/1), (1/2), (1/3), (1/4), (1/5), (1/6), (1/7), (1/8), (1/9),
            (1/10), (1/11), (1/12), (1/13), (1/14), (1/15), (1/16), (1/17),
            (1/18), (1/19), (1/21), (1/19), (1/17), (1/15), (1/13), (1/11),
            (1/9), (1/7), (1/5), (1/3), (1/1), (2/1), (4/1), (8/1), (7/1),
            (5/1), (4/1), (2/1)
        ], inf),
		\octave, Pseq([ 0, 4, 2, 3, 4, 0, 2, 1, 5, 4, 6, 3, 2 ], inf),
	);
).play;

CmdPeriod.doOnce {
    // release any hanging notes
    ~midiOut.allNotesOff(0);
};
)