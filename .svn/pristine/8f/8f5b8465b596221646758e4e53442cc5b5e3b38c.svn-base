class UrlMappings {

    static mappings = {

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/" {
            controller = "dispatch"
            action = "index"
        }

        /* 
         * are you sure? someone could then access this url directly and end up with errors
        "/payment"{
            controller = "payment"
            action = "loadData"
        }
        */

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
