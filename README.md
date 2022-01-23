# OC Scripts for a GTNH Modpack
All scripts that are provided here are suited only for GTNH but could work on other Modpacks too.

# Assline Automation
Currently not working in a public enviroment. 
Needed much Piping work in Minecraft itself.

# Offworld Overwatch
This is a small Script that uses the Wireless Redstone System in GTNH
to receive a Redstone Signal when the Pump or Miner (just any Multiblock Machine) when it needs Maintenance

Usage:

Just add a new Row in the Signals Table as described below. Thats it!
```
signals[i] = { 
               Signal_Maintenance = Wireless Frequency Number,
               Signal_Name = Display Name on the Screen as a String,
               good = Alternate text as a String when there is no Signal. otherwise just use nil,
               bad = Alternate text as a String when there is a Signal. otherwise just use nil,
               align = Left or Right (use Variables),
               row = Wich Row the Line will be in. (7, 9, 11, 13, 15, 17)
             }
```

This are Examples to be used on my Server

```
signals[1] = { Signal_Maintenance = 1869, Signal_Name = "Moon, Helium-3:", good = nil, bad = nil, align = align_pump, row = 7 }
signals[2] = { Signal_Maintenance = 2887, Signal_Name = "Radon, Production:", good = "  High ", bad = "     Low    ", align= align_pump, row = 15 }
```

# PSS Control
This is a Script that shows the Percentage of a PowerSubStation and gives out a Redstone Signal at a specific Percentage value to Turn your Energy production on.

Usage:
Just slap a Adapter on the Controlblock of your PSS and it should work.
Redstone Signal: 35% and below.
it stays on until it reached 95%

ToDo: 
- [ ] CleanUP the Code for easier edit
- [ ] Do the new UI Design
- [ ] Make the UI more Dynamic. (Read the SensorInformation() for Voltage)
- [ ] Do some Maths to Display Charge Rate and how long it needed to Charge or deplete
