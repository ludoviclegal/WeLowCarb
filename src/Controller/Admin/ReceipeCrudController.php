<?php

namespace App\Controller\Admin;

use App\Entity\Receipe;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CollectionField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class ReceipeCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Receipe::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('title', 'Titre'),
            NumberField::new('preparationTime', 'Temps de préparation'),
            NumberField::new('cookingTime', 'Temps de cuisson'),
            NumberField::new('number', 'Nombre de personnes'),
            TextEditorField::new('preparationStep', 'Préparation'),
        ];
    }
}
