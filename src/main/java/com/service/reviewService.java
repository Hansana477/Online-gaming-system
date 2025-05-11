package com.service;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.review;
import com.util.DBConnection;

public class reviewService {

	public void addRev(review rev) {

		try {

			String query = "INSERT INTO  yeshani VALUES('" + rev.getGameid() + "' , '" + rev.getUserid() + "' , '"
					+ rev.getReview() + "' , '" + rev.getRate() + "' )";
			Statement stat = DBConnection.getConnection().createStatement();
			stat.executeUpdate(query);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public ArrayList<review> getAllRevies(String uid) {
		ArrayList<review> listreview = new ArrayList<>();

		try {
			Statement stmt = DBConnection.getConnection().createStatement();
			String query = "SELECT * FROM yeshani WHERE UserID = '" + uid + "'";
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				review rv = new review();
				rv.setGameid(rs.getString("GameID"));
				rv.setUserid(rs.getString("UserID"));
				rv.setReview(rs.getString("Review"));
				rv.setRate(rs.getInt("Rating"));
				listreview.add(rv);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listreview;
	}

	public review getone(review rv) {
		try {

			String query = "SELECT * FROM yeshani WHERE USerID = '" + rv.getUserid() + "' ";

			Statement stat = DBConnection.getConnection().createStatement();
			ResultSet rs = stat.executeQuery(query);
			if (rs.next()) {
				rv.setGameid(rs.getString("GameID"));
				rv.setUserid(rs.getString("UserID"));
				rv.setReview(rs.getString("Review"));
				rv.setRate(rs.getInt("Rating"));
				return rv;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public void updaterev(review rev) {

		try {

			String query = "UPDATE yeshani SET Review = '" + rev.getReview() +
		               "', Rating = '" + rev.getRate() + 
		               "' WHERE GameID = '" + rev.getGameid() + 
		               "' AND UserID = '" + rev.getUserid() + "'";

			Statement stat = DBConnection.getConnection().createStatement();
			stat.executeUpdate(query);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deletrev(review rev) {

		try {
			String query = "DELETE FROM yeshani WHERE GameID = '" + rev.getGameid() + "'";
			Statement staat = DBConnection.getConnection().createStatement();
			staat.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
