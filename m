Return-Path: <SRS0=T1wL=X4=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A75CCA48A
	for <soc@archiver.kernel.org>; Sat, 23 Jul 2022 16:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA1AFC385A5; Sat, 23 Jul 2022 16:05:28 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED521C341C0;
	Sat, 23 Jul 2022 16:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED521C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id m16so5651997qka.12;
        Sat, 23 Jul 2022 09:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vb7PoP3wBNM540eacheWW6lTPUsGBqPMe5PmxeEAKk4=;
        b=G9wHiFkZ8w7viyzJpNzyGDqkqehHhUb87LFsyF4SsM+ETuRcXUg1BdlVbyYy8AwP2i
         kV1e0mOjbJ0EmW0hMjF7Sdi8ABrpKw49G1dK+YWXVyD98uIqsGbjBULOvF1MCqYfiR/d
         QJtnwCehNfSAWNqZv/VNdBEMMT/XKrOEOc2wAAsl05/VYv6OxJLYAcsG+VgTIUWYmZ5/
         6dljd3oWf+xjzFl80xaG3x9Sqh/gRvsE4hiX1SgVIorVWYjHUjkt/OTyyCLNbzJCADqI
         CY4GM7wdpnjS3h7dskRSHr2Pf/UpeHXo88XpdVclp25wL6qKKH9spEfOFtNMmR5z/u0p
         iTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vb7PoP3wBNM540eacheWW6lTPUsGBqPMe5PmxeEAKk4=;
        b=EsZlCuK/EclnCS7DzJeBi+Sb5NEDxFNX0hlb0bomIA9kf1e846W9LVGYeQwZDvYo63
         GuOAxMUM0OoWTuYA8e0/n2Qd5NSWDACts04U6ATE+7qnzFq8oFnGX3kQ/nq19OTbDa1C
         A1cZ0vwaIh7OKbYaZgZTe/Yqy44ekfJinzH02vfm5hO0Vq7gqdC65AieOTd20l9jSIJJ
         ybiH7evYfCYyPEFqEDq+2p9k6NvwEjA/7+4+bc7MKmQPjqI/g6ixGOKblgt+86AADwJJ
         CeuituOE5ZooxCl3zxgVEzh2sUiikPQntXTMbTrpR7nFlnUhKrimVDeKdr640gIoC5y6
         6Bxw==
X-Gm-Message-State: AJIora9aOc2pjE661PNWoLyI9Zd/y64t9SzD12GqiCnnmJEbu1ImAedl
	IEx7tg3RmuOpDO8tyYnXTno=
X-Google-Smtp-Source: AGRyM1s+XDWHp+nDbgOQKt5C4VcWRUXh3Npwnty6jfcEfY4Pu8pvrT/dEg+WdvKgBsMg8Y1b3A7zAg==
X-Received: by 2002:a05:620a:27cf:b0:6b5:473d:44eb with SMTP id i15-20020a05620a27cf00b006b5473d44ebmr3739764qkp.282.1658592326865;
        Sat, 23 Jul 2022 09:05:26 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id g4-20020ac87f44000000b0031eb3af3ffesm4935046qtk.52.2022.07.23.09.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 09:05:26 -0700 (PDT)
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
Subject: [PATCH v5 05/12] dt-bindings: serial: fsl-lpuart: add i.MXRT1170 compatible
Date: Sat, 23 Jul 2022 12:05:06 -0400
Message-Id: <20220723160513.271692-6-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
References: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
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

