class Asteroid
  attr_reader :name,
              :ref_id

  def initialize(attr)
    @name = attr['name']
    @ref_id = attr['neo_reference_id']
  end
end
