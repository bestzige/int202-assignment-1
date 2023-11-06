/* Watchara Santawee 65130500073 */
package dev.bestzige.assignment_one.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity @Getter @Setter @Table(name = "offices")
@NamedQueries(
        {
                @NamedQuery(
                        name = "Office.findAll",
                        query = "SELECT o FROM Office o"
                ),
                @NamedQuery(
                        name = "Office.findByOfficeCode",
                        query = "SELECT o FROM Office o WHERE o.officeCode = :officeCode"
                ),
                @NamedQuery(
                        name = "Office.search",
                        query = "SELECT o FROM Office o WHERE o.officeCode LIKE :search OR o.addressLine1 LIKE :search OR o.addressLine2 LIKE :search OR o.city LIKE :search OR o.state LIKE :search OR o.country LIKE :search OR o.postalCode LIKE :search OR o.phone LIKE :search OR o.territory LIKE :search"
                ),
                @NamedQuery(
                        name = "Office.count",
                        query = "SELECT COUNT(o) FROM Office o"
                ),
        }
)
public class Office {
    @Id
    private String officeCode;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String country;
    private String postalCode;
    private String phone;
    private String territory;

    public Office() {}

    public Office(String officeCode, String addressLine1, String addressLine2, String city, String state, String country, String postalCode, String phone, String territory) {
        this.officeCode = officeCode;
        this.addressLine1 = addressLine1;
        this.addressLine2 = addressLine2;
        this.city = city;
        this.state = state;
        this.country = country;
        this.postalCode = postalCode;
        this.phone = phone;
        this.territory = territory;
    }
}
