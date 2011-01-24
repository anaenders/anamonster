require 'digest/sha2'

module AttachFuPhaseOut

  # Gets the public path to the file
  # The optional thumbnail argument will output the thumbnail's filename.
  def public_filename(thumbnail = nil)
    full_filename(thumbnail).gsub %r(^#{Regexp.escape(Rails.root.join('public'))}), ''
  end

  protected
  def full_filename(thumbnail = nil)
    Rails.root.join(self.class.table_name, *partitioned_path(thumbnail_name_for(thumbnail))).to_s
  end

  def thumbnail_name_for(thumbnail = nil)
    return filename if thumbnail.blank?
    ext = nil
    basename = filename.gsub /\.\w+$/ do |s|
      ext = s; ''
    end
    "#{basename}_#{thumbnail}#{ext}"
  end

  def partitioned_path(*args)
    path_id = ((respond_to?(:parent_id) && parent_id) || id) || 0
    if path_id.is_a?(Integer)
      ("%08d" % path_id).scan(/..../) + args
    else
      hash = Digest::SHA512.hexdigest(path_id.to_s)
      [hash[0..31], hash[32..63], hash[64..95], hash[96..127]] + args
    end
  end
  
end