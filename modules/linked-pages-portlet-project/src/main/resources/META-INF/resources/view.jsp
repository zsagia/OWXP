<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/init.jsp" %>

<%
String portletNamespace = PortalUtil.getPortletNamespace(LinkedPagesPortletKeys.LINKED_PAGES);

LinkedPagesView linkedPagesView = new LinkedPagesView(themeDisplay);

WikiPage wikiPage = linkedPagesView.getWikiPage();

List<Task> availableTasks = new ArrayList<Task>();

if (wikiPage != null) {
	availableTasks = TaskHandlerUtil.getRunningVotes(wikiPage.getPageId());
}

%>

<div>
	<div class="closed lfr-admin-panel lfr-product-menu-panel lfr-simulation-panel sidenav-fixed sidenav-menu-slider sidenav-right" id="<%= portletNamespace %>linkedPagesPanelId">
		<div class="product-menu sidebar sidebar-inverse sidenav-menu">
			<div class="sidebar-header">
				<span><liferay-ui:message key="linked_pages_portlet_project_LinkedPagesPortlet.caption"/></span>
			</div>

			<div class="sidebar-body"></div>

			<div class="content">
				<h4 class="header toggler-header-collapsed">Linked Pages</h4>
				<c:choose>
					<c:when test="<%= linkedPagesView.getLinkedPages().isEmpty() %>">
						<div class="content toggler-content-collapsed">
							No Wiki page is available
						</div>
					</c:when>
					<c:otherwise>
						<div class="content toggler-content-collapsed">
							<ul class="nav">

								<%
								for (PageLink pageLink : linkedPagesView.getLinkedPages()) {
								%>

									<li class="">
										<a href="<%= pageLink.getPageLink() %>" style="color:#6a708b;">
											<%= pageLink.getPageTitle() %>
										</a>
									</li>

								<%
								}
								%>

							</ul>
						</div>
					</c:otherwise>
				</c:choose>

				<h4 class="header toggler-header-collapsed">Votings</h4>

				<c:choose>
					<c:when test="<%= availableTasks.isEmpty() %>">
						<div class="content toggler-content-collapsed">
							No voting tasks are available
						</div>
					</c:when>
					<c:otherwise>
						<div class="content toggler-content-collapsed">
						<%
							for (Task task : availableTasks) {
								
						%>
								<div>
									<h5><%= task.getTaskName() %></h5>
									<aui:input label="Agree" name="<%= task.getTaskName() %>" type="radio" value="<%= true %>" />

									<aui:input label="Not Agree" name="<%= task.getTaskName() %>" type="radio" value="<%= false %>" />
								</div>
						<%
							}
						%>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>