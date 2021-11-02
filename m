Return-Path: <SRS0=V3zi=PV=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C048C4332F
	for <soc@archiver.kernel.org>; Tue,  2 Nov 2021 22:57:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8393F610E5; Tue,  2 Nov 2021 22:57:19 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AB2B60041;
	Tue,  2 Nov 2021 22:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AB2B60041
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id a24so611883qvb.5;
        Tue, 02 Nov 2021 15:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9kENO6dT6bi8+vAAwG2HaEh0fV06gXedhlAWHwtHs6k=;
        b=OedOtHC1F+mL4hUypyXtk5qQSumKxhtC81bPGg4Hc/JX1oppAkyUIxMsY4BuimdO5E
         /exXic+LeeBTJ3HLL+dKh8pTi65nyce4OTkCvxuur9Gk2sQuLQONijX7sm2Ok/le81/w
         t/7lM8PICS6c1HPpPyXNiqQzuIhkx9iIX2woL3+lMXzhy3lhVcKQuJa11oZLxtrT9ooB
         xdvHmiv0PMfTJQtd15Rmaa9r4RvisiIicPpQlmoiTewH3djiTHG70mQGVsh2fcre5unk
         QGrN57hQa+T0DA5aA1qNnMKse1iFArbY+zPefnebZM1Kv0/YrTOpxLIJf3DkUkpgNEVY
         bGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9kENO6dT6bi8+vAAwG2HaEh0fV06gXedhlAWHwtHs6k=;
        b=HGKXTXvK0t7hbMhFB2nQ+m/5dPBy5shiS5bqG3YEIwyh+jsFI29VPBT9sSCUBwe+bP
         EXirs+PRQJd1ckbC/jEY6A3HWflS9Uirlx9CiqXPCrTGCgCxEs/zTu89yKMUjFGAoTWv
         mRGx9PRdLsM83IwMm9kjOhp50W4wD8wH+Y1K2lY9Xy5GP3m+28CTlCqXvbn0InZNT6F0
         RpCmgxs75f6FOpyB0gXm4T8fEP3KrxD1mbV9Zq4/bAyyQOtHAYiK6g4tP+CcrdQ0+ZGD
         gZ+Lw/7Qlf5IVg36sD3JY5MdUrhTBdczaWgGsPxYkNhiVKiqODWbw7CCxrrWPTvTnmbC
         Tzew==
X-Gm-Message-State: AOAM532wHL8RNVp9C/Dgco3nVvV2ohe/ILP1q4BbUYFJpCIFyeUK0oSJ
	nkTNVvcGhl3W2UHRty7lJ0A=
X-Google-Smtp-Source: ABdhPJyQxEEKYdwrDtQ897WKes/oYEhB6qtV5+w2s7/My+JbXJMFLXmxAM54+mEmzDz621wqH1OtLQ==
X-Received: by 2002:ac8:7044:: with SMTP id y4mr41252982qtm.64.1635893838350;
        Tue, 02 Nov 2021 15:57:18 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 15:57:17 -0700 (PDT)
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
Subject: [PATCH v2 09/13] tty: serial: fsl_lpuart: add i.MXRT support
Date: Tue,  2 Nov 2021 18:56:57 -0400
Message-Id: <20211102225701.98944-10-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add support for i.MXRT1050's uart.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
V1->V2:
* Add ack by Greg
---
 drivers/tty/serial/fsl_lpuart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index b1e7190ae483..1db083905d75 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -247,6 +247,7 @@ enum lpuart_type {
 	LS1028A_LPUART,
 	IMX7ULP_LPUART,
 	IMX8QXP_LPUART,
+	IMXRT_LPUART,
 };
 
 struct lpuart_port {
@@ -310,6 +311,11 @@ static struct lpuart_soc_data imx8qxp_data = {
 	.iotype = UPIO_MEM32,
 	.reg_off = IMX_REG_OFF,
 };
+static struct lpuart_soc_data imxrt_data = {
+	.devtype = IMXRT_LPUART,
+	.iotype = UPIO_MEM32,
+	.reg_off = IMX_REG_OFF,
+};
 
 static const struct of_device_id lpuart_dt_ids[] = {
 	{ .compatible = "fsl,vf610-lpuart",	.data = &vf_data, },
@@ -317,6 +323,7 @@ static const struct of_device_id lpuart_dt_ids[] = {
 	{ .compatible = "fsl,ls1028a-lpuart",	.data = &ls1028a_data, },
 	{ .compatible = "fsl,imx7ulp-lpuart",	.data = &imx7ulp_data, },
 	{ .compatible = "fsl,imx8qxp-lpuart",	.data = &imx8qxp_data, },
+	{ .compatible = "fsl,imxrt-lpuart",	.data = &imxrt_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, lpuart_dt_ids);
@@ -2625,6 +2632,7 @@ OF_EARLYCON_DECLARE(lpuart, "fsl,vf610-lpuart", lpuart_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,ls1021a-lpuart", lpuart32_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,ls1028a-lpuart", ls1028a_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,imx7ulp-lpuart", lpuart32_imx_early_console_setup);
+OF_EARLYCON_DECLARE(lpuart32, "fsl,imxrt-lpuart", lpuart32_imx_early_console_setup);
 EARLYCON_DECLARE(lpuart, lpuart_early_console_setup);
 EARLYCON_DECLARE(lpuart32, lpuart32_early_console_setup);
 
-- 
2.33.1

