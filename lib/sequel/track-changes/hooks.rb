
# Add "plugin :track_changes" to any model to track changes to it,
# using the Changes model specified above
module Sequel::Plugins
  module TrackChanges
    module InstanceMethods
      def before_create
        self.created_at ||= Time.now
        self.modified_at ||= Time.now
        super
      end
      
      def after_create
        c = Changes.new
        c.item_id = self.pk
        c.item_type = self.class.table_name
        c.type = :create
        c.new_values = self.values
        c.save
        super
      end
      
      def before_destroy
        c = Changes.new
        c.item_id = self.pk
        c.item_type = self.class.table_name
        c.type = :delete
        old = Todos[self.pk]
        c.old_values = old.values
        c.save
        super
      end
      
      def before_update
        c = Changes.new
        c.item_id = self.pk
        c.item_type = self.class.table_name
        c.type = :update
        old = Todos[self.pk]
        changes = changed_columns
        c.old_values = Hash[* old.values.select {|key,_| changes.member?(key) }.flatten(1)]
        c.new_values = Hash[* self.values.select {|key,_| changes.member?(key) }.flatten(1)]
        c.save
        self.modified_at = Time.now
        super
      end 
    end
  end
end

