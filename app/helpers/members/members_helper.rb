module Members
  module MembersHelper

    def members_get_footer_string include_version = false
      if include_version
        "Running on #{link_to 'Members', 'http://www.memberscms.com'} #{members_get_full_version_string}, an open-source project.".html_safe
      else
        "Running on #{link_to 'Members', 'http://www.memberscms.com'}, an open-source project.".html_safe
      end
    end

	  def members_get_version_info
      Members::VERSION_HASH
	  end

  	def members_get_full_version_string
      "v#{Members::VERSION}"
  	end

  	def members_get_short_version_string
      version_info = members_get_version_info
  	  "v#{version_info[:major]}"
  	end

  	def members_generate_page_title

  		if @members_page_title.nil?
  			return members_config_website_name
  		end

  		members_config_website_name + " > " + @members_page_title
  	end

  	def members_get_access_level_text level
  	  case level
      when $CASEIN_USER_ACCESS_LEVEL_ADMIN
        return "Administrator"
      when $CASEIN_USER_ACCESS_LEVEL_USER
  	    return "User"
  	  else
  	    return "Unknown"
  	  end
  	end

  	def members_get_access_level_array
  	  [["Administrator", $CASEIN_USER_ACCESS_LEVEL_ADMIN], ["User", $CASEIN_USER_ACCESS_LEVEL_USER]]
  	end

    def members_pagination_details objs
      " <small class='pagination-details'>/ page #{objs.current_page} of #{objs.total_pages}</small>".html_safe if objs.current_page && objs.total_pages > 1
    end

  	def members_table_cell_link contents, link, options = {}

  	  if options.key? :members_truncate
  	    contents = truncate(contents, :length => options[:members_truncate], :omission => "...")
  	  end

    	link_to "#{contents}".html_safe, link, options
    end

    def members_table_cell_no_link contents, options = {}

  	  if options.key? :members_truncate
  	    contents = truncate(contents, :length => options[:members_truncate], :omission => "...")
  	  end

    	"<div class='no-link'>#{contents}</div>".html_safe
    end

    def members_span_icon icon_name
      "<span class='glyphicon glyphicon-#{icon_name}' title='#{icon_name.titleize}'></span>"
    end

  	def members_show_icon icon_name
  		"<div class='icon'>#{members_span_icon icon_name}</div>".html_safe
  	end

  	def members_show_row_icon icon_name
      "<div class='iconRow'>#{members_span_icon icon_name}</div>".html_safe
  	end

    def members_format_date date, format = "%b %d, %Y"
      date.strftime(format)
    end

    def members_format_time time, format = "%H:%M"
      time.strftime(format)
    end

    def members_format_datetime datetime, format = "%b %d, %Y %H:%M"
      datetime.strftime(format)
    end

    def members_sort_link title, column, options = {}
      condition = options[:unless] if options.has_key?(:unless)
      icon_to_show_html = "<div class='table-header-icon'>&nbsp;</div>".html_safe
      if params[:c].to_s == column.to_s
        icon_to_show = params[:d] == 'down' ? 'chevron-up' : 'chevron-down'
        icon_to_show_html = "<div class='table-header-icon glyphicon glyphicon-#{icon_to_show}'></div>".html_safe
      end
      sort_dir = params[:d] == 'down' ? 'up' : 'down'
      link_to_unless(condition, title, request.parameters.merge({:c => column, :d => sort_dir})) + icon_to_show_html
    end

    def members_yes_no_label value
      if value
        return "<span class='label label-success'>Yes</span>".html_safe
      else
        return "<span class='label label-danger'>No</span>".html_safe
      end
    end

    def members_no_yes_label value
      if value
        return "<span class='label label-danger'>Yes</span>".html_safe
      else
        return "<span class='label label-success'>No</span>".html_safe
      end
    end

  	# Styled form tag helpers

  	def members_text_field form, obj, attribute, options = {}
  	  members_form_tag_wrapper(form.text_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
  	end

  	def members_password_field form, obj, attribute, options = {}
  		members_form_tag_wrapper(form.password_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
  	end

  	def members_text_area form, obj, attribute, options = {}
  	  members_form_tag_wrapper(form.text_area(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
  	end

  	def members_text_area_big form, obj, attribute, options = {}
  	  members_form_tag_wrapper(form.text_area(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
  	end

  	def members_check_box form, obj, attribute, options = {}
  	  form_tag = "<div class='check-box'>#{form.check_box(attribute, strip_members_options(options))}</div>".html_safe
      members_form_tag_wrapper(form_tag, form, obj, attribute, options).html_safe
  	end

  	def members_check_box_group form, obj, check_boxes = {}
      form_tags = ""

      for check_box in check_boxes
        form_tags += members_check_box form, obj, check_box[0], check_box[1]
      end

      members_form_tag_wrapper(form_tag, form, obj, attribute, options)
    end

  	def members_radio_button form, obj, attribute, tag_value, options = {}
  	  form_tag = form.radio_button(obj, attribute, tag_value, strip_members_options(options))

  	  if options.key? :members_button_label
  	    form_tag = "<div>" + form_tag + "<span class=\"rcText\">#{options[:members_button_label]}</span></div>".html_safe
  	  end

  	  members_form_tag_wrapper(form_tag, form, obj, attribute, options).html_safe
  	end

  	def members_radio_button_group form, obj, radio_buttons = {}
      form_tags = ""

      for radio_button in radio_buttons
        form_tags += members_radio_button form, obj, check_box[0], check_box[1], check_box[2]
      end

      members_form_tag_wrapper(form_tag, form, obj, attribute, options).html_safe
    end

  	def members_select form, obj, attribute, option_tags, options = {}
  		members_form_tag_wrapper(form.select(attribute, option_tags, strip_members_options(options), merged_class_hash(options, 'form-control')), form, obj, attribute, options).html_safe
  	end

  	def members_time_zone_select form, obj, attribute, option_tags, options = {}
  	  members_form_tag_wrapper(form.time_zone_select(attribute, option_tags, strip_members_options(options), merged_class_hash(options, 'form-control')), form, obj, attribute, options).html_safe
  	end

    #e.g. members_collection_select f, f.object, :article, :author_id, Author.all, :id, :name, {:prompt => 'Select author'}
  	def members_collection_select form, obj, object_name, attribute, collection, value_method, text_method, options = {}
  		members_form_tag_wrapper(collection_select(object_name, attribute, collection, value_method, text_method, strip_members_options(options), merged_class_hash(options, 'form-control')), form, obj, attribute, options).html_safe
  	end

  	def members_date_select form, obj, attribute, options = {}
  	  members_form_tag_wrapper("<div class='members-date-select'>".html_safe + form.date_select(attribute, strip_members_options(options), merged_class_hash(options, 'form-control')) + "</div>".html_safe, form, obj, attribute, options).html_safe
  	end

  	def members_time_select form, obj, attribute, options = {}
  	  members_form_tag_wrapper("<div class='members-time-select'>".html_safe + form.time_select(attribute, strip_members_options(options), merged_class_hash(options, 'form-control')) + "</div>".html_safe, form, obj, attribute, options).html_safe
  	end

  	def members_datetime_select form, obj, attribute, options = {}
  	  members_form_tag_wrapper("<div class='members-datetime-select'>".html_safe + form.datetime_select(attribute, strip_members_options(options), merged_class_hash(options, 'form-control')) + "</div>".html_safe, form, obj, attribute, options).html_safe
  	end

  	def members_file_field form, obj, object_name, attribute, options = {}
  	  class_hash = merged_class_hash(options, 'form-control')
  	  contents = "<div class='#{class_hash[:class]}'>" + form.file_field(attribute, strip_members_options(options)) + '</div>'

      if options.key? :members_contents_preview
        contents = options[:members_contents_preview].html_safe + contents.html_safe
      end

  	  members_form_tag_wrapper(contents, form, obj, attribute, options).html_safe
  	end

  	def members_hidden_field form, obj, attribute, options = {}
  	  form.hidden_field(attribute, strip_members_options(options)).html_safe
  	end

    def members_color_field form, obj, attribute, options = {}
        members_form_tag_wrapper(form.color_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
    end

    def members_search_field form, obj, attribute, options = {}
      members_form_tag_wrapper(form.search_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
    end

    def members_telephone_field form, obj, attribute, options = {}
      members_form_tag_wrapper(form.telephone_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
    end

    def members_url_field form, obj, attribute, options = {}
      members_form_tag_wrapper(form.url_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
    end

    def members_email_field form, obj, attribute, options = {}
      members_form_tag_wrapper(form.email_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
    end

    def members_date_field form, obj, attribute, options = {}
      members_form_tag_wrapper(form.date_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
    end

    def members_datetime_field form, obj, attribute, options = {}
      members_form_tag_wrapper(form.datetime_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
    end

    def members_datetime_local_field form, obj, attribute, options = {}
      members_form_tag_wrapper(form.datetime_local_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
    end

    def members_month_field form, obj, attribute, options = {}
      members_form_tag_wrapper(form.month_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
    end

    def members_week_field form, obj, attribute, options = {}
      members_form_tag_wrapper(form.week_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
    end

    def members_time_field form, obj, attribute, options = {}
      members_form_tag_wrapper(form.time_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
    end

    def members_number_field form, obj, attribute, options = {}
      members_form_tag_wrapper(form.number_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
    end

    def members_range_field form, obj, attribute, options = {}
      members_form_tag_wrapper(form.range_field(attribute, strip_members_options(options_hash_with_merged_classes(options, 'form-control'))), form, obj, attribute, options).html_safe
    end

    def members_custom_field form, obj, attribute, custom_contents, options = {}
      members_form_tag_wrapper(custom_contents, form, obj, attribute, options).html_safe
    end

    protected

    def strip_members_options options
      options.reject {|key, value| key.to_s.include? "members_" }
    end

    def merged_class_hash options, new_class
      if options.key? :class
        new_class += " #{options[:class]}"
      end

      {:class => new_class}
    end

    def options_hash_with_merged_classes options, new_class
      if options.key? :class
        new_class += " #{options[:class]}"
      end
      options[:class] = new_class
      options
    end

    def members_form_tag_wrapper form_tag, form, obj, attribute, options = {}
      unless options.key? :members_label
    		human_attribute_name = attribute.to_s.humanize
      else
        human_attribute_name = options[:members_label]
      end

      sublabel = ""

      if options.key? :members_sublabel
        sublabel = " <small>#{options[:members_sublabel]}</small>".html_safe
      end

    	html = ""

      if obj && obj.errors[attribute].any?
        html += "<div class='form-group has-error'>"
    		html += form.label(attribute, "#{human_attribute_name} #{obj.errors[attribute].first}".html_safe, :class => "control-label")
    	else
        html += "<div class='form-group'>"
    		html += form.label(attribute, "#{human_attribute_name}#{sublabel}".html_safe, :class => "control-label")
    	end

    	html += "<div class='well'>#{form_tag}</div></div>"
    end
  end
end
