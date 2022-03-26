Return-Path: <SRS0=yj5T=UF=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69AAC43219
	for <soc@archiver.kernel.org>; Sat, 26 Mar 2022 14:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9FC91C34110; Sat, 26 Mar 2022 14:43:27 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 11805C2BBE4;
	Sat, 26 Mar 2022 14:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 11805C2BBE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id i65so8103038qkd.7;
        Sat, 26 Mar 2022 07:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+xVO0FJIQ2qgJrLzRi1aEh/qFk31sqidposkUwWuxO0=;
        b=jk1eFwQbW5J3JQg/Sv9ZOMundApGSkh69I900OR1CHGbCmSPfmdqji4oRdijiCNdtJ
         em45AdU9UlD4j4vESEKWOi55qyrWR2yqN4wnI6yNgLxT2OW1QMZIYBMHlFub/z5zeiRf
         PNCsbxIGM1JwQafF04enc0tn4taEwu3Vgw69qIC6uyv/BW0mAEHB98lVjB1a/sWy3Sgb
         hMcPELmqqYs1TEBFS9X9Yq6tkLXIUvjx01crvMBL2x8L14lVsXmjaEmiyzb85wC/7yzL
         bSz2HZh2+BUut5b/dEshyOV60bevPD0w7OwG/rNalQWnnF5iG3e4mibyhlvxaKA7KyNE
         k40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+xVO0FJIQ2qgJrLzRi1aEh/qFk31sqidposkUwWuxO0=;
        b=lWuVgt041Cb4Hdu7NZ7ZOS2kITj1UNWSmM0R1G5LWqHuoscOUSnUZO8rbEhiYJLpd+
         CDOCRYyhJtJsgtSpmsoltVlc+VdObbjyHa/NDJBv8QShN6MFhpWe5WgJOtAWQ4wsBpVv
         97GimJ1WSYBLHxmq7mGqt4EuZPuY57MKTXPdPqByzRWZcffpweNbjcvCmq5RxNiMx0CM
         MJyK5whHsOMmbIvPtRwllbP3sfy8rH4EfPyZSXavqJHYoHmekbeI6v3iR/i2QULagwi3
         bYjNrF2nIaneDjMHtl8+56cjgfWgB0L89cuD6BXWXO8J1s9oMh5Tm7g1VQsemHjazoia
         PvRg==
X-Gm-Message-State: AOAM530w0E8EMqOaZCRoOOYgSFC4UJljDbrc/2YTXrO2h+fMA/94qxw3
	xbMJ1q6Y+knI7OS6dGAtvmg=
X-Google-Smtp-Source: ABdhPJzPp95tZ/3hOw0AU+b1NISAzh7LPEzM6bb2PU1W+2UFcf48+O0FA+ubdsRrS+3YTFbaBP7Cfw==
X-Received: by 2002:a05:620a:2a14:b0:67e:ca33:a46d with SMTP id o20-20020a05620a2a1400b0067eca33a46dmr10595581qkp.360.1648305806063;
        Sat, 26 Mar 2022 07:43:26 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id 70-20020a370649000000b0067b4cd8ffbasm4908918qkg.60.2022.03.26.07.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 07:43:25 -0700 (PDT)
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
Subject: [PATCH v1 02/12] dt-bindings: timer: gpt: Add i.MXRT compatible Documentation
Date: Sat, 26 Mar 2022 10:43:03 -0400
Message-Id: <20220326144313.673549-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
References: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the i.MXRT1170 and 1050 have the same GPT timer as "fsl,imx6dl-gpt"
Add i.MXRT to the compatible list.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
index a4f51f46b7a1..716c6afcca1f 100644
--- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
+++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
@@ -31,6 +31,8 @@ properties:
           - enum:
               - fsl,imx6sl-gpt
               - fsl,imx6sx-gpt
+              - fsl,imxrt1050-gpt
+              - fsl,imxrt1170-gpt
           - const: fsl,imx6dl-gpt
 
   reg:
-- 
2.34.1

