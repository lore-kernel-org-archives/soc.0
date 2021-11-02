Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37996C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:03:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0019B60C4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0019B60C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6T0MgC43zt7qoharW06ZGu8xyuulFjyPWbk1UReUCa8=; b=yVe39tLG1vZVcb
	ZNE5s3NRBMqfLA3fOJIC6PbPNQ0jnlnYtRmF8/Z4fjzWYA2NcoydY/l0LABKKvNSr4Zkw1HXcz2Pu
	2kGDhojUjt0oSP/l0cUll8z42V/sYGDvdyonPlJ+9LwrUt7oWCSdTT7hbkCN62Cp9xMce03Bd8/ri
	bLmZxSDFmIQ87BF2hv0Lsk/Mn8ye/HnXfOk3CrAMv+6s1aycx+gtCe33vY93F4Q0dXJvZRbCN0gY7
	oa8EaDNYmTPRvOB3IvS4ozXFveTjGj99kBbVeMITrGLKCt2dWASX1PIaz429qq2aawEQPoqitEvA1
	Smu6Vg51H4jOZw462Kcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi2nF-003H0y-77; Tue, 02 Nov 2021 23:02:13 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi2iY-003EpZ-RB
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 22:57:24 +0000
Received: by mail-qv1-xf31.google.com with SMTP id j9so590767qvm.10
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 15:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
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
 b=X3OGA27sI0BLKBhF0Xlpdi4wcfaBFvaLS7rDW0hs60ey9jIbfbFGQwTNt0iAsQJVi6
 Kv/JHii0KJIiQOzXTtPSNXHXIga5Wf9nDcVTnSJISbai7bR7mglaAq9A/JWkRoK4xTvb
 7g4b9VY+pfA7bT7lpoklfJ+LmWZazwVuOycF3JHhHgPV5l/nv7f2KH1ESIAZAOoyHcZT
 Fq4Hx7AqvG6pThvOii//58Q4LkzrRdEMvXYO+eVYXuAG8CglzMR1yZ1TMLt/AsuFnMSR
 2AIcTdFzzPS58mLcObIpXTjhqYr5l0XQpLaUifoq1wPX/ExUpWaTx0OvtfTxWQUql6Y+
 bu1g==
X-Gm-Message-State: AOAM531z/6nQA3DvPTBTdZuSjI1te6yr16bK3BPhyO3NzWFHjwxrXCjo
 B3mkHCsdm5b8wOrcdV5TMOU=
X-Google-Smtp-Source: ABdhPJznWEVNaPDxSOUP+wtI4TY5Jd/rdQBV/aTXAX+EZP4Ja5gVYacwyacDYlGnM9oR0ku0gnzJ2w==
X-Received: by 2002:a05:622a:134e:: with SMTP id
 w14mr21406824qtk.33.1635893841490; 
 Tue, 02 Nov 2021 15:57:21 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:57:21 -0700 (PDT)
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
Subject: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for i.MXRT
 series
Date: Tue,  2 Nov 2021 18:56:59 -0400
Message-ID: <20211102225701.98944-12-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_155722_924420_9F22C20E 
X-CRM114-Status: GOOD (  13.05  )
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
Message-ID: <20211102225659.CmohGJ4Z9oRf8jbVvTEJFY00bcy-j-INcOxO2ZlFfcA@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
