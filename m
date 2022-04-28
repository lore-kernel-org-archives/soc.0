Return-Path: <SRS0=tSnG=VG=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EECDC433FE
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 21:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66F4DC385B0; Thu, 28 Apr 2022 21:48:49 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A609CC385AD;
	Thu, 28 Apr 2022 21:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A609CC385AD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id p4so3938352qtq.12;
        Thu, 28 Apr 2022 14:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gNj5xhufjdWWURKKhVA8TS0GEfIhNVCDlFkshMGCDZs=;
        b=PmdBXHhh9D9paZpt7KH+MTZBO7FfplCu5gvDGPNBV6u7HWX8CzIvrCjJ93VdtX5n9J
         WsUM/O5ef5DTP+l5BhHXBy1D3wgqFm58aJ06ccv4Ha25JaSx4AuD/grlZDcqPIu1uK9z
         Q2rqz7CEBclY6jM62C2anI7sE4wxBbOz/8bSdeLin+NoBjNOzQgeyulCDhV2Gi3tMWBV
         ejEhuK1tCPUIuwuD8GSlQfoDcJ+390I6h2UgU6PXK/unK2TdoMmBn5TODzvwQXLcafHG
         nMlJmItkTa5eqFmDAWBnLX/ZCvO86dFKNDibMF/FAxeX1PJXjsAS4nm41WUgii7j8GKy
         AkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gNj5xhufjdWWURKKhVA8TS0GEfIhNVCDlFkshMGCDZs=;
        b=7LuVHDBH7nYihwpK1WecR7ADvfoMTPhkk0AvSu3y6jdkWKmflYOQKed25oYa6eWuGj
         Rmd3vOdgQwyYHKXTEvq96YAplrdrvt1oujD1jNJeXWYUAOBrOrYXuuxTLiyl4ldK8i0t
         I1CpzKMI7Yw9mWh5TMfvcvjVe+ouEkzXY/G4gD+TmAa4Bou3a8BbRdMqGgqQdc3KKv9C
         MeIHjFercixixUgXGbPfGusbYHM524PII4Jp3LxpXru1ot0a46h6kpfQnoB5aO7JB2H3
         9fW9RDzl9RR0Fee51lb+7Eor6EKt0o5EH1cbPwlJLvOmVgwp3FSKECKwmHuM7LvUUYLM
         M89A==
X-Gm-Message-State: AOAM533AM4i+ks0Sv1ZXdVp5wwGXuAGgwG4Iuc7QnS3GdghkXJfq16sy
	l9hPW+Y800ToQ8IY/ZpJhPI=
X-Google-Smtp-Source: ABdhPJx4ld17vXNAFmJUl03CBWUmXcU44oS6P0g+XzkKY75LbMpT0tHeCvt2sLgzHzttchLuvhNc2g==
X-Received: by 2002:a05:622a:cc:b0:2f1:fc74:c7a6 with SMTP id p12-20020a05622a00cc00b002f1fc74c7a6mr24783118qtw.387.1651182527660;
        Thu, 28 Apr 2022 14:48:47 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id bl5-20020a05620a1a8500b0069f51e47c5esm546442qkb.110.2022.04.28.14.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:48:47 -0700 (PDT)
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
Subject: [PATCH v2 04/15] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT1170 compatible
Date: Thu, 28 Apr 2022 17:48:27 -0400
Message-Id: <20220428214838.1040278-5-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i.MXRT1170 compatible string to Documentation.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - New commit to fix dtbs_check
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index 19621a2f8beb..b4d98a9c0952 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -34,6 +34,7 @@ properties:
           - fsl,imx6ull-usdhc
           - fsl,imx7d-usdhc
           - fsl,imx7ulp-usdhc
+          - fsl,imx1050-usdhc
           - nxp,s32g2-usdhc
       - items:
           - enum:
@@ -44,6 +45,11 @@ properties:
               - fsl,imx8qm-usdhc
               - fsl,imx8qxp-usdhc
           - const: fsl,imx7d-usdhc
+      - const: fsl,imxrt1050-usdhc
+      - items:
+          - enum:
+              - fsl,imxrt1170-usdhc
+          - const: fsl,imxrt1050-usdhc
 
   reg:
     maxItems: 1
-- 
2.35.1

