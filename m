Return-Path: <SRS0=/X4i=QM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9234C433EF
	for <soc@archiver.kernel.org>; Thu, 25 Nov 2021 21:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B85E1C9305E; Thu, 25 Nov 2021 21:38:54 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F34CC9305A;
	Thu, 25 Nov 2021 21:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1F34CC9305A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id d2so12915940qki.12;
        Thu, 25 Nov 2021 13:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CRiRkKzr1AeW/lMR7VbQ1x0Ahhyksx/jfiQOUrZiHcs=;
        b=qkaBA1VdJww7Bb6PRGpFUQah6QHBqMQrDToN91347S9MFKqRlnZqcRh1sU1xL+CtBO
         0rcUSgZy7m7eYKF82IFoEwthaYUmhcPMN9rD4mE/xcKJzKDQkre33p3sng703EZppJYK
         DHO8rPyplp+aLVwoFVRZqPpKyYVKxDr5IU7Vr2QbGEdOYW1R3hrK67cE1qcXdImBJJj0
         5gh/RoGqUqXyqxAX0zwHN5JgJ5zuCDv69ficfUtlxnv+2TWWF4L6tDf1kGmqviCV++ze
         WdJR89fk8sP3skxrYxCL95IAlF3HktnvTWDMRioJ6MBkXmOb9wh9nCA5mtKGK1l93RJg
         59/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CRiRkKzr1AeW/lMR7VbQ1x0Ahhyksx/jfiQOUrZiHcs=;
        b=QMGJKD4qP/msQ8blnB4+U6p/WeVDRwaOfayS3REjNb9v0wjBPhR23EzkuMwlY9TRwV
         QKzLUY1C5aVI2N6Vo4/9Phc0hnJQ89I1/ffnKvaIktw16yUaX778QU/md8PMFJKlHL1J
         oMyOxBM2DA9XP0gw1dK66EbSfxk9lvkUu2mC0GBJu33q9OyJTbbKCZUXFeKqMmZQAXCw
         3+ka7cmZTgW4C0Y69S8KuwWwKoyttihCPq9Fatqs/S/34+zqtRUotzR6UHTRFJM7GSRf
         0A1oj+jhv5KQQVazqWUC+9Jk3M9UEzfJpYmMVnj4P7GKRVZsARpQcQF7EZe/Jk3MEaji
         hn2w==
X-Gm-Message-State: AOAM532HMKFU0Cicgl1Qg+1gs5zHZRqFUCQVpYkCyKAk/JTdS9SQ2noe
	SvUp5ngq/UTbafs7CG4L3su7kqO5EhqaDg==
X-Google-Smtp-Source: ABdhPJz7pxrwTvbocRSYFRZ8ihiAIdmpmQfJTGwXf29/xyKqDKF3VHZY830ofxr4lDFdFeX5LVS8cA==
X-Received: by 2002:a05:620a:27d0:: with SMTP id i16mr18213069qkp.440.1637874900715;
        Thu, 25 Nov 2021 13:15:00 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j22sm2068175qko.68.2021.11.25.13.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:14:59 -0800 (PST)
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
Subject: [PATCH v3 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT compatible
Date: Thu, 25 Nov 2021 16:14:38 -0500
Message-Id: <20211125211443.1150135-9-Mr.Bossman075@gmail.com>
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

