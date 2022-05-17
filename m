Return-Path: <SRS0=TAfj=VZ=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C2EC43219
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 03:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14F7BC385B8; Tue, 17 May 2022 03:28:17 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AD8FC385AA;
	Tue, 17 May 2022 03:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5AD8FC385AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id s22so7831695qta.0;
        Mon, 16 May 2022 20:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PdMLJHGeYL3BkhQ1IKPvlOorpUAGvppwW+eNkTKAgQY=;
        b=epVeU20/PWITUh/PnZQO4gV6FOnPwRd3wuGGCHycYRbslbbSXVxdItsjxJJS5FoCDY
         m/Q4JfToGoRu9DGDMz9Khxn/QfnB9ap8f8DSUEiRs46YOazpmedmJv6d+UYYCxBfGdEi
         TICDdsa/yw4Ph5BLLQqNxnTL/mFwPzlKuyyAem+WI1mRSwi7Ac1DygQdMYjQ1rM0fwpV
         Nvl6JH+K66D4GbEoqtuhcp4gDoPZpQBcrQn8A/D6625KiuBbb716dRQd6f23nt2wAyml
         tRdyDNA4YgAKrbRMr7BLUGpUr8FJDfRq+PTIHF8BSBD1O548zVggFEdp0Mt5mfpDt4NI
         oTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PdMLJHGeYL3BkhQ1IKPvlOorpUAGvppwW+eNkTKAgQY=;
        b=cgW9qZzMY4mgmKB2P/iJyCwzLmF0AQ2VSSY8FpKwjc/aiOwcVlkEwLZyMVS80wScRF
         ss3bqCTBrQ4lOQnfnm3p6NPvcjTiiD9l9MzzysGyQiBMhSH1HszIxKcuA3o0Y+QwPutU
         zyMdVtN+VA61azDMu+5NRd1+ECHNIX4C56LPTEKDSA3HvXLRLh2rvJYwZCMRCSl/KnVp
         gWGCOA5JFXaoAejv+6yzc+wkdxsEDsBA/6vzaOVX5sk3LIaDnth0K3QB3ZiCmfQ+GqP3
         YsZTl9TZmYRLl5dFw+QzlBxjlZCHh8sNR0I9xjqN8KsSXSF0cpyDT+V8JHbUCy5VzhJO
         p5RQ==
X-Gm-Message-State: AOAM5322PUDqoTN6EbWCjqiTN7PTCRZWO8js8WTuuiyTe9KXzDEAmOzl
	fBORlUA8PD8bNzJxOZjQk3WMiSqyeZw=
X-Google-Smtp-Source: ABdhPJxhDCOOwtl7muxq2EoiLkbbJ3pSULu366CSCoCkoPrUpdovla0DLB8Xkq4oYUvZSpAmqX9neA==
X-Received: by 2002:ac8:5e4f:0:b0:2f7:b5bf:7541 with SMTP id i15-20020ac85e4f000000b002f7b5bf7541mr10075787qtx.59.1652758095266;
        Mon, 16 May 2022 20:28:15 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id a19-20020a376613000000b006a098381abcsm7079535qkc.114.2022.05.16.20.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 20:28:14 -0700 (PDT)
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
Subject: [PATCH v3 08/15] ARM: mach-imx: Add support for i.MXRT1170
Date: Mon, 16 May 2022 23:27:55 -0400
Message-Id: <20220517032802.451743-7-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
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

