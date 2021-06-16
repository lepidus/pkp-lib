{**
 * templates/submission/form/categories.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Include categories for submissions.
 *}
 <script type="text/javascript">
	$(document).ready(function()
	{ldelim}
		if ($('#categoriesList').find('li').length > 10)
		{ldelim}
			$('#categoriesList').find('input:checked').each(function()
			{ldelim}
				$(this).parent().css('font-weight', '700');
			{rdelim});

			$('#categoriesList input').click(function()
			{ldelim}
				if ($(this).is(':checked') == true)
				{ldelim}
					$(this).parent().css('font-weight', '700');
				{rdelim}
				else
				{ldelim}
					$(this).parent().css('font-weight', '400');
				{rdelim}
			{rdelim});

			$('#categoriesSearch').keyup(function()
			{ldelim}
				filter = $('#categoriesSearch').val().toUpperCase();

				$('#categoriesList li').filter(function()
				{ldelim}
					$(this).toggle(
						$(this).text().normalize("NFD").replace(/[\u0300-\u036f]/g, "").toUpperCase().indexOf(filter) > -1
					)
				{rdelim});
			{rdelim});
		{rdelim}
    {rdelim});
</script>

{if count($categories)}
    {if $readOnly}
        {fbvFormSection title="grid.category.categories" list=true}
			{foreach from=$categories item="category" key="id"}
				{if in_array($id, $assignedCategories)}
					<li>{$category->getLocalizedTitle()|escape}</li>
				{/if}
			{/foreach}
        {/fbvFormSection}
    {else}
        {if count($categories) > 10}
            {fbvFormSection list=true title="grid.category.categories"}
				<input type="text" id="categoriesSearch" name="categoriesSearch" value=""/>
				<div class="pkp_categories_list" id="categoriesList">
					{foreach from=$categories item="category" key="id"}
						{fbvElement type="checkbox" id="categories[]" value=$id checked=in_array($id, $assignedCategories) label=$category translate=false}
					{/foreach}
				</div>
            {/fbvFormSection}
        {else}
            {fbvFormSection list=true title="grid.category.categories"}
				{foreach from=$categories item="category" key="id"}
					{fbvElement type="checkbox" id="categories[]" value=$id checked=in_array($id, $assignedCategories) label=$category translate=false}
				{/foreach}
            {/fbvFormSection}
        {/if}
    {/if}
{/if}
