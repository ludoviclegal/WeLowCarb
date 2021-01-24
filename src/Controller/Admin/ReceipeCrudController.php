<?php

namespace App\Controller\Admin;

use App\Entity\Receipe;
use App\Entity\ReceipeHasIngredient;
use App\Form\ReceipeHasIngredientType;
use EasyCorp\Bundle\EasyAdminBundle\Field\FormField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Context\AdminContext;
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

            FormField::addPanel('Ingrédients'),
            CollectionField::new('ingredient', 'Ingrédients')
                ->allowAdd() 
                ->allowDelete()
                ->setEntryIsComplex(true)
                ->setEntryType(ReceipeHasIngredientType::class)
                ->setFormTypeOptions([
                    'by_reference' => 'false' 
                ]),
        ];
    }

    /*public function edit(AdminContext $context)
    {
        die('coucou');
        $editForm = $this->createEditForm($context->getEntity(), $context->getCrud()->getEditFormOptions(), $context);
        $editForm->handleRequest($context->getRequest());
        if ($editForm->isSubmitted() && $editForm->isValid()) {

        }
        //parent::edit(AdminContext $context);
    }*/
}
