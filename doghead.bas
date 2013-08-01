DECLARE SUB pressAnyKey (m$)
DECLARE FUNCTION lpad$ (s$, n%, p$)
DECLARE FUNCTION insertInventory! (item AS ANY)
DECLARE FUNCTION rpad$ (s$, n%, p$)
DECLARE SUB weaponShop ()
DECLARE SUB weaponBuy ()
DECLARE SUB weaponSell ()
DECLARE FUNCTION prompt$ ()
DECLARE SUB loadData ()
DECLARE SUB loadGame ()
DECLARE SUB infoPanel ()
DECLARE SUB mainMenu ()
DECLARE SUB saveGame ()
DECLARE FUNCTION bar$ (value%, minValue%, maxValue%, length%)
DECLARE FUNCTION hasSavedGame! ()
DECLARE FUNCTION weaponDamage$ (i%)

TYPE ItemType
    displayName AS STRING * 32
    ItemType AS INTEGER
    basedmg  AS INTEGER
    dmg      AS INTEGER
    rolls    AS INTEGER
    speed    AS DOUBLE
    hands    AS INTEGER
    armor    AS INTEGER
    value    AS INTEGER
    shop     AS INTEGER
END TYPE

TYPE PlayerType
    displayName AS STRING * 32
    hp     AS INTEGER
    maxhp  AS INTEGER
    str    AS INTEGER
    lhand  AS INTEGER
    rhand  AS INTEGER
    armor  AS INTEGER
    shield AS INTEGER
    xp     AS INTEGER
    level  AS INTEGER
    gold   AS INTEGER
END TYPE

TYPE EnemyType
    displayName AS STRING * 32
    maxhp AS INTEGER
    rolls AS INTEGER
    dmg   AS INTEGER
    armor AS INTEGER
END TYPE

DIM items(255)   AS ItemType
DIM enemies(255) AS EnemyType
DIM inventory(7) AS ItemType

DIM player       AS PlayerType

PRINT "Loading Data..."

loadData

PRINT "Loaded."

IF hasSavedGame = 0 THEN
    INPUT "What is your name? ", player.displayName
    player.hp = 25
    player.maxhp = 25
    player.xp = 0
    player.level = 1
    player.gold = 10
    player.lhand = 0
    player.rhand = -1
    player.shield = -1
    player.armor = -1

    inventory(0) = items(0)
ELSE
    loadGame
END IF

pressAnyKey ("Welcome, " + RTRIM$(player.displayName) + ".")

DO
    mainMenu
LOOP

FUNCTION bar$ (value%, minValue%, maxValue%, length%)
    current% = INT((value% + minValue%) / maxValue% * length%)

    tmp$ = "["
    FOR i = 0 TO length%
        IF i < current% THEN
            tmp$ = tmp$ + "="
        ELSEIF i = current% THEN
            tmp$ = tmp$ + ">"
        ELSE
            tmp$ = tmp$ + " "
        END IF
    NEXT i
    tmp$ = tmp$ + "]"

    bar$ = tmp$
END FUNCTION

FUNCTION hasSavedGame
    OPEN "D:\doghe~22\save.dog" FOR BINARY AS 1
    IF LOF(1) = 0 THEN
        CLOSE
        hasSavedGame = 0
        EXIT FUNCTION
    ELSE
        CLOSE
        hasSavedGame = 1
        EXIT FUNCTION
    END IF
END FUNCTION

SUB infoPanel
    SHARED player AS PlayerType

    DIM tmp AS STRING
    DIM levelxp AS INTEGER
    
    levelxp = 100

    tmp = lpad$(" XP " + bar$(player.xp, 0, levelxp, 20) + " " + STR$(player.xp) + " / " + STR$(levelxp), 40, " ") + rpad$(RTRIM$(player.displayName), 40, " ")
    PRINT tmp

    tmp = lpad$(" HP " + bar$(player.hp, 0, player.maxhp, 20) + " " + STR$(player.hp) + " / " + STR$(player.maxhp), 40, " ") + rpad(" Level " + LTRIM$(STR$(player.level)) + " Gold " + LTRIM$(STR$(player.gold)), 40, " ")
    PRINT tmp

    PRINT
    PRINT STRING$(80, "=")
    PRINT
END SUB

FUNCTION insertInventory (item AS ItemType)
    SHARED inventory() AS ItemType

    FOR i = 0 TO UBOUND(inventory)
        IF inventory(i).displayName <> "" THEN
            inventory(i) = item

            insertInventory = 1
            EXIT FUNCTION
        END IF
    NEXT i

    insertInventory = 0
    EXIT FUNCTION
END FUNCTION

SUB loadData
    SHARED items() AS ItemType
    SHARED enemies() AS EnemyType

    LET i = 0

    OPEN "D:\doghe~22\items.dog" FOR INPUT AS 1
    DO WHILE NOT EOF(1)
       INPUT #1, items(i).displayName, items(i).ItemType, items(i).basedmg, items(i).dmg, items(i).rolls, items(i).speed, items(i).hands, items(i).armor, items(i).value, items(i).shop
       i = i + 1
    LOOP
    CLOSE
    
    OPEN "D:\doghe~22\enemies.dog" FOR INPUT AS 1
    DO WHILE NOT EOF(1)
       INPUT #1, enemies(i).displayName, enemies(i).maxhp, enemies(i).rolls, enemies(i).dmg, enemies(i).armor
       i = i + 1
    LOOP
    CLOSE
END SUB

SUB loadGame
    SHARED player      AS PlayerType
    SHARED inventory() AS ItemType

    LET i = 0
    
    OPEN "D:\doghe~22\save.dog" FOR INPUT AS 1

    INPUT #1, player.displayName, player.hp, player.maxhp, player.lhand, player.rhand, player.armor, player.shield, player.xp, player.level, player.gold

    DO WHILE NOT EOF(1)
       INPUT #1, inventory(i).displayName, inventory(i).ItemType, inventory(i).basedmg, inventory(i).dmg, inventory(i).rolls, inventory(i).speed, inventory(i).hands, inventory(i).armor, inventory(i).value, inventory(i).shop
       i = i + 1
    LOOP

    CLOSE
END SUB

FUNCTION lpad$ (s$, n%, p$)
    l% = LEN(s$)

    IF l% > n% THEN
        l% = n%
    END IF

    lpad$ = s$ + STRING$(n% - l%, p$)
END FUNCTION

SUB mainMenu
    SHARED player AS PlayerType

    CLS
    infoPanel

    PRINT "           (W)eapon shop     "
    PRINT "           (A)rmor shop      "
    PRINT "           (B)lacksmith      "
    PRINT "          t(E)mple           "
    PRINT "           (I)nventory       "
    PRINT "          s(T)ats            "
    PRINT "       sewe(R)               "
    PRINT "           (N)orth gate      "
    PRINT "           (S)outhwest gate  "
    PRINT "  save and (Q)uit            "

    PRINT
    PRINT STRING$(80, "=")
    PRINT

    SELECT CASE prompt$
        CASE "Q"
            saveGame
            END
        CASE "W"
            weaponShop
        CASE "I"
            manageInventory
    END SELECT
END SUB

SUB pressAnyKey (m$)
    PRINT m$

    DO
    LOOP UNTIL INKEY$ <> ""
END SUB

FUNCTION prompt$
    INPUT " Command: ", choice$
    prompt$ = UCASE$(choice$)
END FUNCTION

FUNCTION rpad$ (s$, n%, p$)
    l% = LEN(s$)

    IF l% > n% THEN
        l% = n%
    END IF

    rpad$ = STRING$(n% - l%, p$) + s$
END FUNCTION

SUB saveGame
    SHARED player      AS PlayerType
    SHARED inventory() AS ItemType
    
    OPEN "D:\doghe~22\save.dog" FOR OUTPUT AS 1

    WRITE #1, player.displayName, player.hp, player.maxhp, player.lhand, player.rhand, player.armor, player.shield, player.xp, player.level, player.gold

    FOR i = 0 TO UBOUND(inventory)
        WRITE #1, inventory(i).displayName, inventory(i).ItemType, inventory(i).basedmg, inventory(i).dmg, inventory(i).rolls, inventory(i).speed, inventory(i).hands, inventory(i).armor, inventory(i).value, inventory(i).shop
    NEXT i

    CLOSE
END SUB

SUB weaponBuy
    SHARED items()     AS ItemType
    SHARED player      AS PlayerType
    SHARED inventory() AS ItemType

    CLS
    infoPanel

    DIM choices(UBOUND(items) + 2) AS INTEGER
    DIM i AS INTEGER
    DIM maxChoice AS INTEGER

    j = 1

    PRINT STRING$(5, " ") + lpad$("Name", 32, " ") + lpad$("Damage", 20, " ") + "Hands" + rpad("Price", 18, " ")
    PRINT

    FOR i = 0 TO UBOUND(items)
        IF (items(i).shop = 1 AND items(i).ItemType = 0) THEN
            PRINT " (" + LTRIM$(STR$(j)) + ") " + items(i).displayName + lpad$(weaponDamage$(i), 20, " ") + LTRIM$(STR$(items(i).hands)) + "h" + rpad$(LTRIM$(STR$(items(i).value)), 21, " ")
            
            choices(j) = i
            maxChoice = j

            j = j + 1
        END IF
    NEXT i
    
    PRINT
    PRINT " (B)ack"
    
    PRINT
    PRINT STRING$(80, "=")
    PRINT

    choice$ = prompt$
    ci = VAL(choice$)

    IF (ci >= 1 AND ci <= maxChoice) THEN
        IF player.gold >= items(choices(ci)).value THEN
            inserted = insertInventory(items(choices(ci)))

            IF inserted <> 1 THEN
                pressAnyKey("Your inventory is full.")
                
                EXIT SUB
            END IF

            player.gold = player.gold - items(choices(ci)).value
        ELSE
            pressAnyKey("You do not have enough gold.")

            EXIT SUB
        END IF
    ELSEIF UCASE$(choice$) = "B" THEN
    ELSE
        pressAnyKey("Invalid command.")
    END IF
END SUB

FUNCTION weaponDamage$ (i%)
    SHARED items() AS ItemType

    tmp$ = LTRIM$(STR$(items(i%).rolls)) + "d" + LTRIM$(STR$(items(i%).dmg))
    
    IF items(i%).basedmg > 0 THEN
        tmp$ = tmp$ + "+" + LTRIM$(STR$(items(i%).basedmg))
    END IF
    
    tmp$ = tmp$ + " (" + LTRIM$(STR$(items(i%).speed)) + " speed)"

    weaponDamage$ = tmp$
END FUNCTION

SUB weaponSell
END SUB

SUB weaponShop
    SHARED player AS PlayerType

    CLS
    infoPanel

    PRINT " (B) Buy  "
    PRINT " (S) Sell "

    PRINT
    PRINT STRING$(80, "=")
    PRINT

    SELECT CASE prompt$
        CASE "B"
            weaponBuy
        CASE "S"
            weaponSell
    END SELECT
END SUB

SUB manageInventory
    SHARED player      AS PlayerType
    SHARED inventory() AS ItemType

    CLS
    infoPanel
        
    tmp$ = lpad$(" (L)eft hand", 13, " ")
    if (player.lhand <> -1) THEN
        tmp$ = tmp$ + rpad$(RTRIM$(inventory(player.lhand).displayName), 32, " ")
    ELSE
        tmp$ = tmp$ + rpad$("Nothing", 32, " ")
    END IF
    PRINT tmp$
    
    tmp$ = lpad$(" (R)ight hand", 13, " ")
    if (player.rhand <> -1) THEN
        tmp$ = tmp$ + rpad$(RTRIM$(inventory(player.rhand).displayName), 32, " ")
    ELSE
        tmp$ = tmp$ + rpad$("Nothing", 32, " ")
    END IF
    PRINT tmp$
    
    tmp$ = lpad$(" (A)rmor", 13, " " )
    if (player.armor <> -1) THEN
        tmp$ = tmp$ + rpad$(RTRIM$(inventory(player.armor).displayName), 32, " ")
    ELSE
        tmp$ = tmp$ + rpad$("Nothing", 32, " ")
    END IF
    PRINT tmp$
    
    j = 1
    FOR i = 0 TO UBOUND(inventory)
        IF (i <> player.lhand AND i <> player.rhand AND i <> player.armor) THEN
            tmp$ = lpad(" (" + LTRIM$(STR$(j)) + ")", 13, " ")
            IF (inventory(i).displayName <> STRING$(32," ") AND inventory(i).displayName <> STRING$(32, CHR$(0))) THEN
                tmp$ = tmp$ + rpad$(RTRIM$(inventory(i).displayName), 32, " ")
            ELSE
                tmp$ = tmp$ + rpad$("Nothing", 32, " ")
            END IF
            PRINT tmp$
            
            j = j + 1
        END IF
    NEXT i

    PRINT
    PRINT STRING$(80, "=")
    PRINT

    choice$ = prompt$
END SUB
