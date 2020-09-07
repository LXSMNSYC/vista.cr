require "./tags";

module Vista
  abstract class BaseComponent
    abstract def get_key(): String | Nil;
    abstract def get_children(): Array(BaseComponent) | Nil;
    abstract def get_type(): Tags::Component;
    abstract def render(): BaseComponent | Nil;
  end

  class BasicComponent < BaseComponent
    @key : String | Nil;

    def initialize(@key)
    end

    def get_type(): Tags::Component
      return Tags::Component::BasicComponent;
    end

    def get_key(): String | Nil;
      return @key;
    end

    def get_children(): Array(BaseComponent)
      return @children;
    end

    def render(): BaseComponent | Nil
      return nil;
    end
  end

  class Component < BaseComponent
    @key : String | Nil;

    def initialize(@key)
    end

    def get_type(): Tags::Component
      return Tags::Component::Component;
    end

    def get_key(): String | Nil;
      return @key;
    end

    def get_children(): Array(BaseComponent)
      return @children;
    end

    def render(): BaseComponent | Nil
      return nil;
    end
  end

  class BasicMemoComponent < BaseComponent
    @key : String | Nil;

    def initialize(@key)
    end

    def get_type(): Tags::Component
      return Tags::Component::BasicMemoComponent;
    end

    def get_key(): String | Nil;
      return @key;
    end

    def get_children(): Array(BaseComponent) | Nil
      return nil;
    end

    def render(): BaseComponent | Nil
      return nil;
    end

    def should_update(prev: BasicMemoComponent): Bool
      return self != prev;
    end
  end

  class MemoComponent < BaseComponent
    @key : String | Nil;

    def initialize(@key)
    end

    def get_type(): Tags::Component
      return Tags::Component::BasicMemoComponent;
    end

    def get_key(): String | Nil;
      return @key;
    end

    def get_children(): Array(BaseComponent) | Nil
      return nil;
    end

    def render(): BaseComponent | Nil
      return nil;
    end

    def should_update(prev: BasicMemoComponent): Bool
      return self != prev;
    end
  end

  class ClassComponent < BaseComponent
    @key : String | Nil;

    def initialize(@key)
    end

    def get_type(): Tags::Component
      return Tags::Component::BasicMemoComponent;
    end

    def get_key(): String | Nil;
      return @key;
    end

    def get_children(): Array(BaseComponent) | Nil
      return nil;
    end

    def render(): BaseComponent | Nil
      return nil;
    end

    def will_mount()
    end

    def will_update(old: ClassComponent)
    end

    def will_unmount()
    end

    def did_mount()
    end

    def did_update
    end

    def did_unmount
    end

    def did_catch
    end

    def should_update(prev: BasicMemoComponent): Bool
      return self != prev;
    end
  end

  class ErrorBoundary < BaseComponent
    @key : String | Nil;
    @children : Array(BaseComponent);

    def initialize(@key, @children)
    end

    def get_key(): String | Nil;
      return @key;
    end

    def get_children(): Array(BaseComponent)
      return @children;
    end

    def render(): BaseComponent | Nil
      return nil;
    end

    def get_type(): Tags::Component
      return Tags::Component::ErrorBoundary;
    end
  end

  class Fragment < BaseComponent
    @key : String | Nil;
    @children : Array(BaseComponent);

    def initialize(@key, @children)
    end

    def get_key(): String | Nil;
      return @key;
    end

    def get_children(): Array(BaseComponent)
      return @children;
    end

    def render(): BaseComponent | Nil
      return nil;
    end

    def get_type(): Tags::Component
      return Tags::Component::Fragment;
    end
  end
end
