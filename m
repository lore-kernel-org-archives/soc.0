Return-Path: <SRS0=jRGM=PM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD4FC433EF
	for <soc@archiver.kernel.org>; Sun, 24 Oct 2021 15:40:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 81E69610A0; Sun, 24 Oct 2021 15:40:55 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A3C60F21;
	Sun, 24 Oct 2021 15:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53A3C60F21
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id t16so8153644qto.5;
        Sun, 24 Oct 2021 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vgtfqpJ2UFlTkiMWu/m6pDold20P16J5tOJCpP4mfRs=;
        b=J/NlAl/YoY9eut7+2Gd/+ADk1l/GxoWPCfezyJwmtato5/EZzHseRr8lFJrbI0yv1x
         W40RTcdpv78Zt6sG8GPgYXbRsHuhHSmnui7f2kX2fdILYS1yuzRnFT5W+Yr0GUNKpUGJ
         PcwhJTaQ5PdXk83MDazdgTOqOG+CymAgrPkcUT/HLURWNrQdQeNsMEALM0FK+IZ7ifSE
         x4oDCfG0y2bSXYG7xSmZr0vW7Z9Tq4OHThvZu2h3ZefjnRj1cQgPJtULkTNEz3pTHYnC
         Kk223MLGoyqjksSQsHxQeizEuEwEpTA3okfqQx4590XkFdLvSeTXkjLrmb5k8Gv8VihX
         862Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vgtfqpJ2UFlTkiMWu/m6pDold20P16J5tOJCpP4mfRs=;
        b=droO7BdahT/U3Jn9ppy9f0vJ9oOTV9RuDXxGH/IflBQnMSl3mjlkyP3IBmC7IZXsD7
         ezjRXSkMpZj88lQTU53Lidx/jFGaIw6Sr3ogzFkf80874OzcpKCw/+BFZ87Kuh+nG9W+
         t+OY2ZLv2wYlCvB4h8JFZ1dgxgUwaP5xvv575zvk1CBn/d2kP1mkysFca+y1+hbj9ySH
         2ZXgHEcjFMnetUSmlcyOerwDQFSH+nA8c4LZ2e1zUFYYWoUy6IIu7v5oXnh7Ye5JjWAd
         IkmQARXhsjAU96NQ59JbW/Ny2HYTxivUiTKfOZh32iCldshiPd6hztDddsFod2LNmJBa
         rLyg==
X-Gm-Message-State: AOAM5305MnDZQm1q4au3aF1Mo70nOqoGG7/XFrwiUCmTziPEa4tO0sYE
	uYubLOpnEOS7iFvVs0rOCXQ=
X-Google-Smtp-Source: ABdhPJxz9ISTP/92XiTZMUUmzkXOkPWMWuUnYoUpGIXXHVJIXl0bys5MJECmCuABcI7hXktUoYPDoQ==
X-Received: by 2002:ac8:5e14:: with SMTP id h20mr12064103qtx.364.1635090054510;
        Sun, 24 Oct 2021 08:40:54 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:40:54 -0700 (PDT)
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
Subject: [PATCH 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT compatible string
Date: Sun, 24 Oct 2021 11:40:24 -0400
Message-Id: <20211024154027.1479261-11-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i.MXRT documentation for compatible string.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index a3412f221104..8b6fca1bd39b 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -34,6 +34,7 @@ properties:
           - fsl,imx6ull-usdhc
           - fsl,imx7d-usdhc
           - fsl,imx7ulp-usdhc
+          - fsl,imxrt-usdhc
       - items:
           - enum:
               - fsl,imx8mm-usdhc
-- 
2.33.0

