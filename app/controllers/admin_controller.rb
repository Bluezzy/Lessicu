class AdminController < ApplicationController
    http_basic_authenticate_with name: "jeanphi", password: "grand-roque"
end
