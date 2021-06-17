{**
 * templates/submission/form/categories.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Include categories for submissions.
 *}
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
			<script>
				$(document).ready(function() {ldelim}
						$('#categoriesList').find('input:checked').each(function() {ldelim}
							$(this).parent().css('font-weight', '700');
						{rdelim});
						$('#categoriesList input').click(function() {ldelim}
							categoryItem = $(this).parent().parent();
							if ($(this).is(':checked') == true) {ldelim}
								$(categoryItem).appendTo('.assigned_categories');
								$(this).parent().css('font-weight', '700');
							{rdelim}
							else {ldelim}
								$(categoryItem).appendTo('.unassigned_categories');
								$(this).parent().css('font-weight', '400');
							{rdelim}
						{rdelim});
						$('#categoriesSearch').keyup(function() {ldelim}
							filter = $('#categoriesSearch').val().toUpperCase();
							$('#categoriesList li').filter(function() {ldelim}
								$(this).toggle(
									$(this).text().normalize("NFD").replace(/[\u0300-\u036f]/g, "").toUpperCase().indexOf(filter) > -1
								);
							{rdelim});
						{rdelim});
				{rdelim});
			</script>
            {fbvFormSection list=true title="grid.category.categories"}
				<input type="text" id="categoriesSearch" name="categoriesSearch" value=""/>
				<div class="pkp_categories_list" id="categoriesList">
					<div class="unassigned_categories">
						{foreach from=$categories item="category" key="id"}
							{if !in_array($id, $assignedCategories)}
								{fbvElement type="checkbox" id="categories[]" value=$id checked=in_array($id, $assignedCategories) label=$category translate=false}
							{/if}
						{/foreach}
					</div>
					<div class="assigned_categories">
						{foreach from=$categories item="category" key="id"}
							{if in_array($id, $assignedCategories)}
								{fbvElement type="checkbox" id="categories[]" value=$id checked=in_array($id, $assignedCategories) label=$category translate=false}
							{/if}
						{/foreach}
					</div>
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
