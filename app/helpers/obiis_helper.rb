module ObiisHelper
    def image_for(obii)
        image_tag(obii.image, :alt => obii.name, :class => 'photo')
    end
end
