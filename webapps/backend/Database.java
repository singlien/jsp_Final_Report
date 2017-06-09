package com.database;
import java.sql.*;
public class Database{
  private Connection con = null;
  private Statement stmt = null;
  private ResultSet rs = null;
  private String ip = "";
  private String port = "";
  private String url = "";
  private String db = "";
  private String user = "";
  private String password = "";
  private String driver = "com.mysql.jdbc.Driver";

  public Database(){

  }
  public void connectDB(){
    try{
      url = "jdbc:mysql://" + ip + ":" + port + "/" + db + "?useUnicode=true&characterEncoding=utf-8";
      Class.forName(driver);
      con = DriverManager.getConnection(url,user,password);
      stmt = con.createStatement();
    }catch(Exception ex){
      System.out.println(ex);
    }
  }
  public void closeDB(){
    try{
      rs = null;
      stmt.close();
      con.close();
    }catch(Exception ex){
      System.out.println(ex);
    }
  }
  public void query(String sql){
    try{
      rs = stmt.executeQuery(sql);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }
  public void insertData(String account,String password,String name,String gender,String birth,String email){
    try{
      String sql = "INSERT INTO `FPpersonal` (`name`, `email`, `gender`,`password`, `account`, `birth`, `last-update`) VALUES (?, ?, ?, ?, ?, ?, NOW());";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,name);
        ps.setString(2,email);
        ps.setString(3,gender);
        ps.setString(4,password);
        ps.setString(5,account);
        ps.setString(6,birth);
        int a = ps.executeUpdate();
        System.out.println("Success!, "+sql);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }
  
  public void insert(String sql){
    try{
      int i = stmt.executeUpdate(sql);
      System.out.println("insert result:"+i);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }

  public void updateInventory(){

  }
  public void insertInventory(int pid,String name, String platform, String price, String date, String picture, String video, String inventory){
    int a=-1;
    try{

        if(pid==0){
          //insert
          String sql = "INSERT INTO `FPinventory` (`name`, `platform`, `price`, `date`, `picture`, `video`, `inventory`) VALUES (?, ?, ?, ?, ?, ?, ?);";
          PreparedStatement ps = con.prepareStatement(sql);
          ps.setString(1,name);
          ps.setString(2,platform);
          ps.setString(3,price);
          ps.setString(4,date);
          ps.setString(5,picture);
          ps.setString(6,video);
          ps.setString(7,inventory);
          a = ps.executeUpdate();
          System.out.println("Insert Success!, "+a);
        }else{
          //update
          String sql="update `FPinventory` set name=?, platform=?, price=?, date=?, picture=?, video=?, inventory=? where id = ?;";
          PreparedStatement ps = con.prepareStatement(sql);
          ps.setString(1,name);
          ps.setString(2,platform);
          ps.setString(3,price);
          ps.setString(4,date);
          ps.setString(5,picture);
          ps.setString(6,video);
          ps.setString(7,inventory);
          ps.setInt(8,pid);
          a = ps.executeUpdate();
          System.out.println("Update Success!, "+a);
        }
    }catch(Exception ex){
      System.out.println(ex);
    }
  }

  public Connection getCon(){
    return con;
  }
  public ResultSet getRS(){
    return rs;
  }
  public void setIp(String ip){
    this.ip = ip;
  }
  public void setPort(String port){
    this.port = port;
  }
  public void setUrl(String ip,String port){
    this.url = "jdbc:mysql://" + ip + ":" + port + "/";
  }
  public void setDb(String dbName){
    this.db = dbName;
  }
  public void setUser(String username){
    this.user = username;
  }
  public void setPassword(String password){
    this.password = password;
  }
  public void setDriver(String driver){
    this.driver = driver;
  }
}
