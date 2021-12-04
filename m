Return-Path: <SRS0=WPFH=QV=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CF9C4332F
	for <soc@archiver.kernel.org>; Sat,  4 Dec 2021 06:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69FD1C341C0; Sat,  4 Dec 2021 06:10:58 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10710C341C5;
	Sat,  4 Dec 2021 06:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10710C341C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id j9so4896924qvm.10;
        Fri, 03 Dec 2021 22:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OlA3SRDh8Lj1S0TYSsQxoHgqVKUSBF5/ViXVM/bBDp8=;
        b=TtesSlYKU/KqnKBFS25VdgJXKqndSIcuzO2weuxUGi0rzjR9bOoviObo/pprjwI25n
         689/bFh0gZnuhyEmoX1yyIxCxnoyUIG3dHJFyY3BZnyRyhoCQK5vuKwyc8V83GoAUJQX
         y2X8zeGagVyw3x0MpPqSc5FBNOdLX/Q0HN8mKuSpw1cOODdMQyV6cvmfGZUHH8b3Pl5E
         UVTvUUrwmmTVtjVlzQUOJ4DpsLgB4qZbluGY6vltZRNH7u/HiILUt6TXlJkSJcbnNAuj
         OnqfYGs83E77E0cuBsn0YfeUANQlLLGf7YyUUIYSXxUi2khSJdKYzhuzMS0faxfJh+ls
         6ggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OlA3SRDh8Lj1S0TYSsQxoHgqVKUSBF5/ViXVM/bBDp8=;
        b=CxWN13pJYk8CRBVZ6/w09aJyXaAf04/YbPH20HvJ/FcN3fRyESnL34Y4P1MB9nOL+D
         sHKZIGmgFJ7fOyPpJXEFNAux5DolJaOL7GOEBBbACmjXIu8LgOA3fEJdftbkLSGOvmXt
         kGTtkn3+7xLOIYX49G45UR8p67biLiGUrAXQ8WW8GewjIr+QJwBQdv+4pH70eygG9xiU
         6QMfWLcXaAXt6/DeNeJx7jfYCUIjjPQDbx6s1rDmUaYSMOlOJLFq/5eGPevghC7txp/s
         dFipibJR8IilpgwjYZjlk2F55dk5eCAVzPDzUuQ8aDicvvsTS2lhBSjoD9vm5eGKUIjy
         90Ng==
X-Gm-Message-State: AOAM531DvyykjG7BFXQ2aYtrTjsRXI+3cG+5ampwOFSnKIK44L+PVA0R
	8JuaS5LRd1CXSOk+RzGRY4g=
X-Google-Smtp-Source: ABdhPJxJndG4d+9CcgqNpYBw+OJgcqd7kTs5AL/U/yr5dldZ7HGLihzkWCEfLBXqolgcVLNyGbdnpA==
X-Received: by 2002:a05:6214:1c0b:: with SMTP id u11mr23581628qvc.2.1638598257088;
        Fri, 03 Dec 2021 22:10:57 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id l1sm3500913qkp.125.2021.12.03.22.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 22:10:56 -0800 (PST)
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
Subject: [PATCH v4 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT compatible
Date: Sat,  4 Dec 2021 01:10:37 -0500
Message-Id: <20211204061042.1248028-9-Mr.Bossman075@gmail.com>
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
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index a90c971b4f1f..c37085804c5c 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -21,6 +21,7 @@ properties:
           - fsl,ls1028a-lpuart
           - fsl,imx7ulp-lpuart
           - fsl,imx8qm-lpuart
+          - fsl,imxrt1050-lpuart
       - items:
           - const: fsl,imx8qxp-lpuart
           - const: fsl,imx7ulp-lpuart
-- 
2.34.0

