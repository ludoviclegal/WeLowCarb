<?php

namespace App\Entity;

use App\Repository\IngredientRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints\DateTime;

/**
 * @ORM\Entity(repositoryClass=IngredientRepository::class)
 */
class Ingredient
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $title;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $carb;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $protein;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $fat;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $kcal;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $fiberIncluded;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $fiberExcluded;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $sugar;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $saturatedFat;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $createdAt;

    /**
     * @ORM\ManyToOne(targetEntity="IngredientCategory")
     * @ORM\JoinColumn(name="category_id", referencedColumnName="id")
     */
    private $category;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $quantityFor;

    /**
     * @ORM\ManyToOne(targetEntity="Unit")
     * @ORM\JoinColumn(name="unit_id", referencedColumnName="id")
     */
    private $unit;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $comment;

    /** 
    * @ORM\OneToMany(targetEntity="IngredientHasAllergen", mappedBy="ingredient", cascade={"persist", "remove"}) 
    */ 
    private $allergen;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getCarb(): ?float
    {
        return $this->carb;
    }

    public function setCarb(?float $carb): self
    {
        $this->carb = $carb;

        return $this;
    }

    public function getProtein(): ?float
    {
        return $this->protein;
    }

    public function setProtein(?float $protein): self
    {
        $this->protein = $protein;

        return $this;
    }

    public function getFat(): ?float
    {
        return $this->fat;
    }

    public function setFat(?float $fat): self
    {
        $this->fat = $fat;

        return $this;
    }

    public function getKcal(): ?float
    {
        return $this->kcal;
    }

    public function setKcal(?float $kcal): self
    {
        $this->kcal = $kcal;

        return $this;
    }

    public function getSugar(): ?float
    {
        return $this->sugar;
    }

    public function setSugar(?float $sugar): self
    {
        $this->sugar = $sugar;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * Gets triggered only on insert
     * @ORM\PrePersist
     */
    public function onPrePersist()
    {
        $this->createdAt = new \DateTime("now");
    }

    public function getCategoryId(): ?int
    {
        return $this->categoryId;
    }

    public function setCategoryId(?int $categoryId): self
    {
        $this->categoryId = $categoryId;

        return $this;
    }

    public function __toString()
    {
        return $this->title;
    }

    public function getCategory(): ?IngredientCategory
    {
        return $this->category;
    }

    public function setCategory(?IngredientCategory $category): self
    {
        $this->category = $category;

        return $this;
    }

    /**
     * Get the value of unit
     */ 
    public function getUnit()
    {
        return $this->unit;
    }

    /**
     * Set the value of unit
     *
     * @return  self
     */ 
    public function setUnit($unit)
    {
        $this->unit = $unit;

        return $this;
    }

    /**
     * Get the value of quantityFor
     */ 
    public function getQuantityFor()
    {
        return $this->quantityFor;
    }

    /**
     * Set the value of quantityFor
     *
     * @return  self
     */ 
    public function setQuantityFor($quantityFor)
    {
        $this->quantityFor = $quantityFor;

        return $this;
    }

    /**
     * Get the value of comment
     */ 
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * Set the value of comment
     *
     * @return  self
     */ 
    public function setComment($comment)
    {
        $this->comment = $comment;

        return $this;
    }

    /** 
    * Add allergen 
    * 
    * @param IngredientHasAllergen $allergen 

    * @return Ingredient 
    */ 
    public function addAllergen(IngredientHasAllergen $allergen)
    { 
        $allergen->setIngredient($this); 
        $this->allergen[] = $allergen; 

        return $this; 
    } 

    /** 
    * Remove allergen
    * 
    * @param IngredientHasAllergen $allergen 
    */ 
    public function removeAllergen(IngredientHasAllergen $allergen)
    { 
        $this->allergen->removeElement($allergen);
    } 

    /** 
    * Get allergen
    * 
    * @return \Doctrine\Common\Collections\Collection 
    */ 
    public function getAllergen()
    { 
        return $this->allergen; 
    }

    /**
     * Get the value of fiberIncluded
     */ 
    public function getFiberIncluded()
    {
        return $this->fiberIncluded;
    }

    /**
     * Set the value of fiberIncluded
     *
     * @return  self
     */ 
    public function setFiberIncluded($fiberIncluded)
    {
        $this->fiberIncluded = $fiberIncluded;

        return $this;
    }

    /**
     * Get the value of fiberExcluded
     */ 
    public function getFiberExcluded()
    {
        return $this->fiberExcluded;
    }

    /**
     * Set the value of fiberExcluded
     *
     * @return  self
     */ 
    public function setFiberExcluded($fiberExcluded)
    {
        $this->fiberExcluded = $fiberExcluded;

        return $this;
    }

    /**
     * Get the value of saturatedFat
     */ 
    public function getSaturatedFat()
    {
        return $this->saturatedFat;
    }

    /**
     * Set the value of saturatedFat
     *
     * @return  self
     */ 
    public function setSaturatedFat($saturatedFat)
    {
        $this->saturatedFat = $saturatedFat;

        return $this;
    }
}
