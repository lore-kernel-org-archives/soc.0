Return-Path: <SRS0=V3zi=PV=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B39C4167B
	for <soc@archiver.kernel.org>; Tue,  2 Nov 2021 22:57:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7499D601FC; Tue,  2 Nov 2021 22:57:22 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43A3860041;
	Tue,  2 Nov 2021 22:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43A3860041
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id b17so595658qvl.9;
        Tue, 02 Nov 2021 15:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6IuAL4Jlzfho0dMKI6upYj8AX7/wi6KQMfdg/5Bl22U=;
        b=X1Se+/P+UHBy7XOEMAwQGKZ334vkvS3+fxh4jNtT7kNH60uqY+xs0iN20h6oke+Kqk
         jMzTEgedqjZIApuJzXvVzjns9hh5N6d11kJxbtgCIS1SdzLerQKt20R/maVRHA1lSrJf
         2E9k0Hi7G4nBCopvOfXxQH1lB5aeorUYBmAZjX3J8IW9nUSqpIuzalDlalg2uEkuw4z0
         xaYjySUs0f6ynS01TaYs+tX9zZ/IGM+75RJmoHiiKmBb2Iap1BCSj/dk7MjuGO/yNEEG
         lNZzbc437lH1dDY1PAkMy3ibxwXVwX0pjtEkLrshRlx/ym+/2OfbinS/fqCT0VBT4AJ+
         CjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6IuAL4Jlzfho0dMKI6upYj8AX7/wi6KQMfdg/5Bl22U=;
        b=aUiguqVKQ/cxIC9FiqFiMN/9H+cmsVYDnwwyfhZuWAtUrnSA8tiv8ShP7IOEJu3RKO
         D8fBjkKFTjLhMxQo4uweZTHuQRcY0bSpPpLGOM2FEJnY76rrRkDxeahF7xrIiOsEVyzS
         3MilgAk3WPGmDDlitVpJL6cAcVvLS3eUfOLFIFu6V5KRVBmALEmIJlUxzerirxC0Zxtu
         Y+tq2wm+HRDdelBuA8GZ+CydX8NRn3x2Yyh6SZTwW4Em1iJOEpOKEvHQijoVEsKAEY+t
         juQL9n0GPQQsQqxNvKMgcniDS1lnJTMeFBSrF7LWIMktdq5bPviZ4Lm0zzCfj4O0k9V9
         2yqw==
X-Gm-Message-State: AOAM532igBEnOEciKXMhdy1bVM1kgQFqnp07grl7yg/+rMCCXFE14hbp
	2xXG5JMK9n8UBzi34KDoY/I=
X-Google-Smtp-Source: ABdhPJznWEVNaPDxSOUP+wtI4TY5Jd/rdQBV/aTXAX+EZP4Ja5gVYacwyacDYlGnM9oR0ku0gnzJ2w==
X-Received: by 2002:a05:622a:134e:: with SMTP id w14mr21406824qtk.33.1635893841490;
        Tue, 02 Nov 2021 15:57:21 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 15:57:21 -0700 (PDT)
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
Subject: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for i.MXRT series
Date: Tue,  2 Nov 2021 18:56:59 -0400
Message-Id: <20211102225701.98944-12-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add support for i.MXRT1050's sdhc.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>---
V1->V2:
* Nothing done
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index afaf33707d46..c852a6df5611 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -305,6 +305,12 @@ static struct esdhc_soc_data usdhc_imx7ulp_data = {
 			| ESDHC_FLAG_PMQOS | ESDHC_FLAG_HS400
 			| ESDHC_FLAG_STATE_LOST_IN_LPMODE,
 };
+static struct esdhc_soc_data usdhc_imxrt_data = {
+	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
+			| ESDHC_FLAG_HS200 | ESDHC_FLAG_ERR004536
+			| ESDHC_FLAG_BROKEN_AUTO_CMD23,
+};
+
 
 static struct esdhc_soc_data usdhc_imx8qxp_data = {
 	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
@@ -357,6 +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
 	{ .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
 	{ .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
 	{ .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
+	{ .compatible = "fsl,imxrt-usdhc", .data = &usdhc_imxrt_data, },
 	{ .compatible = "nxp,s32g2-usdhc", .data = &usdhc_s32g2_data, },
 	{ /* sentinel */ }
 };
-- 
2.33.1

