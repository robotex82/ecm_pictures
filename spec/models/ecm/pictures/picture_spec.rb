require 'spec_helper'

module Ecm
  module Pictures
    describe Picture do
      subject { FactoryGirl.create(:ecm_pictures_picture) }

      context "associations" do
        it { should belong_to(:picture_gallery) }
      end
      
      context "acts as list" do
        it { should respond_to(:move_to_top) }
        it { should respond_to(:move_higher) }
        it { should respond_to(:move_lower) }
        it { should respond_to(:move_to_bottom) }
      end
      
      context "friendly id" do
        subject { Factory.create(:ecm_pictures_picture, :name => 'Look, a slugged category!') }
        
        its(:to_param) { should eq('look-a-slugged-category') }
      end      

      context "paperclip" do
        it { should have_attached_file(:image) }
        it { should validate_attachment_presence(:image) }
      end

      context 'sets default handler' do
        subject { Ecm::Pictures::Picture.new }
        its(:markup_language) { should eq(Ecm::Pictures::Configuration.default_markup_language.to_s) }
      end

      context "sets default name" do
        subject { FactoryGirl.create(:ecm_pictures_picture, :name => nil) }

        it { should be_valid }

        it "should generate a name from the filename if name is nil" do
          subject.valid?
          subject.name.should eq("example")
        end

        subject { FactoryGirl.create(:ecm_pictures_picture, :name => "") }

        it { should be_valid }

        it "should generate a name from the filename if name is nil" do
          subject.valid?
          subject.name.should eq("example")
        end
      end

      context "validations" do
        # name is set to the image filename without extension if name is missing.
        # it { should validate_presence_of(:name) }

        it { should ensure_inclusion_of(:markup_language).in_array(Ecm::Pictures::Configuration.markup_languages.map(&:to_s)) }
        it { should_not allow_value(%w[foo bar baz]).for(:markup_language) }
      end
    end
  end
end    
