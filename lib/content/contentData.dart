class MainGalleryName {
  MainGalleryName({
    required this.title,
  });
  final String title;
}

List<dynamic> allGalleryTitle = [
  MainGalleryName(title: 'Animal'),
  MainGalleryName(title: 'Fruit'),
  MainGalleryName(title: 'Food'),
];
// ------------------------------------------------------------

class GalleryData {
  GalleryData({
    required this.name,
    required this.subtitle,
    required this.pos,
    required this.detail,
    required this.img,
    required this.type,
  });
  final String name;
  final String subtitle;
  final String pos;
  final String detail;
  final String img;
  final String type;
}

List<dynamic> allDataInGallery = [
  GalleryData(
    name: "Cat",
    subtitle: "แมว",
    pos: "Noun",
    img: "assets/image/animalContent/cat.png",
    detail:
        "Cats are small animals. Its body is long, with sharp fangs and claws that can retract to hide its claws like a tiger.",
    type: "animal",
  ),
  GalleryData(
    name: "Chicken",
    subtitle: "ไก่",
    pos: "Noun",
    img: "assets/image/animalContent/chicken.png",
    detail:
        "Chickens are classified as birds. Chickens can fly for a short distance. tricky on the ground, ovulate first and then hatch.",
    type: "animal",
  ),
  GalleryData(
    name: "Shark",
    subtitle: "ฉลาม",
    pos: "Noun",
    img: "assets/image/animalContent/shark.png",
    detail:
        "There are now more than 440 species of shark sharks, all of which are carnivorous fish. have a slender shape Active swimming which may reach speeds of up to 35 km / h",
    type: "animal",
  ),
  GalleryData(
    name: "Rabbit",
    subtitle: "กระต่าย",
    pos: "Noun",
    img: "assets/image/animalContent/rabbit.png",
    detail:
        "Rabbits are small herbivorous mammals. Fluffy hair all over the body, short round tail, long ears compared to other animals.",
    type: "animal",
  ),
  GalleryData(
    name: "Wolf",
    subtitle: "หมาป่า",
    pos: "Noun",
    img: "assets/image/animalContent/wolf.png",
    detail:
        "Wolves are mammals. It is classified as a carnivorous animal with a rather fierce, agile, intelligent character.",
    type: "animal",
  ),
  GalleryData(
    name: "Raccoon",
    subtitle: "แร็กคูน",
    pos: "Noun",
    img: "assets/image/animalContent/raccoon.png",
    detail:
        "The raccoon is a widespread species in North and Central America. Raccoon can eat a wide variety of foods including meat and plants.",
    type: "animal",
  ),
  GalleryData(
    name: "Banana",
    subtitle: "กล้วย",
    pos: "Noun",
    img: "assets/image/fruitContent/banana.png",
    detail:
        "Banana is a large herbaceous plant. Flowering at the end of the stem is a flower and usually a long proboscis. There are ripe fruits that can be eaten.",
    type: "fruit",
  ),
  GalleryData(
    name: "Apple",
    subtitle: "แอปเปิ้ล",
    pos: "Noun",
    img: "assets/image/fruitContent/apple.png",
    detail:
        "The apple tree is a deciduous tree in the rose family. There are sweet fruits called apples. Apples are grown all over the world as a fruit tree.",
    type: "fruit",
  ),
  GalleryData(
    name: "Cherry",
    subtitle: "เชอร์รี่",
    pos: "Noun",
    img: "assets/image/fruitContent/cherry.png",
    detail:
        "Cherry is a kind of fruit. It has a sweet and sour taste. Cherry trees are perennials. It is a medium sized shrub. Likes cold weather, dark green leaves, white-pink flowers, small round fruits.",
    type: "fruit",
  ),
  GalleryData(
    name: "Mango",
    subtitle: "มะม่วง",
    pos: "Noun",
    img: "assets/image/fruitContent/mango.png",
    detail:
        "Mangoes are perennials. Distributed in tropical countries from India to the Philippines. Then it spread all over the world. Yellow ripe fruit has a sweet taste.",
    type: "fruit",
  ),
  GalleryData(
    name: "Orange",
    subtitle: "ส้ม",
    pos: "Noun",
    img: "assets/image/fruitContent/orange.png",
    detail:
        "Orange is a shrub or small tree. The fruit is sour or sweet. Often contain calcium, potassium, vitamin A and vitamin C, especially.",
    type: "fruit",
  ),
  GalleryData(
    name: "Plum",
    subtitle: "พลัม",
    pos: "Noun",
    img: "assets/image/fruitContent/plum.png",
    detail:
        "Plum is a fruit that has a hard, single-seeded fruit. When ripe, the rind is purple and black. yellow flesh sweet or sour taste.",
    type: "fruit",
  ),
  GalleryData(
    name: "Pizza",
    subtitle: "พิซซ่า",
    pos: "Noun",
    img: "assets/image/foodContent/pizza.png",
    detail:
        "Pizza is a type of Italian food and fast food. which the Italians invented It looks like a flat round piece of dough topped with tomato sauce. Then cooked by baking in the oven.",
    type: "food",
  ),
  GalleryData(
    name: "Burger",
    subtitle: "เบอร์เกอร์",
    pos: "Noun",
    img: "assets/image/foodContent/burger.png",
    detail:
        "Burgers are a type of food that is considered to be in the same category as sandwiches. It consists of cooked meat that looks like a sheet of stuffing in the middle. and followed by vegetables.",
    type: "food",
  ),
];

// ------------------------------------------------------------

class Animal {
  Animal(
      {required this.name,
      required this.img1,
      required this.img2,
      required this.correctAnswer,
      required this.correctImg,
      required this.subtitle,
      required this.pos});
  final String name;
  final String img1;
  final String img2;
  final String correctImg;
  final String subtitle;
  final String pos;
  final int correctAnswer;
}

final allAnimals = [
  Animal(
      name: 'Cat',
      subtitle: "แมว",
      pos: "Noun",
      correctAnswer: 1,
      correctImg: 'assets/image/animalContent/cat.png',
      img1: 'assets/image/animalContent/cat.png',
      img2: 'assets/image/animalContent/rabbit.png'),
  Animal(
      name: 'Chicken',
      subtitle: "ไก่",
      pos: "Noun",
      correctAnswer: 2,
      correctImg: 'assets/image/animalContent/chicken.png',
      img1: 'assets/image/animalContent/cat.png',
      img2: 'assets/image/animalContent/chicken.png'),
  Animal(
      name: 'Shark',
      subtitle: "ฉลาม",
      pos: "Noun",
      correctAnswer: 1,
      correctImg: 'assets/image/animalContent/shark.png',
      img1: 'assets/image/animalContent/shark.png',
      img2: 'assets/image/animalContent/wolf.png'),
  Animal(
      name: 'Rabbit',
      subtitle: "กระต่าย",
      pos: "Noun",
      correctAnswer: 2,
      correctImg: 'assets/image/animalContent/rabbit.png',
      img1: 'assets/image/animalContent/shark.png',
      img2: 'assets/image/animalContent/rabbit.png'),
  Animal(
      name: 'Raccoon',
      subtitle: "แร็กคูน",
      pos: "Noun",
      correctAnswer: 1,
      correctImg: 'assets/image/animalContent/raccoon.png',
      img1: 'assets/image/animalContent/raccoon.png',
      img2: 'assets/image/animalContent/wolf.png'),
  Animal(
      name: 'Wolf',
      subtitle: "หมาป่า",
      pos: "Noun",
      correctAnswer: 1,
      correctImg: 'assets/image/animalContent/wolf.png',
      img1: 'assets/image/animalContent/wolf.png',
      img2: 'assets/image/animalContent/chicken.png'),
];

// ------------------------------------------------------------

class Fruit {
  Fruit({
    required this.name,
    required this.correctImg,
    required this.subtitle,
    required this.pos,
  });
  final String name;
  final String correctImg;
  final String subtitle;
  final String pos;
}

final allfruit = [
  Fruit(
      name: 'apple',
      subtitle: 'แอปเปิ้ล',
      pos: 'Noum',
      correctImg: 'assets/image/fruitContent/apple.png'),
  Fruit(
      name: 'orange',
      subtitle: 'ส้ม',
      pos: 'Noum',
      correctImg: 'assets/image/fruitContent/orange.png'),
  Fruit(
      name: 'banana',
      subtitle: 'กล้วย',
      pos: 'Noum',
      correctImg: 'assets/image/fruitContent/banana.png'),
  Fruit(
      name: 'mango',
      subtitle: 'มะม่วง',
      pos: 'Noum',
      correctImg: 'assets/image/fruitContent/mango.png'),
  Fruit(
      name: 'plum',
      subtitle: 'พลัม',
      pos: 'Noum',
      correctImg: 'assets/image/fruitContent/plum.png'),
  Fruit(
      name: 'cherry',
      subtitle: 'เชอร์รี่',
      pos: 'Noum',
      correctImg: 'assets/image/fruitContent/cherry.png'),
];

// ------------------------------------------------------------

class SentenceExercise {
  SentenceExercise({
    required this.sentence,
    required this.name,
    required this.correctImg,
    required this.subtitle,
    required this.pos,
  });
  final String sentence;
  final String name;
  final String correctImg;
  final String subtitle;
  final String pos;
}

final sentenceExercise = [
  SentenceExercise(
      sentence:
          'The outside is red, the inside is golden yellow, crispy, sweet, just thright size, as big as a handful.',
      name: 'apple',
      subtitle: 'แอปเปิ้ล',
      pos: 'Noum',
      correctImg: 'assets/image/fruitContent/apple.png'),
  SentenceExercise(
      sentence: 'High in vitamin C, sweet and sour taste.',
      name: 'orange',
      subtitle: 'ส้ม',
      pos: 'Noum',
      correctImg: 'assets/image/fruitContent/orange.png'),
  SentenceExercise(
      sentence:
          'There are both green and yellow. When ripe, it is golden yellow with a sweet taste',
      name: 'mango',
      subtitle: 'มะม่วง',
      pos: 'Noum',
      correctImg: 'assets/image/fruitContent/mango.png'),
  SentenceExercise(
      sentence:
          'Small round fruit, the skin is both dark red. It has a sweet and sour taste.',
      name: 'cherry',
      subtitle: 'เชอร์รี่',
      pos: 'Noum',
      correctImg: 'assets/image/fruitContent/cherry.png'),
  SentenceExercise(
      sentence:
          'It has a tall and strong stem. The leaves are large and long. The ripe fruit is golden yellow.',
      name: 'banana',
      subtitle: 'กล้วย',
      pos: 'Noum',
      correctImg: 'assets/image/fruitContent/banana.png'),
  SentenceExercise(
      sentence:
          'It is a fruit that has a solid single-seed fruit. When ripe, the rind is purple and black. yellow flesh sweet or sour taste',
      name: 'plum',
      subtitle: 'พลัม',
      pos: 'Noum',
      correctImg: 'assets/image/fruitContent/plum.png'),
];

// ------------------------------------------------------------

