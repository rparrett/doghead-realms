DECLARE SUB levelme (str!, wis!, lck!, agi!, hpct!, dpct!, wname$, aname$, level!, name$, class$, expe!, needexpe!, hp!, maxhp!, mp!, maxmp!, gold!, weaponstr!, armorstr!)
DECLARE SUB pyramid (e1w!, e1h!, me1h!, str!, wis!, lck!, agi!, hpct!, dpct!, wname$, aname$, level!, name$, class$, expe!, needexpe!, hp!, maxhp!, mp!, maxmp!, gold!, weaponstr!, armorstr!)
DECLARE SUB fightmenu (ew1!, eh1!, me1h!, str!, wis!, lck!, agi!, hpct!, dpct!, wname$, aname$, level!, name$, class$, expe!, needexpe!, hp!, maxhp!, mp!, maxmp!, gold!, weaponstr!, armorstr!)
DECLARE SUB temple (str!, wis!, lck!, agi!, hpct!, dpct!, wname$, aname$, level!, name$, class$, expe!, needexpe!, hp!, maxhp!, mp!, maxmp!, gold!, weaponstr!, armorstr!)
DECLARE SUB healer (str!, wis!, lck!, agi!, hpct!, dpct!, wname$, aname$, level!, name$, class$, expe!, needexpe!, hp!, maxhp!, mp!, maxmp!, gold!, weaponstr!, armorstr!)
DECLARE SUB armorshop (str!, wis!, lck!, agi!, hpct!, dpct!, wname$, aname$, level!, name$, class$, expe!, needexpe!, hp!, maxhp!, mp!, maxmp!, gold!, weaponstr!, armorstr!)
DECLARE SUB inv (str!, wis!, lck!, agi!, hpct!, dpct!, wname$, aname$, level!, name$, class$, expe!, needexpe!, hp!, maxhp!, mp!, maxmp!, gold!, weaponstr!, armorstr!)
DECLARE SUB stat (str!, wis!, lck!, agi!, hpct!, dpct!, wname$, aname$, level!, name$, class$, expe!, needexpe!, hp!, maxhp!, mp!, maxmp!, gold!, weaponstr!, armorstr!)
DECLARE SUB weaponshop (str!, wis!, lck!, agi!, hpct!, dpct!, wname$, aname$, level!, name$, class$, expe!, needexpe!, hp!, maxhp!, mp!, maxmp!, gold!, weaponstr!, armorstr!)
DECLARE SUB save (str!, wis!, lck!, agi!, hpct!, dpct!, wname$, aname$, level!, name$, class$, expe!, needexpe!, hp!, maxhp!, mp!, maxmp!, gold!, weaponstr!, armorstr!)
REM -=+=-the first lines will be declarations of subs-=+=-
CLS
REM -=+=-=+=--=+=-=+=--=+=-=+=--=+=-=+=--=+=-=+=--=+=-
REM welp. im starting over for my third time. fun eh?
REM -=+=-=+=--=+=-=+=--=+=-=+=--=+=-=+=--=+=-=+=--=+=-

REM -=+=- all let procedures goes here -=+=-
LET me1h = 20
LET e1h = 20
LET e1w = 5
LET level = 1
LET str = 10
LET wis = 10
LET lck = 10
LET agi = 10
LET hpct = 50
LET dpct = 50
LET wname$ = "none"
LET aname$ = "none"
LET expe = 0
LET needexpe = 10
LET weaponstr = 10
LET hp = 25
LET maxhp = 25
LET mp = 5
LET maxmp = 5
LET gold = 10000
LET class = 1
LET name$ = "Sparky"
LET armorstr = 0
REM -=+=- all let procedures ends here -=+=-


REM -=+=-Information collection goes here (name,class,etc)-=+=-

REM -=+=-Information collection ends here (name,class,etc)-=+=-


INPUT "name?", name$
    OPEN name$ + ".dog" FOR BINARY AS #1
     IF LOF(1) = 0 THEN GOTO 9 ELSE GOTO 8
    CLOSE #1
  CLOSE #1
8    OPEN name$ + ".dog" FOR INPUT AS #2
        DO WHILE NOT EOF(2)
          INPUT #2, str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr
        LOOP
    CLOSE #2: REM dis is the procedure to read. should be at beginnign.
  CLOSE #2
GOTO 10


9 CLS
    REM INPUT "What do you want your new character's name to be? ", name$
      OPEN name$ + ".dog" FOR INPUT AS #3
       INPUT "press 1 right here (for your class (only 1 in existance)) ", class
         DO WHILE NOT EOF(3)
          INPUT #3, str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr
         LOOP
      CLOSE #3: REM dis is the procedure to read. should be at beginnign
    CLS
  PRINT "Welcome to the realms, "; name$
PRINT "if you need any help, refer to the readme file."
REM -=+=- leveling procedures goes here -=+=-

REM -=+=- leveling procedures ends here -=+=-

REM -=+=- main menu/town square goes here -=+=-

10
PRINT "+----------------+"
PRINT "|  (W)eapon shop |"
PRINT "|  (I)nventory   |"
PRINT "| s(T)ats        |"
PRINT "|  (H)ealer      |"
PRINT "|  (F)ight stuff |"
PRINT "| t(E)mple       |"
PRINT "|  (S)ave game   |"
PRINT "|  (A)rmor shop  |"
PRINT "+----------------+"
PRINT hp; "/"; maxhp; " "; mp; "/"; maxmp; : INPUT "]", savepr$
IF UCASE$(savepr$) = "S" THEN CALL save(str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr): GOTO 10 ELSE
IF UCASE$(savepr$) = "F" THEN CALL fightmenu(ew1, eh1, me1h, str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr): GOTO 10 ELSE
IF UCASE$(savepr$) = "E" THEN CALL temple(str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr): GOTO 10 ELSE
IF UCASE$(savepr$) = "H" THEN CALL healer(str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr): GOTO 10 ELSE
IF UCASE$(savepr$) = "I" THEN CALL inv(str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr): GOTO 10 ELSE
IF UCASE$(savepr$) = "T" THEN CALL stat(str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr): GOTO 10 ELSE
IF UCASE$(savepr$) = "A" THEN CALL armorshop(str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr): GOTO 10 ELSE
IF UCASE$(savepr$) = "W" THEN CALL weaponshop(str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr): GOTO 10 ELSE PRINT "Try typing better please.": GOTO 10

REM -=+=- main menu/town square ends here -=+=-

SUB armorshop (str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr)
PRINT "You are in the weapon shop. As you approach the shopkeeper he stares; at; you AND asks; you; what; weapon; you; want.; "; ""
CLS
PRINT ""
PRINT "1 Cloth                 |50"
PRINT "2 Leather               |100"
PRINT "3 Chain                 |150"
PRINT "4 Scale                 |250"
PRINT "5 Brigandine            |450"
PRINT "6 Half-plate            |550"
PRINT "7 Full-plate            |700"
PRINT "8 Black Plate           |750"
PRINT "9 Holy Plate            |900"
PRINT "10 Silver plate         |1500"
INPUT "Whadda ya want? ", what$
IF what$ = "1" AND gold > 50 THEN gold = gold - 50: armorstr = 15: aname$ = "Cloth": GOTO 31 ELSE
IF what$ = "2" AND gold > 100 THEN gold = gold - 100: armorstr = 20: aname$ = "Leather": GOTO 31 ELSE
IF what$ = "3" AND gold > 150 THEN gold = gold - 150: armorstr = 25: aname$ = "Chain": GOTO 31 ELSE
IF what$ = "4" AND gold > 250 THEN gold = gold - 250: armorstr = 30: aname$ = "Scale": GOTO 31 ELSE
IF what$ = "5" AND gold > 450 THEN gold = gold - 450: armorstr = 35: aname$ = "Brigandine": GOTO 31 ELSE
IF what$ = "6" AND gold > 550 THEN gold = gold - 550: armorstr = 40: aname$ = "Half-Plate": GOTO 31 ELSE
IF what$ = "7" AND gold > 700 THEN gold = gold - 700: armorstr = 45: aname$ = "Full-Plate": GOTO 31 ELSE
IF what$ = "8" AND gold > 750 THEN gold = gold - 750: armorstr = 50: aname$ = "Black Plate": GOTO 31 ELSE
IF what$ = "9" AND gold > 900 THEN gold = gold - 900: armorstr = 55: aname$ = "Holy Plate": GOTO 31 ELSE
IF what$ = "10" AND gold > 1500 THEN gold = gold - 1500: armorstr = 100: aname$ = "Silver Plate": GOTO 31 ELSE GOTO 32
32 PRINT "Im sorry, you dont seem to have enough gold."
GOTO 30
31 PRINT "Enoy your new weapon!"
GOTO 30

30 END SUB

SUB fightmenu (e1w, e1h, me1h, str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr)
PRINT "+-----------------------+"
PRINT "|  (P)yramids           |"
PRINT "|  (A)nienct Ruins      |"
PRINT "|  (S)wamp              |"
PRINT "|  (T)errace mountain   |"
PRINT "|  (L)eave              |"
PRINT "+-----------------------+"
PRINT hp; "/"; maxhp; " "; mp; "/"; maxmp; : INPUT "]", fmenu$
IF UCASE$(fmenu$) = "P" THEN CALL pyramid(e1w, e1h, me1h, str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr)
CALL levelme(str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr)
END SUB

SUB healer (str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr)
PRINT "Hello, You are now at my little healing shack. 50 gold to heal your wounds."
PRINT "Press H to heal and L to leave"
PRINT hp; "/"; maxhp; " "; mp; "/"; maxmp; : INPUT "]", heal$
IF UCASE$(heal$) = "H" AND gold > 50 THEN LET hp = maxhp ELSE IF UCASE$(heal$) = "H" AND gold < 50 THEN PRINT "Im sorry, you dont have enough gold": GOTO 40 ELSE IF UCASE$(heal$) = "L" THEN GOTO 40
40 END SUB

SUB inv (str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr)
PRINT "Torso Armor - "; aname$
PRINT "Weapon      - "; wname$
SLEEP 2
END SUB

SUB levelme (str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr)
IF expe >= needexpe THEN level = level + 1: LET needexpe = needexpe * 2.5: LET maxhp = maxhp + 10: LET hp = maxhp: LET maxmp = maxmp + 5: LET mp = maxmp: PRINT "Ya Leveled!" ELSE
END SUB

SUB pyramid (e1w, e1h, me1h, str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr)
PRINT "You are now in the pyramids, as you approach a mummy attacks you."
99 PRINT "((A)ttack (R)un))"
PRINT hp; "/"; maxhp; " "; mp; "/"; maxmp; : INPUT "]", at$
IF UCASE$(at$) = "A" THEN GOTO 100 ELSE IF UCASE$(at$) = "R" THEN GOTO 101 ELSE PRINT "try again": GOTO 99
100
LET hit1 = INT(RND * hpct)
IF hit1 > hpct THEN PRINT "You swing and miss!": GOTO 110 ELSE
LET hit = INT(RND * weaponstr)
LET e1h = e1h - hit
PRINT "You hit the mummy for "; hit; "damage!"
IF e1h <= 0 THEN PRINT "You have killed the mummy!": LET expe = expe + 10: LET e1h = me1h: GOTO 101 ELSE GOTO 110
110
LET ehit = INT(RND * ew1)
LET ehit2 = ehit - armor
IF ehit <= 0 THEN ehit = 0
PRINT "The monster hit you for"; ehit; "damage!"
LET hp = hp - ehit
IF hp <= 0 THEN PRINT "You died": SLEEP: END ELSE GOTO 99
101 END SUB

SUB save (str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr)

    CLOSE #1, #2, #3, #4
      OPEN name$ + ".dog" FOR OUTPUT AS #1
        WRITE #1, str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr
        CLOSE #1

END SUB

SUB stat (str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr)
PRINT "Here are your stats, "; name$
PRINT ""
PRINT "Strengh        = "; str;
PRINT "Wisdom         = "; wis
PRINT "Luck           = "; lck;
PRINT "Agility        = "; agi
PRINT "Hit %          = "; hpct;
PRINT "Dodge %        = "; dpct
PRINT "HP             = "; hp;
PRINT "MAX HP         = "; maxhp
PRINT "MP             = "; maxmp;
PRINT "Exp             = "; expe
PRINT "Level          = "; level;
PRINT "Gold            = "; gold
PRINT "Armor Strengh  = "; armorstr;
PRINT "Weapon Strengh  = "; dpct
PRINT "       NeedExp            = "; needexpe
SLEEP 2
END SUB

SUB temple (str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr)
55 PRINT "You are now in the temple"
PRINT "Press B to buy spells, R to recharge mana, and L to leave"
PRINT hp; "/"; maxhp; " "; mp; "/"; maxmp; : INPUT "]", tch$
IF UCASE$(tch$) = "B" THEN GOTO 60 ELSE IF UCASE$(tch$) = "R" THEN GOTO 70 ELSE IF UCASE$(tch$) = "L" THEN GOTO 90 ELSE PRINT "type better": GOTO 55
60 PRINT "Im sorry, were sold out today": GOTO 55
70 PRINT "I am recharging your mana now!"
LET mp = maxmp
GOTO 55
90 END SUB

SUB weaponshop (str, wis, lck, agi, hpct, dpct, wname$, aname$, level, name$, class$, expe, needexpe, hp, maxhp, mp, maxmp, gold, weaponstr, armorstr)

PRINT "You are in the weapon shop. As you approach the shopkeeper he stares; at; you AND asks; you; what; weapon; you; want.; "; ""
CLS
PRINT ""
PRINT "1 Dagger                |50"
PRINT "2 Shortsword            |100"
PRINT "3 Longsword             |150"
PRINT "4 Greatsword            |250"
PRINT "5 Ebony Greatsword      |450"
PRINT "6 Soulslayer            |550"
PRINT "7 Runesword             |700"
PRINT "8 Jeweled Longsword     |750"
PRINT "9 ShieldBreaker         |900"
PRINT "10 Excalibur            |1500"
INPUT "Whadda ya want? ", what$
IF what$ = "1" AND gold > 50 THEN gold = gold - 50: weaponstr = 15: wname$ = "Dagger": GOTO 21 ELSE
IF what$ = "2" AND gold > 100 THEN gold = gold - 100: weaponstr = 20: wname$ = "ShortSword": GOTO 21 ELSE
IF what$ = "3" AND gold > 150 THEN gold = gold - 150: weaponstr = 25: wname$ = "LongSword": GOTO 21 ELSE
IF what$ = "4" AND gold > 250 THEN gold = gold - 250: weaponstr = 30: wname$ = "GreatSword": GOTO 21 ELSE
IF what$ = "5" AND gold > 450 THEN gold = gold - 450: weaponstr = 35: wname$ = "Ebony GreatSword": GOTO 21 ELSE
IF what$ = "6" AND gold > 550 THEN gold = gold - 550: weaponstr = 40: wname$ = "Soulslayer": GOTO 21 ELSE
IF what$ = "7" AND gold > 700 THEN gold = gold - 700: weaponstr = 45: wname$ = "RuneSword": GOTO 21 ELSE
IF what$ = "8" AND gold > 750 THEN gold = gold - 750: weaponstr = 50: wname$ = "Jeweled LongSword": GOTO 21 ELSE
IF what$ = "9" AND gold > 900 THEN gold = gold - 900: weaponstr = 55: wname$ = "ShieldBreaker": GOTO 21 ELSE
IF what$ = "10" AND gold > 1500 THEN gold = gold - 1500: weaponstr = 100: wname$ = "Excalibur": GOTO 20 ELSE GOTO 22
22 PRINT "Im sorry, you dont seem to have enough gold."
GOTO 20
21 PRINT "Enoy your new weapon!"
GOTO 20
20 END SUB
