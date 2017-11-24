Language.destroy_all
l1 = Language.create :name => 'English', :num_native_speaker => 400000000
l2 = Language.create :name => 'Japanese', :region => 'Japan', :num_native_speaker => 125000000
l3 = Language.create :name => 'French', :region => 'France', :num_native_speaker => 150000000

LanguageFamily.destroy_all
f1 = LanguageFamily.create :name => 'Oil'
f2 = LanguageFamily.create :name => 'Japonic'
f3 = LanguageFamily.create :name => 'Anglic'

WritingSystem.destroy_all
w1 = WritingSystem.create :name => 'Katakana', :time_period => '~800 AD to the present'
w2 = WritingSystem.create :name => 'Hiragana', :time_period => '~800 AD to the present'
w3 = WritingSystem.create :name => 'Kanji', :time_period => '~57 AD to the present'
w4 = WritingSystem.create :name => 'Latin', :time_period => '~700 BC-present'

Country.destroy_all
c1 = Country.create :name => 'Australia'
c2 = Country.create :name => 'England'
c3 = Country.create :name => 'France'
c4 = Country.create :name => 'Japan'

l1.writing_systems << w4
l2.writing_systems << w1 << w2 << w3
l3.writing_systems << w4

f1.languages << l3
f2.languages << l2
f3.languages << l1

c1.languages << l1
c2.languages << l1
c3.languages << l2
c4.languages << l3
