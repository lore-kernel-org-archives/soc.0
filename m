Return-Path: <SRS0=T1wL=X4=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5F3C43334
	for <soc@archiver.kernel.org>; Sat, 23 Jul 2022 16:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83F0DC341C7; Sat, 23 Jul 2022 16:05:32 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A739AC36AE2;
	Sat, 23 Jul 2022 16:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A739AC36AE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id v28so5634283qkg.13;
        Sat, 23 Jul 2022 09:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5nDAYvxjqoqYv4CiPZFdwdt1qKBcvG3S4hJKhHvUo8c=;
        b=OcStqwwDXt317Tx3CnxxyuO6eb3rnZMu4XbaxLYL8p+lQkx9103QBwV2HJWEz/J/bZ
         HkTXmZRfiOte7ihgH/RB6vyWORks6sZmfpHQIzmaucnm7cPsZtZDLhn56vEyY/oKkJTB
         aQlN7Wc5Pq17aBhpqNuOFQbbg62qdZtHkJ5Fo3s6mjvxKxExvm4T3cCdqOvq1n+n1Keg
         yMMlOU5TO2SpWYwqs+5GvHB2CfRahPctGmnLM4wZl+t/VtzGXLSno07tH96WutMhZalZ
         tuixP037yYQzz6tt6h0p8qwm3Yve4ozsY+temv6DUGSbptXlwD9nF+BaAA0l5SN7E8kf
         Ugwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5nDAYvxjqoqYv4CiPZFdwdt1qKBcvG3S4hJKhHvUo8c=;
        b=QxceRw/UA5s4I3fOq1tQoQjfhj0eKhX68N70pdJ99PEdvtuSUQq2AaH/irYpyGhN4e
         u5/B62ZzQQrjV6wvw3ZcLZPImDT6IrhcJ8qvhpjbxqY92BR2NOjuH7IAFIIalZHJpMAA
         IExVnUELvXjyoD/44wfO32V+/1QIxeptdbcLBj19RLi5gTss2ckhndHZdUG0l1CpMV0E
         DUicnrSCzh+VuOnMYUp0++/Mn6MWVLhatmgGmzWnnxqWHA4Kx1/OrNe+TTmiTPUOduAe
         fOUNwI9JYoAdoeLVOjIh6OKyvyTv3BpVU8XNhe2N+kKG2y45obIoWaJuliJzKKR7K/M7
         1Bsg==
X-Gm-Message-State: AJIora/gaNgNoqBKZH/U0f4hSJhnoPk2XThjxhqTHdHZmMgU3sfjOk2p
	Cb9laSPepMdQwDMwEusogVo=
X-Google-Smtp-Source: AGRyM1vHmh0NnQ22YfdtqQNEZ1+j/81rWPwOg5S0PbsmGQWJjRKSL1V9mVpRVRg/TWrj9akx7FrXEA==
X-Received: by 2002:ae9:e715:0:b0:6b5:db75:150e with SMTP id m21-20020ae9e715000000b006b5db75150emr3726044qka.23.1658592330601;
        Sat, 23 Jul 2022 09:05:30 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id g4-20020ac87f44000000b0031eb3af3ffesm4935046qtk.52.2022.07.23.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 09:05:29 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	stefan@agner.ch,
	linus.walleij@linaro.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux@armlinux.org.uk,
	abel.vesa@nxp.com,
	dev@lynxeye.de,
	marcel.ziswiler@toradex.com,
	tharvey@gateworks.com,
	leoyang.li@nxp.com,
	sebastian.reichel@collabora.com,
	cniedermaier@dh-electronics.com,
	Mr.Bossman075@gmail.com,
	clin@suse.com,
	giulio.benetti@benettiengineering.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 07/12] clk: imx: Update pllv3 to support i.MXRT1170
Date: Sat, 23 Jul 2022 12:05:08 -0400
Message-Id: <20220723160513.271692-8-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
References: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MXRT1170 has a pll that has the multiplier bits inverted and
cannot be changed add IMX_PLLV3_GENERICV2.

The i.MXRT1170 also has the lock bit moved as well as the
power bit inverted the power bit also is in different locations on each
pll control register.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - Nothing done
V2 -> V3:
 - Nothing done
V3 -> V4:
 - Nothing done
V4 -> V5:
 - Add __imx_clk_hw_pllv3 to change power bit
 - Add BM_PLL_POWER and imx_clk_hw_pllv3 to header
 - Remove imx_clk_hw_pll3_powerbit
---
 drivers/clk/imx/clk-pllv3.c | 57 +++++++++++++++++++++++++++++++++----
 drivers/clk/imx/clk.h       | 11 +++++++
 2 files changed, 62 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
index eea32f87c60a..68b1498cafe1 100644
--- a/drivers/clk/imx/clk-pllv3.c
+++ b/drivers/clk/imx/clk-pllv3.c
@@ -21,8 +21,8 @@
 #define PLL_VF610_NUM_OFFSET	0x20
 #define PLL_VF610_DENOM_OFFSET	0x30
 
-#define BM_PLL_POWER		(0x1 << 12)
 #define BM_PLL_LOCK		(0x1 << 31)
+#define BM_PLL_LOCK_V2		(0x1 << 29)
 #define IMX7_ENET_PLL_POWER	(0x1 << 5)
 #define IMX7_DDR_PLL_POWER	(0x1 << 20)
 
@@ -34,6 +34,7 @@
  * @base:	 base address of PLL registers
  * @power_bit:	 pll power bit mask
  * @powerup_set: set power_bit to power up the PLL
+ * @lock_bit:	 pll lock bit mask
  * @div_mask:	 mask of divider bits
  * @div_shift:	 shift of divider bits
  * @ref_clock:	reference clock rate
@@ -48,6 +49,7 @@ struct clk_pllv3 {
 	void __iomem	*base;
 	u32		power_bit;
 	bool		powerup_set;
+	u32		lock_bit;
 	u32		div_mask;
 	u32		div_shift;
 	unsigned long	ref_clock;
@@ -65,7 +67,7 @@ static int clk_pllv3_wait_lock(struct clk_pllv3 *pll)
 	if ((pll->powerup_set && !val) || (!pll->powerup_set && val))
 		return 0;
 
-	return readl_relaxed_poll_timeout(pll->base, val, val & BM_PLL_LOCK,
+	return readl_relaxed_poll_timeout(pll->base, val, val & pll->lock_bit,
 					  500, PLL_LOCK_TIMEOUT);
 }
 
@@ -101,7 +103,7 @@ static int clk_pllv3_is_prepared(struct clk_hw *hw)
 {
 	struct clk_pllv3 *pll = to_clk_pllv3(hw);
 
-	if (readl_relaxed(pll->base) & BM_PLL_LOCK)
+	if (readl_relaxed(pll->base) & pll->lock_bit)
 		return 1;
 
 	return 0;
@@ -155,6 +157,39 @@ static const struct clk_ops clk_pllv3_ops = {
 	.set_rate	= clk_pllv3_set_rate,
 };
 
+static int clk_pllv3_genericv2_set_rate(struct clk_hw *hw, unsigned long rate,
+		unsigned long parent_rate)
+{
+	struct clk_pllv3 *pll = to_clk_pllv3(hw);
+	u32 val, div;
+
+	div = (readl_relaxed(pll->base) >> pll->div_shift) & pll->div_mask;
+	val = (div == 0) ? parent_rate * 22 : parent_rate * 20;
+
+	if (rate == val)
+		return 0;
+
+	return -EINVAL;
+}
+
+static unsigned long clk_pllv3_genericv2_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct clk_pllv3 *pll = to_clk_pllv3(hw);
+	u32 div = (readl_relaxed(pll->base) >> pll->div_shift)  & pll->div_mask;
+
+	return (div == 0) ? parent_rate * 22 : parent_rate * 20;
+}
+
+static const struct clk_ops clk_pllv3_genericv2_ops = {
+	.prepare	= clk_pllv3_prepare,
+	.unprepare	= clk_pllv3_unprepare,
+	.is_prepared	= clk_pllv3_is_prepared,
+	.recalc_rate	= clk_pllv3_genericv2_recalc_rate,
+	.round_rate	= clk_pllv3_round_rate,
+	.set_rate	= clk_pllv3_genericv2_set_rate,
+};
+
 static unsigned long clk_pllv3_sys_recalc_rate(struct clk_hw *hw,
 					       unsigned long parent_rate)
 {
@@ -407,9 +442,9 @@ static const struct clk_ops clk_pllv3_enet_ops = {
 	.recalc_rate	= clk_pllv3_enet_recalc_rate,
 };
 
-struct clk_hw *imx_clk_hw_pllv3(enum imx_pllv3_type type, const char *name,
+struct clk_hw *__imx_clk_hw_pllv3(enum imx_pllv3_type type, const char *name,
 			  const char *parent_name, void __iomem *base,
-			  u32 div_mask)
+			  u32 div_mask, u8 pwr_bit)
 {
 	struct clk_pllv3 *pll;
 	const struct clk_ops *ops;
@@ -421,11 +456,21 @@ struct clk_hw *imx_clk_hw_pllv3(enum imx_pllv3_type type, const char *name,
 	if (!pll)
 		return ERR_PTR(-ENOMEM);
 
-	pll->power_bit = BM_PLL_POWER;
+	pll->power_bit = pwr_bit;
+	pll->lock_bit = BM_PLL_LOCK;
 	pll->num_offset = PLL_NUM_OFFSET;
 	pll->denom_offset = PLL_DENOM_OFFSET;
 
 	switch (type) {
+	case IMX_PLLV3_GENERICV2:
+		pll->lock_bit = BM_PLL_LOCK_V2;
+		pll->powerup_set = true;
+		ops = &clk_pllv3_genericv2_ops;
+		break;
+	case IMX_PLLV3_SYSV2:
+		pll->lock_bit = BM_PLL_LOCK_V2;
+		pll->powerup_set = true;
+		fallthrough;
 	case IMX_PLLV3_SYS:
 		ops = &clk_pllv3_sys_ops;
 		break;
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 5061a06468df..782100b2846d 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -6,6 +6,8 @@
 #include <linux/spinlock.h>
 #include <linux/clk-provider.h>
 
+#define BM_PLL_POWER		(0x1 << 12)
+
 extern spinlock_t imx_ccm_lock;
 extern bool mcore_booted;
 
@@ -102,6 +104,11 @@ extern struct imx_fracn_gppll_clk imx_fracn_gppll;
 	to_clk(clk_hw_register_gate2(dev, name, parent_name, flags, reg, bit_idx, \
 				cgr_val, cgr_mask, clk_gate_flags, lock, share_count))
 
+#define imx_clk_hw_pllv3(name, parent_names, num_parents, parent,       \
+				bypass1, bypass2, base, flags)          \
+	__imx_clk_hw_pllv3(name, parent_names, num_parents, parent,     \
+				bypass1, bypass2, base, flags, BM_PLL_POWER)
+
 #define imx_clk_pllv3(type, name, parent_name, base, div_mask) \
 	to_clk(imx_clk_hw_pllv3(type, name, parent_name, base, div_mask))
 
@@ -242,6 +249,8 @@ struct clk_hw *imx_clk_hw_sscg_pll(const char *name,
 
 enum imx_pllv3_type {
 	IMX_PLLV3_GENERIC,
+	IMX_PLLV3_GENERICV2,
+	IMX_PLLV3_SYSV2,
 	IMX_PLLV3_SYS,
 	IMX_PLLV3_USB,
 	IMX_PLLV3_USB_VF610,
@@ -253,6 +262,8 @@ enum imx_pllv3_type {
 	IMX_PLLV3_AV_IMX7,
 };
 
+void imx_clk_hw_pll3_powerbit(struct clk_hw *hw, u8 shift);
+
 struct clk_hw *imx_clk_hw_pllv3(enum imx_pllv3_type type, const char *name,
 		const char *parent_name, void __iomem *base, u32 div_mask);
 
-- 
2.36.1

