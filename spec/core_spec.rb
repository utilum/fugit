
#
# Specifying fugit
#
# Tue Jan  3 11:19:52 JST 2017  Ishinomaki
#

require 'spec_helper'


describe Fugit do

  describe '.parse' do

    it 'parses time points' do

      t = Fugit.parse('2017-01-03 11:21:17')

      expect(t.class).to eq(::Time)
      expect(Fugit.time_to_plain_s(t)).to eq('2017-01-03 11:21:17')
    end

    it 'parses cron strings' do

      c = Fugit.parse('00 00 L 5 *')

      expect(c.class).to eq(Fugit::Cron)
      expect(c.to_cron_s).to eq('0 0 -1 5 *')
    end

    it 'parses durations' do

      d = Fugit.parse('1Y3M2d')

      expect(d.class).to eq(Fugit::Duration)
      expect(d.to_plain_s).to eq('1Y3M2D')
    end

    it 'parses durations' do

      d = Fugit.parse('1Y2h')

      expect(d.class).to eq(Fugit::Duration)
      expect(d.to_plain_s).to eq('1Y2h')
    end
  end
end
