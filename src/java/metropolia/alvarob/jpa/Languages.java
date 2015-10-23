/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package metropolia.alvarob.jpa;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Alvaro
 */
@Entity
@Table(name = "languages")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Languages.findAll", query = "SELECT l FROM Languages l"),
    @NamedQuery(name = "Languages.findById", query = "SELECT l FROM Languages l WHERE l.id = :id"),
    @NamedQuery(name = "Languages.findByLanguage", query = "SELECT l FROM Languages l WHERE l.language = :language"),
    @NamedQuery(name = "Languages.findAllLanguages", query = "SELECT l.language, l.id FROM Languages l"),
    @NamedQuery(name = "Languages.findByIso1", query = "SELECT l FROM Languages l WHERE l.iso1 = :iso1"),
    @NamedQuery(name = "Languages.findByIso2", query = "SELECT l FROM Languages l WHERE l.iso2 = :iso2")})
public class Languages implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 50)
    @Column(name = "language")
    private String language;
    @Size(max = 10)
    @Column(name = "iso1")
    private String iso1;
    @Size(max = 10)
    @Column(name = "iso2")
    private String iso2;
    @OneToMany(mappedBy = "languageId")
    private Collection<Users> usersCollection;
    @OneToMany(mappedBy = "languageId")
    private Collection<Words> wordsCollection;
    @OneToMany(mappedBy = "languageId")
    private Collection<Translations> translationsCollection;

    public Languages() {
    }

    public Languages(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getIso1() {
        return iso1;
    }

    public void setIso1(String iso1) {
        this.iso1 = iso1;
    }

    public String getIso2() {
        return iso2;
    }

    public void setIso2(String iso2) {
        this.iso2 = iso2;
    }

    @XmlTransient
    public Collection<Users> getUsersCollection() {
        return usersCollection;
    }

    public void setUsersCollection(Collection<Users> usersCollection) {
        this.usersCollection = usersCollection;
    }

    @XmlTransient
    public Collection<Words> getWordsCollection() {
        return wordsCollection;
    }

    public void setWordsCollection(Collection<Words> wordsCollection) {
        this.wordsCollection = wordsCollection;
    }

    @XmlTransient
    public Collection<Translations> getTranslationsCollection() {
        return translationsCollection;
    }

    public void setTranslationsCollection(Collection<Translations> translationsCollection) {
        this.translationsCollection = translationsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Languages)) {
            return false;
        }
        Languages other = (Languages) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return this.language;
    }
    
}
