class ApiController < ApplicationController
  def get
    puts "URL: #{url_param["u"].to_s}"
    url, query = url_param["url"].split '/?'
    response = HTTParty.get url, query: query
    puts response.to_s
    render json: response.to_s
  end

  private
  def url_param
    params.permit('url')
  end
end
