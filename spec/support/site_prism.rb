module PageObjects
  class PostsSection < SitePrism::Section
    element :posts, 'article.post'
  end

  class GlobalPage < SitePrism::Page
    set_url '/global'
    section :posts_section, PostsSection, 'section.posts'
  end


  class CreateUserPage < SitePrism::Page
    set_url '/users/new'
  end
end


module RegistrationObjects
  class FormSection < SitePrism::Section
    element :name, 'input[name="user[name]"]'
    element :full_name, 'input[name="user[full_name]"]'
    element :email, 'input[name="user[email]"]'
    element :password, 'input[name="user[password]"]'
    element :password_confirmation, 'input[name="user[password_confirmation]"]'
    element :submit, 'input[type="submit"]'
  end

  class CreateUserPage < SitePrism::Page
    set_url '/users/new'
    section :form_section, FormSection, 'form.new_user'
  end
end


module TimelineObjects
  class TimelinePage < SitePrism::Page
    set_url '/timeline'
  end
end


