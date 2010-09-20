module Merb
  module GlobalHelpers

    def print_flash
      return unless flash[:error] || flash[:notice]
      klass = flash[:error] ? 'errors' : 'notice'
      out = <<-EOS
      <div class="#{ klass }" id="flash">
        #{ flash[:error] || flash[:notice] }
      </div>
      EOS
      out << "<script type='text/javascript'>setTimeout( function(){ $('#flash').fadeOut(2*1000); }, 5*1000 );</script>" if flash[:notice]
      out
    end

    def print_date( date )
      date.strftime('<div class="date"><span class="month">%b</span><span class="day">%d</span></div>')
    end

    def blog_by_date_url( blog )
      url(:controller => '')
    end

    def pluralize( count, word )
      '%d %s' % [count, count == 1 ? word : word.pluralize]
    end

    def to_rfc822( datetime )
      d = datetime
      ::Time.local(d.year, d.month, d.day, d.hour, d.min, d.sec).rfc822
    end

  end
end    