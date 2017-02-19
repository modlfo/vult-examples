# Vult PureData Examples

![Vult-Synths](other/synths.png?raw=true "Vult-Synths")

A set of Vult examples where each file is a standalone module that can be compiled to PureData or used to assemble more complex patches.

All modules follow these conventions:
- Pitch: 0.1 per octave, where 0.0 corresponds to C3
- Audio: -1.0 to 1.0
- Envelopes: 0.0 to 1.0
- Gates: 0.0 to 1.0

This convention lousy correnponds to the typical Eurorack convention but divided by 10.0.

[![Build Status](https://travis-ci.org/modlfo/vult-examples.svg?branch=master)](https://travis-ci.org/modlfo/vult-examples) [![Build status](https://ci.appveyor.com/api/projects/status/ws3udr07ll08aibx?svg=true)](https://ci.appveyor.com/project/modlfo/vult-examples)



## Description

### Oscillators

| Module | Description|
|------- | ---------- |
| `osc_sine`    | Sine wave oscillator
| `osc_phd`     | CZ phase distortion oscillator
| `osc_saw`     | Saw wave with basic soft transition
| `osc_blit`    | Multi-oscillator with band-limited pulse, saw and triangle waves
| `osc_noise`   | Digital noise (not good for fixed-point)
| `osc_triangle` | Triangle wave (aliased)

### Envelopes

| Module | Description|
|------- | ---------- |
| `env_ad`      | Attack, Decay envelope
| `env_adsr`    | Attack, Decay, Sustain, Release envelope
| `env_swept`   | Moves from one value to other given a rate

### Filters

| Module | Description|
|------- | ---------- |
| `flt_svf`     | State-variable filter
| `flt_moog`    | Moog ladder filter

### Effects

| Module | Description|
|------- | ---------- |
| `fx_bitcrush` | Bitcrusher
| `fx_delay`    | Delay

### Utilities

| Module | Description|
|------- | ---------- |
| `midi_monocv` | MIDI to CV converter monophonic
| `midi_polycv` | MIDI to CV converter with 4 voices
| `midi_gates`  | MIDI to gates for a typical drum machine

### Units

| Module | Description|
|------- | ---------- |
| `unit_drum` | Kick drum 909 style

## How to compile

Requirements:

- Vult Compiler
- CMake https://cmake.org/
- C++ compiler

Install Vult:

```
$ npm install vult -g
```

Compile:

```
mkdir build
cd build
cmake ../
make
```

### Using in PureData

You need to add the path of the compiled objects (if build as show above, the `build` directory) to the search paths in the PureData preferences.

The folder `test` provides one example PureData patch per object.


