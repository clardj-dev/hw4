Rails.application.routes.draw do
  # User signup
  get("/signup", { :controller => "users",    :action => "new"   })
  post("/signup", { :controller => "users",    :action => "create" })

  # Login / Logout
  get("/login",  { :controller => "sessions", :action => "new"     })
  post("/login", { :controller => "sessions", :action => "create"  })
  get("/logout", { :controller => "sessions", :action => "destroy" })

  # Nested resources: Places and Entries
  resources "places" do
    resources "entries", { :only => ["new", "create"] }
  end

  # Root route
  get("/", { :controller => "sessions", :action => "new" })
end
