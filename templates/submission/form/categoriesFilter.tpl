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
	// Initialise JS handler.
	$(function() {ldelim}
		$('#pkp_submissionCategories').pkpHandler(
			'$.pkp.pages.submission.SubmissionCategoriesFilterHandler'
		);
	{rdelim});
</script>

{fbvFormArea title="grid.category.categories" id="pkp_submissionCategories"}
    {fbvFormSection}
        {fbvElement type="text" label="common.search" multilingual="true" name="searchCategories" id="searchCategories" value=$searchCategories maxlength="255" aria-controls="categoriesList"}
    {/fbvFormSection}
    <div class="categories_list" id="categoriesList" aria-live="true">
        {fbvFormSection class="unassigned_categories" list="true"}
            {foreach from=$categories item="category" key="id"}
                {if !in_array($id, $assignedCategories)}
                    {fbvElement type="checkbox" id="categories[]" value=$id checked=in_array($id, $assignedCategories) label=$category translate=false}
                {/if}
            {/foreach}
        {/fbvFormSection}   
        {fbvFormSection class="assigned_categories" list="true"}
            {foreach from=$categories item="category" key="id"}
                {if in_array($id, $assignedCategories)}
                    {fbvElement type="checkbox" id="categories[]" value=$id checked=in_array($id, $assignedCategories) label=$category translate=false}
                {/if}
            {/foreach}
        {/fbvFormSection}
    </div>
{/fbvFormArea}