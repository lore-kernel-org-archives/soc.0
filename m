Return-Path: <SRS0=WPFH=QV=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF574C28CA7
	for <soc@archiver.kernel.org>; Sat,  4 Dec 2021 06:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE892C341C6; Sat,  4 Dec 2021 06:11:02 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44ECBC341CC;
	Sat,  4 Dec 2021 06:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44ECBC341CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id d2so5796996qki.12;
        Fri, 03 Dec 2021 22:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NBahFhBm5LsBgIuxKHo9TSxzk1RWdMM4sXQUjJWhdQY=;
        b=lS1x+TbFHPqfVR5fTPKMIrA0xnvBoSS5Axu6fsY58xjLWNUByEqxswtDr1vCmjj2bR
         AAVR3TeRE69as8YfoMhmUh+Z6+57YRIJt+l1NJE0+ICOrjpNoespyUUUVLU+Znon0Gyx
         9Cxz72RWSqQOmT68uv0lADGuJ2b653UX6MC1lNwIw4PCbGVuv15RNT/y5yE/TNlv2B7s
         A0vvtBAZx3bialTSaXGdBDGEh0m4q5GTSEp7I14TGz1HxWvqjHyN169HsKUfghoagiWw
         9arDdfLzzAYBbrDFGV9KIrf75ttuKIKnsqNxEuRZpgIPwVplMI5v5S3KSvna3A0Xn6Hy
         Hp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NBahFhBm5LsBgIuxKHo9TSxzk1RWdMM4sXQUjJWhdQY=;
        b=Mi5z5EjR8gwCGqbvvI55foZWvcLeq+3qFrCaomJ7pSoExBn7t4RgxhrRoGcPY6YFPE
         xKX7/8P0O+Q8TxcLkbDfAV4yqIL2fUNdvzZ57VcMZRqFTw6fnelJvHD0aMIpr4AcOdSL
         L/4IahCJ1YMln+/7MDUH6ARVMz2KIiY1becFfpeO2pbbXpG0bshtx2oXuZONddBvc7ar
         DR+1Kl3irkU2CW4W+rApMyGfaR+oGaAfoZQ47D8NKF2zSob26C34/9ZB5SlcNdy5uWOC
         kI/JOihyIk4Hbf16RgWe1XjF7VnByCrOJ5fbp9Si0l97M3hweYFFAWaaARFpJ4Cvlg2s
         PBLA==
X-Gm-Message-State: AOAM530y1nfqNxS65sFHE3YMFyU3LXgg301NcUoi6rQ78Kdw/CoP2TRA
	8kh29EzEqXW/FUlsy5qRGsw=
X-Google-Smtp-Source: ABdhPJwoQ6RlQrgedA3GGnU1amHGW3NPIWiJNeYr+UuEx5dqtJ9NbYQpWY+Y2UQqJtdqmCrs2ZVJLg==
X-Received: by 2002:a37:4015:: with SMTP id n21mr21207390qka.524.1638598261170;
        Fri, 03 Dec 2021 22:11:01 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id l1sm3500913qkp.125.2021.12.03.22.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 22:11:00 -0800 (PST)
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
Subject: [PATCH v4 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for i.MXRT series
Date: Sat,  4 Dec 2021 01:10:40 -0500
Message-Id: <20211204061042.1248028-12-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211204061042.1248028-1-Mr.Bossman075@gmail.com>
References: <20211204061042.1248028-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add support for i.MXRT1050's sdhc.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---
V1->V2:
* Nothing done
V2->V3:
* Rename imxrt to imxrt1050
* Remove BROKEN_AUTO_CMD23 and MAN_TUNING flags
V3->V4:
* Nothing done
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

