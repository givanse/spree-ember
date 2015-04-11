#!/usr/bin/env ruby

puts "Spree Ember: Bootstrapping Development Environment."

system "npm install"

puts "Spree Ember: Creating NPM Links between packages."

spree_ember = Dir.pwd

# Setup Core Dependencies
Dir.chdir "./packages/core"
system "ember install"
system "npm link"
Dir.chdir spree_ember

# Setup Checkouts Dependencies
Dir.chdir "./packages/checkouts"
system "npm link spree-ember-core"
system "ember install"
system "npm link"
Dir.chdir spree_ember

# Setup Auth Dependencies
Dir.chdir "./packages/auth"
system "npm link spree-ember-core"
system "ember install"
system "npm link"
Dir.chdir spree_ember

# Setup Main Package Dependencies
Dir.chdir "./packages/main"
system "npm link spree-ember-core"
system "npm link spree-ember-checkouts"
system "ember install"
system "npm link"
Dir.chdir spree_ember

puts "Spree Ember: Done setting up local packages for development."