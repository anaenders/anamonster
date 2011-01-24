module BlogHelper
  
  def render_calendar(year, month, prev, nex, selected_days)
    calendar(
          :year                => year,
          :month               => month,
          :abbrev              => (0..0),
          :previous_month_text => link_to("<<", params.merge({:mo => prev[:month], :yr => prev[:year] })),
          :next_month_text     => link_to(">>", params.merge({:mo => nex[:month],  :yr => nex[:year] })),
          :month_name_class    => 'month_name',
          :month_nav_class     => 'month_nav',
          :other_month_class   => 'other_month') do |d|
        if selected_days.include?(d.mday)
          day_display = link_to(d.mday.to_s, blog_calendar_day_path(:by => 'date', :year => year, :month => month, :day => d.mday))
        else
          day_display = d.mday.to_s
        end
        [ day_display,
          { :class => @selected_days.include?(d.mday) ? 'blog_post' : 'day' }
        ]
    end
  end
  
end