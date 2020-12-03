# Java Notes

## Singleton Design Pattern
* only one instance of an object exists at a time
* all references for an object of this class will point to the same object
* StrategyPattern8.hr

## Strategy Design Pattern
* has no state, no instance variables
* code that's singleton will most likely be strategy

## Dynamic vs Static Binding
* Static binding means you know the type of object you're instantiating at compile time, this could be a simple statement like 
`ArrayList<Integer> temp = new ArrayList<>();`
* Dynamic binding means you don't know the dynamic type of an object until runtime. An example from class is the switch statement we had to determine the price type.

## Reflection
* API in Java that allows you to examine a class's features at runtime. 
* Common example is the `getClass()` method, but there's also `getConstructors()` and `getMethods()`

### Reflection Example
```
Class<?> c = Class.forName(someName);
Constructor<?> r = c.getConstructor();
myObject = (AbstractClassName) r.newInstance();

```

## List of Exceptions
* ClassCastException: attempt to cast to something that isn’t a valid subclass
* ClassNotFoundException: tries to load a class with forName, but the name can’t be found
* IllegalAccessException: tries to grab something or use a method, but doesn’t have the access
* InstantiationException: Tries to use newInstance, but object can’t be instantiated
* InvocationTargetException: Wrapper for exception thrown by method/constructor
* NoSuchMethodException: Method cannot be found
