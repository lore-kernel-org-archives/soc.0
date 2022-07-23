Return-Path: <SRS0=T1wL=X4=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851ADC43334
	for <soc@archiver.kernel.org>; Sat, 23 Jul 2022 16:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F871C341C7; Sat, 23 Jul 2022 16:05:22 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CAFA4C341C0;
	Sat, 23 Jul 2022 16:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CAFA4C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id e16so5662883qka.5;
        Sat, 23 Jul 2022 09:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oM+J6LQU47Ll5cBvglPrj/8sNA6JWNYmjwfp5l6F0ec=;
        b=cB+D6tFZxjNwwMQAdR7bB/aqZsiIAZVbh/5GRQIwpERHhBFDShRd5e5X3bU3XjVZaI
         lyZlVUy8ViCqLrwANiJ76x1UGZsWGwM9kZ+wzMyFUHLkAmdjFSI9Jd1CU9UgFcsTIpgh
         2EbjFi+yqjwU/00jei4KX2StYRpNkNUQyngSFf/jx/v8BiTbNNE4Emv5yHeTK3JwzheR
         7bFwNANlOjTl250em41TcMDLI5j9xylhcf49WGaDWHEOSfM4+QMBx7ILcExeeqfEMuIC
         fl2VaRkFq1yX167nuCNIAEfOrJ0PefsoQ7KRhFElOrnlyaSYav3+xlXAFZGybiFRiIKk
         snDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oM+J6LQU47Ll5cBvglPrj/8sNA6JWNYmjwfp5l6F0ec=;
        b=SFhDqy69C6npgF0E31hFqdStLjAnG0LRQYubvR+9Tc1Ezo5hNm9ljL66Ila6YJnAE7
         BJ8cRpEET3xsNBBtA5Dn/RG+IjhaxzWYbNdQdnc+hKcryT50vdpwmErMCYz++HCPJ6Tf
         YBOWGs77v5qU1MWrN4cYAZ3NIU4j7WM97XE3HkRTf2bWpg3fAMb7TrmdNun6oiqGL7ra
         F7omt9uoAFot/tfE70UjV3tAXRASN0ZU8htrvgt6IdCAJXmhfo+BnmXM/eFG5GLhxL/k
         xvUUAyzcf177ormCfvWDm3NndlSDbQJ+R5SiQhoydVn5B69QbeQN55qPBxhb+uzuIN6o
         j8Zw==
X-Gm-Message-State: AJIora8pbNI6W4tMXXSLR6n+aiifhK6M4eNAil7lSRjj2PFWj3J6RJ/N
	AR6aLhrMpTGM3FHXZcuG3JU=
X-Google-Smtp-Source: AGRyM1sh3TrQGE4W8az/u94k8nMU0iL06oazAZ1/ltgN7HHBlzFufvmZxLkCZp6G8L8Z6PQ/bZleIg==
X-Received: by 2002:a05:620a:270e:b0:6b4:8425:d03c with SMTP id b14-20020a05620a270e00b006b48425d03cmr3820941qkp.732.1658592320736;
        Sat, 23 Jul 2022 09:05:20 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id g4-20020ac87f44000000b0031eb3af3ffesm4935046qtk.52.2022.07.23.09.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 09:05:20 -0700 (PDT)
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
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v5 02/12] dt-bindings: timer: gpt: Add i.MXRT compatible Documentation
Date: Sat, 23 Jul 2022 12:05:03 -0400
Message-Id: <20220723160513.271692-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
References: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the i.MXRT1170 and 1050 have the same GPT timer as "fsl,imx6dl-gpt"
Add i.MXRT to the compatible list.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
V1 -> V2:
 - Nothing done
V2 -> V3:
 - Nothing done
V3 -> V4:
 - Nothing done
V4 -> V5:
 - Nothing done
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
2.36.1

