Return-Path: <SRS0=yj5T=UF=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C5DC433FE
	for <soc@archiver.kernel.org>; Sat, 26 Mar 2022 14:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 610F5C340F3; Sat, 26 Mar 2022 14:43:35 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC0A3C2BBE4;
	Sat, 26 Mar 2022 14:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BC0A3C2BBE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id 85so8090557qkm.9;
        Sat, 26 Mar 2022 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zVMBwba+OFGRWQLxhmJNkbLVJBAIF3Hcu3hVj+hPIDU=;
        b=FniufBSCFh+91j1tpQbTWPp8uemvOlCHmjXSXLtwwlllmSJZinICj9WIcDaJg/xx24
         eWOcnNkO5xGyB9yKf85d+2EjF1pdUeldMgzyD0hAW9QVGP7sJBQHICjxLH6qClFEXs80
         k/K68QOUerpigmnLyPLKk6vHDfMwoTbQsfbtVbb8AJz1JkvrHVTNU2CysV3xJ7tLSO6Y
         Fw0q5K8KBNNFWFIVJblHZmBbQAQTKyAIiysLSy1j1596lMrEayK3hVF1KQUZh75YTA3H
         BmQlqJPHz+pZmE+QGMCzto5Il8THsOCGr4KOY3wYqKuHXvHQGL31UojtQ9OoJactgGAC
         9Spw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zVMBwba+OFGRWQLxhmJNkbLVJBAIF3Hcu3hVj+hPIDU=;
        b=kRAWTbfhvs/T45Nxm1bpfFpIw8Evku001Kjy0yWIvMR9+SzsWEjuob8Un+XKQ/8ATC
         iiCH5NSNTAxib1YU4xzOuvEZo8DQKtTMklFX6eCBq8q520d4mdmzA7eQJUv2j7p0fUwV
         AgX6oaLUXu3odWZV3HaEe46vOQcICOL+1xe4Pp9W4AJzgHgQqw9ujf2qbqTasw/7pBiX
         NMy1UDOrRFiaNKlBx2cGAjTGjfERR1w16Ua7vOSENC4qLSCf49Twg5AODOeKCEuZfpkW
         BhK4avRWzcsDloNZAMNIjiG4zbttbEggXPgXHSXhF6y+yI+XSNP3zTy+kfBRVs1ZyNuC
         Aa7w==
X-Gm-Message-State: AOAM531ft0/OSXVFWGI2OcOR9oXtImMQiW14Z5MqZonq9bECRzD/vssD
	T9bJ6vF40ssWmbFzARrmQr3l6HswH3U=
X-Google-Smtp-Source: ABdhPJxoO0y4Sx6UvlWtKljSwWMgKXTv+3rXp+vP1+NOfQ21036bAjvNWvhasa3Dnc/U8OYO1uTHFw==
X-Received: by 2002:a05:620a:199b:b0:67e:ce80:e414 with SMTP id bm27-20020a05620a199b00b0067ece80e414mr10522894qkb.209.1648305813727;
        Sat, 26 Mar 2022 07:43:33 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id 70-20020a370649000000b0067b4cd8ffbasm4908918qkg.60.2022.03.26.07.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 07:43:32 -0700 (PDT)
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
Subject: [PATCH v1 05/12] ARM: mach-imx: Add support for i.MXRT1170
Date: Sat, 26 Mar 2022 10:43:06 -0400
Message-Id: <20220326144313.673549-6-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
References: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "fsl,imxrt1170" to imxrt_compat

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
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
2.34.1

