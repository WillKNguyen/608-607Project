package ensf607.propertysearchengine.property;

import ensf607.propertysearchengine.pricehistory.*;
import ensf607.propertysearchengine.neighbourhood.*;
import ensf607.propertysearchengine.user.*;

// import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedDate;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.Period;
import java.util.HashSet;
import java.util.Set;


@Entity
@Table
public class Property implements Serializable {
    
    @Id
    @SequenceGenerator(
            name = "mls_sequence",
            sequenceName = "mls_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "mls_sequence"
    )
    private int mls;

    @Transient
    private int daysSinceListed;

    private int price;

    @Column(name = "date_listed", nullable = false, updatable = false)
    @CreatedDate
    private LocalDate dateListed = LocalDate.now();

    private String address;

    
    @ManyToOne
    @JoinColumn(name="neighbourhood_id", referencedColumnName = "id")
    private Neighbourhood neighbourhood;

    @OneToMany(mappedBy = "")
    private Set<PriceHistory> priceHistory = new HashSet<>();

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name="listedBy", referencedColumnName = "email")
    private User listingUser;

    @JsonIgnore
    @ManyToMany(mappedBy = "favourites")
    private Set<User> favouritedBy = new HashSet<>();
    
    // Features
    private String propertyType;
    private int yearBuilt;
    private double bedrooms;
    private double bathrooms;

    public Property() {
    }


    public Property(String address, String propertyType, int yearBuilt, double bedrooms, double bathrooms, int price, int neighbourhoodID) {
        this.price = price;
        this.dateListed = LocalDate.now();
        this.address = address;
        this.propertyType = propertyType;
        this.yearBuilt = yearBuilt;
        this.bedrooms = bedrooms;
        this.bathrooms = bathrooms;
    }

    public int getMls() {
        return this.mls;
    }

    public void setMls(int mls) {
        this.mls = mls;
    }

    public LocalDate getDateListed() {
        return dateListed;
    }

    public void setDateListed(LocalDate dateListed) {
        this.dateListed = dateListed;
    }

    public int getDaysSinceListed() {
        return Period.between(dateListed, LocalDate.now()).getDays();
    }

    public int getPrice() {
        return this.price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPropertyType() {
        return this.propertyType;
    }

    public void setPropertyType(String propertyType) {
        this.propertyType = propertyType;
    }

    public int getYearBuilt() {
        return this.yearBuilt;
    }

    public void setYearBuilt(int yearBuilt) {
        this.yearBuilt = yearBuilt;
    }

    public double getBedrooms() {
        return this.bedrooms;
    }

    public void setBedrooms(double bedrooms) {
        this.bedrooms = bedrooms;
    }

    public double getBathrooms() {
        return this.bathrooms;
    }

    public void setBathrooms(double bathrooms) {
        this.bathrooms = bathrooms;
    }

    public void setDaysSinceListed(int daysSinceListed) {
        this.daysSinceListed = daysSinceListed;
    }






 
}
