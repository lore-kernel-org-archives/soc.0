Return-Path: <SRS0=T1wL=X4=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01080C43334
	for <soc@archiver.kernel.org>; Sat, 23 Jul 2022 16:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DEAFBC341D0; Sat, 23 Jul 2022 16:05:20 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23B64C341C0;
	Sat, 23 Jul 2022 16:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 23B64C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id f14so5706048qkm.0;
        Sat, 23 Jul 2022 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/eLH0yog0Bw3hBDbRM0s90v+9InNOx9Xe/vOmOIYLbo=;
        b=QsvevnAfSaOAESS2pqob5ExJCfuhq8ERdGh1JIbzftti/uF5xgwFd66/BtJ5xKA8iG
         wM1lzri4ASIdyvHxC0+N0QRJJoGzq+OcGZbgOCimn0ynAzTeDHEQ0uYbdnAfbGZBFFHh
         chy8nISvhn+kINVzn4Yb62GTQnu+JqjCIKpGg0sObm2DCOdMAjg6PFJbpK/FVDTpPl5E
         7veMxkmRV6P4p/GLwhyzC0lF84u2EcRWs57zCKFtpCFsX6TxtyteI64WwcFlQmM3av2J
         iut/TJjomjkiwVdqDi10AkpNBgAgsO5iQjfD5eQO34/qx9OZFZrkOE/HplVVkRivfVOv
         nAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/eLH0yog0Bw3hBDbRM0s90v+9InNOx9Xe/vOmOIYLbo=;
        b=O/mhxQJFaF580abzqK0PRJVjI99BxJxFQje2ouytYCznodwL7qT9gxuevP4XhubCaf
         E/Vwq9u+Yf3AoTF1uAVD88WqFxLsKKhWJJCareM7Zf1t2zbS2MZyu5RwFK33tPI9Y/ka
         LJX08kSWa05olOIdSWjg9HGCfBzy4uyA8oENoeKdfuKOwpRw/cX+kIvM9N+S3RTsJO0Y
         I43AKOGT88WzQAJ0qRdiCRWTKX6RNmebrmrmRmli4233xpluY2ISzetoH0rSSmb5oUam
         7826fPjmATqUZcOqnUqFmuAIz62mQBR9ZKJgs7bLwnFzBCyg9kN+mBSQ1umswHIFJxu2
         taoA==
X-Gm-Message-State: AJIora+JmcjZnKTebMkJkSivb+W4k9VxTaDuv1BPVe7FL04AQ9X8hmj7
	p1zMJHDbuERQRteef7ISfRs=
X-Google-Smtp-Source: AGRyM1ugzQFqbvUOtNQn2VtC93LwY/YIDuaLe/OWEY2+qiBkxiz65vTaYQXWhERPI4O+ETyOey2WJw==
X-Received: by 2002:a37:8a44:0:b0:6b5:f371:a183 with SMTP id m65-20020a378a44000000b006b5f371a183mr3853203qkd.492.1658592318886;
        Sat, 23 Jul 2022 09:05:18 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id g4-20020ac87f44000000b0031eb3af3ffesm4935046qtk.52.2022.07.23.09.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 09:05:18 -0700 (PDT)
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
Subject: [PATCH v5 01/12] dt-bindings: arm: imx: Add i.MXRT compatible Documentation
Date: Sat, 23 Jul 2022 12:05:02 -0400
Message-Id: <20220723160513.271692-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
References: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently the imxrt1050 was added but the cpu compatible node wasn't
added. Add both i.MXRT1170 and 1050 compatibles to fsl.yaml.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
V1 -> V2:
 - Swap order of soc's
V2 -> V3:
 - Nothing done
V3 -> V4:
 - Nothing done
V4 -> V5:
 - Nothing done
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index ef524378d449..875f136010ae 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1020,6 +1020,18 @@ properties:
               - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
           - const: fsl,imx8ulp
 
+      - description: i.MXRT1050 based Boards
+        items:
+          - enum:
+              - fsl,imxrt1050-evk         # i.MXRT1050 EVK Board
+          - const: fsl,imxrt1050
+
+      - description: i.MXRT1170 based Boards
+        items:
+          - enum:
+              - fsl,imxrt1170-evk         # i.MXRT1170 EVK Board
+          - const: fsl,imxrt1170
+
       - description:
           Freescale Vybrid Platform Device Tree Bindings
 
-- 
2.36.1

