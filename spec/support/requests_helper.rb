module RequestsHelper
  def get_with_token(path, params = {}, headers = {})
    headers["Authorization"] = retrieve_access_token
    get path, params: params, session: headers
  end

  def post_with_token(path, params = {}, headers = {})
    headers["Authorization"] = retrieve_access_token
    post path, params: params, session: headers
  end
end
