#!/usr/local/bin/lua
dofile("luhn.lua")

Args = {}

local function main()
    for i,v in ipairs(arg) do
        Argg = table.insert(Args, i, v)
    end
    if Args[1] == "--help" or Args[1] == "-h" then
        print("\nlunh-lua, by L14")
        print("--------------------------")
        print(" lua main.lua [commandes] <value>")
        print("--------------------------")
        print("Commandes \n")
        print(" --help or -h                      => Pour obtenir de l'aide (vous y êtes actuellement)")
        print(" --verify or -v <number>           => Verifie si le nombre est valide selon la formule de Luhn")
        print(" --generate or -g <length (10)>    => Génère un nombre de Luhn valide à partir d'une base ou sinon d'une taille donnée !")
        print("--------------------------")
        print("Les exemples \n")
        print(" --verify 6667      ----> le nombre n'est pas valable selon la formule de Luhn")
        print(" -g                 ----> 9829")
        print(" --generate 124x    ----> 1248")
        print(" -g 1xxxxxxxxx      ----> 18267591834")
        print("--------------------------")

    elseif Args[1] == "--verify" or Args[1] == "-v" and Args[2] then
        if Verify(tonumber(Args[2])) == true then
            print("Oui, le nombre " .. Args[2] .. " est bien valide à partir de la formule de Luhn !")
        else
            print("Non, le nombre " .. Args[2] .. " n'est pas valide selon la formule de Luhn !")
        end
    elseif Args[1] == "--generate" or Args[1] == "-g" then
        local rand;
        if Args[2] == nil then
            print("Resultat: " .. Generate(math.random(100, 999)))
        else
            local s = Args[2]
            local _, n = s:gsub("x","")
            if string.match(s, "%d*%d") == nil then
                local r = math.random(1, 99)
                print(r)
                s = r .. s
            end
            if n > 0 then
                n = n - 1
            end

            for i = 0, n, 1 do
                s = Generate(tonumber(string.match(s, "%d*%d")))
                print(s)
            end
        end
    else
        print("Vous n'avez fournit aucune commande au programme \n  Veuillez executer -h pour obtenir de l'aide!")
    end
end

main()