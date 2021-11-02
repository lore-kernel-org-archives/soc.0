Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C06C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:03:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83F9F60C4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83F9F60C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwCl8/rn2DMaJKF06j3LkBP2b9apVELAmGifGfkmxF0=; b=ADSWLCy6Q/8L9z
	+KiPz0RGeZEbJbO/5gDL5+CilM/bv7RyJuGk+UOjqSXWPiPxr/ees99aG3EQWld8mUj8ADSoAZmR7
	YsE9ONbS6pzoCiU86TyTLxihPYW7DSaT3eFf/NgYc/TWwbNS8cBPovrOEoRYrD3WOjpwtQ02nurnf
	yDfr0TW/gl/xjp7txvVTQv9/wIyAAAqSKQ8HiBcml+8Rgml62PfkVd4dwp/Qznldd1TzHW7f+gkz4
	ORqe3zqQ+RQg8OcbnDNDGEwK18l9G6ssXWg0pq2vk8RBgx6HIHy4GTjYA7HuJ4mZRINRg1QHw1cJV
	9yPKcZiX8hVDQyDq5AHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi2mS-003GfD-Rd; Tue, 02 Nov 2021 23:01:25 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi2iW-003EoU-PT
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 22:57:22 +0000
Received: by mail-qv1-xf34.google.com with SMTP id b17so595603qvl.9
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 15:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
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
 b=MDy18gsbf7vPdlLl+fKPdinRKPA0jT9tEx5qe5oWgEjOl4E1X95qw75dICpEozvsZQ
 sVJbz/scuXHJ7uHP6kJObE/L8ONYbltiNA6487dhdliccY/tHWjr77e+QV+zH9FIbeAT
 AkMzvYG1BlHG2fmJjReAswE1MdocBYHIK7EP4VxfA6HitWlClYqWBBdWMgaMxqsPRpyt
 ozuMUTSr0CQS13DMYtp0cxXdbyzQTGN4Eu/IHdnsLrUm78Z3nBGVZ33W1FmJTTuqygrE
 7x5e7VlyqJcylRLpt+SVcMbMlebOUQ6fcIJfKoyAm0FAUg0CmTiGPPS3XkMDLrVvPuGG
 seEA==
X-Gm-Message-State: AOAM532XisGJ5BqzKlLsSwl4lMb4hsmTq53oz5HPGMCEkfE60EKCmqcQ
 zOF2TrPZ+CHQzFe/VLUPV70=
X-Google-Smtp-Source: ABdhPJzvncT8jsqO17WmjFqU6dV6qTNP9fA3RJ7MZ0N0WVKoE7yR2jImRsI9mqAM64mBQA1Ci/knDA==
X-Received: by 2002:a05:622a:84:: with SMTP id
 o4mr32151612qtw.41.1635893840049; 
 Tue, 02 Nov 2021 15:57:20 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:57:19 -0700 (PDT)
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
 Jesse Taube <mr.bossman075@gmail.com>
Subject: [PATCH v2 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT
 compatible string
Date: Tue,  2 Nov 2021 18:56:58 -0400
Message-ID: <20211102225701.98944-11-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_155720_876247_9E01EEA9 
X-CRM114-Status: GOOD (  10.12  )
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
Message-ID: <20211102225658.RiouUrGgH_cUAKiGg1_veSPiJ6IRHvJQQHNz1dK0ySM@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
