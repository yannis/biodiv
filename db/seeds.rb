# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
User.create!(name: "Yannis", email: 'yannis.jaquet@unige.ch', password: '12345678', password_confirmation: '12345678')

Institute.destroy_all
institutes = [
  {
    id: 1,
    name_fr: "Section de Biologie: Département de Génétique & Évolution et Unité de Microbiologie",
    name_en: "Section of Biology: Department of Genetics & Evolution and Unit of Microbiology",
    description_fr: "Explorer et comprendre la diversité, l’histoire évolutive, la biogéographie et l’adaptation des organismes, des bactéries à l’Homme.",
    description_en: "Our research programs are aimed at exploring and understanding the biodiversity, the evolutionary history, the biogeography and the adaptation of organisms, from bacteria to human.",
    url: "http://www.unige.ch/sciences",
    illustrations: [Illustration.new(picture: File.open(File.join(Rails.root, "base_material", "section_de_biologie.jpg")))],
    logo: Logo.new(picture: File.open(File.join(Rails.root, "base_material", "logo-fac-sc.png")))
  },
  {
    id: 2,
    name_fr: "Conservatoire & Jardin botaniques de la Ville de Genève",
    name_en: "Conservatory & Botanical Garden of the City of Geneva",
    description_fr: "Des écosystèmes aux gènes, les CJB développent des recherches centrées sur l'étude des organismes végétaux et fongiques, ainsi que sur la biodiversité qu'ils représentent.jardin_botanique_logo.png",
    description_en: "From ecosystems to genes, our research programs are centered on the study of plant and fungal organisms, and on the biodiversity they represent.",
    url: "http://www.ville-ge.ch/cjb/activites_scientifiques.php",
    illustrations: [Illustration.new(picture: File.open(File.join(Rails.root, "base_material", "jardin_botanique.jpg")))],
    logo: Logo.new(picture: File.open(File.join(Rails.root, "base_material", "jardin_botanique_logo.png")))
  },
  {
    id: 3,
    name_fr: "Muséum d’histoire naturelle de la Ville de Genève",
    name_en: "Museum of natural history of the City of Geneva",
    description_fr: "Le Muséum conserve des millions de spécimens appartenant au patrimoine naturel. Ses collections exceptionnelles alimentent des recherches en systématique, biodiversité et évolution des animaux.",
    description_en: "The Museum's collections comprise millions of specimens belonging to the natural heritage. These unique collections form the basis of various research programs in systematics, biodiversity and animal evolution.",
    url: "http://www.ville-ge.ch/mhng/activites_scientifiques.php",
    illustrations: [Illustration.new(picture: File.open(File.join(Rails.root, "base_material", "museum_d_histoire_naturelle.jpg")))],
    logo: Logo.new(picture: File.open(File.join(Rails.root, "base_material", "museum_d_histoire_naturelle_logo.jpg")))
  }
]

institutes.each do |institute|
  Institute.create! institute
end

Contact.destroy_all
contacts = [
  {
    name: "Juan Montoya",
    email: "juan.montoya@unige.ch"
  },
  {
    name: "Daniel Jeanmonod",
    email: "Daniel.Jeanmonod@@ville-ge.ch"
  },
  {
    name: "Jean Mariaux",
    email: "Jean.Mariaux@ville-ge.ch"
  }
]

contacts.each do |contact|
  Contact.create! contact
end

Laboratory.destroy_all
laboratories = [
  {
    id: 1,
    name_fr: "Laboratoire de phylogénie et évolution des vertébrés",
    name_en: "Laboratory of molecular phylogeny and evolution in vertebrates",
    address: "Dr. Juan Montoya\njuan.montoya@unige.ch\n+41 22 379 6786",
    url: "http://genev.unige.ch/en/users/Juan-Montoya/unit",
    institute_id: 1
  },
  {
    id: 2,
    name_fr: "Laboratoire de Génétique Bactérienne",
    name_en: "Laboratory of Bacterial Genetics",
    address: "Dr. Xavier Perret\nUniversité de Genève\nSciences III\nUnité de Microbiologie\n30 quai Ernest-Ansermet\n1211 Genève 4\nxavier.perret@unige.ch\n+41 22 379 3117",
    url: "http://www.unige.ch/sciences/biologie/biveg/microbio/themes/XavierPerret.html",
    institute_id: 1
  }
]

laboratories.each do |laboratory|
  Laboratory.create! laboratory
end

Project.destroy_all
projects = [
  {
    id: 1,
    name_fr: "Identification et résolution d'artefacts en phylogénomique par l'utilisation de la méthode LS3: analyses chez les poissons téléostéens et chez d'autres vertébrés.",
    description_fr: "**Thématique:** Phylogénomique\n
    Les méthodes d'inférence phylogénétique ont connu de grandes améliorations ces dernières années, en particulier par le développement de modèles d'évolution de séquences de plus en plus réalistes. Toutefois, les modèles actuels ne peuvent prendre en compte la possibilité que la vitesse d'évolution soit très différente entre les lignées analysées. Une telle situation peut mener à l'artefact d' “attraction des longues branches” qui conduit à des reconstructions phylogénétiques erronées.
Dans notre laboratoire, nous avons développé une méthodes appelée “Locus Specific Sequence Subsampling” (LS³) qui permet d'identifier et de retirer du jeu de données les gènes et les séquences dont la vitesse d'évolution est trop rapide pour assumer un taux d'évolution homogène entre lignées.
L'objectif de ce travail de master est d'inférer la phylogénie de plusieurs lignées de poissons, puis de l'ensemble des poissons téléostéens, sur la base de nombreux gènes (phylogénomique) en utilisant la nouvelle méthode LS3. En effet, les relations évolutives entre grandes lignées de téléostéens sont encore incertaines dans de nombreuses parties de l'arbre des poissons et certaines de ces régions problématiques montrent les signes d'une “attraction des longues branches”. En fonction des résultats, d'autres régions problématiques dans l'arbre phylogénétique de vertébrés pourraient être passées au crible de la méthode LS3.",
      laboratory_id: 1
    },
  {
    id: 2,
    name_fr: "Etude des spéciations induites par une ancienne connexion entre le bassin de l'Amazone et celui du Parana-Paraguay dans les Andes bolivienne par l'établissement de phylogénies intra-génériques de l'ichtyofaune bolivienne",
    description_fr: %Q{Thématique: Biogéographie et processus de diversification

    L'Amérique tropicale (Néotropiques) recèle la plus grande biodiversité continentale, et également l'ichtyofaune la plus riche du globe terrestre. Comprendre comment cette biodiversité s'est mise en place est une question centrale en biologie de l'évolution. Dans ce projet, nous nous intéresserons à l'étude de la diversité des poissons dans les plus grands bassins fluviaux des Néotropiques: l'Amazone et le Parana-Paraguay. Nous analyserons plus particulièrement un épisode potentiel d'échanges de faune piscicole entre ces deux grands bassins qui aurait eu lieu il y a près de 3.5 millions d'années dans les Andes à l'est de la Bolivie. Des travaux géologiques récents ont documentés un changement du cours d'un affluent important de la rivière Madeira (grand affluent de l'Amazone) qui s'est déconnecté du bassin de l'Amazone pour se connecter au bassin du Parana-Paraguay. Un tel changement hydrographique a très probablement été accompagné par une nouvel apport de poissons amazoniens dans le bassin du Parana-Paraguay.
Par la reconstruction de phylogénies de plusieurs genres choisis de poissons ayant des représentants dans les deux bassins, nous allons identifier les évènements de spéciations qui pourraient remonter à cette cause. Par l'application de méthodes de calibrations des phylogénies, il sera possible de vérifier si les âges de spéciation correspondent à l'âge de l'évènement de capture de rivière. Le cas échéant, cet évènement géologique servira de point de calibration pour toutes les analyses en cours et futures sur la phylogénie des poissons néotropicaux. D'autre part, cette étude permettra une meilleure connaissance du rôle des changements hydrologiques comme moteur à la spéciation allopatrique pour expliquer l'énorme biodiversité rencontrée dans les Néotropiques.},
  laboratory_id: 1
  },
  {
    id: 3,
    name_fr: "Utilisation de la transcriptomique comparative pour élucider les bases génétiques des processus adaptatifs chez les vertébrés",
    description_fr: "**Thématique:** Evolution adaptative\n
Dans ce projet, l'étudiant utilisera une nouvelle méthode développée dans notre laboratoire pour établir la liste des gènes qui ont évolués sous sélection positive darwinienne (Positively Selected Genes, PSG) après la divergence entre deux espèces proches. L'étudiant analysera des paires d'espèces proches montrant de grandes différences phénotypiques associées à des adaptations notoires. Les gènes identifiés comme PSG seront classifiés selon leur ontologie (Gene Ontology, GO) et selon leur appartenance à des réseaux de régulation génétique. Ces résultats permettront d'identifier les catégories de GO ou les réseaux de régulation génétique les plus souvent impliqués dans des processus adaptatifs.
Cette recherche nécessitera du travail de laboratoire comme des extractions d'ARN et la préparation de librairies de cDNA pour effectuer des expériences de RNA-seq (séquençage massif de l'ensemble des ARNs d'un tissu ou d'un organisme). D'autre part, des outils de bioinformatiques seront utilisés pour l'assemblage des transcriptomes et les analyses de pression de sélection agissant sur les gènes ainsi que la classification des PSG en classes de GO et en réseaux de régulation génétique.",
  laboratory_id: 1
  },
  {
    id: 4,
    name_fr: "Diversité et génétique des symbioses entre rhizobia et légumineuses",
    name_en: "Diversity and genetics of N2-fixing symbioses between rhizobia and legumes",
    description_en: %Q{### Background

Insufficient nitrogen is one of the major soil parameters that limit plant growth. That most of the Fabaceae may associate with the nitrogen-fixing soil bacteria know as rhizobia makes these plants capable of growing even in the absence of nitrogen fertilizers. This characteristic, which contributed to the global ecological success of legumes (>20,000 species), also provides an opportunity to use rhizobial inoculants on important crops such as soybean, bean, and chickpea, and thus promote sustainable agricultural practices.

To fix atmospheric nitrogen (N2) for the benefit of host plants, rhizobia must first colonize the intracellular space of specialized plant cells found inside root nodules. The infection that allows free-living rhizobia to enter roots and establish persistent colonies inside nodule cells is strictly controlled by plants. The exchange of many molecular signals between host plants and rhizobia helps discriminate symbiotic from pathogenic bacteria.

### Research

Our laboratory explores two facets of these beneficial plant-microbe associations:

1. The natural diversity of rhizobia and their adaptation to specific plant cultivars, and
2. The genetic basis for the exceptional promiscuity of the symbiotic strain Sinorhizobium fredii NGR234.

### Projects

Diversity of rhizobia in agricultural or natural ecosystems is poorly explored. We propose to collect plant nodules in selected ecosystems (in Switzerland or abroad), followed by characterization of the rhizobia isolated from nodules. Identification is achieved using diverse molecular techniques, including mass spectrometry and DNA sequence analysis.

For those who prefer to focus on molecular techniques, selected genes of the model strain ￼￼￼￼NGR234 will be inactivated by site-directed mutagenesis. Then, the symbiotic phenotypes of the resulting mutants will be scored on a number of host plants.

Projects for Master thesis are defined together with the applicant, taking into a his/her primary interests as well as research currently underway in the laboratory.},
    description_fr: %Q{### Informations Générales

La quantité d’azote réduit est un des paramètres qui limitent la croissance des plantes. La plupart des Fabaceae formant des symbioses fixatrices d’azote avec les bactéries du sol appelées rhizobia, ces plantes sont capables de prospérer sans apports d’engrais azotés. Cette caractéristique qui a contribué au succès écologique des légumineuses (>20,000 espèces recensées) est maintenant utilisée pour promouvoir une agriculture plus respectueuse de l’environnement, par exemple en inoculant des cultures aussi importantes que le soja, le haricot ou le pois chiche avec des souches symbiotiques sélectionnées.

Toutefois, avant de pouvoir réduire l’azote atmosphérique (N2) les rhizobia doivent d’abord coloniser l’espace intracellulaire de cellules végétales regroupées dans des nodosités qui se forment sur les racines ou tiges des plantes hôtes. Le processus infectieux qui conduit les rhizobia à travers les tissus racinaires et jusque dans les cellules des nodosités est strictement contrôlé par les légumineuses : un échange de signaux moléculaires permettant aux plantes de reconnaître les bactéries symbiotiques de celles qui sont pathogènes.

### Thématiques de Recherche

Notre laboratoire explore deux facettes de ces associations entre plantes et microbes:

1. La diversité naturelle des rhizobia et leur adaptation à des variétés spécifiques, et
2. Les bases génétiques de l’exceptionnelle promiscuité symbiotique de la souche Sinorhizobium fredii NGR234.

#### Projets

La diversité des rhizobia dans les écosystèmes naturels ou agricoles est encore peu explorée. Nous proposons donc de récolter des nodosités dans divers écosystèmes, en Suisse ou à l’étranger. Puis, les rhizobia isolés de ces nodosités sont identifiés grâce à diverses techniques moléculaires comme la spectrométrie de masse ou le séquençage.

Pour ceux qui préfèrent s’investir dans les analyses moléculaires, il est aussi possible d’inactiver par mutagénèse dirigée un ou des gènes de la souche modèle NGR234 puis d’analyser les phénotypes symbiotiques de ces mutants sur diverses plantes hôtes.

Les projets de Master sont définis en accord avec les candidats, en tenant compte des intérêts personnels ainsi que des recherches en cours au laboratoire.},
  laboratory_id: 2
  }
]

projects.each do |project|
  Project.create! project
end
I18n.with_locale(:en) do
  Project.find_each(&:save)
end
I18n.with_locale(:fr) do
  Project.find_each(&:save)
end
