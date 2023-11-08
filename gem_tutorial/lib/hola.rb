# Says Hello
#
#
# @return [String] a string is returned!
class Hola
  def self.hi(language = "english")
    # here we are in self.hi
    translator = Translator.new(language)
    translator.hi
  end
end


require 'hola/translator'

