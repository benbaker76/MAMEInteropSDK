# MAME Interop SDK

Developed by [Ben Baker / R Belmont / Howard Casto / MAME Team]

## Description

The MAME Interop SDK is a collection of source code projects to facilitate writing applications that communicate with MAME using its built in output system developed by the MAME Team.

The communication with MAME is achieved by using MAME32.dll (x86) or MAME64.dll (x64). The dll(s) are originally based off the ledutil.c code example included in the MAME archive with additional code added for network communication. It demonstrates reading outputs from MAME using the Windows messaging system using a hidden window or more recently network output on localhost port 8000.

## Enable Output

To enable MAME's output you will need to edit your mame.ini file with the following line:
```
#
# OSD OUTPUT OPTIONS
#
output                    windows
```

NOTE: Alternatively you can set this value to 'network' to use the network output system. In this case make sure you initialize MAME Interop with the `useNetworkOutput` parameter set to true.

## Source Code

It contains source code projects for the following languages:

- C#
- C++
- Delphi
- VB6
- VB.NET

## Example Outputs

Run digdug while one of the source code example exe's are running and you will see the outputs display in the app's TextBox. When you select Player1/Player2 coin buttons, digdug flashes the led's for Player1/Player2 start buttons.

The output looks like this:

```
mame_start
id 0 = 'digdug'
id 12346 = 'led0' <-- Player 1 Coin button is pressed
update_state: id=12346 (led0)  state=1
update_state: id=12346 (led0)  state=0
update_state: id=12346 (led0)  state=1
update_state: id=12346 (led0)  state=0
update_state: id=12346 (led0)  state=1
update_state: id=12346 (led0)  state=0
update_state: id=12346 (led0)  state=1
update_state: id=12346 (led0)  state=0
id 12345 = 'led1' <-- Player 2 Coin button is pressed
update_state: id=12345 (led1)  state=1
update_state: id=12346 (led0)  state=1
update_state: id=12345 (led1)  state=0
update_state: id=12346 (led0)  state=0
update_state: id=12345 (led1)  state=1
update_state: id=12346 (led0)  state=1
update_state: id=12345 (led1)  state=0
update_state: id=12346 (led0)  state=0
mame_stop
```

If you run the ledutil.exe program that comes with Mame it will make the LED outputs of digdug flash your Numlock and Capslock keys. Essentially it is mapping the LED outputs to the keyboard's LED's. For example this output could be re-directed to a LEDWiz device instead.

Other examples include Terminator 2's recoil and Afterburners Force Feedback. (Not Implemented yet.)
Outputs on real arcade games currently supported in Mame range from simple status LEDs that were on the pcb of the game, rank lamps, solenoids, motors, speedomoters, segmented displays and basically anything you can think of.  If you know of a game that had some sort of output and that output is not implemented in Mame, you need to track down as much info on the game as possible and either fix the driver or send it to the attention of one of the MAME developers so they can hopefully add support. Note that real schematics would be necessary, as simply knowning an output exists isn't enough.

## Supported Games

They include but are not limited to:

- Any game that flashed the coin lights before the output upgrade.
- Gorf
- Prop cycle
- Beatmania / HiphopMania Games
- Lunar Lander
- All Para Para and Keyboardmania games.

## Supported ROMs

These are total approximations for Mame 0.111

- 1477 ROMs support led outputs
- 33 ROMs support lamp outputs
- 31 ROMs support digit outputs

## ledx
```
1941, 1941j, 1944, 1944j, 19xx, 19xxa, 19xxh, 19xxj, 19xxjr1, 3stooges, 3wonders, 3wonderu, 4in1, 7jigen, 8ball, 8ball1, 8bpm, abaseb, abaseb2, abscam, aceattaa, aceattac, acitya, afighter, agallet, agentx1, agentx2, agentx3, agentx4, ajax, ajaxj, alexkid1, alexkidd, alibaba, alienar, alienaru, aliensy1, aliensy2, aliensy3, aliensyn, alphaona, alphaone, altair, altbeaj1, altbeaj3, altbeas2, altbeas4, altbeas5, altbeasj, altbeast, animaljr, aquarush, ar_airh, ar_bios, ar_bowl, ar_dart, ar_fast, ar_ldrb, ar_ldrba, ar_ninj, ar_rdwr, ar_sdwr, ar_socc, ar_spot, ar_sprg, ar_xeon, arcadia, area88, argusg, armchm2o, armchmp2, armora, armorap, armorar, armwar, armwara, armwarr1, armwaru, astdelu1, astdelu2, astdelux, asterock, asteroi1, asteroib, asteroid, asteroid, astrocde, atarifb, atarifb, atarifb1, atarifb4, atarisy1, atomicp, aurail, aurail1, aurailj, avalnche, avalnche, avsp, avspa, avsph, avspj, avspu, azurian, bagmanmc, balsente, baraduka, barrier, batcir, batcira, batcirj, batman2, battles, bayrout1, bayroute, bayroutj, bayrtbl1, bayrtbl2, beastf, bezerk, bigbucks, bigrun, bladestl, bladestl, bladstle, blast30, blaster, blastkit, blkhole, bloods11, bloods21, bloods22, bloodstm, bm1stmix, bm2ndmix, bm2ndmxa, bm4thmix, bm5thmix, bm6thmix, bmcompm2, bmcompmx, bmcorerm, bmdct, bodyslam, bombbee, bongo, bosco, boscomd, boscomdo, boscoo, boscoo2, botss, boxer, boxingb, brickzn, brickzn3, bsktball, bssoccer, bubbles, bubblesp, bubblesr, buckrog, buckrogn, buggychl, buggychl, buggycht, bullet, bullsdrt, burglarx, bwcasino, bwidow, canyon, canyonp, captcomj, captcomm, captcomu, cascade, casino5, castfant, catacomb, catapult, caterplr, cave, cawing, cawingj, cawingr1, cawingu, cbdash, cbnj, cbtime, cburnrb2, cburnrub, ccastle1, ccastle2, ccastle3, ccastlef, ccastleg, ccastlep, ccastles, ccastles, cdiscon1, centipd2, centipdb, centiped, centiped, centtime, cexplore, cfghtice, cflyball, cgraplop, cgraplp2, checkmaj, checkman, chewing, chikij, choko, chwy, cidelsa, cinemat, cischeat, cischeat, clapapa, clapapa2, cloak, cloakfr, cloakgr, cloaksp, clocknch, cloud9, cluckypo, cmissnx, cnights2, cnightst, colony7, colony7a, commsega, copsnrob, cosmos, cotton, cottong, cottonj, cottonu, cppicf, cppicf2, cprobowl, cprogolf, cprosocc, cps1, cps2, cptennis, crater, crush, crush2, crush3, crush4, csclub, cscluba, csclubh, csclubj, cscrtry, cscrtry2, cshift, csuperas, csweetht, cterrani, ctisland, ctislnd2, ctislnd3, ctornado, ctrpllrp, ctsttape, curvebal, cutieq, cvs, cworld2j, cybots, cybotsj, cybotsu, czeroize, dacholer, daimakai, daiskiss, darkwar, dazzler, dcs, ddenlovr, ddonpach, ddonpchj, ddsom, ddsoma, ddsomb, ddsomj, ddsomjr1, ddsomr1, ddsomr2, ddsomr3, ddsomu, ddsomur1, ddtod, ddtoda, ddtodh, ddtodj, ddtodjr1, ddtodr1, ddtodu, ddtodur1, ddux, ddux1, dduxbl, dealer, decocass, defcmnd, defence, defender, defendg, defendw, defense, defndjeu, deltrace, demndrgn, demoderm, demon, destroyr, destryer, devilfsg, devstor2, devstor3, devstors, dfeveron, digdug, digdug2, digdug2o, digduga1, digdugat, digdugb, diggerc, dimahoo, dingo, dingoe, dino, dinoj, dinou, djmain, dkongjrm, dominos, donpachi, donpachk, donpacjp, donpackr, draco, dragoona, dragoonj, dragrace, dragrace, dremshpr, drgnbstr, drgpunch, drivedge, drivfrcb, drivfrcg, drivfrcp, dstlk, dstlka, dstlku, dstlkur1, dumpmtmt, dunkshot, dynax, dynwar, dynwarj, dzigzag, eagle, eagle2, eagle3, ebases, ecofghta, ecofghtr, ecofghtu, eggor, ehrgeiz, ehrgeiza, endurob2, endurobl, enduror, enduror1, eolith, epos, esb, esprade, espradej, espradeo, eswat, eswatbl, eswatj, eswatu, exctleag, exodus, eyes, eyes2, eyeszac, f15se, f15se21, f1gpstar, f1gpstr2, fantazia, fantjour, fantzon1, fantzone, feversos, ffight, ffightj, ffightj1, ffightu, ffightua, fgtlayer, findout, firebeas, firetrk, flyball, forgottn, fort2b, fort2ba, fpoint, fpoint1, fpointbj, fpointbl, frogg, funkyfig, g13knd, gaelco3d, gaia, galaga, galaga3, galaga3a, galaga3m, galagamf, galagamk, galagamw, galagao, galap1, galap4, galapx, galaxiaj, galaxian, gallag, galmidw, galmidwo, galturbo, gaplus, gaplusa, gapluso, garuka, gatsbee, geebee, geebeeg, genpeitd, gepoker, gepoker1, gepoker2, gepoker3, getrivia, gghost, ggreats2, ghlpanic, ghouls, ghoulsu, gigawing, gimeabrk, gmahou, gmgalax, gokuparo, goldbug, goldnabl, goldnax1, goldnax2, goldnax3, goldnaxe, goldnaxj, goldnaxu, golgo13, gorf, gorfpgm1, gorkans, gottlieb, gravitar, gravitr2, gravp, greatgun, gridlee, grobda, grobda2, grobda3, grudge, gs4002, gs4002a, gt101c, gt101c1, gt102b, gt102c, gt102c1, gt102c2, gt102c3, gt103, gt103a, gt103a1, gt103a2, gt103a3, gt103a4, gt103aa, gt103ab, gt103asx, gt2k, gt2ks100, gt2kt500, gt3d, gt3dl191, gt3dl192, gt3ds192, gt3dt211, gt3dt231, gt3dv14, gt3dv15, gt3dv16, gt3dv17, gt3dv18, gt5, gt507uk, gt97, gt97s121, gt97t240, gt97v120, gt97v121, gt97v122, gt98, gt98s100, gt98t303, gt98v100, gt99, gt99s100, gt99t400, gtclassc, gtclassp, gtcls100, gteikob2, gteikokb, gteikoku, gtroyal, gtsuprem, gutangtn, guwange, gwinga, gwingj, hanakanz, hanamai, hangly, hangly2, hangly3, hangon, harddrb5, harddrb6, harddrc1, harddrcb, harddrcg, harddrg4, harddriv, harddriv, harddrj6, harddrv1, harddrv2, harddrv3, harddrvb, harddrvc, harddrvg, harddrvj, hardhea2, hardhead, hardhedb, hardyard, hardyd10, harem, hattrick, hdrivaip, hdrivair, heartatk, hero, hexpool, hidctch2, hidctch3, hidnctch, hkagerou, hmcompm2, hmcompmx, hnkochou, hnoridur, hopmappy, hotchase, hotdogst, hotmemry, hunchbak, hunchbkg, huncholy, hwchamp, igmo, inca, indytem2, indytem3, indytem4, indytemc, indytemd, indytemp, inferno, insector, irobot, itech32, jackrab2, jackrabs, jackrabt, jantouki, jin, joust, joust2, joustr, joustwr, joyman, jumpbug, jumpbugb, jumpshot, jumpshtp, jungler, junglers, jyangoku, kaitei, kaiteik, kickboy, kingbalj, kingball, kngtmare, knights, knightsj, knightsu, kod, kodb, kodj, kodu, konamigx, kopunch, korokoro, korosuke, krull, ladybugg, landbrk, landbrka, lbgrande, le2, le2j, le2u, levers, liberat2, liberatr, lizwiz, llander, llander1, lockon, locomotn, logger, lostwrld, lottofun, luctoday, lunarba1, lunarbat, m075, mach3, magworm, mainev2p, mainevt, mainevto, majxtal7, maketrax, maketrxb, mappy, mappyj, marble, marble2, marble3, marble4, maxrpm, maya, mayday, maydaya, maydayb, mazerbla, mazerbla, mazinger, mbomberj, mbombrd, mbombrdj, mbrush, mcnpshnt, mcr3, mdhorse, megadon, megaman, megaman2, megamn2a, mercs, mercsj, mercsu, mercsua, merit, meteorts, metmqstr, metrocra, metrocrs, mhavoc, mhavoc2, mhavocp, mhavocrv, micro3d, milliped, millpac, minigol2, minigolf, missile, missile2, mjangels, mjchuuka, mjdchuka, mjdialq2, mjelct3, mjelct3a, mjelctrn, mjfriday, mjleague, mjmyster, mjreach1, mmatrix, mmatrixj, mmpanic, montecar, monymony, moonal2, moonal2b, moonaln, mooncrgx, mooncrs2, mooncrs3, mooncrsa, mooncrsb, mooncrsg, mooncrst, mooncrsu, moonqsr, motos, mpangj, mplanets, mplanuk, mrdrillr, mrtnt, mschamp, msh, msha, mshb, mshh, mshj, mshjr1, mshu, mshutlj2, mshuttle, mshuttlj, mshvsf, mshvsfa, mshvsfa1, mshvsfb, mshvsfb1, mshvsfh, mshvsfj, mshvsfj1, mshvsfj2, mshvsfu, mshvsfu1, mspacmab, mspacman, mspacmat, mspacmbe, mspacmnf, mspacpls, msword, mswordj, mswordr1, mswordu, mtwins, mvp, mvpj, mvsc, mvsca, mvscar1, mvscb, mvsch, mvscj, mvscjr1, mvscu, myqbert, mysticm, mzrblzra, namcos12, namcos86, nametune, navarone, nb1413m3, nemo, nemoj, neruton, nettoqc, newpuc2, newpuc2b, newpuckx, nhidctch, nitedrvr, nitedrvr, nmaster, nmouse, nmouseb, nrallyx, nstocker, nwarr, nwarrb, nwarrh, omega, omegrace, omni, opengol2, opengolf, orbit, orbitron, othunder, othundrj, othundu, othunduo, otwalls, outline, overdriv, ozon1, pacapp, pacapp2, pacappsp, pacgal, pacheart, pacland, pacland2, pacland3, paclandm, pacman, pacmanbl, pacmanf, pacmod, pacnchmp, pacnpal, pacnpal2, pacplus, paintrlr, pairs, pairsa, pang3, pang3j, passht4b, passsht, passshta, passshtb, passshtj, pckeybrd, peterpak, pfghtj, pgear, pgearr1, phozon, phrcraze, phrcrazs, piranha, piranhah, piranhao, pisces, piscesb, pitboss, playball, plegendj, plegends, pnickj, polepos, polepos1, polepos2, poleposa, poleps2a, poleps2b, ponpoko, ponpokov, poolshrk, pop_hh, porky, portrait, portrait, portrata, powerdrv, profpac, progear, progeara, progearj, ptblank2, puckman, puckmana, puckmanf, puckmanh, puckmod, punisher, punishrj, punishru, puzldama, puzzlekg, pwrins2j, pwrinst2, pzloop2j, qad, qadj, qb3, qbert, qberta, qbertjp, qbertqub, qberttst, qbtrktst, qndream, qtono2, quantum, quantum1, quantump, quart2, quart21, quartet, quartet1, quiz, quiz211, quiz365, quiz365t, quizchq, quizchql, quiztvqq, qwak, raccoon, racedcb4, racedcg4, racedrb1, racedrb4, racedrc1, racedrc2, racedrc4, racedrcb, racedrcg, racedrg1, racedrg4, racedriv, racedrv1, racedrv2, racedrv3, racedrv4, racedrvb, racedrvc, racedrvg, racinfrc, racknrol, radarzn1, radarznt, radarzon, radikalb, raiders, rallyx, rallyxm, rampage, rampage2, rcasino, rckman2j, rckmanj, reactor, redufo, reelfun, rescraid, rescrdsa, revenger, ringdest, ringohja, riotcity, ripoff, roadblc1, roadblcg, roadblg1, roadblg2, roadbls1, roadbls2, roadbls3, roadblsc, roadblsg, roadblst, roadrun1, roadrun2, roadrunn, robby, robotron, robotryo, rockclim, rockmanj, rocktrv2, roishtar, rongrngg, rongrong, rranger, rthunder, rthundro, runaway, rungun2, rushhero, ryukyu, sailormn, sailormo, salmndr2, sarge, sbrkout, scorpnmc, scramblb, screwloo, scudhamm, sdi, sdib, sdibl, seawolf2, segahang, segas16a, segas16b, sentetst, sextriv1, sextriv2, sexyparo, sf2, sf2accp2, sf2ce, sf2cej, sf2ceua, sf2ceub, sf2ceuc, sf2eb, sf2hf, sf2j, sf2ja, sf2jc, sf2koryu, sf2m1, sf2m2, sf2m3, sf2m4, sf2m5, sf2m6, sf2m7, sf2rb, sf2rb2, sf2red, sf2t, sf2tj, sf2ua, sf2ub, sf2ud, sf2ue, sf2uf, sf2ui, sf2uk, sf2v004, sf2yyc, sfa, sfa2, sfa3, sfa3b, sfa3r1, sfar1, sfar2, sfar3, sfau, sfootbal, sftm, sftm110, sftm111, sftmj, sfz2a, sfz2aa, sfz2ab, sfz2ah, sfz2aj, sfz2b, sfz2br1, sfz2h, sfz2j, sfz2n, sfz3a, sfz3ar1, sfz3j, sfz3jr1, sfz3jr2, sfza, sfzb, sfzbr1, sfzh, sfzj, sfzjr1, sfzjr2, sgemf, sgemfa, sgemfh, shangupb, sharrier, sharrir1, shinobi, shinobi1, shinobi2, shinobi3, shinobi4, shinobl, shootbul, shpeng, shrike, shufshot, sinista1, sinista2, sinistar, sjryuko, sjryuko1, skybase, skydiver, skykid, skykidd, skykiddo, skykiddx, skykido, skyraid, skyraidr, slamdnk2, slammast, slammasu, smbomb, smbombr1, smooncrs, snakepit, snakjack, snapper, soccer, soccersa, soccersj, soccerss, solarq, sonicbom, sos, soulclba, soulclbb, soulclbc, soulclbr, spacbat2, spacbatt, spacduel, spacefrt, spaceftr, spacewar, spacezap, sparkman, spctbird, spdball, speedfrk, speedup, spf2t, spf2ta, spf2xj, spiker, splat, sprglbpg, sprglobp, sprint1, sprint2, sprint2a, sprint4, sprint4a, sprmatkd, sprtmtch, spyhunt, sqbert, sranger, srangerb, srangerw, ssf2, ssf2a, ssf2ar1, ssf2j, ssf2jr1, ssf2jr2, ssf2t, ssf2ta, ssf2tb, ssf2tbj, ssf2tbr1, ssf2tu, ssf2tur1, ssf2u, ssf2xj, sshot137, sshot139, stankatk, starcas, starcas1, starcase, starcasp, starcrus, starfght, starfigh, stargate, stargrds, starhawk, starshp1, starshpp, startrkd, starwar1, starwars, steelta1, steeltag, steeltal, steeltap, stellcas, stocker, stompin, streakng, strider, striderj, stridrja, stridrua, strtdriv, stunrn2e, stunrn3e, stunrun, stunrun0, stunrun2, stunrun3, stunrun4, stunrun5, stunrune, stunrunj, stunrunp, subroc3d, subs, suna16, suna8, sunaq, sundance, superbik, superbug, superbwl, superg, supergx, superpac, superpcm, suprglob, suprleag, suprmatk, surfplnt, swarm, sws99, sxevious, system16, tactcan2, tactcian, tailg, tankbatt, tazzmang, tbyahhoo, tekken3, tekken3a, tekken3b, tektagt, tektagta, tektagtb, tektagtc, tempest, tempest1, tempest2, tempest3, temptube, tenkomoj, tenkomor, tetris, tetris1, tetris2, tetris3, tetrisbl, theglob, theglob2, theglob3, theglobp, ticket, tictac, timek131, timekill, timesca1, timescan, tkmmpzdm, todruaga, todruago, toggle, tokkae, tomcatsw, topracer, topracra, topracrb, tornado1, tornado2, toryumon, tourtab2, tourtabl, tourtabl, triplhnt, triplhnt, triviabb, triviaes, triviag1, triviag2, triviasp, triviayp, trvchlng, trvwhzha, trvwhzho, trvwhzii, trvwhziv, trvwhzva, trvwhzve, trvwziii, tshoot, tst_galx, tturf, tturfbl, tturfu, tunhunt, tunhuntc, turbo, turboa, turbob, turbotag, tylz, typhoon, uballoon, uecology, ultratnk, unico, uniwars, unsquad, uopoko, uopokoj, usg182, usg185, usg252, usg32, usg82, usg83, usg83x, usgames, usvsthem, vampj, vampja, vampjr1, vanvan, vanvanb, vanvank, varth, varthj, varthr1, varthu, vhunt2, vhunt2r1, vhuntj, vhuntjr1, vhuntjr2, victorba, victory, videopin, vidvince, vpool, vsav, vsav2, vsava, vsavh, vsavj, vsavu, vsnetsca, vsnetscj, vsnetscr, vsnetscu, vsnetseb, wallst, warlords, warofbug, warpwar2, warpwarp, warpwarp, warpwarr, warrior, wb3, wb31, wb32, wb33, wb34, wb3bbl, wcbowl, wcbowldx, wcbwl12, wcbwl140, wcbwl15, wcbwl161, wcbwl165, wecleman, wecleman, wildplt, williams, willow, willowj, willowje, winspike, winspikj, wizwarz, wndrmomo, wof, wofa, wofj, wofu, wolfpack, wolfpack, wonder3, woodpek, woodpeka, wotw, wotwc, wow, wrestwa1, wrestwa2, wrestwar, xevios, xevious, xeviousa, xeviousb, xeviousc, xmcota, xmcotaa, xmcotah, xmcotaj, xmcotaj1, xmcotajr, xmcotau, xmvsf, xmvsfa, xmvsfar1, xmvsfb, xmvsfh, xmvsfj, xmvsfjr1, xmvsfjr2, xmvsfr1, xmvsfu, xmvsfur1, xtheball, yarunara, zaccaria, zero, zero2, zeropnt, zeropnt2, zeropnta, zerotime, zigzag, zigzag2, zoom909
```

## lampx
```
bctvidbs, bigdeal, bigdealb, cardline, connect4, crmaze, crmazea, crmazeb, cuoreuno, elephfam, elephfmb, funworld, jokercrd, jollycrd, jolycdab, jolycdae, jolycdat, jolycdcr, jolycdit, magiccrd, mating, matinga, maxaflex, mf_achas, mf_bdash, mf_brist, mf_flip, mpu4, royalcdb, royalcdc, royalcrd, skiltrek, turnover
```

## digitx
```
bctvidbs, buckrog, buckrogn, connect4, crmaze, crmazea, crmazeb, dlair, dlaira, dlairb, dlairc, dlaird, dlaire, dlairf, grchamp, mating, matinga, maxaflex, mf_achas, mf_bdash, mf_brist, mf_flip, mpu4, skiltrek, sspeedr, subroc3d, turbo, turboa, turbob, turnover, zoom909
```

## Useful Hardware Interfaces

To be added later.

## Release Dates

- 27-3-2018 - 1.3 - Finalized network output support / added support for inputs (pause)
- 5-8-2016 - 1.2 - Added support for network output
- 20-12-2007 - 1.1 - Fixed a few issues
- 8-2-2007 - 1.0 - First Release

## Credits

- General Info and Support [Howard Casto]
- Network patches [R Belmont]
- MAME32.dll / MAME64.dll [Ben Baker / MAME Team]
- C# [Ben Baker]
- C++ [Ben Baker]
- Delphi [Ben Baker]
- VB6 [Ben Baker / Howard Casto]
- VB.NET [Ben Baker]

## Contacts

- Howard Casto (MAME Interop SDK Manager/Developer): hcasto@gmail.com
- Ben Baker (MAME Interop SDK Developer): headkaze@gmail.com
