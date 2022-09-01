Return-Path: <SRS0=HV0T=ZE=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEF6ECAAD5
	for <soc@archiver.kernel.org>; Thu,  1 Sep 2022 18:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4F74C43143; Thu,  1 Sep 2022 18:33:55 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FC82C433C1;
	Thu,  1 Sep 2022 18:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9FC82C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id h27so13970924qkk.9;
        Thu, 01 Sep 2022 11:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=WQ1Q0mz9FFzqj4DZ/mjMEZ15Ws6UL1GezqnQ2p7zS64=;
        b=UM51+arlg6z/CCre6QPOKyXnLdhVedrQVQT4q1qYMERqndsL0vqFdZxRK6fHfiD5vR
         p2fGC+qIRw4yd8hPKMl2PY3J+TlLj9VkJeaJT4YMYVUEMjAZIVsr8WJCYJUeIcKJTHPY
         OgH0c4LuWAsGoBl4pSAjTW6sYKAxngaN9pvI/OvElZRVZtCmni5xQ7RUhlRHBNSpPKF8
         lXwbef53MF/0m5so3LokRkX6+dwrY0kRhRGPHvDUwJL0R//qkAHISL4wsGXTk5aMDlLQ
         sKz0jlc7893EdDWW0QOKXdEmgsMBBLv/kri1qptyani3GrXl8V86UwQ9/aFb0kX0icqj
         Y1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=WQ1Q0mz9FFzqj4DZ/mjMEZ15Ws6UL1GezqnQ2p7zS64=;
        b=K9xeAEnkwELNzTIrfspdcX+E9hoACiOQ8SQYZYihsWYO26B/OstE4ug0/dZ9eRwKay
         v0OymPwRqgTpoxuUajdNMuRltGC/LY4HWFmR4GYCtCeFE4kK7Ov+/pzVzzJihkfn5dfc
         /zmGJC1MQ0xjxEOT40GkttCR0JUl4dhcW31oMBhrfuXM9sIWL3BBOr9f1EXouWtuWApq
         ARyH1tvF5JlQjO7Y1xUPUHHxi3x8J9kLCTxgoSTMDXHqD6dAC0nyVz6+UOl4PTJu7tRB
         TO6YZxVFNtqbV26K8AsuGmEcYGPRZG874W1BdHY/JGasl6LONYMyZBtktCXj3Wv8aBFk
         9NGQ==
X-Gm-Message-State: ACgBeo22wY8MFsOmLRqBeySq4tTRkjbrLEqS7GXtWGg5OXMc5kSMvLIC
	QY8ucsnGFsp+QSSkktdLXFQ=
X-Google-Smtp-Source: AA6agR6pT51eIYfYIyYoIomfGEmepLPuLA7x8eDUHmhlaEnFi4XboSuLFgKSOOhCsW5nCmXv4bc7Ew==
X-Received: by 2002:a05:620a:c50:b0:6b9:6e6:428d with SMTP id u16-20020a05620a0c5000b006b906e6428dmr20469297qki.280.1662057233500;
        Thu, 01 Sep 2022 11:33:53 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id u20-20020ac87514000000b00342e86b3bdasm10563343qtq.12.2022.09.01.11.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 11:33:52 -0700 (PDT)
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
Subject: [PATCH v6 03/10] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT1170 compatible
Date: Thu,  1 Sep 2022 14:33:36 -0400
Message-Id: <20220901183343.3188903-4-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
References: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
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
V5 -> V6:
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

