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

	$('#categoriesSearch').keyup(function()
	{ldelim}
		filter = $('#categoriesSearch').val().toUpperCase();
		categories = $('#categoriesList').find('li');

		for (i = 0; i < categories.length; i++)
		{ldelim}
			category = $(categories[i]).text().normalize("NFD").replace(/[\u0300-\u036f]/g, "");
			if (category.toUpperCase().indexOf(filter) > -1)
			{ldelim}
				$(categories[i]).css('display','');
			{rdelim}
			else
			{ldelim}
				$(categories[i]).css('display','none');
			{rdelim}
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
