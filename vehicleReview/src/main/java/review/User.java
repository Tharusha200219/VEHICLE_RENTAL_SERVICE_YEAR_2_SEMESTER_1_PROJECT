package review;

//Model Class
//IT22225788
//SANDAKELUM P.A.T.R
public class User {
    private int id;
    private String name;
    private String email;
    private int rating;
    private String review;

    public User(String name, String email, int rating, String review) {
        this.name = name;
        this.email = email;
        this.rating = rating;
        this.review = review;
    }

    public User(int id, String name, String email, int rating, String review) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.rating = rating;
        this.review = review;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }
}
