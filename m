Return-Path: <SRS0=T1wL=X4=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B4CC43334
	for <soc@archiver.kernel.org>; Sat, 23 Jul 2022 16:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9CD6C341C7; Sat, 23 Jul 2022 16:05:26 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF0BCC341C0;
	Sat, 23 Jul 2022 16:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF0BCC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id x11so5426007qts.13;
        Sat, 23 Jul 2022 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jK1g6CKi8TGVEXtmQQp5ePb9oV0aBgQX1WSc/ZWjGNc=;
        b=GQ0LXoz16pb+BYb0RYEMcaylvWKYAa8sbH7tNP4qaYXmHQ4vfvIDFFzFaZeDwJNhkA
         JRkAu18I87FSi1PmxFfMgZi9WYd9B707Id2gwgJNH3InLY7ABu8ENNS3HxCBnhJUFeP4
         PjsBt78fC3NmHrt1q8n5bIEvO3yh+qDhyM+vxpgRnTcsMlOGG64gCPlzLiyp3TEGSVoM
         qeedapYa9+3VBlLprjdRvECKgGidNwpPJ0kg90g0uxHzNLFNMIxOIIwCUquaYDCs9z+E
         UBCxJnFfkmDdRtVVK03+pv9o/hdADx0Q6xLaJyA4i7IB6N8QRiUZPHh1SyRhXCO7Lvpc
         wA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jK1g6CKi8TGVEXtmQQp5ePb9oV0aBgQX1WSc/ZWjGNc=;
        b=x6wwuiDhG/v8b0eX4JKRAp6VWl5xY8zGJqrk5MeIHH3R9FKseJ9aMGrZMnb3Q7bS2K
         4w+OQ1qOPpaTOYZguliYzoagdlJao7BGMplxMnVs1ciqzaMK73SfUODvO5iflI5g/p1z
         C/IDnG8TlON5v1KcO51KPMz/GofD3zA4PknmA3+G9/khThLwrYJmhBvbHQDejhSfSlwu
         /Mmd7nn4JjPf9R4gaO4B/y3Au4mmMld47cVP9PbjnSQoUXdaKqabFmj86Uip5aJ6miVE
         6l9+dUYQuXi7dcdZCxcaBZnrzw29CLX7R/9dadLB7tg5XW7luIqDXaELBcPMFeSb9Ivj
         uSBQ==
X-Gm-Message-State: AJIora8KoZmD9jdU7Tc1otpiFHa++rRjSndQCeJakBhmKz8nF+1Sa3Go
	31rMC344xRkus3Vs6O1kYW4=
X-Google-Smtp-Source: AGRyM1uYTCjmmVj7ECql86XkacltEYujgSy09r9BhU6t7MjcYTmX4zbhUggyKQnVGkKuHfyGoMZGSg==
X-Received: by 2002:a05:622a:24e:b0:31e:fec2:d0d7 with SMTP id c14-20020a05622a024e00b0031efec2d0d7mr4400777qtx.222.1658592324787;
        Sat, 23 Jul 2022 09:05:24 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id g4-20020ac87f44000000b0031eb3af3ffesm4935046qtk.52.2022.07.23.09.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 09:05:24 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	stefan@agner.ch,
	linus.walleij@linaro.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux@armlinux.org.uk,
	abel.vesa@nxp.com,
	dev@lynxeye.de,
	marcel.ziswiler@toradex.com,
	tharvey@gateworks.com,
	leoyang.li@nxp.com,
	sebastian.reichel@collabora.com,
	cniedermaier@dh-electronics.com,
	Mr.Bossman075@gmail.com,
	clin@suse.com,
	giulio.benetti@benettiengineering.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 04/12] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT1170 compatible
Date: Sat, 23 Jul 2022 12:05:05 -0400
Message-Id: <20220723160513.271692-5-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
References: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i.MXRT1170 compatible string to Documentation.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - New commit to fix dtbs_check
V2 -> V3:
 - Fix typo
 - Remove unused const
V3 -> V4:
 - Nothing done
V4 -> V5:
 - Nothing done
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index 29339d0196ec..0e7833478869 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -75,6 +75,10 @@ properties:
           - const: fsl,imx8qxp-usdhc
           - const: fsl,imx7d-usdhc
         deprecated: true
+      - items:
+          - enum:
+              - fsl,imxrt1170-usdhc
+          - const: fsl,imxrt1050-usdhc
 
   reg:
     maxItems: 1
-- 
2.36.1

