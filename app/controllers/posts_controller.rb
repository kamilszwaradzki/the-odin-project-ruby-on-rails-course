  # in app/controllers/posts_controller.rb
  class PostsController < ApplicationController

    def index
      @posts = Post.all
    end

    def show
      # code to grab the proper Post so it can be
      # displayed in the Show view (show.html.erb)
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(allowed_post_params)
      if @post.save
        flash[:success] = "Great! Your post has been created!"
        redirect_to @post # go to show page for @post
      else
        flash.now[:error] = "Rats! Fix your mistakes, please."
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      # code to find the post we want and send the
      # user to the Edit view for it (edit.html.erb), which has a
      # form for editing the post
    end

    def update
      # code to figure out which post we're trying to update, then
      # actually update the attributes of that post. Once that's
      # done, redirect us to somewhere like the Show page for that
      # post
    end

    def destroy
      # code to find the post we're referring to and
      # destroy it.  Once that's done, redirect us to somewhere fun.
    end

    private  # Best to make helper methods like this one private

    # gives us back just the hash containing the params we need to
    # to create or update a post
    def allowed_post_params
      params.expect(post: [:title, :body, :author_id])
    end
  end
