# coding: utf-8
require 'test_helper'

class LevenstheinTest < ActiveSupport::TestCase
  test "Levensthein distance algorithm" do
    assert Levensthein.distance_between("", "") == 0
    assert Levensthein.distance_between("aeiou", "aeiou") == 0
    assert Levensthein.distance_between("Casa", "Cara") == 1
    assert Levensthein.distance_between("", "A very long string") == "A very long string".length
    assert Levensthein.distance_between("Asdfgh", "Qwerty") == 6
    assert Levensthein.distance_between("Andrés", "Andres") == 1
    assert Levensthein.distance_between("Áéîoü", "Áéîoü") == 0
    assert Levensthein.distance_between("Áéîoü", "Aéîou") == 2
    assert Levensthein.distance_between("dégueulasse", "degoulasse") == 3
    assert Levensthein.distance_between("fatigue", "degoulasse") == 9
    assert Levensthein.distance_between("êtes", "etes") == 1
  end
end