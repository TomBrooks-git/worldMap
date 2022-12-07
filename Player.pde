class Player
{
  int pX;
  int pY;
  int pW;
  int pH;
  
  int pCentX;
  int pCentY;
  
  int pLeft;
  int pRight;
  int pTop;
  int pBottom;
  
  int maxSpeed = 3;
  
  Player()
  {
   pX = 100;
   pY = 100;
   pW = 30;
   pH = 30;
   
   pLeft = pX;
   pRight = pX + pW;
   pTop = pY;
   pBottom = pY + pH;
   
   pCentX = pX + (pW/2);
   pCentY = pY + (pH/2);
   
  }
  
  
  
  void show()
  {
    fill(0);
    rect(pX, pY, pW, pH);
  }
  
  void update(boolean l, boolean r, boolean u, boolean d)
  {
    if(l)
    {
     this.pX -= this.maxSpeed; 
    }
    if(r)
    {
     this.pX += this.maxSpeed; 
    }
    if(u)
    {
     this.pY -= this.maxSpeed; 
    }
    if(d)
    {
     this.pY += this.maxSpeed; 
    }
  }
  
  void checkBounds()
  {
   if(pX >= width - pW)
   {
    pX = width - pW; 
   }
   if(pX <= 0)
   {
    pX = 0; 
   }
   if(pY <= 0)
   {
    pY = 0; 
   }
   if(pY >= height - pH)
   {
     pY = height - pH;
   }
  }
  
  void checkTileCollision(Tile t[])
  {
   for(int i = 0; i < t.length; i++)
   {
    if(t[i].tileType == 0)
    {
      continue;
    }
    if(pX + pW > t[i].tileLeft && pX < t[i].tileLeft)  //left size collision
    {
      if(pY + pH <= t[i].tileBottom && pY >= t[i].tileTop)
      {
        pX = t[i].tileLeft - pW; 
      }
      else if(pY < t[i].tileTop && (pY + pH) > t[i].tileTop)
      {
       if((abs(float((pX + pW) - t[i].tileLeft))) < abs(float((pY + pH) - t[i].tileTop)))
       {
         pX = t[i].tileLeft - pW;
       }
       else
       {
         pY = t[i].tileTop - pH; 
       }
      }
      else if(pY < t[i].tileBottom && (pY + pH) > t[i].tileBottom)
      {
        if((abs(float((pX + pW) - t[i].tileLeft))) < abs(float(pY - t[i].tileBottom)))
       {
         pX = t[i].tileLeft - pW;
       }
       else
       {
         pY = t[i].tileBottom; 
       }
      }
    }
    else if(pY + pH > t[i].tileTop && pY < t[i].tileTop)  //top side collision
    {
      if(pX >= t[i].tileLeft && pX + pW <= t[i].tileRight)
      {
        pY = t[i].tileTop - pH;
      }
    }
    else if(pY < t[i].tileBottom && pY + pH > t[i].tileBottom)
    {
      if(pX >= t[i].tileLeft && pX + pW <= t[i].tileRight)
      {
        pY = t[i].tileBottom;
      }
    }
    if(pX < t[i].tileRight && pX + pW > t[i].tileRight)
    {
      if(pY + pH <= t[i].tileBottom && pY >= t[i].tileTop)
      {
        pX = t[i].tileRight;
      }
      else if(pY < t[i].tileTop && pY + pH > t[i].tileTop)
      {
        if((abs(float(pX - t[i].tileRight))) < (abs(float((pY + pH) - t[i].tileTop))))
        {
         pX = t[i].tileRight;
        }
        else
        {
         pY = t[i].tileTop - pH; 
        }
      }
      else if(pY < t[i].tileBottom && pY + pH > t[i].tileBottom)
      {
       if((abs(float(t[i].tileRight) - pX)) < abs(float(pY - t[i].tileBottom)))
       {
         pX = t[i].tileRight;
       }
       else
       {
         pY = t[i].tileBottom; 
       }
      }
    }
  
   }
    
    
  }
  
  //void checkCollision(Tile tiles[])
  //{
  // for(int i = 0; i < tiles.length; i++)
  // {
  //   if(tiles[i].tileType == 0)
  //   {
  //    continue; 
  //   }
     
  //   if(this.pRight > tiles[i].tileLeft && this.pTop < tiles[i].tileTop || this.pBottom > tiles[i].tileBottom)  //checking player right - tile left collision
  //   {
  //     this.pX = tiles[i].tileLeft - this.pW;
  //   }
     
  //   if(this.pLeft < tiles[i].tileRight && this.pTop < tiles[i].tileTop || this.pBottom > tiles[i].tileBottom)  //checking player left - tile right collision
  //   {
  //     this.pX = tiles[i].tileRight;
  //   }
     
  //   if(this.pBottom > tiles[i].tileTop && this.pRight > tiles[i].tileLeft || this.pLeft < tiles[i].tileRight)  //checking for player bottom - tile top collision
  //   {
  //     this.pY = tiles[i].tileTop - this.pH;
  //   }
     
  //   if(this.pTop > tiles[i].tileBottom && this.pRight > tiles[i].tileLeft || this.pLeft < tiles[i].tileRight)
  //   {
  //     this.pY = tiles[i].tileBottom;
  //   }
  // }
   
  //}
  
  
  
  
}
