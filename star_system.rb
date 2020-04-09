class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  def planet_names()
    return @planets.map {|planet| planet.name}
  end

  def get_planet_by_name(name)
    return @planets.find {|planet| planet.name == name}
  end

  def get_largest_planet()
    return @planets.max_by {|planet| planet.diameter}
  end

  def get_smallest_planet()
    return @planets.min_by {|planet| planet.diameter}
  end

  def get_planets_with_no_moons()
    return @planets.find_all {|planet| planet.number_of_moons == 0}
  end

  def get_planets_with_more_moons(number)
    filtered_planets = @planets.find_all {|planet| planet.number_of_moons > number}
    return filtered_planets.map {|planet| planet.name}
    # IN RUBY 2.7:
    # return @planets.filter_map {|planet| planet.name if planet.number_of_moons > number}
  end

  def get_number_of_planets_closer_than(million_km)
    return @planets.find_all {|planet| planet.distance_from_sun < million_km}.length
  end

  def get_total_number_of_moons()
    return @planets.sum {|planet| planet.number_of_moons}
  end

  def get_planet_names_sorted_by_increasing_distance_from_sun()
    sorted_planets = @planets.sort {|p1, p2| p1.distance_from_sun <=> p2.distance_from_sun}
    return sorted_planets.map {|planet| planet.name}
  end

  def get_planet_names_sorted_by_size_decreasing()
    sorted_planets = @planets.sort {|p1, p2| p1.diameter <=> p2.diameter}
    return sorted_planets.map {|planet| planet.name}.reverse!
  end

end
