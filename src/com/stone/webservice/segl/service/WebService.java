package com.stone.webservice.segl.service;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.ElementType;

@Documented  
@Retention(RetentionPolicy.RUNTIME)   
@Target(ElementType.TYPE)   
public @interface WebService {

    String value() default "";

    Type type() default Type.SOAP;

    public enum Type {
        SOAP, REST
    }
}