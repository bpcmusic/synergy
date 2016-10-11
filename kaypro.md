[< BACK](readme.md)

#Connecting to the Kaypro II

Getting the Synergy II+ working with the Kaypro isn't hard, but it can be tricky if you don't know all the steps. Here is what I had to do to get it running.

####Serial Connection Cable

Having the proper serial cable is critical for communication. This is the pinout for the DB-25 connector that is required to go between the two devices

Left Signal Name | L DB-25 | R DB-25 | R SN
---|---|---|---
FG (Frame Ground) | 1 | 1 | FG
TD (Transmit Data) | 2 | 3 | RD
RD (Receive Data) | 3 | 2 | TD
RTS (Request to Send) | 4 | 5 | CTS
CTS (Clear to Send) | 5 | 4 | RTS
SG (Signal Ground) | 7 | 7 | SG
DSR (Data Set Ready) | 6 | 20 | DTR
DTR (Data Terminal Ready) | 20 | 6 | DSR

####Setting Baud Rate

Connecting is one thing, but you need to make sure that your Kaypro II is running the proper baud rate to the Synergy. The way to do this is to execute the BAUDM program on the Synergy Utilities disk and set it to 9600 (option G). You will need to do this EVERY TIME you want to connect the computer and your Synergy.

####Testing the Connection

Ok - ready to test? Here you go:

1. Connect the cable
2. Boot the Kaypro
3. Set the Baud Rate
4. Launch SYNHCS (I used the last version from 85)
5. Start your Synergy
6. Press "RESTORE" then "PROGRAM-4" on the Synergy to put it into connection test mode
7. Execute option 13 on SYNHCS "Test Synergy Link"
8. Press the Any Key ;)
9. Look for Happy Tests

####Is It Not Happy?

If it isn't, you may need to set jumpers inside the Synergy to get the baud rate set properly at that end. I didn't have to do this, but the Synergy II Manual Addendum suggests that the following jumpers set the rate (found at the font left corner of the processor board, which is the far right large board).

switch | rate
---|---
 ee | 1200 baud
 dd | 2400 baud 
cc | 4800 baud
bb | 9600  baud
aa | 19200 baud


Jumpers listed as found and oriented on the serial interface card (top to bottom). Mine was set to "bb" - 9600 baud.

####Kaypro CP/M Notes

The whole Kaypro thing can be a little confusing due to all of the variants of the operating systems and hardware models. Throw into the mix that the hardware is ancient and the drives are seriously aging. My Kaypro II works pretty well - but only with the F variant of the operating system (G just hangs the thing). I've also have some bum outer tracks on my A drive - but I've been able to successfully make copies of most of the Synergy related disks and I can successfully execute SYNHCS - they synergy editor and voice management software.

I used COPY to copy most disks; for those that failed to copy successfully, I used the following procedure:

**Copying Disks that Won't Copy with COPY:**

I had the best luck following the steps below for each disk that I wanted to copy that was failing the COPY command; it seemed more successful to format and immediately use PIP top copy as opposed to formatting all disks and then performing all of the PIP copies. Could have been superstition, but I had much better progress when I started reformatting just before my filecopy. I also wore one red shoe during the process. ;)

* Put your OS in drive A and a blank disk in drive B
* Format the disk in b using INITDISK; select option 0 for KAYPRO and press RETURN to format the disk
* Press return to exit INITDISK when the format is complete
* Type PIP in the console to get the PIP command prompt
* Replace your OS disk with the disk you want to copy
* Type "B:=A:*.*"
* When complete, replace your OS disk in drive A and hit CTRL-C to do a soft boot