Return-Path: <SRS0=tSnG=VG=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2618C433FE
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 21:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B0EFC385AE; Thu, 28 Apr 2022 21:48:47 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04C69C385A9;
	Thu, 28 Apr 2022 21:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04C69C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id f14so4501234qtq.1;
        Thu, 28 Apr 2022 14:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=emhy1c4wokkALHU5zhTa1PBa9uxMNsXAmSHPjRucwAA=;
        b=D0+8ewP7DGpkqMUTQhOAmPXQl97EdeP5vP501RVMyfNnKrsvSFYTe3Q38CH0ke35ho
         5XzDmBoIupeynqp2zzbRteYC0y+gc+DEi6JpHNRhoXzOOd25VOWlBZQ+MsQhAlB64Zge
         /YEi4+7r+zSl8eISdPoWtAYCtOfaejAQeGEvFVZa3DDTSqL5DcGzTD2mPVeO7QAsqnya
         anjX1dhPhOaiGpf8Gfh8LAldatBnVFy46j4ZOET+dRdzwXT2qDeAe5gjtmzeSJJnQBMp
         R2lolCsMzu22b1hX0Y4F1/gD/eFMr2wHgGIJK9Rn6tLackK3kNJvmbxlLSAvbpp7zCVB
         /G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=emhy1c4wokkALHU5zhTa1PBa9uxMNsXAmSHPjRucwAA=;
        b=vTKZkvWBHd9ovKZ75beB3gg9c2tlNmGovAOuejOVatSmrcmR6kUkxEuPazA6HWWXnm
         nsR7MnVbwqR750aoohwz1p1Q6vbiKsDg8185Abqe768T+tJnuiDx4YmirsotqKDnQr+3
         6fQvJ3I5ICBfQTWmGiFO+X1R/Rm1+LsJ48Dx4SfaOVg4Tw9MZo5lVgbVQ8x6ThkB2OI4
         crlAkbMoKu3iL6KFLRURJExmZH8O3ergTcQ3euFLDZYavwJuUoRzWZMPGV8KAuGAspfv
         S7butHXsRzhZKUkWOl+XBq+p1JLUzEbTve30+qpnYduwhtO2KSuJVZfmrGBjCx2l9OVe
         jS9Q==
X-Gm-Message-State: AOAM532zLYWxqfiZ6dC2XDtPypP0BeS354cB+bXNIDT9QtpTSCkl7lFR
	jJDBj+HbLDAcOrSYty4xCYU=
X-Google-Smtp-Source: ABdhPJyILod4JLI+sqUQNfFlWiZsTjRBp9iaMkgiRQbFlJC9w9yqmrtnzeK8CWeGEXOb1NRx4dEoZw==
X-Received: by 2002:a05:622a:1981:b0:2f3:6390:c232 with SMTP id u1-20020a05622a198100b002f36390c232mr19125660qtc.677.1651182525992;
        Thu, 28 Apr 2022 14:48:45 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id bl5-20020a05620a1a8500b0069f51e47c5esm546442qkb.110.2022.04.28.14.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:48:45 -0700 (PDT)
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
Subject: [PATCH v2 03/15] dt-bindings: gpio: fsl-imx-gpio: Add i.MXRT compatibles
Date: Thu, 28 Apr 2022 17:48:26 -0400
Message-Id: <20220428214838.1040278-4-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the i.MXRT1170 and 1050 have the same gpio controller as
"fsl,imx35-gpio". Add i.MXRT to the compatible list.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - New commit to fix dtbs_check
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
2.35.1

