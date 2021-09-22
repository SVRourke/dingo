Dingo::Application.config.session_store(
    :cookie_store,
    :key => ENV["SESSION_SECRET"],
    expire_after: 1.hour
)