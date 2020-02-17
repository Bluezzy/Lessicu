# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Word.destroy_all
Article.destroy_all
Theme.destroy_all

Theme.create!({name: "pezze"})
Theme.create!({name: "tatiche"})
Theme.create!({name: "strategie"})
Theme.create!({name: "mat"})
Theme.create!({name: "autre"})

Word.create!({name: "pion", translation: "pedinu", theme_id: Theme.get_id("pezze")})
Word.create!({name: "fou", translation: "alfieru", theme_id: Theme.get_id("pezze")})
Word.create!({name: "roque", translation: "arruccamentu", theme_id: Theme.get_id("strategie")})
Word.create!({name: "sacrifice", translation: "orsonata", theme_id: Theme.get_id("tatiche")})
Word.create!({name: "mat du couloir", translation: "mattu di u curridò", theme_id: Theme.get_id("mat")})


Article.create!({
    title: "Le Mat du Berger", 
    author: "Jean-Philippe Orsoni", 
    content: "<p>Le Mat du Berger est un très joli mat, sans doute le plus connu et le plus spectaculaire
    qui permet aux débutants de gagner en quelques coups seulement en attaquant immédiatement la faiblesse du pion f.
    Il est effectué avec le <strong>Fou</strong> et la <strong>Dame</strong>.</p>",
    heading: "Comprenez le mat du Berger"
})

Article.create!({
    title: "Le développement des Pièces",
    author: "Jean-Philippe Orsoni",
    content: "<p>Commencer une partie d'Échecs sans savoir quoi faire, c'est le lot de tout débutant
    qui se respecte. Les principes de bases doivent être respectés. Les Échecs sont un jeu qui demandent
    à activer toutes ses forces. Toutes vos pièces doivent avoir un rôle. En début de jeu, il faut activer
    chacune de vos pièces vers le centre de l'échiquier. Si vous ne respectez pas ce principe de base,
    vous aurez beaucoup de mal par la suite à faire parler votre créativité, car vous manquerez d'espace,
    et votre adversaire pourra manoeuvre comme bon lui semble pour attaquer vos faiblesses, que vous ne pourrez pas défendre
    à cause du manque de coordination entre vos pièces.</p>",
    heading: "C'est un conseil qu'on a tous entendu, mais pourquoi est-si important ?"
})

ArticlesTheme.create!({
    article_id: 5,
    theme_id: Theme.get_id("mat")
})

ArticlesTheme.create!({
    article_id: 6,
    theme_id: Theme.get_id("strategie")
})

