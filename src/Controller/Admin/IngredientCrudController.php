<?php

namespace App\Controller\Admin;

use App\Entity\Ingredient;
use App\Form\IngredientHasAllergenType;
use EasyCorp\Bundle\EasyAdminBundle\Field\FormField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CollectionField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class IngredientCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Ingredient::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('title', 'Nom'),
            AssociationField::new('category'),
            NumberField::new('kcal', 'Kilo calories'),
            NumberField::new('quantityFor', 'Valeur pour'),
            AssociationField::new('unit', 'Unité'),
            TextField::new('comment', 'Commentaire'),

            FormField::addPanel('Macros'),
            NumberField::new('carb', 'Glucides'),
            NumberField::new('fiberIncluded', 'dont fibres'),
            NumberField::new('sugar', 'dont sucre'),
            NumberField::new('protein', 'Protéines'),
            NumberField::new('fat', 'Lipides'),
            NumberField::new('saturatedFat', 'Graisses saturées'),
            NumberField::new('fiberExcluded', 'Autres fibres'),

            FormField::addPanel('Allergens'),
            CollectionField::new('allergen', 'Allergens')
                ->allowAdd() 
                ->allowDelete()
                ->setEntryIsComplex(true)
                ->setEntryType(IngredientHasAllergenType::class)
                ->setFormTypeOptions([
                    'by_reference' => 'false' 
                ]),
        ];
    }
}
