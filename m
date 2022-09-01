Return-Path: <SRS0=HV0T=ZE=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EC6ECAAD3
	for <soc@archiver.kernel.org>; Thu,  1 Sep 2022 18:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2969EC433B5; Thu,  1 Sep 2022 18:33:53 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48AADC433C1;
	Thu,  1 Sep 2022 18:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48AADC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id g14so14138232qto.11;
        Thu, 01 Sep 2022 11:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=lCAGnK1kDCXBFkNV/1zrCVbUY1432OK/jCC+gvVTzH0=;
        b=bNV4/zxxKsJX0M5jTO2fJdkvSfds7AFBZAcXW+ZFzS4klkDHs5onKIfxORV1IhSjdY
         iz7WVo5kkbUVSnBFlCZ6EdqLB5KZpWsu6Xyks2pXrErRbc2sOf3fnpht7IgcTS1yf0Xr
         ZcHfmMw5kLxuCAC/4yoTAZpHIm4lqsvjONwsJ5JmWsMJ9qRDqTQ6+I/YOf6U62s8qEWy
         iUXOLueaJtzuIzfwKICO8uQZzACm7n9R2Ee3lhnVvnkE61wkRFZfgoa04ZkKTuniLtuM
         NnI24t1vWm9t6r16Y42oG+4PZUI96kwKptTNYsnAkZ+HS0oiKL0MYprCMtMOyBGz2m70
         z6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=lCAGnK1kDCXBFkNV/1zrCVbUY1432OK/jCC+gvVTzH0=;
        b=ENskBHPGroEPZ6jM7nrl2FdKf1/vz6Hfuv/ysfd3YGn266Is/9jctpqkHNYWOYHlVJ
         iIt2bSPeYEBY9y2/GsJI5gwDcbvwIfrjAb9sXdV1cz/bEKeetMbWEE4kf6uqeX8bF+q8
         ItTMkVtLaffALwBAhBA0Gbux8UltAezmKHEKOuikr3zNdjBEXpJ0IYJi36G1hUsjXKxe
         BHvLKjtTd4tva5A8KMmvBk/sRdEjUDWzwUgfTNJRKxSuCrsKHHtNWu97faQBbEYLBca1
         holEfFvVwSvmac4Ij0NCBzDW4Ic8Akfn0b5RB3OmpEWoSZWxPZ+mo6lj5V2gV2WVOQPr
         7wdg==
X-Gm-Message-State: ACgBeo1sO7J8FvQ+TZKJ+Fb8zTp+2Mp684MA4n1eMSZcKyXzgYQABX8J
	Wawp3DSoLx2Tjz7Og0SQnwA=
X-Google-Smtp-Source: AA6agR4fkaeC2CPBfxL+OpE52/j5kVPD419IvXn5pByNQhdnvbaTdhLH+7HLtGml/Lgy58nNbLwDrA==
X-Received: by 2002:ac8:5acf:0:b0:344:8f3e:5f08 with SMTP id d15-20020ac85acf000000b003448f3e5f08mr24629950qtd.207.1662057231240;
        Thu, 01 Sep 2022 11:33:51 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id u20-20020ac87514000000b00342e86b3bdasm10563343qtq.12.2022.09.01.11.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 11:33:50 -0700 (PDT)
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
Subject: [PATCH v6 02/10] dt-bindings: timer: gpt: Add i.MXRT compatible Documentation
Date: Thu,  1 Sep 2022 14:33:35 -0400
Message-Id: <20220901183343.3188903-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
References: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
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
V5 -> V6:
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

