#!/usr/bin/ruby

require 'Rex/Post/Meterpreter/Extension'
require 'Rex/Post/Meterpreter/Extensions/Stdapi/Process'
require 'Rex/Post/Meterpreter/Extensions/Stdapi/Registry'

module Rex
module Post
module Meterpreter
module Extensions
module Stdapi

###
#
# Stdapi
# ------
#
# Standard ruby interface to remote entities
#
###
class Stdapi < Extension
	def initialize(client)
		super(client, 'stdapi')

		# Alias the following things on the client object so that they
		# can be directly referenced
		client.register_extension_alias('process', self.process)
		client.register_extension_alias('registry', self.registry)
	end

	def brand(klass)
		klass = klass.dup
		klass.client = self.client
		return klass
	end

	def process
		brand(Rex::Post::Meterpreter::Extensions::Stdapi::Process)
	end
	
	def registry
		brand(Rex::Post::Meterpreter::Extensions::Stdapi::Registry)
	end
end

end; end; end; end; end
