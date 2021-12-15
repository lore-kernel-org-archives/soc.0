Return-Path: <SRS0=KNgb=RA=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9276CC43219
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 22:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DA4AC36AE4; Wed, 15 Dec 2021 22:05:53 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2D22C36AE9;
	Wed, 15 Dec 2021 22:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2D22C36AE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id p4so21544159qkm.7;
        Wed, 15 Dec 2021 14:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uZXcXH3L1t8Ypj76VyGOg3cu76ENgNQ926hUe44X4rE=;
        b=jbwaghfmwhvJZaalL3dMgv0OxzIpgcprLqPnKQombDpfLlgkJ6m0jV/4sZuZhS1lk1
         u/utp0zAx7SDBRwBMmk5+EHPtfFo0tQ6QwAVyB92Jl6KngdET1fVFGAUMzsG65vUSx7y
         0wj7V8BfwnnE3H6J365vCmTI9t4ot/Qkw86QH6G9t61dAaSLmZR0K1xG20D3k7Qdi8My
         A+cWw8vSHV0MjS1/nGVer9yY11qFMd2aEKpenlCM71aYQooix+sQX/bK4rmQhoIiIDSo
         NNOxyyxe3RYTZ1KlCuEYWo/8UxAkC5Y0eX6btTloPfgDNe1m9h13cYw44Y1CwcGoZKBt
         NW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uZXcXH3L1t8Ypj76VyGOg3cu76ENgNQ926hUe44X4rE=;
        b=gdMzBWvnOby7veNGqH4zhDbdq6jij+jsFr9+OJktfApsUs10W9ioz+3rI8K6g4AUuJ
         18dTKYj9uwtj2cAyNJEIjoea2AMf3w+V4om4FZ8r/cYdRQ77L6SKRr5XZlvLQbRopG4x
         cfDFRx1esXzjGz/jmlgh17HyzWVFQCjIdjHjx3DVPXNPO1/eNpPBwTXgVMD3EL5YBfDR
         qsy7+IUVeO58LCCI/or049IO6IJDtMDLRoRuCaANizRoUOibSvPaBORxkLbTMPheg2M0
         AT6xZxMRhsXZb5x2QsFEFrj0gsAS/nc9ysAeVErhGwli4U0fk6cIjORFTvZO2RXWYGM6
         0DNw==
X-Gm-Message-State: AOAM531sKrV8rxA/qhIwkNOFdG8jE/Th+PlnMMVMjZoEINn3AO3tLH5n
	OAfrhKVRkOmW7oLbjYwVlXM=
X-Google-Smtp-Source: ABdhPJyBLieCF65zaagWkywbISEzmE4MuaG2BxRWuOkkXAY43ofgv3z/FQplYjGKDPbQKtsLx/SeiQ==
X-Received: by 2002:a05:620a:ce5:: with SMTP id c5mr10185462qkj.285.1639605951999;
        Wed, 15 Dec 2021 14:05:51 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id s20sm2471592qtc.75.2021.12.15.14.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:05:51 -0800 (PST)
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
Subject: [PATCH v5 6/9] dt-bindings: serial: fsl-lpuart: add i.MXRT1050 compatible
Date: Wed, 15 Dec 2021 17:05:35 -0500
Message-Id: <20211215220538.4180616-7-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
References: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add i.MXRT1050 documentation for compatible string.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Nothing done
V2->V3:
* Rename imxrt to imxrt1050
V3->V4:
* Nothing done
V4->V5:
* Change commit description to just 1050
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index e7ac63dd1469..5b066afda24b 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -21,6 +21,7 @@ properties:
           - fsl,ls1028a-lpuart
           - fsl,imx7ulp-lpuart
           - fsl,imx8qm-lpuart
+          - fsl,imxrt1050-lpuart
       - items:
           - enum:
               - fsl,imx8qxp-lpuart
-- 
2.34.1

