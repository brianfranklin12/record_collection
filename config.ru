require './config/environment'

use Rack::MethodOverride

use UsersController
use AlbumsController
run ApplicationController
