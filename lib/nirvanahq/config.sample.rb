# @q whats best way to deal with configs in rb?
# I don't see a problem with this method. not too much pollution, and 
# doesn't impact gem use in code
$nirvana_config = { 
  :username => 'Kryten',

  #md5 of your password. I will need this to get your auth token
  :password => 'THIS-IS-AN-MD5-OF-YOUR-PASSWORD'
}
