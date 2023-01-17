Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B14C3DA78
	for <soc@archiver.kernel.org>; Tue, 17 Jan 2023 16:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E863C433EF; Tue, 17 Jan 2023 16:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5936DC433D2;
	Tue, 17 Jan 2023 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673973697;
	bh=4W+LMFIC03txs/fKwZg/VXFgERl+Imhhl+f5HQP4HXY=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=GC5peznF5O+OoIOSc7hqyT7AnK+Ru0U4LriVxu+EtZx5RfEEcmnYnQ7ilNe1FJ2fW
	 43N9y8LJ8pXAYM0dkZBjpOIXs95UrlKge20qLEPEAF8YUzTlxH+Mh+2Xgj1GCRCPNW
	 13Rr3SVvcjmOQYoYvMPGEryhhg+FvpSP64iaZyHXp2oUYWJrM1nRtLIYIAv/0AcIsS
	 cXIlxd8P5rTIUdSLusyZ4AVV2W+FZvuto7GOeSSeECnQ7AMo25MaqH6+WmQ49B3YFq
	 qx4X3AZVuMEq1XHu3EEatNKbrHlLTjkt3vtbc62zZ9klErkQH671LfFwCGp5Krk+Z4
	 fdobWNJLlJiOw==
From: Arnd Bergmann <arnd@kernel.org>
To: Michal Simek <michal.simek@xilinx.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Tanmay Shah <tanmay.shah@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ben Levinsky <ben.levinsky@amd.com>,
	Ronak Jain <ronak.jain@xilinx.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: zynqmp: fix declarations for gcc-13
Date: Tue, 17 Jan 2023 17:41:14 +0100
Message-Id: <20230117164133.1245749-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

gcc-13.0.1 reports a type mismatch for two functions:

drivers/firmware/xilinx/zynqmp.c:1228:5: error: conflicting types for 'zynqmp_pm_set_rpu_mode' due to enum/integer mismatch; have 'int(u32,  enum rpu_oper_mode)' {aka 'int(unsigned int,  enum rpu_oper_mode)'} [-Werror=enum-int-mismatch]
 1228 | int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode)
      |     ^~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/firmware/xilinx/zynqmp.c:25:
include/linux/firmware/xlnx-zynqmp.h:552:5: note: previous declaration of 'zynqmp_pm_set_rpu_mode' with type 'int(u32,  u32)' {aka 'int(unsigned int,  unsigned int)'}
  552 | int zynqmp_pm_set_rpu_mode(u32 node_id, u32 arg1);
      |     ^~~~~~~~~~~~~~~~~~~~~~
drivers/firmware/xilinx/zynqmp.c:1246:5: error: conflicting types for 'zynqmp_pm_set_tcm_config' due to enum/integer mismatch; have 'int(u32,  enum rpu_tcm_comb)' {aka 'int(unsigned int,  enum rpu_tcm_comb)'} [-Werror=enum-int-mismatch]
 1246 | int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
include/linux/firmware/xlnx-zynqmp.h:553:5: note: previous declaration of 'zynqmp_pm_set_tcm_config' with type 'int(u32,  u32)' {aka 'int(unsigned int,  unsigned int)'}
  553 | int zynqmp_pm_set_tcm_config(u32 node_id, u32 arg1);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~

Change the declaration in the header to match the function definition.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/firmware/xlnx-zynqmp.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index eb88b4ba62f9..0e4c70987e6a 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -549,8 +549,8 @@ int zynqmp_pm_request_wake(const u32 node,
 			   const u64 address,
 			   const enum zynqmp_pm_request_ack ack);
 int zynqmp_pm_get_rpu_mode(u32 node_id, enum rpu_oper_mode *rpu_mode);
-int zynqmp_pm_set_rpu_mode(u32 node_id, u32 arg1);
-int zynqmp_pm_set_tcm_config(u32 node_id, u32 arg1);
+int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode);
+int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
 int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
 int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
 			     u32 value);
@@ -849,12 +849,12 @@ static inline int zynqmp_pm_get_rpu_mode(u32 node_id, enum rpu_oper_mode *rpu_mo
 	return -ENODEV;
 }
 
-static inline int zynqmp_pm_set_rpu_mode(u32 node_id, u32 arg1)
+static inline int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode)
 {
 	return -ENODEV;
 }
 
-static inline int zynqmp_pm_set_tcm_config(u32 node_id, u32 arg1)
+static inline int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode)
 {
 	return -ENODEV;
 }
-- 
2.39.0

