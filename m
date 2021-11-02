Return-Path: <SRS0=V3zi=PV=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C63C4332F
	for <soc@archiver.kernel.org>; Tue,  2 Nov 2021 22:57:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E7581610C8; Tue,  2 Nov 2021 22:57:17 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F0CE601FC;
	Tue,  2 Nov 2021 22:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F0CE601FC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id d6so617975qvb.3;
        Tue, 02 Nov 2021 15:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tp9jx2w5xmRhSaPrYSvUOoWJLgBK25gjF2mKOgOPi54=;
        b=DC9F86JFyMzvhwAJ8oMM2sDIypcHHp9DbVM5si3RX95RM2moTu0uoFSA0baLffKlqq
         eUizVFCdDZ0RTc436CrtFVQ5/2AcU0xumBwy0bRnCluOZnWRHKLoGdua2apkW7ylIab9
         YmBNPNA6yjyKhrev1P5DRag4pBTChfRW14lpr1sZH+d5afAvfgGcd3ZtGD9vwdXHvt/J
         MKyHtDc/eYXUHUWQUAc01YBfpGHcu/JQgzghi7FFYdBlGUycnN1njQy5Gh1C1Y5hpcii
         /rWr3Ys0GYy96YRn34J6WUNWMhKYkcUa7mIrFdB4HvE+Tq945tO5E6ohmPgP1XLn+SRq
         kfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tp9jx2w5xmRhSaPrYSvUOoWJLgBK25gjF2mKOgOPi54=;
        b=zYaE9sVEJZcjV3nyvf0zqAT+52Q8SbEQuGg6NlRm57lI/jgs6GE2f9VfEw5tAnDPCp
         GUTFGYjoywip7vJpMM1V0pLRwQxf9fCykJf7Azw5e3kqSr1qcMECyws94M4xy9cRkraH
         IC12zvDI+pF8btfiCujtxdNCSVBpUjjzZ4aOFYNlDZkW3YA8KAGTw21YGsA8FRog7gEC
         svWRgCPJkZSUoEyWeNLqCOYT5CuxPDxS1Wh3Vu76duAAgcn08CgsToYmn8nTut64mrHQ
         PYhT8gnbxGrR9XhB+KJSbB+ZvrSZtVzbHDapDx37nQ6McHDl9e9wVgeWxMbYxEgWZqGJ
         HJoQ==
X-Gm-Message-State: AOAM532JtFc28Fyfv4gfn9qsoq23AuWFOvjckciLAMdNU3Mf4Uk7bCfi
	ZiOdlL2QLwXcfKI9fZnP+jc=
X-Google-Smtp-Source: ABdhPJyzSRLpFUewjxKCJfvWBNc5NBKG2onhv262G8514DtfjfAc9GL1weix3lF+BV3Rd2zvlanphw==
X-Received: by 2002:a05:622a:d5:: with SMTP id p21mr26153541qtw.44.1635893836763;
        Tue, 02 Nov 2021 15:57:16 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 15:57:16 -0700 (PDT)
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
Subject: [PATCH v2 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT compatible
Date: Tue,  2 Nov 2021 18:56:56 -0400
Message-Id: <20211102225701.98944-9-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add i.MXRT documentation for compatible string.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
V1->V2:
* Add ack by Rob
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index a90c971b4f1f..4b4340def2aa 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -21,6 +21,7 @@ properties:
           - fsl,ls1028a-lpuart
           - fsl,imx7ulp-lpuart
           - fsl,imx8qm-lpuart
+          - fsl,imxrt-lpuart
       - items:
           - const: fsl,imx8qxp-lpuart
           - const: fsl,imx7ulp-lpuart
-- 
2.33.1

