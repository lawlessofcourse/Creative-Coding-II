(
SynthDef(\chords, {
	arg freq = 440, amp = 0.707,  sustain = 2, modFreq =440, rate = 4, depth = 0.02;
	var sig, env, sig2, masterSig, combDelay;

	// env = Env.adsr(0.01*sustain, 0.2*sustain, amp*0.707, 0.2*sustain);
	env = Env.new([0,amp/2,amp/2, 0],[1,sustain, 1], 'sqr' );

	env = EnvGen.kr(env, amp, doneAction: 2);
	//sig = Mix.ar([SinOsc.ar(Vibrato.ar(DC.ar(freq), rate, depth), mul: env),Saw.ar(Vibrato.ar(DC.ar(freq/2), rate, depth), mul: env/2)]);
	sig = HPF.ar(SinOsc.ar(Vibrato.ar(DC.ar(freq), rate, depth), mul: env ), 32.703,amp );
	// sig = sig*Vibrato.ar(DC.ar(modFreq), rate, depth);
	sig = Limiter.ar(sig, 0.5);
	//sig = sig*env;
	sig = Pan2.ar(sig, 0);

	//sig = sig+FreeVerb.ar(sig, 0.33, 0.2, 0.5, amp);

	Out.ar(0, sig);

}).add;


SynthDef(\pluck, {
	arg freq = 261.63*2, amp = 0.707,
	atk = 0.001, sustain = 1, rel = 0.25, rate = 1, depth = 0.6,
	maxDel = 0.01, delay=0.01, coef = 0.1, out = 0, gate = 1, dec = 2, modFreq = 880;
	var sig, env;

	env = EnvGen.kr(Env.linen(atk, sustain, rel, amp, -2), doneAction: 2);
	sig = Pluck.ar(
		in: LPF.ar(SinOsc.ar(freq), 2000),
		trig: Impulse.kr(1),
		maxdelaytime: maxDel,
		delaytime: delay,
		decaytime: sustain,
		coef: coef,
		mul: env
	);

	sig = Pan2.ar(sig, 0);
	sig = FreeVerb.ar(sig, 0.33, 0.3, 0.5);
	sig = Limiter.ar(sig, amp);
	Out.ar(out, sig);
}).add;
)

(
SynthDef(\synthy, {
	arg freq = 440, amp = 0.707, gate = 1, sustain = 1, modFreq = 880, rate = 0.5, depth = 0.05;
	var sig, env, sig2, masterSig;
	env = Env.adsr(0.01*sustain, 0.2*sustain, amp*0.707, 0.2*sustain);


	env = EnvGen.kr(env, gate, amp, doneAction: 2);

	sig = RLPF.ar(Saw.ar(Vibrato.ar(DC.ar(freq), rate, depth), mul: env), modFreq, rq: 0.5);
	// sig = sig*Vibrato.ar(DC.ar(modFreq), rate, depth);

	sig2 = RLPF.ar(SinOsc.ar(Vibrato.ar(DC.ar(freq), rate, depth), mul: env), modFreq, rq: 0.5);


	masterSig = Pan2.ar(Mix.new([sig, sig2]), 0);
	//masterSig = FreeVerb.ar(masterSig, 0.2, mul: amp);
	masterSig = Limiter.ar(masterSig, amp);

	Out.ar(0, masterSig);

}).add.play;
)

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


(
SynthDef(\wubs2, {
	arg  freq = 110, inSigFreq = 440, freqB =698.46, freqA = 43.625, freqDur = 20, vRate = 2, vDepth= 2, amp = 0.707, freq2 = 0;
	var sig, mod, sig2, outSig, sig1, sigMix, env;

	//env = EnvGen.kr(Env.new([0,0.7,0.7,0], [5, 20, 5], 'sqr', 2));
	//env = XLine.kr(0.01, 1, 2);
	freq = XLine.kr(freqB, freqA, freqDur, doneAction: 2);
	freq2 = XLine.kr(freqA, freqB, freqDur, doneAction: 2);
	env = EnvGen.kr(Env.new([freq, freq2],[freqDur, 5], 'lin'));
	vRate = EnvGen.kr(Env.new([2, 2, 0], [15, 5], 'lin'));
	mod = Vibrato.kr(
		DC.ar(1),
		rate: vRate,
		depth:vDepth,
		delay:2,
		onset:3,
		rateVariation: 0.0,
		depthVariation:0
	);

	sig1= SinOsc.ar(env, 0.1, mul: amp);
	sig2 = Saw.ar(env, 0.1, mul:amp);

	sigMix = Mix.new([sig1, sig2]);
	sigMix = sigMix*mod;

	sig = RLPF.ar(
		in: sigMix,
		freq: XLine.kr(6000,500,freqDur),
		rq: 0.05,
		mul: amp//XLine.kr(1, 0.01, 20, amp, doneAction: 2),
	);

	sig = FreeVerb.ar(sig, mix: 0.5, room:0.35, mul: 0.2);
	sig = Pan2.ar(sig, 0);
	sig = Limiter.ar(sig, 0.7);

	Out.ar(0, sig);
}).add.play;
)

(

SynthDef(\wubsConst, {
	arg  freq = 110, inSigFreq = 440, freqA =698.46, freqB = 43.625, freqDur = 20, vRate = 0, vDepth= 2, amp = 0.707, freq2 = 0;
	var sig, mod, sig2, outSig, sig1, sigMix, env;

	//env = EnvGen.kr(Env.new([0,0.7,0.7,0], [5, 20, 5], 'sqr', 2));
	//env = XLine.kr(0.01, 1, 2);
	freq = XLine.kr(freqA, freqB, freqDur, doneAction: 2);
	freq2 = XLine.kr(freqB, freqA, freqDur, doneAction: 2);
	env = EnvGen.kr(Env.new([freq, 43.625],[freqDur, 5], 'lin'));
	vRate = EnvGen.kr(Env.new([0, 0, 2], [5, 15], 'lin'));
	mod = Vibrato.kr(
		DC.ar(1),
		rate: vRate,
		depth:vDepth,
		delay:2,
		onset:3,
		rateVariation: 0.0);

	sig1= SinOsc.ar(freqB, 0.1, mul: amp);
	sig2 = Saw.ar(freqB, 0.1, mul:amp);

	sigMix = Mix.new([sig1, sig2]);
	sigMix = sigMix*mod;

	sig = RLPF.ar(
		in: sigMix,
		freq: 500,
		rq: 0.05,
		mul: amp//XLine.kr(1, 0.01, 20, amp, doneAction: 2),
	);

	sig = FreeVerb.ar(sig, mix: 0.33, room:0.5, mul: 0.2);
	sig = Pan2.ar(sig, 0);
	sig = Limiter.ar(sig, 0.7);

	Out.ar(0, sig);
}).add.play;
)


(
SynthDef(\pluck, {
	arg freq = 261.63, amp = 0.707,
	atk = 0.01, sustain = 0.5, rel = 0.25, rate = 1, depth = 0.6,
	maxDel = 0.1, delay=0.1, coef = 0.1, out = 0, gate = 1, dec = 20, modFreq =880;
	var sig, env;

	env = EnvGen.kr(Env.linen(atk, sustain, rel, amp, -2), doneAction: 2);
	sig = Pluck.ar(
		in: LPF.ar(LFSaw.ar([freq, freq*2, freq/2, freq/4]), 2000),
		trig: Impulse.kr(3),
		maxdelaytime: maxDel,
		delaytime: delay,
		decaytime: sustain,
		coef: coef,
		mul: env
	);

	sig = Pan2.ar(sig, 0);
	sig = FreeVerb.ar(sig, 0.33, 0.5, 0.5);
	Out.ar(out, sig);
}).add.play;
)
(
//CAN I GIVE THIS AN LFO SHAPE TO MAKE INTO DUBSTEP SOUND? - DONE
SynthDef(\bassNoise, {
	arg freq = 55, amp = 0.707, gate = 1,
	atk = 0.01, rel = 0.01, sustain = 1.5,
	modFreq = 1100, rate = 2, depth = 0.05,
	iphase = 0.5, width = 0.5,
	lfoRate = 3, lfoAmpLow = 0; // where is lfoAmpLow being used?
	var sig1, sig, env, rateEnv, lfo;

	//env = EnvGen.kr(Env.linen(atk, sustain, rel, amp, -2), gate, doneAction: 2); // 1.5 SECONDS IN PLAY TIME

	lfo = LFTri.ar(lfoRate).linlin(-1,1,0,1);

	sig=RLPF.ar(
		VarSaw.ar(
			[LFSaw.kr(lfoRate, 0, 100, 55), Vibrato.kr(DC.ar(freq), rate, depth)+Crackle.ar(0.5, amp*2)],
			iphase,
			width,
			lfo,
		),
		modFreq,
		rq: 0.5,
		mul: lfo,//sig = sig * lfo; ... same thing
	);


	sig = Pan2.ar(sig, 0);
	sig = Limiter.ar(sig, amp/2);
/*	sig1 = sig+Crackle.ar(1.5, amp);
	sig = sig+sig1;*/
	//sig = sig*env;
	//sig = Pluck.ar(sig, 1, 0.2, 0.2, 3, 0.5, amp);
	Out.ar(0, sig);
}).add.play;
)
(
 //CAN I GIVE THIS AN LFO SHAPE TO MAKE INTO DUBSTEP SOUND? - DONE
SynthDef(\bassNoise2, {
	arg freq = 55, amp = 0.707, gate = 1,
	atk = 0.01, rel = 0.01, sustain = 1.5,
	modFreq = 440, rate = 0.75, depth = 0.05,
	iphase = 0.5, width = 0.5,
	lfoRate = 4, lfoAmpLow = 0; // where is lfoAmpLow being used?
	var sig1, sig, env, rateEnv, lfo;

	//env = EnvGen.kr(Env.linen(atk, sustain, rel, amp, -2), gate, doneAction: 2); // 1.5 SECONDS IN PLAY TIME

	lfo = LFTri.ar(lfoRate).linlin(-1,1,0,1);

	sig=RLPF.ar(
		VarSaw.ar(
			LFSaw.kr(lfoRate, 0, 55, 220),//Vibrato.kr(DC.ar(freq), rate, depth)+Crackle.ar(0.5, amp*2),
			iphase,
			width,
			lfo,
		),
		modFreq,
		rq: 0.5,
		mul: lfo,//sig = sig * lfo; ... same thing
	);


	sig = Pan2.ar(sig, 0);
	sig = Limiter.ar(sig, amp);
/*	sig1 = sig+Crackle.ar(1.5, amp);
	sig = sig+sig1;*/
	//sig = sig*env;
	//sig = Pluck.ar(sig, 1, 0.2, 0.2, 3, 0.5, amp);
	Out.ar(0, sig);
}).add.play;
)
 //CAN I GIVE THIS AN LFO SHAPE TO MAKE INTO DUBSTEP SOUND?
SynthDef(\bassHit, {
	arg freq = 55, amp = 0.707, gate = 1,
	atk = 0.02, sustain = 0.5, rel = 1.5,
	modFreq = 880, rate = 0, depth = 0.05,
	iphase = 0.5, width = 0.5,
	freqA = 110, freqB = 43.654, freqC = 36.708,
	freqDur1 = 0.01, freqDur2=0.75, freqC1 = 1, freqC2 = (-1);
	var sig1, sig, env, freqEnv;

	freqEnv = EnvGen.kr(Env.new([freqA, freqB, freqC], [freqDur1, freqDur2], [freqC1, freqC2]));

	env = EnvGen.kr(Env.linen(atk, sustain, rel, amp, -2), gate, doneAction: 2); // 3.02 total time

	/*rateEnv = EnvGen.kr(Env.new([0.25, 0.5,  0.5, 1, 1, 2, 2, 4, 4, 6, 6],
		                        [     1,   2,    1, 2, 1, 4, 1, 4, 1, 4 ], curve: 'lin'));*/
	sig=RLPF.ar(
		VarSaw.ar(
			Vibrato.kr(freqEnv, rate, depth)+Crackle.ar(0.5, amp*2),
			iphase,
			width,
			amp,
		),
		modFreq,
		rq: 0.5,
		mul: env
	);
	// sig = sig*Vibrato.ar(DC.ar(modFreq), rate, depth);
	//sig =Saw.ar(Vibrato.ar(DC.ar(freq), rate, depth), mul: env);

	sig = Pan2.ar(sig, 0);

	sig = Limiter.ar(sig, amp);

/*	sig1 = sig+Crackle.ar(1.5, amp);
	sig = sig+sig1;*/
	//sig = sig*env;
	//sig = Pluck.ar(sig, 1, 0.2, 0.2, 3, 0.5, amp);
	Out.ar(0, sig);
}).add.play;
SynthDef(\beautBuild, {
	arg  freq = 110, freqDur = 15, vRate = 6, vDepth= 0.2, amp = 0.707, filterFreq = 0;
	var sig, mod, sig2, outSig, sig1, sigMix, env;

	//env = EnvGen.kr(Env.new([0,0.7,0.7,0], [5, 20, 5], 'sqr', 2));
	//env = XLine.kr(0.01, 1, 2);
	//freq = XLine.kr(freqA, freqB, freqDur, doneAction: 0);
	//env =	XLine.kr(1, 0.01, 30, doneAction: 1);
	env = EnvGen.kr(Env.linen(3, 20, 7, amp, 'lin'), doneAction: 2);
	filterFreq = XLine.kr(8000, 440 ,freqDur);
	mod = Vibrato.kr(DC.ar(1), rate: vRate, depth:vDepth);

	sig1= SinOsc.ar(freq, 0.1, mul: amp);

	sig2 = Saw.ar(freq, 0.1, mul:amp);

	sigMix = Mix.new([sig1, sig2]);
	sigMix = sigMix*mod;

	sig = RLPF.ar(
		in: sigMix,
		freq: filterFreq,
		rq: 0.05,
		mul: env
	);

	sig = FreeVerb.ar(sig, mix: 0.33, room:0.5, mul: amp);
	sig = Pan2.ar(sig, 0);
	sig = Limiter.ar(sig, 0.7);

	Out.ar(0, sig);
}).add;

SynthDef(\beautConstant, {
	arg  freq = 110, freqDur = 15, vRate = 6, vDepth= 0.2, amp = 0.707, filterFreq = 0;
	var sig, mod, sig2, outSig, sig1, sigMix, env, rate;

	filterFreq = ((freq*2)*2);

	env = EnvGen.kr(Env.linen(0.2, 3, 1, 1, 'lin'), doneAction: 2);



	mod = Vibrato.kr(DC.ar(1), rate: vRate, depth:vDepth);

	sig1= SinOsc.ar(freq, 0.1, mul: amp);

	sig2 = Saw.ar(freq, 0.1, mul:amp);

	sigMix = Mix.new([sig1, sig2]);
	sigMix = sigMix*mod;

	sig = RLPF.ar(
		in: sigMix,
		freq: filterFreq, // SET CONTROL KNOB FOR FREQ 440 - 880 ish > map to keyboard?
		rq: 0.05,
		mul: env
	);

	sig = FreeVerb.ar(sig, mix: 0.33, room:0.5, mul: amp);
	sig = Pan2.ar(sig, 0);

	sig = Limiter.ar(sig, amp);

	Out.ar(0, sig);
}).add;
//Set rate and depth control on Vibrato to either OSC device or Midi Device. Change doneAction so it plays forever.. fade out when done(set db in pbind to controller to fade out?).
(
SynthDef(\wubs3, { //freq is at F2 filterFreq is F4
	arg  freq = 87.307, freqDur = 15, vRate = 3, vDepth= 0.9, amp = 0.707, filterFreq = 0,
	mix = 0.33, room = 0.5, bend = 0;

	var sig, mod, sig2, sig1, env;

	filterFreq = ((freq*2)*2);

	env = Env.linen(0.2, 17, 3,  1, 'lin');
	env = EnvGen.kr(env, doneAction: 2);

	freq = Env.new([220, 220, 261.63, 261.63, 293.67, 293.67, 220, 196,  196 ]/2,
		           [    3,   1,      4,      1,      4,      1,   3,    3 ], 'lin');// 20 total time
	freq = EnvGen.kr(freq, gate: 1, doneAction: 2);

	mod = Vibrato.kr(DC.ar(1), rate: vRate, depth:vDepth);

	sig1= SinOsc.ar(freq, 0.1, mul: amp);
	sig2 = Saw.ar(freq, 0.1, mul:amp);
	sig1 = RHPF.ar(
		in: sig1,
		freq: filterFreq, // filterFreq is (freq*2)*2
		rq: 0.05,
		mul: mod,
	);sig2 = RLPF.ar(
		in: sig2,
		freq: 293.67, //D4
		rq: 0.05,
		mul: mod,
	);
	sig = Mix.new([sig1, sig2]);
	sig = FreeVerb.ar(sig, mix: mix, room: room, mul: env);
	sig = Pan2.ar(sig, 0);
	sig = Limiter.ar(sig, amp/2);

	Out.ar(0, sig);
}).add.play;
)
SynthDef(\buildUp, {
	var env, sig, sig2, outSig;
	env = EnvGen.kr(Env.new([0,1,1,0], [2, 10, 3]), doneAction: 2);
	sig = RLPF.ar(
		in: Saw.ar(XLine.kr(50, 200, 10),0.1),
		freq: XLine.kr(8000,400,5),
		rq: 0.05,
		mul: env
	);
	sig2 = RLPF.ar(
		in: Saw.ar(XLine.kr(start: 40, end: 150, dur: 10), 0.1),
		freq: SinOsc.ar(XLine.kr(0.7, 300, 20), 0, 3600, 4000),
		mul: env
	);
	outSig = Mix.new([sig, sig2]);
	outSig= Limiter.ar(outSig, 1);
	Out.ar(0, outSig!2);
}).add;
// MY OWN KICK BASED OFF OF SOUND ENGRAVER'S KICK
SynthDef(\deepKick, {
	arg freqA = 110, freqB = 87.307, freqC = 43.654, freqDur1=0.07, freqDur2=1.75, freqC1 = 1, freqC2 = (-1),
	atk=0.01, rel=0.99, curve=(-3), amp=0.707, pan=0, out=0;

	var sig, env, freqEnv;

	freqEnv = EnvGen.kr(Env.new([freqA, freqB, freqC], [freqDur1, freqDur2], [freqC1, freqC2]));

	env = EnvGen.kr(Env.perc(atk, rel, 0.707, -2), doneAction: 2);

	sig = SinOsc.ar(freqEnv, pi/2, env);

	sig = Pan2.ar(sig, pan, amp);

	Out.ar(out, sig);
}).add;
//DERIVED FROM NATHAN HO'S CLAP
SynthDef(\clap, {
    arg out = 0, amp = 0.707, pan = 0, dur = 1;
    var env1, env2, sig, noise1, noise2;

    // noise 1 - 4 short repeats
    env1 = EnvGen.ar(
        Env.new(
            [0, 1, 0, 0.9, 0, 0.7, 0, 0.5, 0],
            [0.001, 0.009, 0, 0.008, 0, 0.01, 0, 0.03],
            [0, -3, 0, -3, 0, -3, 0, -4]
        )
    );

    noise1 = PinkNoise.ar(env1);
    noise1 = RHPF.ar(noise1, 600, rq: 1, mul: amp);
    noise1 = RLPF.ar(noise1, XLine.kr(7200, 4000, 0.03), rq: 1, mul: amp);
    noise1 = BPF.ar(noise1, 1620, 3, amp);

    // noise 2 - 1 longer single
    env2 = EnvGen.ar(Env.perc(0.02, 0.5, amp, -6), doneAction:2);

    noise2 = PinkNoise.ar(env2);
    noise2 = RHPF.ar(noise2, 1000, rq: 1, mul: amp);
    noise2 = RLPF.ar(noise2, 7600, rq: 1, mul: amp);
    noise2 = BPF.ar(noise2, 1230, 0.7, 0.7);

	sig = Mix.new([noise1, noise2]);
	sig = Pan2.ar(sig,pan,amp);
    Out.ar(out, sig );
}).add;

// I CAN'T GET highHat TO PLAY THROUGH A PDEF, WHY? I HAD IT WORKING FOR OVER 10 MINUTES THEN IT STOPPED PLAYING THROUGH THE PDEF

SynthDef(\highHat, {
    arg out = 0, pan = 0, amp = 0.707, freqA = 4000, freqB = 4200;
    var env, sig;

    env = EnvGen.ar(Env.perc(0.001, 0.1, curve: -8), doneAction: 2);
	sig = Mix(BPF.ar(WhiteNoise.ar(env), [freqA, freqB], [0.2, 0.6], [amp, amp*0.4]));

//	sig = sig * In.kr(~hatVol);
    Out.ar(out, sig!2);
}).add;
)

Env.perc(0.001, 0.3, curve: -4).plot

