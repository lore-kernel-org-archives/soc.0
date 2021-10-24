Return-Path: <SRS0=jRGM=PM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDD3C433FE
	for <soc@archiver.kernel.org>; Sun, 24 Oct 2021 15:40:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 92E686101E; Sun, 24 Oct 2021 15:40:51 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D0D60EBC;
	Sun, 24 Oct 2021 15:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60D0D60EBC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id r17so8119195qtx.10;
        Sun, 24 Oct 2021 08:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qcrI4wP6nWNeQuDo4rvfqoTQ/bG/63LjB2/3WWBKi4U=;
        b=N1KF1dRokm5UGVDxerlKDpwcITBd+JjD7mIyWVReQVnVXTQC6JdDm5o6Wsr0vCwXbs
         uz686H4V7mzmgPvPteXIhiVnpJdDDmbZtMd3WIbRkKPjD6Oc2E0I0kAEzqHGugKtoF9i
         qvNwEDckoLv48aR5V58OylhIkEIrPyRqVBJtPNbnvbwBtEY5u8NPpl1vUusrosMdfeHV
         X9ke1Oin8AcUItmLEbdZjZl8RgrXqNU/d/eB+oJXRDMsS2g3Zjz2OIHwd2MpBj7DNaK9
         SBqMWWFr2w9aIQk5ZYToS8O8zyApVYp+IH+dhx51/S/EaEVFDKJ3cziz+eh9lpTfGSao
         c32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qcrI4wP6nWNeQuDo4rvfqoTQ/bG/63LjB2/3WWBKi4U=;
        b=ajp9oyJyy+XIV6kEiSn9oH2q4ZthVDxVWcWv2UM3GrfJYP4N/yG8qzkJkSUTkma9pc
         A0ZTi38/F3WxlCz0w8if+dd50CRWi0ASLDx3wofGeiso5lhEdV0eWBCtCJsWxMgVgGjG
         6dzcEuHgxcLyTH8ztN/YpTf116wG2IRA2xrqR3DG8vWPn8atjSPNQxRZ7g4DMWe0z30d
         D2V8FBu++zezrDf1u5oX/1aJMVn9hBEM37/cUhRL21CaKiHfXxhySiZLZev7NnkvKsTX
         6zO5hH+QMhZlzrDET7q87NkJWg004P16lPzLuwHUD1dy+TpXFnz8K/SIQ/s2BXVlxWM8
         Eppw==
X-Gm-Message-State: AOAM5338RBbF203TN1i6NMyiaPow4dUY97kKxf8nr2bwmmbxWyO2Ax2I
	OcfzeY9k63laS+j4TSKj1eA=
X-Google-Smtp-Source: ABdhPJwHfYoV/7vYQousF4pHNtL/Od1EtRnn48ZFUZoXV6WokybqH8vfSKuOmPZ3wDakFAVwaooIaA==
X-Received: by 2002:a05:622a:244:: with SMTP id c4mr12491114qtx.186.1635090050570;
        Sun, 24 Oct 2021 08:40:50 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:40:50 -0700 (PDT)
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
	leonard.crestez@nxp.com,
	b20788@freescale.com,
	Mr.Bossman075@gmail.com,
	fugang.duan@nxp.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT compatible
Date: Sun, 24 Oct 2021 11:40:22 -0400
Message-Id: <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i.MXRT documentation for compatible string.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
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
2.33.0

