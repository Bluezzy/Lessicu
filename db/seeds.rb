# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Word.destroy_all
Theme.destroy_all
Category.destroy_all
User.destroy_all

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

Category.create!({name: "Pedagugia"})
Category.create!({name: "autre"})
Category.create!({name: "Attualità"})
Category.create!({name: "I Capizzoni Mundiali"})

User.create!({
    name: "Marc'Andria",
    email: "marcandriabattesti@gmail.com",
    admin: true,
    password: "frousht2b",
    password_confirmation: "frousht2b"
})

User.create!({
    name: "Jean-Philippe Orsoni",
    email: "jeanphi.orsoni@gmail.com",
    admin: true,
    password: "grandroque",
    password_confirmation: "grandroque"
})

User.create!({
    name: "Lambda",
    email:"lambda@gmail.com",
    admin: false,
    password: "bleuduciel",
    password_confirmation: "bleuduciel"
})

User.create!({
    name: "alpha",
    email: "alpha@gmail.com",
    admin: false,
    password: "rougeduciel",
    password_confirmation: "rougeduciel"
})

=begin
Article.create!({
    title: "Le Mat du Berger", 
    category_id: Category.find_by(name: "Pedagugia").id,
    author: "Jean-Philippe Orsoni", 
    content: "<p>Le Mat du Berger est un très joli mat, sans doute le plus connu et le plus spectaculaire
    qui permet aux débutants de gagner en quelques coups seulement en attaquant immédiatement la faiblesse du pion f.
    Il est effectué avec le <strong>Fou</strong> et la <strong>Dame</strong>.</p>",
    heading: "Comprenez le mat du Berger"
})

Article.create!({
    title: "Le développement des Pièces",
    author: "Jean-Philippe Orsoni",
    category_id: Category.find_by(name: "Pedagugia").id,
    content: "<p>Commencer une partie d'Échecs sans savoir quoi faire, c'est le lot de tout débutant
    qui se respecte. Les principes de bases doivent être respectés. Les Échecs sont un jeu qui demandent
    à activer toutes ses forces. Toutes vos pièces doivent avoir un rôle. En début de jeu, il faut activer
    chacune de vos pièces vers le centre de l'échiquier. Si vous ne respectez pas ce principe de base,
    vous aurez beaucoup de mal par la suite à faire parler votre créativité, car vous manquerez d'espace,
    et votre adversaire pourra manoeuvre comme bon lui semble pour attaquer vos faiblesses, que vous ne pourrez pas défendre
    à cause du manque de coordination entre vos pièces.</p>",
    heading: "C'est un conseil qu'on a tous entendu, mais pourquoi est-si important ?"
})

Article.create!({
    title: "Coronavirus",
    author: "Anonyme",
    category_id: Category.find_by(name: "Attualità").id,
    content:"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse id orci molestie, accumsan velit vel, suscipit est. Vivamus pharetra congue viverra. Nam aliquam commodo quam. Duis elementum volutpat eros a rhoncus. Ut quis ex sed magna porta finibus quis id turpis. Cras ornare porta risus eget pulvinar. Pellentesque malesuada risus nisi, efficitur suscipit diam porttitor sed. Integer leo lorem, fringilla sed sapien ut, interdum venenatis urna. Nam id tellus efficitur, sollicitudin purus sed, iaculis dolor. Donec efficitur, purus in egestas finibus, justo turpis rhoncus mauris, vitae tempus eros eros ac lorem. Etiam eget lacus ipsum. Morbi aliquet varius dolor maximus elementum. Maecenas luctus risus eget mi gravida condimentum.</p>",
    heading: "Toute l'actualité liée au Coronavirus"
})
=end
