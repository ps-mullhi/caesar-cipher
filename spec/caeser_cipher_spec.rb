require_relative '../lib/caesar_cipher'

RSpec.describe do
  describe '#is_letter?' do
    context 'when testing for a valid letter' do
      it 'works with lowercase letter' do
        expect(is_letter?('a')).to be_truthy
        expect(is_letter?('z')).to be_truthy
      end

      it 'works with uppercase letter' do
        expect(is_letter?('A')).to be_truthy
        expect(is_letter?('Z')).to be_truthy
      end
    end

    context 'when testing for invalid input' do
      it 'doesn\'t work with numbers' do
        expect(is_letter?('0')).to be_falsy
        expect(is_letter?('9')).to be_falsy
      end

      it 'doesn\'t work with symbols' do
        expect(is_letter?('!')).to be_falsy
        expect(is_letter?('@')).to be_falsy
      end

      it 'doesn\'t work with inputs longer than length 1' do
        expect(is_letter?('aa')).to be_falsy
        expect(is_letter?('zz')).to be_falsy
      end
    end
  end
end
