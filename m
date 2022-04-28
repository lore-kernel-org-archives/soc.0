Return-Path: <SRS0=tSnG=VG=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E572C4167B
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 21:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E867EC385B2; Thu, 28 Apr 2022 21:48:45 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CC3CC385A9;
	Thu, 28 Apr 2022 21:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5CC3CC385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id ay11so4499624qtb.4;
        Thu, 28 Apr 2022 14:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sq1McYDtncgu3zqIM7eDiykPH41EW1O9qKhBDq8HPzg=;
        b=m4c34C75x7Jtc8GQeKDtOPIV3Xvno2koB/GQ+gyU1FzvKGM/71kZxPDBCb8Msnji8c
         AImTDouWL4Ecj5YgVop44reRWi96UHzk6V6yZoro+Jod+BiheNJ+xPY3JAvasMNcai5q
         1RMD7Sz2dUQWnqnsmhgLWjO1+0ooyqtVn+CgJUCZO+mvLPLoaHANRA4oF6+I4xxd0HO4
         GlgEiLAsvFCIRzz1whMdDTruE0FGDAZ+zvSSHINee6LRL1sGteMYQoMGhYmCKVWD8dG6
         bhVHxZFbR0zr9bJu7j+rAa338PcFFiPOwOSjeWZICAKouv6u9y45J34ssFoehzi3snfh
         GHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sq1McYDtncgu3zqIM7eDiykPH41EW1O9qKhBDq8HPzg=;
        b=fDkmdyxTb39vayCmGT+eMxnHDrN8ZfCr8ShCgONdU3nuuCQfxBc3TcP3z5kculCwKN
         YJbvnzvgJCyqXlq1xwc6vICKH3fntVNhtvcKciEPtQFsfSy2yyXsPxzS+ntHxPqTLf1P
         fc22xbMn7MJPAHHX3VTmVZQ4ySHUGqI1aoFCOgJG9duVkrzBG1O0srrCGbIFTwD1c8yg
         x2pgVgRpMvg2DTN0Iny1MIWIUZxA2AsPyeni8MvfUjSJL2J72qvTd/6TkbguQGUipGU0
         oCkH4M14Ena7z5R4CdYEjwtaz0+BL2CQPs+SCJK2Z9kFdjei3S3YYVDoqmOkz3i1xY1I
         4dbg==
X-Gm-Message-State: AOAM531abxd2JO4jJ0c6AfWwAtKgy7MEddP83qKEu3ed5Cv5wkUm/T4f
	WLJrcwgd0+nwAc0TpC2iuuc=
X-Google-Smtp-Source: ABdhPJxxIafmXjFknlk4ztopHK5xsw1FkhTDO3U2c6KXHwxESFM6VshJnXbBy2tSRwc7CfQUpFPlXA==
X-Received: by 2002:a05:622a:14d0:b0:2f3:4279:687c with SMTP id u16-20020a05622a14d000b002f34279687cmr25311866qtx.551.1651182524397;
        Thu, 28 Apr 2022 14:48:44 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id bl5-20020a05620a1a8500b0069f51e47c5esm546442qkb.110.2022.04.28.14.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:48:44 -0700 (PDT)
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
Subject: [PATCH v2 02/15] dt-bindings: timer: gpt: Add i.MXRT compatible Documentation
Date: Thu, 28 Apr 2022 17:48:25 -0400
Message-Id: <20220428214838.1040278-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the i.MXRT1170 and 1050 have the same GPT timer as "fsl,imx6dl-gpt"
Add i.MXRT to the compatible list.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
V1 -> V2:
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
2.35.1

