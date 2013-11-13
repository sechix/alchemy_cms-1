require 'spec_helper'

module Alchemy
  describe "ActsAsEssence" do
    #let(:element) { FactoryGirl.create(:element, :name => 'headline', :create_contents_after_create => true) }
    let(:essence) { build_stubbed(:essence_text) }

    describe '#ingredient=' do
      it 'should set the value to ingredient column' do
        essence.ingredient = 'Hallo'
        expect(essence.ingredient).to eq('Hallo')
      end
    end

    describe '#open_link_in_new_window?' do

      subject { essence.open_link_in_new_window? }

      context 'essence responds to link_taget' do
        context 'if link_target attribute is set to "blank"' do

          before { essence.link_target = 'blank' }

          it "should return true" do
            expect(subject).to eq(true)
          end
        end

        context 'if link_target attribute is not "blank"' do
          it "should return false" do
            expect(subject).to eq(false)
          end
        end
      end
    end

    describe '#page' do
      let(:page) { build_stubbed(:page) }
      let(:element) { build_stubbed(:element, page: page) }

      context 'essence has no element' do
        it "should return nil" do
          expect(essence.page).to eq(nil)
        end
      end

      it "should return the page the essence is placed on" do
        essence.stub(:element).and_return(element)
        expect(essence.page).to eq(page)
      end
    end

  end
end
