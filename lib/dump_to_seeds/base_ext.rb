module DumpToSeeds::BaseExt

  def to_seed(includes = [])
    if includes.blank?
      build_simple_rb(self)
    else
      dump_object(self, includes)
    end
  end

  private

  def dump_object(obj, includes = [], parent_var = nil, rel_key = nil)

    includes = [includes].flatten.compact

    dump_arr = []
    var_name = obj.class.name.underscore
    dump_arr << "#{var_name} = #{build_simple_rb(obj, !(parent_var && rel_key))}"

    if(parent_var && rel_key)
      dump_arr << "#{var_name}.#{rel_key} = #{parent_var}.id"
      dump_arr << "#{var_name}.save"
    end

    includes.each do |i|
      rel, next_ass = i.is_a?(Hash) ? i.to_a.first : [i, []]

      refl = obj.class.reflect_on_association(rel)
      if refl
        rel_objs = [obj.send(rel)].flatten.compact
        rel_objs.each do |ro|
          dump_arr << dump_object(ro, next_ass, var_name, refl.primary_key_name)
        end
      end
    end

    dump_arr.join("\n")+"\n"
  end

  def build_simple_rb(obj, do_create = true)
    attrs = obj.attributes
    attrs.delete(:id)
    attrs = Hash[attrs.to_a.map{|a1,a2| [a1, a2.to_s] }]
    "#{obj.class.name}.#{do_create ? 'create' : 'new'}(#{attrs.inspect})"
  end

end
