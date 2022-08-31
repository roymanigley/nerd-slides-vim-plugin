
    ███╗   ██╗███████╗██████╗ ██████╗     ███████╗██╗     ██╗██████╗ ███████╗███████╗
    ████╗  ██║██╔════╝██╔══██╗██╔══██╗    ██╔════╝██║     ██║██╔══██╗██╔════╝██╔════╝
    ██╔██╗ ██║█████╗  ██████╔╝██║  ██║    ███████╗██║     ██║██║  ██║█████╗  ███████╗
    ██║╚██╗██║██╔══╝  ██╔══██╗██║  ██║    ╚════██║██║     ██║██║  ██║██╔══╝  ╚════██║
    ██║ ╚████║███████╗██║  ██║██████╔╝    ███████║███████╗██║██████╔╝███████╗███████║
    ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═════╝     ╚══════╝╚══════╝╚═╝╚═════╝ ╚══════╝╚══════╝
                                                                                  

    Ready to start the presentation?

    - CTRL + down = for next slide
    - CTRL + up   = for previous slide
    - ESC         = to close the images





















































































___
                                            
                                                     ██████╗ █████╗ ██████╗ ██████╗ ███████╗
                                                    ██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔════╝
                                                    ██║     ███████║██████╔╝██████╔╝█████╗  
                                                    ██║     ██╔══██║██╔═══╝ ██╔══██╗██╔══╝  
                                                    ╚██████╗██║  ██║██║     ██║  ██║███████╗
                                                     ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝
                                                                                    
                                                  ____ ____ ____ _________ ____ ____ ____ ____ 
                                                 ||D |||E |||V |||       |||T |||A |||L |||K ||
                                                 ||__|||__|||__|||_______|||__|||__|||__|||__||
                                                 |/__\|/__\|/__\|/_______\|/__\|/__\|/__\|/__\|
                                                                     

                                                        Quarkus with RESTEasy Reactive




















































































___
![quarkus card](https://quarkus.io/assets/images/quarkus_card.png)


































































































___

# To block or not to block, that is the question

## New world, new rules!

> In Quarkus 2.2.0, they introduced a new dispatching strategy based on the method signatures. 
> The Quarkus build-time approach lets us be wise and deduce if a method should be called on 
> the I/O thread or a worker thread at build time, reducing the runtime overhead.
>  
> The following table summarizes the new set of rules:


| Method signature                            | Dispatching strategy |
|---------------------------------------------|----------------------|
| T method(…)                                 | Worker thread        |
| Uni<T> method(…)                            | I/O thread           |
| CompletionStage<T> method(…)                | I/O thread           |
| Multi<T> method(…)                          | I/O thread           |
| Publisher<T> method(…)                      | I/O thread           |
| @Transactional CompletionStage<T> method(…) | Worker thread        |























































___

> What does that change for you?

## Integrating with Hibernate ORM

> Let’s imagine you want to use Hibernate classic with RESTEasy reactive:

    ```java
    import org.jboss.resteasy.reactive.RestQuery;
    
    import javax.ws.rs.GET;
    import javax.ws.rs.Path;
    
    @Path("/fruit")
    public class FruitResource {
    
       @GET
       public Fruit getFruit(@RestQuery String name) {
           return Fruit.find("name", name).firstResult();
       }
    }
    ```

> If you use Hibernate reactive, you will use the Mutiny API, and so the resulting code will be:

    ```java
    import io.smallrye.mutiny.Uni;
    import org.jboss.resteasy.reactive.RestQuery;
    
    import javax.ws.rs.GET;
    import javax.ws.rs.Path;
    
    @Path("/fruit")
    public class FruitResource {
    
       @GET
       public Uni<Fruit> getFruit(@RestQuery String name) {
           return Fruit.find("name", name).firstResult();
       }
    }
    ```



















































































____

# Summary

> With Quarkus 2.2, the dispatching strategy of RESTEasy reactive becomes smarter thus improving the developer experience.

- You don’t need to learn the reactive way; you can keep using imperative code.

- You don’t need to think about your threads; Quarkus does that for you.

- You don’t lose in flexibility; you can override the decision.






