if defined?(Rails) && Rails::VERSION::MAJOR == 4
	require 'members/engine'
	require 'members/version'
	require 'will_paginate'
	require 'authlogic'
else
	puts("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	puts("!!! WARNING !!! This version of Members requires Rails 4.x !!!")
	puts("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
end