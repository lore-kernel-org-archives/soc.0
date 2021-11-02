Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14892C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:01:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9AD461053
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9AD461053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+drEC7VIA6SJPQZiWI2Q5R3m5XdQJL7vp/7sM+sRWk=; b=io+ge/UsIRe0qb
	zKYoz9pKe84JUqJiwxwqjursIOI2ZYYcBQhQRSA1fZdQRd+CbM8U9b9PTG7oTzs9smjb4o3Sj65gx
	DY+2wBXC2btAEgQCd1SDLXD/BaGTXHmPL1oRS9rsExEcub8zg/W83jOctsGn5YTAZV+jzE0cF1yLJ
	OLZu2P9XEiOf6X/b4Jks5lngCTasnk46yTn5/vJQTbM3OL9ARL2+FSnV+GS44ZnBcZdM0pH6IW7v9
	z214HmUAS9jjUp+7+Pu2mi+80AVi7FHaa1KxgINOJgdpvxytCY/m+mb5HKKcXV1itY0LpBIDCBl9i
	HyJM3qyIiApZylVv6psQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi2lE-003G6u-0q; Tue, 02 Nov 2021 23:00:08 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi2iV-003Enl-4w
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 22:57:20 +0000
Received: by mail-qv1-xf33.google.com with SMTP id b11so606232qvm.7
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 15:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
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
 b=d1uPhDECOJofFNbc0MsNDCj/xSfV0h4gY/t9IyJhk3hPGig7e3IWFhAwwt7eaB26EN
 MwdvErT6QFthCtm7fpEe/xBnZs530vskcxNTCYpfAatw42RhIA0XNIekDVMb5rvAzcr/
 INJFEgvgtyk4ZZM+teLe+J91QzxJyDIkyZCt4pl7wnzHNk/WowEZTLcNKIq7igbTNy6z
 puCfnTKc9HfIeqzoiix7oTzaKDzwcSramLMw37u46DxhMhxN8SIWwVGI6XweVJeLq8bZ
 74x6rE8xFQEi2aj/S6ys1zr7PdMHGWspl2NiOWfSwCH2LNZXUet5FetNvjsxEuJHRf1X
 179g==
X-Gm-Message-State: AOAM530CoT4qNwq5HcgtUDRNBoccX0PVFWxDZExh/R85wdOBPETov/ey
 mQkrcyIBLOvDYm93DfI5eZeIn9HVxsJVpGho
X-Google-Smtp-Source: ABdhPJyQxEEKYdwrDtQ897WKes/oYEhB6qtV5+w2s7/My+JbXJMFLXmxAM54+mEmzDz621wqH1OtLQ==
X-Received: by 2002:ac8:7044:: with SMTP id y4mr41252982qtm.64.1635893838350; 
 Tue, 02 Nov 2021 15:57:18 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:57:17 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org,
 giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 Mr.Bossman075@gmail.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 Jesse Taube <mr.bossman075@gmail.com>
Subject: [PATCH v2 09/13] tty: serial: fsl_lpuart: add i.MXRT support
Date: Tue,  2 Nov 2021 18:56:57 -0400
Message-ID: <20211102225701.98944-10-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_155719_261778_D5385AB3 
X-CRM114-Status: GOOD (  13.23  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211102225657.qP0BJe2F0zSwEeccfa2goSnh8cbaokjQRz_fnLtwzGg@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
