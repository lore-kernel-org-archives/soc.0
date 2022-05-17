Return-Path: <SRS0=TAfj=VZ=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289C0C433F5
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 03:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 111F8C385AA; Tue, 17 May 2022 03:28:10 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40A85C385B8;
	Tue, 17 May 2022 03:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40A85C385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id k8so13736145qki.8;
        Mon, 16 May 2022 20:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xuQULfnMRIZxwNK+Ml9um+QR+n0TJ9GdbQgbpfprxdg=;
        b=EZIbojQOe6IM7QSVAW67HEFr7KFhfQ1zmRZrVlI+OKgfAW9XK3UFpVVVBZTSaajWEX
         LE48v1uNVoVF8+WTsmi/Y3n+fyNJKcUSn2w8kzi39YYt06b0v+Cr5+6gB/p1t5bc4wiw
         BYiFgTRdk0RvuqrqQ9SAv6jB/97Z2MDqzI/AJ389B1S7UlqFBOrM8qXJx3QID0/o62nr
         bvqOEsCrLLynpZSURV5PYz1C69/RZjgTNLvlcOTdK3u1azXiToM+G8cDL8nNR3/8W3hc
         V4mnCR6U6/k6iVhoenudoVzT7BMO2biVy4aUAsgi1MUXuSj+Cq1TuNHgxLueM2jaxwKQ
         GJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xuQULfnMRIZxwNK+Ml9um+QR+n0TJ9GdbQgbpfprxdg=;
        b=O9UWAwRQOpHbztCA+N8G30jSR6ZPvHdQ8RomicyemvZ9gaOjZfeil0d4oeuDspL2Vq
         LsEiR8eYvtbNcGJl3Hof2+Jt4j1NOQTcnFhO77Ox/SsyVZXERKu5/jlJP5hszk14sePJ
         k8wG+zQG8vUz+kILnJY2Evr3DRVntHINL38Pao3Nd2xBtVAQAYvpTwSq2INMM0Zguy16
         wkYLpHPjQDLS10AiyZmsV3fQI9d1SSWdRUtEZvGeYGTJdqD4/lPw2zpaHYJvvC17+dAi
         P1PQRmdYMnMEbHNTkQxwi4TvSqHF0rsTsvWB8xE8REpe5/n/TLKHhUh7LlV1x08b/6wi
         ZyMA==
X-Gm-Message-State: AOAM533C6NC9zxLjLFhXJ/cI8vX+3kRSdfDOOcYOWAUgmf3oi1FcuiuM
	SbadpXy4W2VvZpcZvTYy0is=
X-Google-Smtp-Source: ABdhPJx8HQ7DoYvRCYmnm1vmwPHbRIvWR8oSqYO6NSkvLcSbEhBTsGN0Dq43lzY/lr0YfwSFVM8sVQ==
X-Received: by 2002:a05:620a:40cb:b0:6a0:922b:2d67 with SMTP id g11-20020a05620a40cb00b006a0922b2d67mr14834359qko.20.1652758088180;
        Mon, 16 May 2022 20:28:08 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id a19-20020a376613000000b006a098381abcsm7079535qkc.114.2022.05.16.20.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 20:28:07 -0700 (PDT)
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
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 04/15] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT1170 compatible
Date: Mon, 16 May 2022 23:27:51 -0400
Message-Id: <20220517032802.451743-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i.MXRT1170 compatible string to Documentation.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - New commit to fix dtbs_check
V2 -> V3:
 - Fix typo
 - Remove unused const
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

