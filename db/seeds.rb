if User.all.empty?
    User.create(
        name: "John Doe",
        email: "demo@example.com",
        password: "password"
    )
end