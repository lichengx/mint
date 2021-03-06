SimpleCaptcha.setup do |sc|
  # default: 100x28
  sc.image_size = '100x20'

  # default: 5
  sc.length = 4

  # default: simply_blue
  # possible values:
  # 'embosed_silver',
  # 'simply_red',
  # 'simply_green',
  # 'simply_blue',
  # 'distorted_black',
  # 'all_black',
  # 'charcoal_grey',
  # 'almost_invisible'
  # 'random'
  sc.image_style = 'simply_blue'


  # default: low
  # possible values: 'low', 'medium', 'high', 'random'
  sc.distortion = 'random'

  # default: medium
  # possible values: 'none', 'low', 'medium', 'high'
  sc.implode = 'medium'
end
