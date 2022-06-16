Return-Path: <SRS0=aE8x=WX=cqplus1.com=prvs=1162F1FB06=qinjian@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125DDCCA47A
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 06:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D43C4C36AE2; Thu, 16 Jun 2022 06:42:50 +0000 (UTC)
Received: from mx1.cqplus1.com (mx1.cqplus1.com [113.204.237.245])
	by smtp.kernel.org (Postfix) with ESMTP id A5624C385A9
	for <soc@kernel.org>; Thu, 16 Jun 2022 06:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5624C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=cqplus1.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cqplus1.com
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 172.28.114.216
	by mx1.cqplus1.com with MailGates ESMTP Server V5.0(23338:0:AUTH_RELAY)
	(envelope-from <qinjian@cqplus1.com>); Thu, 16 Jun 2022 14:42:35 +0800 (CST)
From: Qin Jian <qinjian@cqplus1.com>
To: sboyd@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	mturquette@baylibre.com,
	linux@armlinux.org.uk,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Qin Jian <qinjian@cqplus1.com>
Subject: [PATCH v19 05/11] clk: gate: Add devm_clk_hw_register_gate_parent_data()
Date: Thu, 16 Jun 2022 14:42:21 +0800
Message-Id: <70efe3b8ba941d897599ba8a61ae31984dbd3ed2.1655360818.git.qinjian@cqplus1.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1655360818.git.qinjian@cqplus1.com>
References: <cover.1655360818.git.qinjian@cqplus1.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devm_clk_hw_register_gate_parent_data() - devres-managed version
of clk_hw_register_gate_parent_data()

Signed-off-by: Qin Jian <qinjian@cqplus1.com>
---
 include/linux/clk-provider.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index c10dc4c65..179346c5c 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -567,6 +567,23 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
 	__devm_clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL, \
 			       NULL, (flags), (reg), (bit_idx),		      \
 			       (clk_gate_flags), (lock))
+/**
+ * devm_clk_hw_register_gate_parent_data - register a gate clock with the
+ * clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_data: parent clk data
+ * @flags: framework-specific flags for this clock
+ * @reg: register address to control gating of this clock
+ * @bit_idx: which bit in the register controls gating of this clock
+ * @clk_gate_flags: gate-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_gate_parent_data(dev, name, parent_data, flags,  \
+				       reg, bit_idx, clk_gate_flags, lock)    \
+	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, NULL,	      \
+			       (parent_data), (flags), (reg), (bit_idx),      \
+			       (clk_gate_flags), (lock))
 void clk_unregister_gate(struct clk *clk);
 void clk_hw_unregister_gate(struct clk_hw *hw);
 int clk_gate_is_enabled(struct clk_hw *hw);
-- 
2.33.1

