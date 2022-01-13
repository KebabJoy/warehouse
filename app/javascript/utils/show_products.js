$(document).on('turbolinks:load', function (){
    $('.show-products-form').on('click', function (e){
        e.preventDefault();

        const $form = $(".products-form");
        const $sourceSelector = $("#products_storehouse_source_storehouse_id")[0]
        const $targetSelector = $("#products_storehouse_target_storehouse_id")[0]

        if($sourceSelector.options.selectedIndex !== 0 && $targetSelector.options.selectedIndex !== 0 &&
           $sourceSelector.options.selectedIndex !== $targetSelector.options.selectedIndex)
        {
            $(".exchange-errors").hide()
            $(".storehouses-form").hide()
            $form.show()
        } else if(!$(".exchange-errors").is(':visible'))
        {
            $(".exchange-errors").show()
        }
    })
})
