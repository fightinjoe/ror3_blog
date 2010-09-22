module CommentsHelper
  def link_to_author( comment )
    if comment.author_website
      '<a href="%s">%s</a>' % [ comment.author_website, comment.author_name ]
    else
      comment.author_name
    end
  end

  def comment_actions( comment )
    email   = '<a href="mailto:%s">Email</a>' % comment.author_email if user_signed_in? && comment.author_email
    confirm = "return confirm('Are you certain you want to delete this comment?');"
    delete  = button_to('Delete', { :controller => 'comments', :action => 'destroy', :id => comment.id },
                                  { :method => :delete, :onclick => confirm })
    #delete  = delete_button(
    #  :blog_comment, comment, 'Delete',
    #  {:style   => 'display:inline;'},
    #  {:onclick => confirm, :style => 'font-size:.8em' }
    #)
    [ email, delete ].join(' - ')
  end
end