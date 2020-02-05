class AdminController < ApplicationController
    http_basic_authenticate_with name: "jeanphi", password: "grandroque"
end
