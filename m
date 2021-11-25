Return-Path: <SRS0=/X4i=QM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D490C433EF
	for <soc@archiver.kernel.org>; Thu, 25 Nov 2021 21:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E68AC9305E; Thu, 25 Nov 2021 21:44:43 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90C3AC9305A;
	Thu, 25 Nov 2021 21:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 90C3AC9305A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id r15so14942977uao.3;
        Thu, 25 Nov 2021 13:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0JRLJYcXhrRDBJKcmXD2oBmy6Smq5NLEEE+jpKeaTQI=;
        b=ayiajLyqzIPTbCHpYFE1SobpZRGlIBCDMQZ6RoHtdG5Pd37d8/IekvcM7HUxV7bHn1
         23kogyCN9TYxZRAHGs1OE+0jKmUjrOLcUYCTTjRHhRmanvW5v3ucCjr6aegauJmInzV8
         qlockAnccpJdiziY/WBnvjlI4vK2SZV7+3o5oCGstD5L6orPrD8ewS2srHYNi/nKwyVn
         5rPQBKSwvginPTpL6GdyJfjOYi9+q8sIjMwIjPZOwTF1/22IKg0S0SVuVpK2rc645775
         DTNzNgj4TRJTr5RhKK1W0gPaRY2Nldix/TWKGdVpMXH+BUzVTSmrBYzAi6X8/2dLLgNj
         sBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0JRLJYcXhrRDBJKcmXD2oBmy6Smq5NLEEE+jpKeaTQI=;
        b=bdZZeYuC53KoLK4Cul+Ye9D4/gc0UGdonVCfr6DUJxaXrhoz2FxElwBvb1QMePBnAG
         MG71fjCCS5iVdykBUm/RgzixB3Yktc3oKhH09AG1n7c/CpVx60tGYis4KtWjVjM3HXkQ
         /Bj9/o3Ft5BZsGBNoHvxrb7MvSZdK3xZnba5t0//roGhX+O7pZ2s5E+LM1mkUHnOEacK
         ExoANlu9r9QzRZ0HLyu4X5bPpurgzlv4BVgcO7VDMnypugXVNw5KJx8fOPfjFjqS+Wk7
         9YA+cNAZ5GJxYLF9Kfhn/7uig1KAx/Fqm4o1plUyw0KlK7cXclqVRk1OHem/LnkUvfiB
         13fQ==
X-Gm-Message-State: AOAM531gVLD7dt+v/kSlUIbai/RpPeXXz27rP0FxpgnuUNwq3cASPeME
	D5QkTsYCdbE3aKHnF5zzwKeewVrXaZgw4Q==
X-Google-Smtp-Source: ABdhPJymL+1A7frhrmMGWXzMvIs4AYDhLZD6/fPrF5GhvkDZOAMnhWK/bEqQTwFmsCUrgBjVxw1cjg==
X-Received: by 2002:a05:6214:27c6:: with SMTP id ge6mr9473113qvb.103.1637874902745;
        Thu, 25 Nov 2021 13:15:02 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j22sm2068175qko.68.2021.11.25.13.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:15:01 -0800 (PST)
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
Subject: [PATCH v3 09/13] tty: serial: fsl_lpuart: add i.MXRT support
Date: Thu, 25 Nov 2021 16:14:39 -0500
Message-Id: <20211125211443.1150135-10-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add support for i.MXRT1050's uart.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Nothing done
V2->V3:
* Rename imxrt to imxrt1050
---
 drivers/tty/serial/fsl_lpuart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index b1e7190ae483..884bc4e70d70 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -247,6 +247,7 @@ enum lpuart_type {
 	LS1028A_LPUART,
 	IMX7ULP_LPUART,
 	IMX8QXP_LPUART,
+	IMXRT1050_LPUART,
 };
 
 struct lpuart_port {
@@ -310,6 +311,11 @@ static struct lpuart_soc_data imx8qxp_data = {
 	.iotype = UPIO_MEM32,
 	.reg_off = IMX_REG_OFF,
 };
+static struct lpuart_soc_data imxrt1050_data = {
+	.devtype = IMXRT1050_LPUART,
+	.iotype = UPIO_MEM32,
+	.reg_off = IMX_REG_OFF,
+};
 
 static const struct of_device_id lpuart_dt_ids[] = {
 	{ .compatible = "fsl,vf610-lpuart",	.data = &vf_data, },
@@ -317,6 +323,7 @@ static const struct of_device_id lpuart_dt_ids[] = {
 	{ .compatible = "fsl,ls1028a-lpuart",	.data = &ls1028a_data, },
 	{ .compatible = "fsl,imx7ulp-lpuart",	.data = &imx7ulp_data, },
 	{ .compatible = "fsl,imx8qxp-lpuart",	.data = &imx8qxp_data, },
+	{ .compatible = "fsl,imxrt1050-lpuart",	.data = &imxrt1050_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, lpuart_dt_ids);
@@ -2625,6 +2632,7 @@ OF_EARLYCON_DECLARE(lpuart, "fsl,vf610-lpuart", lpuart_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,ls1021a-lpuart", lpuart32_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,ls1028a-lpuart", ls1028a_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,imx7ulp-lpuart", lpuart32_imx_early_console_setup);
+OF_EARLYCON_DECLARE(lpuart32, "fsl,imxrt1050-lpuart", lpuart32_imx_early_console_setup);
 EARLYCON_DECLARE(lpuart, lpuart_early_console_setup);
 EARLYCON_DECLARE(lpuart32, lpuart32_early_console_setup);
 
-- 
2.34.0

