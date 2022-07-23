Return-Path: <SRS0=T1wL=X4=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7596AC43334
	for <soc@archiver.kernel.org>; Sat, 23 Jul 2022 16:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50C63C341C7; Sat, 23 Jul 2022 16:05:30 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7796C341C0;
	Sat, 23 Jul 2022 16:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A7796C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id e5so5469796qts.1;
        Sat, 23 Jul 2022 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gwvQIgq3vhhcfZ1NYQsfvq3heagizQH5IEQrv2gja80=;
        b=hH8BE5VYW+TKL8xKwEP1hvTS0IvxYl5IcZc9Nzh4ZgesbztwmmaqsG/DDEy5Xqhew8
         ynDKgMxha39VxFlKP7CXLNlVrEDiB7GUyT6j3XS0aeHmhdQpWeEhx4Z+CvwgBtRjBQTw
         09eQ2OmqDfF/lcRUMCaXyabgXX7B9fFGE/8X1NRYAzJhG/7oRvisHOtjNhHSRGgDfYp9
         09WR1OIC/qUi/HW77LfwyCG1FLLo7f013uSX7otKLITQ4FNbBUc3x99UsHtX/1H6ssxf
         khDl0f2TCLP0731wCfCZdSmzkSychxJgYNkToHMEtle6PAb8oc3ANdkv4uVpGuXPlR6f
         GUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gwvQIgq3vhhcfZ1NYQsfvq3heagizQH5IEQrv2gja80=;
        b=06CLwpj6saI1IbrBrYCeF5A1rIudMskNVZW0zxYTckBi6LFhU02UEJuy4t4daFrZuj
         dMZyhfTZyMQhyS+Jh8MQ78/zl+4XLl6mkuC3nLge7PDvRokIP2o0tZXT97HeTKkooKuM
         wCOxmXlp4b1nssRikrR5qEBHHV8jluJJzZsZm3m9moFQsw7wOFCPDXRt0Ye/EAm9Gf+r
         zA4u6/2WTPdQsR5JqVg2CaqHnwDNlxZvyi0muHrEs9PczYPoQX/RwUyf9nujbe8SkzLZ
         e9JS5IDQROkIqG/uPADXcLdaWsJJssVefr4RuuSsyInrehLFHu6VGPjkKQmfWFWgz6DQ
         4hzw==
X-Gm-Message-State: AJIora+HEO7MESmK//UOaNrldn1DlL1oWQHWTaYBHmOMmqfFs7jTf8Sb
	OuWrgLf55+pmdLrjAoJM3ETS050VgxwkDQ==
X-Google-Smtp-Source: AGRyM1tR0ByQr20Um4ggLuRTncRgO5oc4F/nKqrO7Ts/0aN77zu2wS/X4t7bxa7CLvFM7d0czqK6EQ==
X-Received: by 2002:ac8:5fcf:0:b0:31f:3ac:487d with SMTP id k15-20020ac85fcf000000b0031f03ac487dmr4505296qta.148.1658592328649;
        Sat, 23 Jul 2022 09:05:28 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id g4-20020ac87f44000000b0031eb3af3ffesm4935046qtk.52.2022.07.23.09.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 09:05:28 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	stefan@agner.ch,
	linus.walleij@linaro.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux@armlinux.org.uk,
	abel.vesa@nxp.com,
	dev@lynxeye.de,
	marcel.ziswiler@toradex.com,
	tharvey@gateworks.com,
	leoyang.li@nxp.com,
	sebastian.reichel@collabora.com,
	cniedermaier@dh-electronics.com,
	Mr.Bossman075@gmail.com,
	clin@suse.com,
	giulio.benetti@benettiengineering.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 06/12] ARM: mach-imx: Add support for i.MXRT1170
Date: Sat, 23 Jul 2022 12:05:07 -0400
Message-Id: <20220723160513.271692-7-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
References: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "fsl,imxrt1170" to imxrt_compat

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - Nothing done
V2 -> V3:
 - Nothing done
V3 -> V4:
 - Nothing done
V4 -> V5:
 - Nothing done
---
 arch/arm/mach-imx/mach-imxrt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-imx/mach-imxrt.c b/arch/arm/mach-imx/mach-imxrt.c
index 2063a3059c84..0070214feb42 100644
--- a/arch/arm/mach-imx/mach-imxrt.c
+++ b/arch/arm/mach-imx/mach-imxrt.c
@@ -10,6 +10,7 @@
 
 static const char *const imxrt_compat[] __initconst = {
 	"fsl,imxrt1050",
+	"fsl,imxrt1170",
 	NULL
 };
 
-- 
2.36.1

