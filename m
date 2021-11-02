Return-Path: <SRS0=V3zi=PV=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EA7C19777
	for <soc@archiver.kernel.org>; Tue,  2 Nov 2021 22:57:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 209E661073; Tue,  2 Nov 2021 22:57:21 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD59E60041;
	Tue,  2 Nov 2021 22:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD59E60041
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id d6so618159qvb.3;
        Tue, 02 Nov 2021 15:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IL3OGRIIMFUvv6ERH/SkSwRuJ7jwKuspNRDZqrtOGDc=;
        b=DyZ94o0+FQapY+J2rZGkoXsLLRkGrxuOD1iAX7zCkinTqnJQtKhnlPzPST9jAIF53r
         t4hR9tfTJuOst3R2jZuV3ik2uN5iG5H+gwTo8EgR5Jh0TO1tuFcSlyvxe+ggPYTXl84l
         cV6GMTfbNyoYZrdG36nx7Bjkb6JM8d75JrX72XaQbEtBofIEGV7QNsuxN/SR1hfGBNLy
         5HAJ+09LherHqBSp/nnbD0aVPMYgEGzCoqcK2aaTDkNzMVwF/oLYDtTqT5htLnQLZ7wf
         E5aXGmyiXnQFxlHhAhJ33A3Pgit7HcLH6bJGNDWRDm246WuBYCRrzUeZflEwwRln44ZL
         NtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IL3OGRIIMFUvv6ERH/SkSwRuJ7jwKuspNRDZqrtOGDc=;
        b=uiUASayimeodBLlmJZ0tj+Po70eTMOAQHaoUQfS6i5GNs0uc3Vs8uRGl8Ww5uQM/qi
         nEQWPpO1YI3rbJ5nZfgl9qFIpzX/tW0ZglVyScscn631v4bTpdzt2UbsJNpTVORQSUDb
         nrrQK5lRFbtbDoAtd/G47Ou3wOLt1O1DM1wasjHZ7XDHzDAlKqFfkgW/EHmdu467KFe7
         UjHLGE1WM0/ckVBXx0RhOXhtQ3HzYiqDPD7EAFcjl0mGjQlEqsgNQrR40kT1Y4rqo3Ov
         55uAq/R8YcSQm7zQsmUHgKA3zqiDwQRujE0OsoJdmJUjVSdSdlvvNU/jacIC0OzYroJt
         nzUA==
X-Gm-Message-State: AOAM5338RDirrmXd8R99uREXvuwABOrpgdf5B+vnum1QjK0Ww0yk3ycV
	gpXUDoer4f0/5j5wA8LIS5dIWSab0OqgtXj3
X-Google-Smtp-Source: ABdhPJzvncT8jsqO17WmjFqU6dV6qTNP9fA3RJ7MZ0N0WVKoE7yR2jImRsI9mqAM64mBQA1Ci/knDA==
X-Received: by 2002:a05:622a:84:: with SMTP id o4mr32151612qtw.41.1635893840049;
        Tue, 02 Nov 2021 15:57:20 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 15:57:19 -0700 (PDT)
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
Subject: [PATCH v2 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT compatible string
Date: Tue,  2 Nov 2021 18:56:58 -0400
Message-Id: <20211102225701.98944-11-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add i.MXRT documentation for compatible string.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Nothing done
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index 19621a2f8beb..bbb600f0e105 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -34,6 +34,7 @@ properties:
           - fsl,imx6ull-usdhc
           - fsl,imx7d-usdhc
           - fsl,imx7ulp-usdhc
+          - fsl,imxrt-usdhc
           - nxp,s32g2-usdhc
       - items:
           - enum:
-- 
2.33.1

