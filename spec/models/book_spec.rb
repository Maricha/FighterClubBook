require 'rails_helper'

RSpec.describe Book, type: :model do
  before(:all) do
    @book = Book.new(fname: "Pan Tadeusz", sname: "Epopeja", desc: "Super")
  end

  it 'should have good name' do
    expect(@book.fname).to eq('Pan Tadeusz')
  end

  it 'should have good super name' do
    expect(@book.sname).to eq('Epopeja')
  end

  it 'should have good desc' do
    expect(@book.desc).to eq('Super')
  end

end
