Return-Path: <SRS0=WPFH=QV=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A303C433EF
	for <soc@archiver.kernel.org>; Sat,  4 Dec 2021 06:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4430CC341C9; Sat,  4 Dec 2021 06:11:01 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2EC4C341C3;
	Sat,  4 Dec 2021 06:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2EC4C341C3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id q64so5841113qkd.5;
        Fri, 03 Dec 2021 22:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RFI6Hwm2cozY9KFaKPS+db9qh1JW0JzTLHG991yW9HU=;
        b=V5OvZw01aDhPy1jgV9zz53pKIqUCsjS+d6hEXLI/ENaqvVY1BUFrlnSIAySJDTqWrs
         WkTJJ9ptXPaZ/ULjTU7PoCrav7gWzQPBiD48YKaIT1aCHaO2/Dn6bmWL9ZqNB7jJASnX
         1LLN4qoFNSQEiYqNh7eFWDoBM3YQ7P2JDR21s3FMQ3ecu6rPePa2Qd8mrlWhn79Fz9Rg
         994QMLdkunNviLRdnJ4CcJ7Wkwja0VxO1KppZIfvyVccmfTeCBKIDYMPUiwYZC5eDAvC
         kONul944oVl+Mq23z2HWie78MId+gv32ueQBAIM2R0x33ayLqWQyvRPATbBTam/HTauD
         fK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RFI6Hwm2cozY9KFaKPS+db9qh1JW0JzTLHG991yW9HU=;
        b=Egj+2dd+ZygcaE1KXKTXXkdh/0c5mU9m+2UyX8sAlDtT7NZZPYq11N8zKy5etdPBs9
         AstNJoFFuhn2HKd3Ek0C8SlmQVXCLBXJ8myfeLe1Q4INBHnRDC1E9Qu8TKFnE3tioB1t
         i20Jbybb0JfIarGbipuolyw2P2ix5CM18FMexoYIbxDhScQOd1+oT6Cl0t0xtwHxLOJi
         25N914aMzWyZLezaWE0gLB0Pjz9CsDZmwjGWZt92+mQ/YGMJx5ESV4Q9rBMZd67TWXe2
         8FED0fwJwQH7diXSqhvcBgRDxXS1p8N1+JD4L8GAIoawr/wZJtIS2cEj7McOTrzsm7tw
         MWLg==
X-Gm-Message-State: AOAM530SZstO5KGYYCcSA0pua0aR3TSBDuzI9BA2yCHsSVRo3yrJuqfE
	a7VNIokAqI4VKcMR/0v+fu7DG3/QISq3/w==
X-Google-Smtp-Source: ABdhPJzJHYPgvoPkYu9fKpWodxkkzl7c4qjcH+7Y1XMpysETBsdh8oqWhPRMbd9uWE35BXXdZKmvYg==
X-Received: by 2002:a05:620a:2886:: with SMTP id j6mr21563682qkp.316.1638598259809;
        Fri, 03 Dec 2021 22:10:59 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id l1sm3500913qkp.125.2021.12.03.22.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 22:10:59 -0800 (PST)
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
	Jesse Taube <mr.bossman075@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT compatible string
Date: Sat,  4 Dec 2021 01:10:39 -0500
Message-Id: <20211204061042.1248028-11-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211204061042.1248028-1-Mr.Bossman075@gmail.com>
References: <20211204061042.1248028-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add i.MXRT documentation for compatible string.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
V1->V2:
* Nothing done
V2->V3:
* Rename imxrt to imxrt1050
V3->V4:
* Nothing done
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index 19621a2f8beb..0912055b4089 100644
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

