<?php

namespace App\Form;

use App\Entity\ReceipeHasIngredient;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ReceipeHasIngredientType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('quantity')
            ->add('ingredient')/*, CollectionType::class, [
                'query_builder' => function(EntityRepository $repository) { 
                    return $repository->createQueryBuilder('ingredient')->orderBy('ingredient.title', 'ASC');
                },
                'property' => 'title',
            ])*/
            //->add('receipe')//, null, ['choice_value' => ])
            ->add('unit')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => ReceipeHasIngredient::class,
        ]);
    }
}
