# Shim for otr-activerecord
require 'otr-activerecord'
module Grape
  ActiveRecord = OTR::ActiveRecord
end
require 'grape/activerecord/version'
$stderr.puts "WARNING: grape-activerecord is deprecated; please switch to otr-activerecord"
