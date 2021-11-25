Return-Path: <SRS0=/X4i=QM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D63C433F5
	for <soc@archiver.kernel.org>; Thu, 25 Nov 2021 21:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44557C93059; Thu, 25 Nov 2021 21:20:53 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD254C9304D;
	Thu, 25 Nov 2021 21:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD254C9304D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id t6so12962226qkg.1;
        Thu, 25 Nov 2021 13:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=loKGtqwC+Nu4d8PRLPlowPaDjaBxyF6vxvNrHOfxfpU=;
        b=aEUYIbe8VTlSlxsD08awhC4tUNC84Hf1o0Elc9WzwBoGOZjuLGYF1pFmo+ZAx+5j7a
         zlkfMjcSo9Us9jBM8yjkStVASlJ4jSB7Yd3Gx5cIwg8otGRJyKR9TJvn8HEV4JLG9ssm
         g+dbJUtePguoTH4Wajt1sXxNVQYDFWVtRi+BB59OLpAFR9IBI04xdTWxE/PHbEQISZ1z
         y8RDRgT1EV5+AbYYuM8bbzlc3iM810cU1Sgx1yClUv2msdeYVvnqqT4GOZ/M5T6muyEm
         Eb1xTCfv7mIjPVAnhDrzK4PemiVthV0UQOwVSyOVHkPhdH+K8fwKBNdhXDV/eZzZpto+
         DSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=loKGtqwC+Nu4d8PRLPlowPaDjaBxyF6vxvNrHOfxfpU=;
        b=ZkJysdeg7CvLlx6m5brd+3FQr25bkDbhwyUG/8bkXjKNnToOh6a79lgH40qrg+3Kok
         hWOWAOOfJ7UuiDiaootPpnZIA4flXBj6Vwx4zXLOimjqAn5Ygl1ZiMgNMtosryblBq1i
         O8+vGVKxyMCn2BcUQc/2W/X4JiDB2rtARjw1NruoRPKXP9LXJx1pP0VRMxy9YN9FMfla
         AgOb41eUrgbN7GGaMJRFRmC1iV7mFvYRlQPxKuRvISLwa4B5rv8m9Pk4a3vkdxu2M3rV
         LZMH2WR4uA0aYqoupRLAXaQTVSkXTzLLQS5BfUGr6iiNawPVJKa0DVulO8LVNwMkkxqf
         +Fiw==
X-Gm-Message-State: AOAM531UCJ4YZQpcNc8mscG4kRqDApjmOW4NRTzRlIws51273bxP2X3A
	VNaNW8PQZD6vUPfrZSjkK5sjLVB6/sOFPw==
X-Google-Smtp-Source: ABdhPJwN1wto/UYyazZajqsPSZ8uJ7gwlGC0IU1ufSoDNhIXP6rIVFBlJmb7pG3QqXtxU3SoXq4eaA==
X-Received: by 2002:a37:9dd3:: with SMTP id g202mr10038212qke.774.1637874904976;
        Thu, 25 Nov 2021 13:15:04 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j22sm2068175qko.68.2021.11.25.13.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:15:03 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	ulf.hansson@linaro.org,
	aisheng.dong@nxp.com,
	stefan@agner.ch,
	linus.walleij@linaro.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux@armlinux.org.uk,
	abel.vesa@nxp.com,
	adrian.hunter@intel.com,
	jirislaby@kernel.org,
	giulio.benetti@benettiengineering.com,
	nobuhiro1.iwamatsu@toshiba.co.jp,
	Mr.Bossman075@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Jesse Taube <mr.bossman075@gmail.com>
Subject: [PATCH v3 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT compatible string
Date: Thu, 25 Nov 2021 16:14:40 -0500
Message-Id: <20211125211443.1150135-11-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add i.MXRT documentation for compatible string.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Nothing done
V2->V3:
* Rename imxrt to imxrt1050
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index d5be9863009c..3fd6deff07f2 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -34,6 +34,7 @@ properties:
           - fsl,imx6ull-usdhc
           - fsl,imx7d-usdhc
           - fsl,imx7ulp-usdhc
+          - fsl,imxrt1050-usdhc
           - nxp,s32g2-usdhc
       - items:
           - enum:
-- 
2.34.0

