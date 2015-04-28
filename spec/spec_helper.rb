require 'serverspec'
require 'docker'

RSpec.configure do
  image = Docker::Image.build_from_dir('.')

  set :os, family: :debian
  set :backend, :docker
  set :docker_image, image.id
end
