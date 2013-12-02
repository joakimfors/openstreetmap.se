# Installation

Kräver Ruby 1.9

1. Klona projektet "openstreetmap.se"
2. Initialisera content/
  1. git submodule init
  2. git submodule update
3. Kör "bundle install --binstubs --path vendor" (kräver att bundler redan är installert)
4. Starta med antingen
  * bin/shotgun
  * bin/thin -R config.ru -a 0.0.0.0 -p 9393 start
