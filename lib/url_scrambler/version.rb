module UrlScrambler
  MAJOR= 0
  MINOR= 0
  PATCH= ENV['PATCH_VERSION'] || 0

  private_constant :MAJOR, :MINOR, :PATCH

  VERSION = "#{MAJOR}.#{MINOR}.#{PATCH}"
end