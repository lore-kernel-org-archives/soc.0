Return-Path: <SRS0=jRGM=PM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC5AC433EF
	for <soc@archiver.kernel.org>; Sun, 24 Oct 2021 15:40:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C0B48610A6; Sun, 24 Oct 2021 15:40:58 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EF1D60EBC;
	Sun, 24 Oct 2021 15:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EF1D60EBC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id d205so9625020qke.3;
        Sun, 24 Oct 2021 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
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
        b=qewVVoAzx4edgh7y5HKxptQkDSDPg3gSNwb2z6BoMjZDBVkveBornQzubkY0ohlT1P
         CpTt4sD5QVjRxsKZ2oJ05S2c4pynigNqMbxD0hj7wEYm7Pr9CQSTVEFG0Owari+BMVsP
         y+tXtftbJnOjAgZK1UKud56hdSOrhTMtVwj+pT39nPqZYnrYn+NjMrPKP2S3WfyLH1aA
         kEFrjHtl6pZgSlHhEvovrvBFE5g1fluWoJq4KKYlzge3oV/1q3Bh6uE28atiKEHE5m2j
         xuWT4/c4GkzHnGtUgn4f1BlPDA0hyvKRuXvPCed+GB7D3zOpcYCetSKBN3Ik1PwwQyFw
         HPjg==
X-Gm-Message-State: AOAM533K7/gzT81yORiR2caBGM9VULVVfJtO6UKPriKdS/8kbt6IOJUn
	X68Eb3QAAMn4wJevYiekUc0=
X-Google-Smtp-Source: ABdhPJy8xNszH11yizp1S2U6BFqMIm1GKFkIUDdizYRWliK/G7EWtcMvLalGsRme2xf/HAeY3O+lUw==
X-Received: by 2002:a37:8a44:: with SMTP id m65mr9408463qkd.72.1635090057740;
        Sun, 24 Oct 2021 08:40:57 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:40:57 -0700 (PDT)
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
Subject: [PATCH 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for i.MXRT series
Date: Sun, 24 Oct 2021 11:40:25 -0400
Message-Id: <20211024154027.1479261-12-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

