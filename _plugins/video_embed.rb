class VideoEmbed < Liquid::Tag
  # Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

  def initialize(tagName, markup, tokens)
    super

    # if markup =~ Syntax then
    #   @id = $1

    #   if $2.nil? then
    #       @width = 560
    #       @height = 420
    #   else
    #       @width = $2.to_i
    #       @height = $3.to_i
    #   end
    # else
    #   raise "No YouTube ID provided in the \"youtube\" tag"
    # end
  end

  def render(context)
    "<video  style=\"display:block; width:100%; height:auto;\" autoplay controls loop=\"loop\"> <source src=\"img/#{@filename}\" type=\"video\" /> </video>"
  end

  Liquid::Template.register_tag "video_embed", self
end
