Return-Path: <SRS0=tSnG=VG=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD474C4332F
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 21:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5F84C385AF; Thu, 28 Apr 2022 21:48:55 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2EC01C385A9;
	Thu, 28 Apr 2022 21:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2EC01C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id k12so4171763qvc.4;
        Thu, 28 Apr 2022 14:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ychtn8SD4NMRNaGjpVNr9S3Ei5rtR05oQ+ZMmU3VmQk=;
        b=BV3xaN9mU4t9ycFzzpXdCJhcZYdak1cPV3uu+3RRUt+NIESdWtCc5MtmbmnStfBbU4
         Z+w8VjvZhiis1K3RJiKbH+dMtwBiP1tzZVs7uJ0EIg8p4pAeDoZajdaeGiSyHTK07SVg
         Aai5AUqGpwIH/0KLCmLeySL7p3HfSQoMogC6pXcT4H96HLAqfqRfWNq+ZWh04ge6dyKz
         xYBWKQLc+5CeoVstl0nIAa/53jDSr1mQ6NbZvJ/jQU5jUPvy32+wxXkMjgsrrRn1lmsR
         UomUO6ylkc/ZdT9czHk4q6Yk80XFeE4eHK4Ths/Rm6cBLzNBFesjf9XZrK5IDjmrsmMJ
         /keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ychtn8SD4NMRNaGjpVNr9S3Ei5rtR05oQ+ZMmU3VmQk=;
        b=oQHtcRej8VirZSUQBtOCZG+tB3/LMWxDR/aq4ww4bePhByKTMWCLIMdQrw78+SObVh
         QKi2zIfwxXKSp5wlM1Wjwpi1rkMwnMEL0oQTAJOEM9fjxZfxR6fJsmNSgONFfbzM8hCe
         Cc1Upktm8EaclSmTPEDlqKJTUZwK2MABbDFbhmuPcCtWM4Ye1zd0/SwQLfBdgJqrGnHW
         tVZJzJCAO5s2B1Xb4L7+24e2zjriOr1lSkwTvmGdooug8lJNN5a/lP6DhQUMhpXa7BgZ
         MF/Cm01Jbk8o69EnnPUh+yW9GGLo5qbJTwOjs6gmNNcHDfBoRn+1+H0L3mKUa42vAb6+
         ognA==
X-Gm-Message-State: AOAM533nWbENrKPkVVcpktzqW/uKtcaXziCeKS7N5sok4qAamnXxuheu
	u2522dYGWRIs1XgJojwMddR424BEmPA=
X-Google-Smtp-Source: ABdhPJwut13QdUA10q/S608ZFTUULF1LRhMsjGAMh86U9IZsVz5jMxqzbxxGJkGrkrcNyaWMMYmS4g==
X-Received: by 2002:ad4:5ba8:0:b0:456:3c2a:dcd9 with SMTP id 8-20020ad45ba8000000b004563c2adcd9mr14947726qvq.14.1651182534148;
        Thu, 28 Apr 2022 14:48:54 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id bl5-20020a05620a1a8500b0069f51e47c5esm546442qkb.110.2022.04.28.14.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:48:53 -0700 (PDT)
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
Subject: [PATCH v2 08/15] ARM: mach-imx: Add support for i.MXRT1170
Date: Thu, 28 Apr 2022 17:48:31 -0400
Message-Id: <20220428214838.1040278-9-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "fsl,imxrt1170" to imxrt_compat

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
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
2.35.1

