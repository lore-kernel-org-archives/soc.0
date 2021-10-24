Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8D6C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:48:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84FA560EE9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84FA560EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYLWJzJ82V4XBG/Q58TgnssKE7GWyttnqxU3zwKfFQY=; b=t5sGmnkONUuCz0
	ZjI639SaHURcKsfPXA3sckc8IvFqEYBL1Iq3OGge36UWMNmQlZaxuY2weEeCpvmM+Py0ZOmlYpvCW
	694Ee2jklrGBP2h0q1T5MKBX5h0KjYgCDdaA0cUwdpru1bE+/vNc6x0iaiIDqNiQJ3O5Xu/9cQOLS
	ivHM5IlUjpfof4TvRp6UCzQH/jeaAyBQCxBt3WeVyTGVtB2bl3LwDcWaJ8edXnm/rYSBmbw7zgGXa
	A1VIfXvNhlaA8U17BQFf0nyIrnyceCNFP8v4PgrAp+nNO+jHjjS10sKeBHwfRsiLS5odsvA6KOiPX
	3pRP5hQyumbkHxjzeuBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mefhX-00EEtz-9i; Sun, 24 Oct 2021 15:46:25 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mefcF-00ECY3-IX
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 15:40:56 +0000
Received: by mail-qt1-x82a.google.com with SMTP id b12so8160218qtq.3
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vgtfqpJ2UFlTkiMWu/m6pDold20P16J5tOJCpP4mfRs=;
 b=J/NlAl/YoY9eut7+2Gd/+ADk1l/GxoWPCfezyJwmtato5/EZzHseRr8lFJrbI0yv1x
 W40RTcdpv78Zt6sG8GPgYXbRsHuhHSmnui7f2kX2fdILYS1yuzRnFT5W+Yr0GUNKpUGJ
 PcwhJTaQ5PdXk83MDazdgTOqOG+CymAgrPkcUT/HLURWNrQdQeNsMEALM0FK+IZ7ifSE
 x4oDCfG0y2bSXYG7xSmZr0vW7Z9Tq4OHThvZu2h3ZefjnRj1cQgPJtULkTNEz3pTHYnC
 Kk223MLGoyqjksSQsHxQeizEuEwEpTA3okfqQx4590XkFdLvSeTXkjLrmb5k8Gv8VihX
 862Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vgtfqpJ2UFlTkiMWu/m6pDold20P16J5tOJCpP4mfRs=;
 b=Kc3lEF2wS0CANWWDDQtJtbGRHGn88nUMn+caid4KGaeT97Uh5gT/lGo+UD8eAoU1FE
 nx8miSxly/31YlFbOaNqFZc1KmEeo7d8c6EZ8rggR+LEJ2BwmO+6H4M86eK06MYVXdYI
 XfJY0cfW9Da/bIj4Mq/lpxtEf9KLZbwkpx88hg0aE2mWVNc/8Rx0zIywV7dpQXW8uuZX
 wf92q/fnwsxiu5F5LjZikBNDK4nfaVSnFcsqzJox+hhfxQDXKXBJcwB+tUTrQV+AFibE
 Fsl2G2tZhhqmQZwgj7hRezE9sfOY95rYdBQtuUg76WFjS0hsryDn+1wYerQ+hcXijgjZ
 +YkQ==
X-Gm-Message-State: AOAM531SiAhl+LWAkU8FA/vAfIpSKN7hlyY4mZUEsBjBGllOnHkz3cKI
 CmL/9JIMi3Vqi4ROnFNnn2E=
X-Google-Smtp-Source: ABdhPJxz9ISTP/92XiTZMUUmzkXOkPWMWuUnYoUpGIXXHVJIXl0bys5MJECmCuABcI7hXktUoYPDoQ==
X-Received: by 2002:ac8:5e14:: with SMTP id h20mr12064103qtx.364.1635090054510; 
 Sun, 24 Oct 2021 08:40:54 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 08:40:54 -0700 (PDT)
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
Subject: [PATCH 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT compatible
 string
Date: Sun, 24 Oct 2021 11:40:24 -0400
Message-ID: <20211024154027.1479261-11-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_084055_649686_908E9DB4 
X-CRM114-Status: UNSURE (   9.17  )
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
Message-ID: <20211024154024.a4T4-RNb2oWys1EqkRQrUXu2O__BtSsfxMHRgz5dy-k@z>

Add i.MXRT documentation for compatible string.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index a3412f221104..8b6fca1bd39b 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -34,6 +34,7 @@ properties:
           - fsl,imx6ull-usdhc
           - fsl,imx7d-usdhc
           - fsl,imx7ulp-usdhc
+          - fsl,imxrt-usdhc
       - items:
           - enum:
               - fsl,imx8mm-usdhc
-- 
2.33.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
