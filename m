Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8628C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:48:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 864CB60F70
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 864CB60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5x0fbGbHw9RkzWRzaiuWd5scG2s2Qb5TuBDRdRnJ/xI=; b=vDb012MOs/N8FJ
	L5zpcx+LT06XlAjvG8xmo795NFuSGDmAgYuZgpSRJYxdKYSGpmyKqyV/HMWsykiyi6s7c99gnVacz
	RIPDJxGITTHdy9QqQDtcB7qgruQ2VnridGUnCIOqoxeO1LMV5kefN2zRd2MQBNkb0vPPMVvADHx11
	yJvoCZcD1ohroh2pSOMMNT8uDwI52VFMS77DugXWp5wKMOewBM1t3Ro2Quyt+z949n2E673R8H+2l
	1J/9BxwPI787xJGYxhGo4sdPpZCOk3kaUiBE0TErWF3ya7Oc27qxg4vG8J8BrkoYbaIqyeyv+ieVx
	abVyKFUYEJlcTbh0EuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mefiQ-00EFJw-Bq; Sun, 24 Oct 2021 15:47:18 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mefcI-00ECZT-Ds
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 15:40:59 +0000
Received: by mail-qk1-x72f.google.com with SMTP id h20so9424835qko.13
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m7AY/039Zo+SJm52UkUHM4qnGfgD3YDnvZFqJ9CqE+I=;
 b=l0ybfp8Xz7UhYd4KhZAtki8ids+oNLK3rv9wyQnv56yvPLJY+SShX/YG2MtwRU8Iem
 KO+ywrb2oJAAoqbVLYT3eBeQMNB6zF2k2Sh1set7BHjMon7uMEcv4KQKj17SzsPgEvlk
 O32hQSZls0RKG3YuXps5DBm0yGz3jGXg4npbjfSOQp66ed8SBOZRDk0PERZxmAtEjENi
 5lWa0TMS24XEzYTrCYrFvQx5WDCgiwOazb6xW2pwar5nwSoMIE6PqhN6nr3yeJZEVQzE
 HcIAiI6LCxbCOvcbyOxr9xOVIkMYACOqxIFxQ2O6ee5N6znm7nvo7VmVT7cd3+a5ttEz
 7VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m7AY/039Zo+SJm52UkUHM4qnGfgD3YDnvZFqJ9CqE+I=;
 b=iBWLI2IrZELs8za4wGpYDMpph2oIUQ94EtudtwywyaZOQ4/wx0RTc3QJCCYVdbsPnW
 UwwyVnKfGmJAk/3fEBid4E+t/7k3f4vxNCmLbXrSsxiP+BCsjOkL4FAdPueZBSDhbsG/
 cLIITS9hv8kNx86zYdjK4zLwSuB3C5Zyeo8QrAP63nfQQPRDGBH++PU2zJWtNrgmI3R3
 sD7URizV9Q1rQDiVXIJIOaaSmSgerirqJb8aM1wj+PNyWoctuvvQxa2cbOTW6Cf1LUhj
 vWI7P148R1yFr7Y85vNg7+DP6KqV3z1JLKYCMzoQDgVmprg0+kkT4Lx2xraAtvEy140w
 ig/w==
X-Gm-Message-State: AOAM533GhGnxivyTc88+VTr7WiBFhhRZQVN+uaEpVqsI8yiuOyiV+Z1e
 jIGUkwK7ZKpVi027AugNOZg=
X-Google-Smtp-Source: ABdhPJy8xNszH11yizp1S2U6BFqMIm1GKFkIUDdizYRWliK/G7EWtcMvLalGsRme2xf/HAeY3O+lUw==
X-Received: by 2002:a37:8a44:: with SMTP id m65mr9408463qkd.72.1635090057740; 
 Sun, 24 Oct 2021 08:40:57 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 08:40:57 -0700 (PDT)
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
 leonard.crestez@nxp.com, b20788@freescale.com, Mr.Bossman075@gmail.com,
 fugang.duan@nxp.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: [PATCH 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for i.MXRT series
Date: Sun, 24 Oct 2021 11:40:25 -0400
Message-ID: <20211024154027.1479261-12-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_084058_496288_56AB868D 
X-CRM114-Status: GOOD (  12.07  )
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
Message-ID: <20211024154025.GpqsMLvnpQWAj168Jx9C-Uh7VQXZDlXFek3sQVLGKns@z>

Add support for i.MXRT1050's sdhc.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index f18d169bc8ff..a112c3641560 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -295,6 +295,12 @@ static struct esdhc_soc_data usdhc_imx7ulp_data = {
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
@@ -347,6 +353,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
 	{ .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
 	{ .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
 	{ .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
+	{ .compatible = "fsl,imxrt-usdhc", .data = &usdhc_imxrt_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx_esdhc_dt_ids);
-- 
2.33.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
