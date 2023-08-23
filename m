Return-Path: <SRS0=yzNC=EI=robh_at_kernel.org=rob@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5950AC3DA6F
	for <soc@archiver.kernel.org>; Wed, 23 Aug 2023 19:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1777BC433C8; Wed, 23 Aug 2023 19:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCA1C433C7;
	Wed, 23 Aug 2023 19:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692817919;
	bh=s4YOnmi9JvRPm07nshzPHn1qcbZ938a4sogEi3pqxiE=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=C3uwE0IbDEGfWHsFRUbOovf5gJNgXIYDy4U+Vsp2Gh8xvsJqUiUskwc7k1yFsTZ2j
	 j3a6PzKviaJRaS6N0g8kj/AmZQZ76kMXdBjBkaQagGz/5T+NHPc+JHzsvGWhq7bu9E
	 R2p1uXYYi1YifzKrb3CB8vNKWlbziiTMHteDCobscDeNgar7sGRDlBB0OM8f4TU/RM
	 2v4i80QZyRUBWhJ25ThImnUb65Fn9cKgmrEQzLg/K32l7Y3xk/kcrZqTpH6YcCYozS
	 BUeZmL6xfhmmO0ClI6mSCN8C00LMo2gaAmiEVqBywOMWEezC3JmPPDuuuo19dPRFdK
	 hO8xr9zu4PK0w==
Received: (nullmailer pid 2732794 invoked by uid 1000);
	Wed, 23 Aug 2023 19:11:57 -0000
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] bus: fsl-mc: Use common ranges functions
Date: Wed, 23 Aug 2023 14:09:42 -0500
Message-Id: <20230823190958.2717267-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3d5089c4263d ("of/address: Add support for 3 address cell
bus"), the DT address functions can handle translating buses with 3
address cells. Replace the custom code with the for_each_of_range()
iterator.

The original code had fallbacks to get "#address-cells"/"#size-cells"
from the bus parent node if they are missing. This is non-standard
behavior, and AFAICT the upstream .dts files never relied on that.

Reviewed-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Tested-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2: Add tags

Arnd, Please apply this directly.

 drivers/bus/fsl-mc/fsl-mc-bus.c | 90 +++++----------------------------
 1 file changed, 13 insertions(+), 77 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 7c57e7d2ff55..2f6d5002e43d 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -995,75 +995,18 @@ struct fsl_mc_device *fsl_mc_get_endpoint(struct fsl_mc_device *mc_dev,
 }
 EXPORT_SYMBOL_GPL(fsl_mc_get_endpoint);
 
-static int parse_mc_ranges(struct device *dev,
-			   int *paddr_cells,
-			   int *mc_addr_cells,
-			   int *mc_size_cells,
-			   const __be32 **ranges_start)
-{
-	const __be32 *prop;
-	int range_tuple_cell_count;
-	int ranges_len;
-	int tuple_len;
-	struct device_node *mc_node = dev->of_node;
-
-	*ranges_start = of_get_property(mc_node, "ranges", &ranges_len);
-	if (!(*ranges_start) || !ranges_len) {
-		dev_warn(dev,
-			 "missing or empty ranges property for device tree node '%pOFn'\n",
-			 mc_node);
-		return 0;
-	}
-
-	*paddr_cells = of_n_addr_cells(mc_node);
-
-	prop = of_get_property(mc_node, "#address-cells", NULL);
-	if (prop)
-		*mc_addr_cells = be32_to_cpup(prop);
-	else
-		*mc_addr_cells = *paddr_cells;
-
-	prop = of_get_property(mc_node, "#size-cells", NULL);
-	if (prop)
-		*mc_size_cells = be32_to_cpup(prop);
-	else
-		*mc_size_cells = of_n_size_cells(mc_node);
-
-	range_tuple_cell_count = *paddr_cells + *mc_addr_cells +
-				 *mc_size_cells;
-
-	tuple_len = range_tuple_cell_count * sizeof(__be32);
-	if (ranges_len % tuple_len != 0) {
-		dev_err(dev, "malformed ranges property '%pOFn'\n", mc_node);
-		return -EINVAL;
-	}
-
-	return ranges_len / tuple_len;
-}
-
 static int get_mc_addr_translation_ranges(struct device *dev,
 					  struct fsl_mc_addr_translation_range
 						**ranges,
 					  u8 *num_ranges)
 {
-	int ret;
-	int paddr_cells;
-	int mc_addr_cells;
-	int mc_size_cells;
-	int i;
-	const __be32 *ranges_start;
-	const __be32 *cell;
-
-	ret = parse_mc_ranges(dev,
-			      &paddr_cells,
-			      &mc_addr_cells,
-			      &mc_size_cells,
-			      &ranges_start);
-	if (ret < 0)
-		return ret;
+	struct fsl_mc_addr_translation_range *r;
+	struct of_range_parser parser;
+	struct of_range range;
 
-	*num_ranges = ret;
-	if (!ret) {
+	of_range_parser_init(&parser, dev->of_node);
+	*num_ranges = of_range_count(&parser);
+	if (!*num_ranges) {
 		/*
 		 * Missing or empty ranges property ("ranges;") for the
 		 * 'fsl,qoriq-mc' node. In this case, identity mapping
@@ -1079,20 +1022,13 @@ static int get_mc_addr_translation_ranges(struct device *dev,
 	if (!(*ranges))
 		return -ENOMEM;
 
-	cell = ranges_start;
-	for (i = 0; i < *num_ranges; ++i) {
-		struct fsl_mc_addr_translation_range *range = &(*ranges)[i];
-
-		range->mc_region_type = of_read_number(cell, 1);
-		range->start_mc_offset = of_read_number(cell + 1,
-							mc_addr_cells - 1);
-		cell += mc_addr_cells;
-		range->start_phys_addr = of_read_number(cell, paddr_cells);
-		cell += paddr_cells;
-		range->end_mc_offset = range->start_mc_offset +
-				     of_read_number(cell, mc_size_cells);
-
-		cell += mc_size_cells;
+	r = *ranges;
+	for_each_of_range(&parser, &range) {
+		r->mc_region_type = range.flags;
+		r->start_mc_offset = range.bus_addr;
+		r->end_mc_offset = range.bus_addr + range.size;
+		r->start_phys_addr = range.cpu_addr;
+		r++;
 	}
 
 	return 0;
-- 
2.40.1

