Return-Path: <SRS0=/X4i=QM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9209C433F5
	for <soc@archiver.kernel.org>; Thu, 25 Nov 2021 21:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94FC8C93059; Thu, 25 Nov 2021 21:21:39 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27F45C9304D;
	Thu, 25 Nov 2021 21:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27F45C9304D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id 8so7240246qtx.5;
        Thu, 25 Nov 2021 13:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ydk5E0AUMZP3msFnqmvRmoHq6yWf+2tROGqOJqYlTaQ=;
        b=F0gF3VDSm7pE4dKVZX8qSU9zHT7w4QsKddKR0ccefqC702EfpFw6j+JTe2gSq1dlE/
         kHllhoDAE9189pqshE+n/b1fLdQoUyVu4DCgpFDpQsynoc7C8oaW1VRjZQI9jgzlzrgo
         /BQ9uLrxDBGrMAoTly1IGwAc3fu5W1srhHjHegn8/fO4dVj6lHuY7b/Isjemb+QYgwog
         g2WbWhijdHCazqGg/G19Bvb8bDEjQKkXvSqkyiW63JtMm4ijmQAE0S4CSYi3WB18vNNG
         J4reLj8heiGMpzKqolQo0hLlDiZf/ajtZCoqD66fDtlJzEabYsmR9Uao39MLw1Y9EvNa
         ct/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ydk5E0AUMZP3msFnqmvRmoHq6yWf+2tROGqOJqYlTaQ=;
        b=V2k5yq4FgYz1cYMKqVTZFn4jthQU3YJtTDKFUpFoEZACbjXPHyALp+mIpreI9F908W
         x1C8sBvfCBZnQ0+qcWxNDZgiXEzsIJDIh81JV6B5i13UdTnpUdXWGGGltR31XFKCBWBP
         nTtYjhEnDJtzFMpSOFVXpwYh5uY/6kY1mNjjacEjLN4OHVkRW1JkcfTjQd/g5pVyjLq9
         QVJ4Ga1EpcSYD6yDjBy+Rdxty/X+05fRE3RpVnhi7xrCK0OPDjwdu+qqICvDSInn0e7r
         m8QPiLmOh9UJp9z3/AM45YF5wxghXAha8gPyul9mm7mA+eWhFPtuTcaH5pYF8CJjQjQA
         pafw==
X-Gm-Message-State: AOAM5300RXN7dzv+BHS+qVUTBP5KopVeOoX6/8MO+5tw4aSMz92rS9YH
	f+i9rMgDP/YC3jnZnqJj9CMt/2lwkL9FAg==
X-Google-Smtp-Source: ABdhPJyXOygJCkPcuw0sa/BVi11id4uMnZCU+DLV+8kp7MmLhOabQsj8Q6Kg9yx8bobfUak3xlcmgw==
X-Received: by 2002:a05:620a:191a:: with SMTP id bj26mr18475683qkb.37.1637874906775;
        Thu, 25 Nov 2021 13:15:06 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j22sm2068175qko.68.2021.11.25.13.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:15:06 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	ulf.hansson@linaro.org,
	aisheng.dong@nxp.com,
	stefan@agner.ch,
	linus.walleij@linaro.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux@armlinux.org.uk,
	abel.vesa@nxp.com,
	adrian.hunter@intel.com,
	jirislaby@kernel.org,
	giulio.benetti@benettiengineering.com,
	nobuhiro1.iwamatsu@toshiba.co.jp,
	Mr.Bossman075@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Jesse Taube <mr.bossman075@gmail.com>
Subject: [PATCH v3 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for i.MXRT series
Date: Thu, 25 Nov 2021 16:14:41 -0500
Message-Id: <20211125211443.1150135-12-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add support for i.MXRT1050's sdhc.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Nothing done
V2->V3:
* Rename imxrt to imxrt1050
* Remove BROKEN_AUTO_CMD23 and MAN_TUNING flags
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 764ee1b761d9..55981b0f0b10 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -305,6 +305,9 @@ static struct esdhc_soc_data usdhc_imx7ulp_data = {
 			| ESDHC_FLAG_PMQOS | ESDHC_FLAG_HS400
 			| ESDHC_FLAG_STATE_LOST_IN_LPMODE,
 };
+static struct esdhc_soc_data usdhc_imxrt1050_data = {
+	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_HS200 | ESDHC_FLAG_ERR004536,
+};
 
 static struct esdhc_soc_data usdhc_imx8qxp_data = {
 	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
@@ -355,6 +358,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
 	{ .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
 	{ .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
 	{ .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
+	{ .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
 	{ .compatible = "nxp,s32g2-usdhc", .data = &usdhc_s32g2_data, },
 	{ /* sentinel */ }
 };
-- 
2.34.0

