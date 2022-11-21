package ensf607.propertysearchengine.pricehistory;

import ensf607.propertysearchengine.property.*;

import java.time.LocalDate;
import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table
public class PriceHistory implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int id;

    private LocalDate date;
    private int price;

    @ManyToOne
    @JoinColumn(name="PropertyMLS", referencedColumnName = "mls")
    private Property property;

    public PriceHistory() {
    }

    public PriceHistory(int mls, LocalDate date, int price) {
        this.date = date;
        this.price = price;
    }

    public LocalDate getDate() {
        return this.date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getPrice() {
        return this.price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
 
}
