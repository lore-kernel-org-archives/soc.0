Return-Path: <SRS0=dYGX=3W=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19B2C433FE
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 13:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6587BC433D7; Tue, 22 Nov 2022 13:44:17 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3CEF2C433D6
	for <soc@kernel.org>; Tue, 22 Nov 2022 13:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3CEF2C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id p8so23595562lfu.11
        for <soc@kernel.org>; Tue, 22 Nov 2022 05:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7cSVZRD5dl++t7NTRPxlXhktXZGNW8/fggWgo+i1QwM=;
        b=n8GgaUjftITEUjT9UbaD0FjzUVM+s8BfzCNdULajuEyLze1ZIMLxMBFLuRI8zQqsXj
         ytLPpREY8ltPVAXRaZxri2Dp/thU+TFsCwhnwvl8Ed3zx9ccXp/Z8oCEy9zmnD+TIWh3
         s1iCkzzU4nJuOJFWGkbMCgd4qQjYQUVtW/I3k08aWc/GhDC/Z9zKZqFRAjgYVu3s7vKg
         WLXmlhvYhS/DUN3wGubBlZKHYqez391eIsFNs1Ovno3BIW2QCJTsklFv3EzGCN6XSWJ6
         dQlXIpMqqSEECvATC85E9auFEpRU8mzm77ddveY4RKzBaN2phZJfzJrBTPEUms7cuf5d
         jMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cSVZRD5dl++t7NTRPxlXhktXZGNW8/fggWgo+i1QwM=;
        b=jOJLVlfA1P4j/8+BHKSCr+n77AQSsL32oSbYozabuTLdySbbirTNgiqDpKsIZGsWTc
         nk4rALGmz2J0kStoxFVth6NPMCc4RWGIRV+AQGHbsFu5/lPQ2IO8lbTw5j6YmTXaWtRy
         Fm+SBJOL2rv6nDVUrP/unXjvpKInEjMPweB/JAg7AAdDVWa7u9u5Q2tgC2y401KVz91Y
         vfjNPH1+bHGjtRzgp70O0WiNEwvtEyMjK3dfBJ+wBGoE+hyrIFROR8PdEK88lGS7CI8t
         wx18GgQNEj5ObIo4ysSBrPm7feabxGdcWOvPJBkK3mVjGHPiJuac+/Zf9L5ez4TksvU4
         JHrg==
X-Gm-Message-State: ANoB5pnVJ/oAE5StDSlINc4rX5FcvYwlVO3U5F5OYzel5sIbDEQQKW81
	ooiQl8pCmU3eGHCmEDrZATuJn2ZqWkb2vA==
X-Google-Smtp-Source: AA0mqf6n0iET3taxlhj5daLvISJtcWCShO6aEdm06dY/3OiekEvKX6We/rU2vMKwYtIM2N9pbiPGgw==
X-Received: by 2002:a05:6512:606:b0:4b1:2aab:7cbf with SMTP id b6-20020a056512060600b004b12aab7cbfmr4581551lfe.499.1669124653926;
        Tue, 22 Nov 2022 05:44:13 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id s15-20020a056512214f00b004a8b9c68735sm2500919lfr.102.2022.11.22.05.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 05:44:13 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Imre Kaloz <kaloz@openwrt.org>,
	Krzysztof Halasa <khalasa@piap.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] bus: ixp4xx: Don't touch bit 7 on IXP42x
Date: Tue, 22 Nov 2022 14:44:11 +0100
Message-Id: <20221122134411.2030372-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We face some regressions on a few IXP42x systems when
accessing flash, the following unrelated error prints
appear from the PCI driver:

ixp4xx-pci c0000000.pci: PCI: abort_handler addr = 0xff9ffb5f,
	   isr = 0x0, status = 0x22a0
ixp4xx-pci c0000000.pci: imprecise abort
(...)

It turns out that while bit 7 is masked "reserved" it is
not unused, so masking it off as zero is dangerous, and
breaks flash access on some systems such as the NSLU2.
Be more careful and avoid masking off any of the reserved
bits 7, 8, 9 or 30. Only keep masking EXP_WORD (bit 2)
on IXP43x which is necessary in some setups.

Cc: stable@vger.kernel.org
Fixes: 1c953bda90ca ("bus: ixp4xx: Add a driver for IXP4xx expansion bus")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly for fixes since it
fixes a regression.
---
 drivers/bus/intel-ixp4xx-eb.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/intel-ixp4xx-eb.c b/drivers/bus/intel-ixp4xx-eb.c
index a4388440aca7..91db001eb69a 100644
--- a/drivers/bus/intel-ixp4xx-eb.c
+++ b/drivers/bus/intel-ixp4xx-eb.c
@@ -49,7 +49,7 @@
 #define IXP4XX_EXP_SIZE_SHIFT		10
 #define IXP4XX_EXP_CNFG_0		BIT(9) /* Always zero */
 #define IXP43X_EXP_SYNC_INTEL		BIT(8) /* Only on IXP43x */
-#define IXP43X_EXP_EXP_CHIP		BIT(7) /* Only on IXP43x */
+#define IXP43X_EXP_EXP_CHIP		BIT(7) /* Only on IXP43x, dangerous to touch on IXP42x */
 #define IXP4XX_EXP_BYTE_RD16		BIT(6)
 #define IXP4XX_EXP_HRDY_POL		BIT(5) /* Only on IXP42x */
 #define IXP4XX_EXP_MUX_EN		BIT(4)
@@ -57,8 +57,6 @@
 #define IXP4XX_EXP_WORD			BIT(2) /* Always zero */
 #define IXP4XX_EXP_WR_EN		BIT(1)
 #define IXP4XX_EXP_BYTE_EN		BIT(0)
-#define IXP42X_RESERVED			(BIT(30)|IXP4XX_EXP_CNFG_0|BIT(8)|BIT(7)|IXP4XX_EXP_WORD)
-#define IXP43X_RESERVED			(BIT(30)|IXP4XX_EXP_CNFG_0|BIT(5)|IXP4XX_EXP_WORD)
 
 #define IXP4XX_EXP_CNFG0		0x20
 #define IXP4XX_EXP_CNFG0_MEM_MAP	BIT(31)
@@ -252,10 +250,9 @@ static void ixp4xx_exp_setup_chipselect(struct ixp4xx_eb *eb,
 		cs_cfg |= val << IXP4XX_EXP_CYC_TYPE_SHIFT;
 	}
 
-	if (eb->is_42x)
-		cs_cfg &= ~IXP42X_RESERVED;
 	if (eb->is_43x) {
-		cs_cfg &= ~IXP43X_RESERVED;
+		/* Should always be zero */
+		cs_cfg &= ~IXP4XX_EXP_WORD;
 		/*
 		 * This bit for Intel strata flash is currently unused, but let's
 		 * report it if we find one.
-- 
2.38.1

