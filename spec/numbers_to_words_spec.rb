require('rspec')
require('numbers_to_words')
require('pry')

describe('Fixnum#numbers_to_words') do
  it('returns the name of a number 1 through 10') do
    expect(7.numbers_to_words).to(eq("seven"))
  end
  it ('returns the name of a two digit number') do
    expect(20.numbers_to_words).to(eq("twenty"))
  end
  it ('returns the name of the "teen" exception') do
    expect(18.numbers_to_words).to(eq("eighteen"))
  end
  it ('returns multiword two digit number') do
    expect(37.numbers_to_words).to(eq("thirty seven"))
  end
  it ('hundred digits number') do
    expect(237.numbers_to_words).to(eq("two hundred thirty seven"))
  end
end
