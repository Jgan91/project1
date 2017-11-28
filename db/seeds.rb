Language.destroy_all
english = Language.create :name => 'English', :num_native_speaker => 400000000
japanese = Language.create :name => 'Japanese', :region => 'Japan', :num_native_speaker => 125000000
french = Language.create :name => 'French', :region => 'France', :num_native_speaker => 150000000
german = Language.create :name => 'German'
italian = Language.create :name => 'Italian'
romansh = Language.create :name => 'Romansh'

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
