class Books {
  String title;
  String author;
  String description;
  List<String> genre;
  String imageUrl;
  String totalReviews;
  String price;
  String rating;

  Books(
      {required this.title,
      required this.author,
      required this.description,
      required this.genre,
      required this.imageUrl,
      required this.totalReviews,
      required this.price,
      required this.rating});
}

List<Books> listOfBooks = [
  Books(
      title: 'Anna Karenina',
      author: 'Leo Tolstoy',
      description:
          'Any fan of stories that involve juicy subjects like adultery, gambling, marriage plots, and, well, Russian feudalism, would instantly place Anna Karenina at the peak of their “greatest novels” list. And that’s exactly the ranking that publications like Time magazine have given the novel since it was published in its entirety in 1878. Written by Russian novelist Leo Tolstoy, the eight-part towering work of fiction tells the story of two major characters: a tragic, disenchanted housewife, the titular Anna, who runs off with her young lover, and a lovestruck landowner named Konstantin Levin, who struggles in faith and philosophy. Tolstoy molds together thoughtful discussions on love, pain, and family in Russian society with a sizable cast of characters regarded for their realistic humanity. The novel was especially revolutionary in its treatment of women, depicting prejudices and social hardships of the time with vivid emotion.',
      genre: [
        'Novel',
        'Drama',
        'Literary Realism',
        'Romance Novel',
        'Erotic Literature',
        'Historical Fiction'
      ],
      imageUrl: 'assets/images/anna-karenina.jpg',
      totalReviews: '1.363',
      price: '12.99',
      rating: '4.6'),
  Books(
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      description:
          'Harper Lee, believed to be one of the most influential authors to have ever existed, famously published only a single novel (up until its controversial sequel was published in 2015 just before her death). Lee’s To Kill a Mockingbird was published in 1960 and became an immediate classic of literature. The novel examines racism in the American South through the innocent wide eyes of a clever young girl named Jean Louise (“Scout”) Finch. Its iconic characters, most notably the sympathetic and just lawyer and father Atticus Finch, served as role models and changed perspectives in the United States at a time when tensions regarding race were high. To Kill a Mockingbird earned the Pulitzer Prize for fiction in 1961 and was made into an Academy Award-winning film in 1962, giving the story and its characters further life and influence over the American social sphere.',
      genre: [
        'Novel',
        'Bildungsroman',
        'Domestic Fiction',
        'Southern Gothic',
        'Legal Story',
        'Thriller'
      ],
      imageUrl: 'assets/images/to-kill-a-mockingbird.jpg',
      totalReviews: '17.360',
      price: '14.98',
      rating: '4.8'),
  Books(
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      description:
          'F. Scott Fitzgerald’s The Great Gatsby is distinguished as one of the greatest texts for introducing students to the art of reading literature critically (which means you may have read it in school). The novel is told from the perspective of a young man named Nick Carraway who has recently moved to New York City and is befriended by his eccentric nouveau riche neighbor with mysterious origins, Jay Gatsby. The Great Gatsby provides an insider’s look into the Jazz Age of the 1920s in United States history while at the same time critiquing the idea of the “American Dream.” Perhaps the most famous aspect of the novel is its cover art—a piercing face projected onto a dark blue night sky and lights from a cityscape—an image that is also found, in a slightly different configuration, within the text itself as a key symbol.',
      genre: ['Novel', 'Fiction', 'Tragedy'],
      imageUrl: 'assets/images/the-great-gatsby.jpg',
      totalReviews: '18.037',
      price: '6.88',
      rating: '4.4'),
  Books(
      title: 'One Hundred Years of Solitude',
      author: 'Gabriel García Márquez',
      description:
          'The late Colombian author Gabriel García Márquez published his most famous work, One Hundred Years of Solitude, in 1967. The novel tells the story of seven generations of the Buendía family and follows the establishment of their town Macondo until its destruction along with the last of the family’s descendents. In fantastical form, the novel explores the genre of magic realism by emphasizing the extraordinary nature of commonplace things while mystical things are shown to be common. Márquez highlights the prevalence and power of myth and folktale in relating history and Latin American culture. The novel won many awards for Márquez, leading the way to his eventual honor of the Nobel Prize for Literature in 1982 for his entire body of work, of which One Hundred Years of Solitude is often lauded as his most triumphant.',
      genre: [
        'Novel',
        'Magical Realism',
        'High Fantasy',
        'Family Saga',
        'Epic Fiction'
      ],
      imageUrl: 'assets/images/one-hundred-years.jpg',
      totalReviews: '12.480',
      price: '18.99',
      rating: '4.5'),
  Books(
      title: 'A Passage to India',
      author: 'E.M Forster',
      description:
          'E.M. Forster wrote his novel A Passage to India after multiple trips to the country throughout his early life. The book was published in 1924 and follows a Muslim Indian doctor named Aziz and his relationships with an English professor, Cyril Fielding, and a visiting English schoolteacher named Adela Quested. When Adela believes that Aziz has assaulted her while on a trip to the Marabar caves near the fictional city of Chandrapore, where the story is set, tensions between the Indian community and the colonial British community rise. The possibility of friendship and connection between English and Indian people, despite their cultural differences and imperial tensions, is explored in the conflict. The novel’s colorful descriptions of nature, the landscape of India, and the figurative power that they are given within the text solidifies it as a great work of fiction.',
      genre: ['Novel', 'Fiction'],
      imageUrl: 'assets/images/passage-to-india.jpg',
      totalReviews: '3.812',
      price: '20.0',
      rating: '4.3'),
  Books(
      title: 'Beloved',
      author: 'Toni Morrison',
      description:
          'Toni Morrison’s 1987 spiritual and haunting novel Beloved tells the story of an escaped slave named Sethe who has fled to Cincinnati, Ohio, in the year 1873. The novel investigates the trauma of slavery even after freedom has been gained, depicting Sethe’s guilt and emotional pain after having killed her own child, whom she named Beloved, to keep her from living life as a slave. A spectral figure appears in the lives of the characters and goes by the same name as the child, embodying the family’s anguish and hardship and making their feelings and past unavoidable. The novel was lauded for addressing the psychological effects of slavery and the importance of family and community in healing. Beloved was awarded the Pulitzer Prize for fiction in 1988.',
      genre: ['Novel', 'Magical Realism', 'Historical Fiction'],
      imageUrl: 'assets/images/beloved.jpg',
      totalReviews: '425.861',
      price: '13.99',
      rating: '4.0'),
  Books(
      title: 'Things Fall Apart',
      author: 'Chinua Achebe',
      description:
          'The Western canon of “great literature” often focuses on writers who come from North America or Europe and often ignores accomplished writers and amazing works of literature from other parts of the world. Chinua Achebe’s Things Fall Apart, published in 1958, is one such work of Nigerian literature that had to overcome the bias of some literary circles and one that has been able to gain recognition worldwide despite it. The novel follows an Igbo man named Okonkwo, describing his family, the village in Nigeria where he lives, and the effects of British colonialism on his native country. The novel is an example of African postcolonial literature, a genre that has grown in size and recognition since the mid-1900s as African people have been able to share their often unheard stories of imperialism from the perspective of the colonized. The novel is frequently assigned for reading in courses on world literature and African studies.',
      genre: ['Novel', 'Historical Fiction'],
      imageUrl: 'assets/images/things-fall-apart.jpg',
      totalReviews: '12.897',
      price: '6.28',
      rating: '4.3'),
  Books(
      title: 'Mrs. Dalloway',
      author: 'Virginia Woolf',
      description:
          'Possibly the most idiosyncratic novel of this list, Virginia Woolf’s Mrs. Dalloway describes exactly one day in the life of a British socialite named Clarissa Dalloway. Using a combination of a third-person narration and the thoughts of various characters, the novel uses a stream-of-consciousness style all the way through. The result of this style is a deeply personal and revealing look into the characters’ minds, with the novel relying heavily on character rather than plot to tell its story. The thoughts of the characters include constant regrets and thoughts of the past, their struggles with mental illness and post-traumatic stress from World War I, and the effect of social pressures. The novel’s unique style, subject, and time setting make it one of the most respected and regarded works of all time.',
      genre: ['Novel', 'Psychological Fiction'],
      imageUrl: 'assets/images/mrs-dalloway.jpg',
      totalReviews: '425.861',
      price: '13.99',
      rating: '4.0'),
  Books(
      title: 'Jane Eyre',
      author: 'Charlotte Brontë',
      description:
          'Charlotte Brontë’s Jane Eyre, another novel often assigned for reading in school, was initially published in 1847 under the pseudonym Currer Bell to disguise the fact that the writer was a woman. Fortunately, a lot has changed with regard to women in literature since 1847, and Brontë now receives the credit she deserves for one of the most groundbreaking novels about women in history. At a time when the author felt compelled to hide her true identity, Jane Eyre provided a story of individualism for women. The novel’s eponymous character rises from being orphaned and poor into a successful and independent woman. The work combines themes from both Gothic and Victorian literature, revolutionizing the art of the novel by focusing on the growth in Jane’s sensibility with internalized action and writing.',
      genre: [
        'Novel',
        'Gothic Fiction',
        'Romance Novel',
        'Bildungsroman',
        'Social Criticism',
        'Fictional Autobiography'
      ],
      imageUrl: 'assets/images/jane-eyre.jpg',
      totalReviews: '15.193',
      price: '9.00',
      rating: '4.5'),
  Books(
      title: 'The Color Purple',
      author: 'Alice Walker',
      description:
          'Though the epistolary novel (a novel in the form of letters written by one or more characters) was most popular before the 19th century, Alice Walker became a champion of the style with her 1982 novel The Color Purple, which won a Pulitzer Prize and a National Book Award. Set in the post-Civil War American South, the novel follows a young African American girl named Celie into adulthood in letters she writes to God and to her sister Nettie. Celie faces sexual abuse by her father and eventually her husband, chronicling her own suffering and growth as well as that of her friends and family. The novel explores themes of sexism, racism, gender, sexual orientation, and disability through its grouping of disadvantaged and damaged characters who, over time, grow to shape their own lives. The story was adapted into an Academy Award-nominated film in 1985 that, despite widespread critical acclaim, was notoriously snubbed of all 11 awards it was nominated for.',
      genre: ['Novel', 'Domestic Fiction', 'Epistolary Novel'],
      imageUrl: 'assets/images/the-color-purple.jpg',
      totalReviews: '15.557',
      price: '17.00',
      rating: '4.7')
];
