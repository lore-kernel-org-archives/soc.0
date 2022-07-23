Return-Path: <SRS0=T1wL=X4=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30CDC433EF
	for <soc@archiver.kernel.org>; Sat, 23 Jul 2022 16:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 920A1C341C7; Sat, 23 Jul 2022 16:05:24 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E51A1C341C0;
	Sat, 23 Jul 2022 16:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E51A1C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id b11so912743qvo.11;
        Sat, 23 Jul 2022 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=InRXohvCnMAhmT8u+oEgogA0v2wkFEAz3q2k5R/fqSM=;
        b=GgUat65VKsK0ZfRj3q0oBW1CkoIxu7E+MrqgpBUEm2grTGs4eOFzTDGV6ULXDRIgwG
         HAbl1U/fHF+h+Wq96YysjLLqZFfen2ImAAjHbqzYNc+T2Fl6Fe6YPsnilshk+f8rEXMH
         te/1Ef5Rlfw9d7z6TKt2anIYBnvjN/NpXu24WhOPXE3sKw0275znEekL9CpGbF78EtkK
         fMbQFA2e2kF9Pa3CNgy5eGWhOZQ804VywFTjvwudP8eIImO/mQ471l5IXGVWYntbJhNV
         OVavlOfcCyd2LfoGE9LEi+/HUOhVeBE4tFYknVTriYkZvf4C4X/EjCLtmCcafZZtP3Vo
         tVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=InRXohvCnMAhmT8u+oEgogA0v2wkFEAz3q2k5R/fqSM=;
        b=HR1FzV2BkW/+1/ccSEIpVipAPEOWQs4iBAXLee+D6+089IoN49HujIktPS7DCOuwCn
         32rOknBdbMml9Y8hWOge7x0yYnp0fehT1kAGmClx4wWNRunwlcUd0b2n+8Onqx4qfFHW
         9yCykp+dearwhx/Ldi9t+II/bfVxQQdwKXS0nfq3wwDiSiIaPW8zOdzd5YMGrYyeTYs+
         fbPQPAx75zyzZXecb3jq3MOZkVpar9DXc9+zZ1SL9YaNEDDxT05hhCFDlXQYWQczGfV3
         0ovM8Fr6FbafjCU37EJmlABKQXZjTjWbC0mNOuGnueZjwxh0ZeyN5T9VMsDydRBhxc6K
         vYDw==
X-Gm-Message-State: AJIora+llQSj9QVXcoSeK2SjxdaxJKTu51s04jpZy6PXywHKJ7Li27wf
	CtvNsVkKEGBdfIlY1NAdB1s=
X-Google-Smtp-Source: AGRyM1vw/+m2KQwJeidQXdDWly0QGmIWFNzrcAVU3JJcEdM246sNweIz4yvWIYO6yOqG2saax+vE0g==
X-Received: by 2002:ad4:5c62:0:b0:474:1267:14fd with SMTP id i2-20020ad45c62000000b00474126714fdmr4439378qvh.68.1658592322732;
        Sat, 23 Jul 2022 09:05:22 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id g4-20020ac87f44000000b0031eb3af3ffesm4935046qtk.52.2022.07.23.09.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 09:05:22 -0700 (PDT)
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
Subject: [PATCH v5 03/12] dt-bindings: gpio: fsl-imx-gpio: Add i.MXRT compatibles
Date: Sat, 23 Jul 2022 12:05:04 -0400
Message-Id: <20220723160513.271692-4-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
References: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the i.MXRT1170 and 1050 have the same gpio controller as
"fsl,imx35-gpio". Add i.MXRT to the compatible list.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
V1 -> V2:
 - New commit to fix dtbs_check
V2 -> V3:
 - Nothing done
V3 -> V4:
 - Nothing done
V4 -> V5:
 - Nothing done
---
 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index f57d22d1ebd6..ae18603697d7 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -37,6 +37,8 @@ properties:
               - fsl,imx8mp-gpio
               - fsl,imx8mq-gpio
               - fsl,imx8qxp-gpio
+              - fsl,imxrt1050-gpio
+              - fsl,imxrt1170-gpio
           - const: fsl,imx35-gpio
 
   reg:
-- 
2.36.1

