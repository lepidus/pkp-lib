{**
 * templates/submission/form/categoriesFilter.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Categories filter for submissions.
 *}

<script>
    $(document).ready(function() {ldelim}
		$('#categoriesFilter input').click(function() {ldelim}
			categoryItem = $(this).parent().parent();
			if ($(this).is(':checked') == true) {ldelim}
				$(categoryItem).appendTo('.assigned_categories');
			{rdelim}
			else {ldelim}
				$(categoryItem).appendTo('.unassigned_categories');
			{rdelim}
		{rdelim});
		$('#search').keyup(function() {ldelim}
			filter = $(this).val().toUpperCase();
			$('.categories_list li').filter(function() {ldelim}
				$(this).toggle(
					$(this).text().normalize("NFD").replace(/[\u0300-\u036f]/g, "").toUpperCase().indexOf(filter) > -1
				);
			{rdelim});
		{rdelim});
    {rdelim});
</script>

<div class="pkp_categories_filter" id="categoriesFilter">
    <input type="text" name="search" id="search" placeholder="{translate key="common.search"}" value="" />
    <div class="categories_list">
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
</div>
