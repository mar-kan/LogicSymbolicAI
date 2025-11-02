planet(Planet) :- heavenlyBody(Planet), revolves(Planet, Star), star(Star).
moon(Moon) :- heavenlyBody(Moon), revolves(Moon, Planet), planet(Planet).