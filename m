Return-Path: <SRS0=jRGM=PM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA822C433FE
	for <soc@archiver.kernel.org>; Sun, 24 Oct 2021 15:40:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 92D6E61050; Sun, 24 Oct 2021 15:40:53 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CCAC60F21;
	Sun, 24 Oct 2021 15:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CCAC60F21
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id c28so8110699qtv.11;
        Sun, 24 Oct 2021 08:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fG7/U26JTr2Go8waG37i/rnBfZKJjV/c/9+8XoMI6dY=;
        b=Nq+do2nPPMzN5qL2FehSoU59KbwnTZaV4tDSRuu7xgPg612txv/xyobFSEZEYrv5XB
         I/yKStecPVuyJSP94SsOnV8xmNV6avy3mBbdQ4Lqo9iha8loWGek8cIMXn1AeoroHU6q
         VgTVI51VvVk5m02iq2FpYQL+WBtvKm0c/QYNj2ML44pYbwGpIRU1o75Ia3uRwYYAyy3R
         IFI8A4SFAxR8Ai2iCVQ9r+dkz/Nijxt+4bqQ/t/KSS62Xppyu73H78r/5TmBbI2ahjsy
         zLV4qE+eWpb8Ssuu7iLUNiT33P145h/t4KZLOY6LIGVrQ1t2ukzoj9TDYpt7IEW3up/C
         7UTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fG7/U26JTr2Go8waG37i/rnBfZKJjV/c/9+8XoMI6dY=;
        b=GV82VG3cVF/xTbyelTQpgKsudVCOIqToeRNKrmTuiIV767JPc/B15tEQpYYgdIt5mP
         dz9afoCkYWvKfqJB7M4hGY+WIlwHQWGqDWQmZoZukdzd46GDEi84uRhGVjMtg3GLUXGl
         KMuu5wJCHTvnxzwKpw6yz42BVk4YJJRXlgA/0u4LHPK5TD6FXXhkY6/5fc4PtSE24rQc
         m+lxmbcT0kFZ+zj6pIfzJNvsEe4hqcbHgfj4AoE4XKXCRN0pFdLtM+hFZM1Hwr7hZnG0
         GeZFsn5lLHAhMCnO+holuuO9VPVTuTxkOnfgrnyh0dI3AIlkDvq+GoD5i3CFcAydiQm4
         mn8g==
X-Gm-Message-State: AOAM530OPr9JrP81bQ+aqNKyUsAgnIUgvKXp+GY8sgCt110abBPEkHoc
	NOtFYF4BwbooXocUdobEv+05jXS5+6RnPWCY
X-Google-Smtp-Source: ABdhPJwRmqhGlfNx6aKDhywa9RXPVYJjtt/UNCf6mMnXbQveLNJSk4xkLkdH6NUK1YIaVi843OT8ig==
X-Received: by 2002:a05:622a:1a8c:: with SMTP id s12mr12121146qtc.303.1635090052549;
        Sun, 24 Oct 2021 08:40:52 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:40:52 -0700 (PDT)
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
	leonard.crestez@nxp.com,
	b20788@freescale.com,
	Mr.Bossman075@gmail.com,
	fugang.duan@nxp.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 09/13] tty: serial: fsl_lpuart: add i.MXRT support
Date: Sun, 24 Oct 2021 11:40:23 -0400
Message-Id: <20211024154027.1479261-10-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for i.MXRT1050's uart.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
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
2.33.0

