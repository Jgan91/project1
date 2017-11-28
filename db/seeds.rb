Language.destroy_all
english = Language.create :name => 'English', :num_native_speaker => 400000000, :sample => 'All human beings are born free and equal in dignity and rights. They are endowed with reason and conscience and should act towards one another in a spirit of brotherhood.'
japanese = Language.create :name => 'Japanese', :region => 'Japan', :num_native_speaker => 125000000, :sample => 'すべての人間は、生まれながらにして自由であり、かつ、尊厳と権利とについて平等である。人間は、理性と良心を授けられてあり、互いに同胞の精神をもって行動しなければならない。'
french = Language.create :name => 'French', :region => 'France', :num_native_speaker => 150000000, :sample => 'Tous les êtres humains naissent libres et égaux en dignité et en droits. Ils sont doués de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternité.'
german = Language.create :name => 'German', :sample => 'Alle Menschen sind frei und gleich an Würde und Rechten geboren. Sie sind mit Vernunft und Gewissen begabt und sollen einander im Geist der Brüderlichkeit begegnen.'
italian = Language.create :name => 'Italian', :sample => 'Tutti gli esseri umani nascono liberi ed eguali in dignità e diritti. Essi sono dotati di ragione e di coscienza e devono agire gli uni verso gli altri in spirito di fratellanza.'
romansh = Language.create :name => 'Romansh', :sample => 'Tuots umans naschan libers ed eguals in dignità e drets. Els sun dotats cun intellet e conscienza e dessan agir tanter per in uin spiert da fraternità.'

LanguageFamily.destroy_all
oil = LanguageFamily.create :name => 'Oil'
japonic = LanguageFamily.create :name => 'Japonic'
anglic = LanguageFamily.create :name => 'Anglic'

WritingSystem.destroy_all
katakana = WritingSystem.create :name => 'Katakana', :time_period => '~800 AD to the present'
hiragana = WritingSystem.create :name => 'Hiragana', :time_period => '~800 AD to the present'
kanji = WritingSystem.create :name => 'Kanji', :time_period => '~57 AD to the present'
latin = WritingSystem.create :name => 'Latin', :time_period => '~700 BC-present'

Country.destroy_all
australia = Country.create :name => 'Australia'
england = Country.create :name => 'England'
france = Country.create :name => 'France'
japan = Country.create :name => 'Japan'
canada = Country.create :name => 'Canada'
switzerland = Country.create :name => 'Switzerland'

english.writing_systems << latin
japanese.writing_systems << katakana << hiragana << kanji
french.writing_systems << latin

oil.languages << french
japonic.languages << japanese
anglic.languages << english

australia.languages << english
england.languages << english
france.languages << french
japan.languages << japanese
