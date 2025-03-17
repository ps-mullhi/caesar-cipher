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

  describe '#is_upper?' do
    it 'works with uppercase letter' do
      expect(is_upper?('A')).to be_truthy
      expect(is_upper?('Z')).to be_truthy
    end

    it 'doesn\'t work with lowercase letter' do
      expect(is_upper?('a')).to be_falsy
      expect(is_upper?('z')).to be_falsy
    end
  end

  describe '#cipher_char' do
    context 'when ciphering a char' do
      lowercase_lower_bound = 97
      lowercase_upper_bound = 122
      uppercase_lower_bound = 65
      uppercase_upper_bound = 90

      it 'works with small positive shift on lowercase letter' do
        small_shift = 3
        small_result = cipher_char('a', small_shift, lowercase_lower_bound, lowercase_upper_bound)
        expect(small_result).to eql('d')
      end

      it 'works with small negative shift on lowercase letter' do
        small_shift = -4
        small_result = cipher_char('p', small_shift, lowercase_lower_bound, lowercase_upper_bound)
        expect(small_result).to eql('l')
      end

      it 'works with big positive shift on lowercase letter' do
        big_shift = 33
        big_result = cipher_char('g', big_shift, lowercase_lower_bound, lowercase_upper_bound)
        expect(big_result).to eql('n')
      end

      it 'works with big negative shift on lowercase letter' do
        big_shift = -53
        big_result = cipher_char('s', big_shift, lowercase_lower_bound, lowercase_upper_bound)
        expect(big_result).to eql('r')
      end

      it 'works with small positive shift on uppercase letter' do
        small_shift = 3
        small_result = cipher_char('A', small_shift, uppercase_lower_bound, uppercase_upper_bound)
        expect(small_result).to eql('D')
      end

      it 'works with small negative shift on uppercase letter' do
        small_shift = -4
        small_result = cipher_char('P', small_shift, uppercase_lower_bound, uppercase_upper_bound)
        expect(small_result).to eql('L')
      end

      it 'works with big positive shift on uppercase letter' do
        big_shift = 33
        big_result = cipher_char('G', big_shift, uppercase_lower_bound, uppercase_upper_bound)
        expect(big_result).to eql('N')
      end

      it 'works with big negative shift on uppercase letter' do
        big_shift = -53
        big_result = cipher_char('S', big_shift, uppercase_lower_bound, uppercase_upper_bound)
        expect(big_result).to eql('R')
      end
    end

    context 'when ciphering a phrase' do
      it 'works with small positive shift' do
        small_shift = 4
        expect { caesar_cipher('AbCd', small_shift) }.to output("EfGh\n").to_stdout
      end

      it 'works with small negative shift' do
        small_shift = -3
        expect { caesar_cipher('abCd!?, ++ l', small_shift) }.to output("xyZa!?, ++ i\n").to_stdout
      end

      it 'works with big positive shift' do
        big_shift = 47
        expect do
          caesar_cipher('I\'m doing alright, thanks...', big_shift)
        end.to output("D'h yjdib vgmdbco, ocvifn...\n").to_stdout
      end

      it 'works with big negative shift' do
        big_shift = -72
        expect do
          caesar_cipher('I\'m doing alright, thanks...', big_shift)
        end.to output("O's juotm grxomnz, zngtqy...\n").to_stdout
      end
    end
  end
end
