Return-Path: <SRS0=HV0T=ZE=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C09ECAAD3
	for <soc@archiver.kernel.org>; Thu,  1 Sep 2022 18:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF33EC433D7; Thu,  1 Sep 2022 18:33:56 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 03287C433C1;
	Thu,  1 Sep 2022 18:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 03287C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id h27so13971008qkk.9;
        Thu, 01 Sep 2022 11:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Tv2a7wU2lhgN97bYzJfah37NqTdtlxQ5678kEaFGvZM=;
        b=F4sesasecjX/JIjBPB1nFlGezzl2EeRQ8PgoBgGj3g4d6Ns1fXzIk41ieUigoQ+yjT
         0uFYW0xf/DD7010ylr5FjsS0DHRTt0g9rGc7hL90W5t9Welnd3LBoB25th+9/3oIYE0G
         sC5Ssv8s0j1vMM1VASi2/yVOZ5U+HHy6j2Ji8RM9k1O/DueagTExMiqdtnESMfTTO3xe
         UTUjFxEZJ0ecmo+4nnv2/HuDfWjdvhzFkMudTqcPZNnn5xpgDshWi0CNWZmkXrr8oXcR
         ZXH4vXPeTqEpK99/4uvTo5ZOoRkn171FhULAPIIOL0kxJOPOsQeNM8m8jt6fRLw+Bzrp
         ohtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Tv2a7wU2lhgN97bYzJfah37NqTdtlxQ5678kEaFGvZM=;
        b=u2tktRA/UzSij0Krx4ALHFbw+qYtrxdPvqsxTofAVG1KQl09gbmfuAimwLR6vqH6TN
         ev50lWDaS6Def52xgEtm2k9FcBx9Xc1ykfZg3SrSIKnO6iWN6Gtc8FR9xmBx44O6Du0s
         3wSyUIju0xzWAAaDLcXIsOFL22EhI+KAGn+Fy30QQmchCtOKwe5IpbWuZ3zGR1R1vFaT
         XgLsw3i7CsbpcL5r7c8N+4ee8kLtZHlVGfIBYxSw/E8+bRiVRUnucU0/GA3ghDY/a1Yu
         MpZK3SnqPe1D3rGoGytQC7LKXeEK5SYGffVFeAtB7HXm705Fr2vZ9F4xuVZ4az1WrDv8
         fFHw==
X-Gm-Message-State: ACgBeo0JfYrR56GiXgPg5QiszAIcWCWqNoMFnfS4jlybzWbu2Vzuu0ia
	9NgPkDEmlPnSpVl2F3WJq+g=
X-Google-Smtp-Source: AA6agR7f87gfbRhIG1C0yYL3bG7qyjKY2RU+B86kNZIwcfhp5tMMsI2JVVyb5GHrZ2AsPNa+rWfgIg==
X-Received: by 2002:a05:620a:2890:b0:6bc:6ecd:2c4a with SMTP id j16-20020a05620a289000b006bc6ecd2c4amr20912427qkp.603.1662057235658;
        Thu, 01 Sep 2022 11:33:55 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id u20-20020ac87514000000b00342e86b3bdasm10563343qtq.12.2022.09.01.11.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 11:33:54 -0700 (PDT)
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
Subject: [PATCH v6 04/10] dt-bindings: serial: fsl-lpuart: add i.MXRT1170 compatible
Date: Thu,  1 Sep 2022 14:33:37 -0400
Message-Id: <20220901183343.3188903-5-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
References: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i.MXRT1170 compatible string to Documentation.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
V1 -> V2:
 - New commit to fix dtbs_check
V2 -> V3:
 - Nothing done
V3 -> V4:
 - Fix rebase artifact
V4 -> V5:
 - Nothing done
V5 -> V6:
 - Nothing done
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index 30eaa62e1aed..2c2f3c97a125 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -32,6 +32,9 @@ properties:
               - fsl,imx8qm-lpuart
               - fsl,imx8dxl-lpuart
           - const: fsl,imx8qxp-lpuart
+      - items:
+          - const: fsl,imxrt1170-lpuart
+          - const: fsl,imxrt1050-lpuart
 
   reg:
     maxItems: 1
-- 
2.36.1

