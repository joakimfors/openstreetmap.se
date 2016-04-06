# Installation

Kräver Ruby 1.9

1. Klona projektet "openstreetmap.se"
2. Klona https://github.com/joakimfors/openstreetmap.se-content.git till content/
3. Kör "bundle install --binstubs --path vendor" (kräver att bundler redan är installert)
4. Starta med antingen
  * bundle exec mr-sparkle (för dev instans)
  * bin/thin -R config.ru -a 0.0.0.0 -p 9393 start (för produktion)
