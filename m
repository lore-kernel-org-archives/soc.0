Return-Path: <SRS0=HV0T=ZE=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61D9ECAAD3
	for <soc@archiver.kernel.org>; Thu,  1 Sep 2022 18:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADD11C433D6; Thu,  1 Sep 2022 18:33:59 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A824AC433C1;
	Thu,  1 Sep 2022 18:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A824AC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id x14so9658398qvr.6;
        Thu, 01 Sep 2022 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=YdtFHMRN/r3oFnRnKHqmURrUXOCIm7+fBetlO5pq8CQ=;
        b=aYl2vS9Ns3ibcHpoQzkVFaSyDdfB74G2pc8Qt2Rgft0RsKbbUfjvN3KItqiyHfJFD4
         VyklUZv0B3CvrVu7HmIHVwUXrMBpJYTpP5lgyDXzn6R+tkVP79LIyS7VTx0xa8QHpMjP
         SRh9bQF6I7009IdtMq6mC5sDlJEnsFy1bh03T4zyFx+8u/FmNy4WKN/Cf7vZrR229/9W
         Vw7uj5NnqwGTbdvRLAQO1o6Z1QQr4AufLiw+uAOfNvcxDHqconDrxnJ3LrSV3w+QOkb0
         gUTCOD6CtPgqZG7riUcfkKP05frv06g7CT8WUKF9CaRRu2G2j4L2xqbWZJkJtIX8sDMv
         G/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=YdtFHMRN/r3oFnRnKHqmURrUXOCIm7+fBetlO5pq8CQ=;
        b=mXGQByTMMTfyaAVyxyNr4dd8j8loOeS2g49JoO1fTe7qH2AH5BPFzxXKYsU6kB5KrX
         FxKpWzW1UnbRk3cper6woZD0SawwNh7ccNPhe+8I0OE0N8cwuqDlpe0V2xP+f8ADlFAS
         dCFlHJgyn2vNZUhDchbeKCoMoYKJ73NsHBA3N8ra3PfRB1dueKzNYPlHGt9z2HzLX0j6
         LrOxwq6gzSD5NYL1PyYPIpw5L24VSItvkPngtP3e1JSyFKZknSKutlbSq3jhOxFXtMBP
         WPSyKZ+WSWTs67AKucp+ZcMXqFQdg++eNLvTBhG5sEMekhtbw9fzrlOiZ73Pm743DWwH
         4Pgg==
X-Gm-Message-State: ACgBeo3LgGSqGZCBoJxgDZdhqN0g+bSlE2WHgREkcrdiXv6dUds2SSdQ
	lakn8ItLASG85vB+28R3wwo=
X-Google-Smtp-Source: AA6agR46lSqIFUvCtXJ/+X5Skmn0JT1a5CDHDpxEmseppesoKd0bDCqvDlzsSi1tHr2dSLZ/blK6Lw==
X-Received: by 2002:a05:6214:2489:b0:498:f243:b9a3 with SMTP id gi9-20020a056214248900b00498f243b9a3mr25402269qvb.19.1662057237556;
        Thu, 01 Sep 2022 11:33:57 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id u20-20020ac87514000000b00342e86b3bdasm10563343qtq.12.2022.09.01.11.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 11:33:56 -0700 (PDT)
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
Subject: [PATCH v6 05/10] ARM: mach-imx: Add support for i.MXRT1170
Date: Thu,  1 Sep 2022 14:33:38 -0400
Message-Id: <20220901183343.3188903-6-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
References: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
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
V5 -> V6:
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

