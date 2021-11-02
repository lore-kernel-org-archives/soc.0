Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB40C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:01:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9280461058
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9280461058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYWD9x5/Wjk9wNq/eap92fW5GKmVy23X7Gy5Ozty4EQ=; b=R61hZg9gKBMEok
	O3KrWZ/Ose6ATODsR4ee+8+iHIrXoM1d0YHHzbuDziwh+6t5/4MrZM0YHuHWb6Zpn8SAL+70s8Jr/
	hlEIQ6dLFrBDrLTFF+ZItSVaRCpTtqNCmWO43xze1AtvzEDqt8L3NH4Tq7meWEhd3jYhGWnmFKTjb
	qjl9JUzq4pdH/HUGah57ip+URTnqXW279vfdvBWLQLjpeaUa/VPjulRWOcwtrtWaRdQhiqENInKvS
	JfXCwJEqKsvNCj0YxegapGTzmsnBaDTN+ntHLZRbHr1VHmKlgBxlWBltW5zymvv8hJ+0igKMzmK2V
	cGvUtfkTidk30Z0Sbyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi2kn-003Fs0-2g; Tue, 02 Nov 2021 22:59:42 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi2iT-003En7-Ey
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 22:57:18 +0000
Received: by mail-qv1-xf34.google.com with SMTP id j9so590536qvm.10
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 15:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
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
 b=2xI6hNkcS5cySPFq4P/4gIUDsQ7s48YjXiVHTK/zIHCxwor09+NZhU/2YPOhqGwPsA
 cYMAauA1e9X3cWnZUr5ob+XoSkiYmAXR6kHNvlaP1c2bjTSaZGvG3aaM6lxH5rGBK4CB
 8bartMc72pKTwsZmSl3GjIZEU5ALavKXvpyBfnvXwL3EpqmEJUEDBa9DzDnfX3QhUjBm
 HYboRZBqVxobSDoPMK7dOkRevSYHZJFfv1U+UfayrhMqrx2IALkUGFnCNF7sj8m+1ULw
 /IhMMQhGjmaSf0FE0rwf1GGZgN0RTW1swKVzziEgndZ9kjEbiGvr62Jqcb44S+jioaJp
 FW0g==
X-Gm-Message-State: AOAM532h+z5Sa1oPzZq8sXvQHWaACMeMv3EKPWpQlSm9w8ri5RFcvNRA
 6OR1JLaqmflLTqg4i6Hu3fs=
X-Google-Smtp-Source: ABdhPJyzSRLpFUewjxKCJfvWBNc5NBKG2onhv262G8514DtfjfAc9GL1weix3lF+BV3Rd2zvlanphw==
X-Received: by 2002:a05:622a:d5:: with SMTP id
 p21mr26153541qtw.44.1635893836763; 
 Tue, 02 Nov 2021 15:57:16 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:57:16 -0700 (PDT)
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
 Mr.Bossman075@gmail.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 Jesse Taube <mr.bossman075@gmail.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT
 compatible
Date: Tue,  2 Nov 2021 18:56:56 -0400
Message-ID: <20211102225701.98944-9-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_155717_526140_E6729C92 
X-CRM114-Status: GOOD (  10.16  )
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
Message-ID: <20211102225656.sdJfQmUHWANscyxiG4ezhrBBIzEtqie3lFTWSE1Qck0@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
