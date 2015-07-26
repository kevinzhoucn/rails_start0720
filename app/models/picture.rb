class Picture
  include Mongoid::Document
  field :key, type: String
  field :value, type: String

  mount_uploader :avatar, AvatarUploader

  public
    def self.get_image(key_value)

      picture = Picture.where(key: key_value).first
      if !picture
        picture = Picture.create(key: key_value, value: key_value, avatar: "")
      end

      return picture
    end
end
