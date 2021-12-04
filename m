Return-Path: <SRS0=WPFH=QV=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21D6C43217
	for <soc@archiver.kernel.org>; Sat,  4 Dec 2021 06:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CDF93C341C5; Sat,  4 Dec 2021 06:10:59 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E44FC341C3;
	Sat,  4 Dec 2021 06:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E44FC341C3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id p3so4919744qvj.9;
        Fri, 03 Dec 2021 22:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QwRfYjASEKPn0rq5hMtwE+U5/hpOlafLmLBHxtSVut8=;
        b=iAjEND/Mh7t5gE3MiutOA5kD4GuT4VcfXfE/01XZX8Lvz6UPEeqzU2qnC0mop7JBzZ
         ul7thdgrRklDjioFARJitkMUFgI79Qq9V+IVCMDOWgmfTC9Px0xFX3h4avsG55sXaFbd
         jRka5odj2+i5joX44uUfe4M2l4/Lbq8OdyaLX65NKbhbOCnsAPBacSg1Y3EFPywLFngz
         Ma817eTkKrKPunb6uOTyFOSkfAa0YkjV6DLmfzjjYy3z8sp9Nk+yhTYKek9xcdAYnc3T
         KvnCbRzvcwu5Y0/hTjMr2oPA99T5SwAL/yMo7fmTxVGburZatwNb7NlqtAwqcBBO5j9P
         1ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QwRfYjASEKPn0rq5hMtwE+U5/hpOlafLmLBHxtSVut8=;
        b=HQMb/B7TnwodRC0EkawN3rMAZEqH1bfYl1ebJX6JzJO0RssKP+82jlQmpKv1uuLcN4
         eDuct9Oe5Cu+2Q+jt//x1COWS/LHx6D8xvDJN1/xvZRyYwgAr0WuV1ZrSA8sKJtLtj7H
         lhARaOXeqg+BBFQNQqm7+miJbVChytxn+UWmjoy/VyXaCl2qr3J2ZWjHxJl4LqABCKvm
         0TzzouVnUlQHmq6jYh+lz8PZXDSfMsxT1HekVNkXSHJB7OTE9Buw4x6gbWxrfhvsuTwX
         WUJ00FpJ6Ig88XKCLhz2T3qvzn64Ri9SGBdWwNjNaAxMi4LBksnGdCXoRz1vPw3FyUjo
         2yMQ==
X-Gm-Message-State: AOAM533yOHq7ovSis/ioIw8RKt6sHxgNqy16g6QYUnKCOcpmuj7s7SnX
	G+iqwJf09vtd2DeITBifFFk=
X-Google-Smtp-Source: ABdhPJxYfVzxgKC+nPGJXmboncoTRe3DyMT1qjF1zeWOAGV9Y6uPFtdTjRxy4mG0Nzxh+iwoC1TESQ==
X-Received: by 2002:a0c:df0c:: with SMTP id g12mr23373490qvl.24.1638598258442;
        Fri, 03 Dec 2021 22:10:58 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id l1sm3500913qkp.125.2021.12.03.22.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 22:10:58 -0800 (PST)
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
Subject: [PATCH v4 09/13] tty: serial: fsl_lpuart: add i.MXRT support
Date: Sat,  4 Dec 2021 01:10:38 -0500
Message-Id: <20211204061042.1248028-10-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211204061042.1248028-1-Mr.Bossman075@gmail.com>
References: <20211204061042.1248028-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add support for i.MXRT1050's uart.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---
V1->V2:
* Nothing done
V2->V3:
* Rename imxrt to imxrt1050
V3->V4:
* Nothing done
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

