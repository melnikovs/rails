#--
# Copyright (c) 2004-2009 David Heinemeier Hansson
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

begin
  require 'active_support'
rescue LoadError
  activesupport_path = "#{File.dirname(__FILE__)}/../../activesupport/lib"
  if File.directory?(activesupport_path)
    $:.unshift activesupport_path
    require 'active_support'
  end
end

gem 'rack', '>= 0.9.0'
require 'rack'
require 'action_dispatch/rack'

module ActionDispatch
  autoload :Request, 'action_dispatch/http/request'
  autoload :Response, 'action_dispatch/http/response'
  autoload :StatusCodes, 'action_dispatch/http/status_codes'

  autoload :Failsafe, 'action_dispatch/middleware/failsafe'
  autoload :ParamsParser, 'action_dispatch/middleware/params_parser'
  autoload :RewindableInput, 'action_dispatch/middleware/rewindable_input'

  autoload :MiddlewareStack, 'action_dispatch/utils/middleware_stack'
  autoload :UploadedFile, 'action_dispatch/utils/uploaded_file'
  autoload :UploadedStringIO, 'action_dispatch/utils/uploaded_file'
  autoload :UploadedTempfile, 'action_dispatch/utils/uploaded_file'
  autoload :UrlEncodedPairParser, 'action_dispatch/utils/url_encoded_pair_parser'

  module Http
    autoload :Headers, 'action_dispatch/http/headers'
  end

  module Session
    autoload :AbstractStore, 'action_dispatch/middleware/session/abstract_store'
    autoload :CookieStore, 'action_dispatch/middleware/session/cookie_store'
    autoload :MemCacheStore, 'action_dispatch/middleware/session/mem_cache_store'
  end
end

autoload :Mime, 'action_dispatch/http/mime_type'