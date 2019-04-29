
herojson = require("../../recursos/jejee.json")
herojson = require("../../recursos/jejee.png")


class Hero2 extends PIXI.Graphics
    transition : false
    constructor: (app) ->
        super()
        @app = app
        @build()
        window.addEventListener 'keypress', @onKeyPress
        window.addEventListener 'keyup', @onKeyUp
        
        right: false
        left: true
        transition: false
        
        
    onKeyPress: (evt) =>
      
      if evt.key is 'd' || evt.key is 'D'
         @movie.scale.x = 1.5
         @zero.splice(0,23)
         for  i in [13..18] by 1
             @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))
         
         @right = true

       

       if evt.key is 'a' || evt.key is 'A'
         @movie.scale.x = -1.5
         @zero.splice(0,23)
         for  i in [13..18] by 1
             @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))
         
         @left = true
             
       
         
            
    onKeyUp: (evt) =>
      if evt.key is 'd'|| evt.key is 'D'
         
         @zero.splice(0,23)
         @movie.scale.x = 1.5
         for  i in [1..6] by 1
             @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))
         @right = false

         if @transition && @left
             @zero.splice(0,23)
             @movie.scale.x = -1.5
             for  i in [1..6] by 1
                 @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))
             @transition= false
             @right = false
         null

       if evt.key is 'a'|| evt.key is 'A'
         @zero.splice(0,23)
         @movie.scale.x = -1.5
         for  i in [1..6] by 1
             @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))
         @left = false


         if @transition && @right
             @zero.splice(0,23)
             @movie.scale.x = 1.5
             for  i in [1..6] by 1
                  @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))
             @left = false
             @transition = false


         null  

         
    
    build: () =>
     @zero = []
     for  i in [1...6] by 1
         @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))
     
     @movie = new PIXI.extras.AnimatedSprite(@zero)
     @movie.position.set(530)
     @movie.x=50
     @movie.scale.x = 1.5
     @movie.scale.y = 1.5
     @movie.anchor.set(0.5)
     @movie.animationSpeed = 0.1  
     @movie.play()
     @app.addAnimationNodes(@)
     @app.stage.addChild(@movie)
     

    animate:()=>
      
      if @movie.y<=500 
          @movie.y += 7
      console.log @movie.y
      if @right is true 
          @movie.x += 5
         
      if @right is true && @left is true 
          @transition = true
         
       
      if @left is true
          @movie.x -= 5
          
        
        
        
       
        
        

module.exports = Hero2