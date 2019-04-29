class Rectangle extends PIXI.Graphics
 interactive: true
 
 clicked: false
 alreadyClick: false
 encojiendo= 12
 constructor: (c, x, y, w, h) ->
        
        super()
        @color = c
        @posX = x
        @posY = y
        @w = w
        @h = h
        @originalx=x
        @originalw= w
        @on 'mouseover', @onMouseOver
        @on 'mouseout', @onMouseOut

    
        
        @draw()

        
   

   
   onMouseOver:()=>
      @clicked = true
      
   onMouseOut:()=>
     
      
   draw: =>
         
         @lineStyle(2, 0xFEEB77, 1)
         @beginFill(@color)
         @drawRect(@posX, @posY, @w, @h)
         @endFill()
         @x= @posX
         @y= @posY
         
        

   animate: =>
         if @clicked
           @clear()
           @lineStyle(2, 0xFEEB77, 1)
           @beginFill(@color)
           
           @drawRect(@posX+=4, @posY, @w-=8, @h)
           @endFill()
           if @w<=@originalw*-1
                @clear()
                @lineStyle(2, 0xFEEB77, 1)
                @beginFill(@color)
                @w=@originalw
                @posX=@originalx
                @drawRect(@posX, @posY, @w, @h)
                @endFill()
                @clicked = false
             

           
             
     


module.exports = Rectangle