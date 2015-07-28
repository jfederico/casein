require 'spec_helper'
require 'rspec/rails'

describe Members::MembersHelper, type: :helper do

  before do
    allow(subject).to receive("link_to").and_return("LINK_TO")
  end

  describe '#members_get_footer_string' do
    it "builds a form field" do
      expect(helper.members_get_footer_string false).to include "Running on"
      expect(helper.members_get_footer_string false).to have_link "Members", href: 'http://www.memberscms.com'
    end
  end

  describe "#members_get_version_info" do
    it "returns the correct version info" do
      expect(helper.members_get_version_info)
    end
  end

  describe "#members_get_short_version_string" do
    it "returns the correct version info" do
      expect(helper.members_get_short_version_string).to eql 'v' + Members::VERSION.split(".").first
    end
  end

  describe "#members_get_full_version_string" do
    it "returns the correct version info" do
      expect(helper.members_get_full_version_string).to eql "v" + Members::VERSION
    end
  end

  describe 'field helpers' do

    let(:helper) { TestActionViewClass.new }
    let(:obj) { TestModel.new }
    let(:opts) { {} }
    let(:builder) { ActionView::Helpers::FormBuilder.new :test_model, obj, helper, opts }

    describe "#members_color_field" do
      it "builds an html5 color field" do
        field = helper.members_color_field(builder, obj, 'my_color')
        expect(field).to have_css('.form-group .well input#test_model_my_color')
        expect(field).to have_css('.form-group label.control-label', "My Color")
        expect(field).to have_css('.form-group .well input.form-control')
      end
    end

    describe "#members_telephone_field" do
      it "builds an html5 telephone field" do
        field = helper.members_telephone_field(builder, obj, 'my_telephone')
        expect(field).to have_css('.form-group .well input#test_model_my_telephone')
        expect(field).to have_css('.form-group label.control-label', "My Telephone")
        expect(field).to have_css('.form-group .well input.form-control')
      end
    end

    describe "#members_search_field" do
      it "builds an html5 search field" do
        field = helper.members_search_field(builder, obj, 'my_search')
        expect(field).to have_css('.form-group .well input#test_model_my_search')
        expect(field).to have_css('.form-group label.control-label', "My Search")
        expect(field).to have_css('.form-group .well input.form-control')
      end
    end

    describe "#members_url_field" do
      it "builds an html5 url field" do
        field = helper.members_url_field(builder, obj, 'my_url')
        expect(field).to have_css('.form-group .well input#test_model_my_url')
        expect(field).to have_css('.form-group label.control-label', "My Url")
        expect(field).to have_css('.form-group .well input.form-control')
      end
    end

    describe "#members_email_field" do
      it "builds an html5 email field" do
        field = helper.members_email_field(builder, obj, 'my_email')
        expect(field).to have_css('.form-group .well input#test_model_my_email')
        expect(field).to have_css('.form-group label.control-label', "My Email")
        expect(field).to have_css('.form-group .well input.form-control')
      end
    end

    describe "#members_date_field" do
      it "builds an html5 date field" do
        field = helper.members_date_field(builder, obj, 'my_date')
        expect(field).to have_css('.form-group .well input#test_model_my_date')
        expect(field).to have_css('.form-group label.control-label', "My Date")
        expect(field).to have_css('.form-group .well input.form-control')
      end
    end

    describe "#members_datetime_field" do
      it "builds an html5 datetime field" do
        field = helper.members_datetime_field(builder, obj, 'my_datetime')
        expect(field).to have_css('.form-group .well input#test_model_my_datetime')
        expect(field).to have_css('.form-group label.control-label', "My Datetime")
        expect(field).to have_css('.form-group .well input.form-control')
      end
    end

    describe "#members_datetime_local_field" do
      it "builds an html5 datetime_local field" do
        field = helper.members_datetime_local_field(builder, obj, 'my_datetime_local')
        expect(field).to have_css('.form-group .well input#test_model_my_datetime_local')
        expect(field).to have_css('.form-group label.control-label', "My Datetime_Local")
        expect(field).to have_css('.form-group .well input.form-control')
      end
    end

    describe "#members_month_field" do
      it "builds an html5 month field" do
        field = helper.members_month_field(builder, obj, 'my_month')
        expect(field).to have_css('.form-group .well input#test_model_my_month')
        expect(field).to have_css('.form-group label.control-label', "My Month")
        expect(field).to have_css('.form-group .well input.form-control')
      end
    end

    describe "#members_week_field" do
      it "builds an html5 week field" do
        field = helper.members_week_field(builder, obj, 'my_week')
        expect(field).to have_css('.form-group .well input#test_model_my_week')
        expect(field).to have_css('.form-group label.control-label', "My Week")
        expect(field).to have_css('.form-group .well input.form-control')
      end
    end

    describe "#members_time_field" do
      it "builds an html5 time field" do
        field = helper.members_time_field(builder, obj, 'my_time')
        expect(field).to have_css('.form-group .well input#test_model_my_time')
        expect(field).to have_css('.form-group label.control-label', "My Time")
        expect(field).to have_css('.form-group .well input.form-control')
      end
    end

    describe "#members_number_field" do
      it "builds an html5 number field" do
        field = helper.members_number_field(builder, obj, 'my_number', {:in => 1.0..20.0, :step => 0.5})
        expect(field).to have_css('.form-group .well input#test_model_my_number[step="0.5"]')
        expect(field).to have_css('.form-group label.control-label', "My Number")
        expect(field).to have_css('.form-group .well input.form-control')
      end
    end

    describe "#members_range_field" do
      it "builds an html5 range field" do
        field = helper.members_range_field(builder, obj, 'my_range', {:in => 1.0..10.0})
        expect(field).to have_css('.form-group .well input#test_model_my_range[max="10.0"]')
        expect(field).to have_css('.form-group label.control-label', "My Range")
        expect(field).to have_css('.form-group .well input.form-control')
      end
    end

  end

end
