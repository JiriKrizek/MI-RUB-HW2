# Vytvořte aplikaci, která spočítá obsah dvou čtverců sjednocených do jednoho obrazce.

# Oba čtverce se zadávají pomocí souřadnic geometrického středu a délky hrany (používáme 
# bezrozměrnou veličinu). Pokud je zadán vstup, který není číslem, aplikace vypíše 
# „Spatny vstup.“ a okamžitě se ukončí. Stejným způsobem reaguje, když je zadána záporná 
# délka hrany. Nulová délka hrany aplikaci nevadí. Pokud ctverce nemají společný ani jeden 
# bod (např. když se nedotýkají ani jedním rohem), aplikace na to zareaguje textem 
# „Ctverce se ani nedotykaji.“

require '../lib/main.rb'

m = Main.new
m.run