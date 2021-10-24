Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD42C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:46:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A72060F12
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A72060F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Tst/m7B3vvFHz6ASMu8n2nzgbh9kH56PvGsuB0FgTA=; b=Pc5/ZBlcGVuV57
	IiT829/UeR08OFu1FlFuIcvDohFDFB+55SIbNPr9IF4FDOElue5+WN9jMUXNIFzl1auqRu8V6e/40
	a7RTmTMCmDOcwW9O8A8G3V00Bzu3Z3jbrJLL8nFTGUbFbkICgZ2Fmd8YmP7H4cwmB8c6ZsbaXvKIQ
	/YVg4Rt3LsVvs7s0W/OOy27diqZibWFtF8DZnN1j0AVaDAkHy4wKCzwT08EgtQRALpIEqHax9XH6+
	A9bUX3QkttCOVnWe0Qs4ng/Le6C/SMMLqy1/XGBiWPaqNSvLP2zSk2HERcQ9uq/FUyGf32nlecm3B
	+K+vv1l/WtRSr47XFAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meffV-00EE2z-Gm; Sun, 24 Oct 2021 15:44:18 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mefcB-00ECVx-Ko
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 15:40:54 +0000
Received: by mail-qt1-x831.google.com with SMTP id y11so8119655qtn.13
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 08:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
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
 b=qiqYh5HWGb8uie3UdDyfiVrn2Mxni99Lex6/koa98amk/EvkxD3HSsx24HAy7du7cs
 vVYXmWOQ7bLrxHsQkr6XUBFwRhNQNBp6S0JBJFHeAG8/ppsv3179mEZMQGkzY5ri9ro0
 ftHpKtN+CWnrjqoCYzF14cFPd80JUACOphECPeWbSYqPWHruzY1WSUOfLZE1YH3IgmLM
 nvxTekg3jMn8cdefSOemmqSx48FLcrCpuAJu6ZCznPqI5x3IT26IuJV42YbJz60BSU1i
 4LB+bvWnPBlNaAzz1VTUWnediJSgP9amC0pF+N1heUoXQfcoouRVuFF+WKbHnHmb1JgI
 3ywQ==
X-Gm-Message-State: AOAM530a/hLJ5mnvUOVpzMelIIGfaxQWSRLqT1i89eDMGLeOlIjI4FQO
 /h4YtPRWWMcMeTPJekJmWaI=
X-Google-Smtp-Source: ABdhPJwHfYoV/7vYQousF4pHNtL/Od1EtRnn48ZFUZoXV6WokybqH8vfSKuOmPZ3wDakFAVwaooIaA==
X-Received: by 2002:a05:622a:244:: with SMTP id
 c4mr12491114qtx.186.1635090050570; 
 Sun, 24 Oct 2021 08:40:50 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 08:40:50 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org,
 giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 leonard.crestez@nxp.com, b20788@freescale.com, Mr.Bossman075@gmail.com,
 fugang.duan@nxp.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT compatible
Date: Sun, 24 Oct 2021 11:40:22 -0400
Message-ID: <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_084051_747211_6BBD4B8B 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211024154022.z6Xa-2NvRfEtVuy0fFXRmkHgIS1eEgjcSlhgezx64lY@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
