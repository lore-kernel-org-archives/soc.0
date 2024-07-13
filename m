Return-Path: <SRS0=U1GK=ON=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9746DC3DA42
	for <soc@archiver.kernel.org>; Sat, 13 Jul 2024 03:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F98BC4AF0A; Sat, 13 Jul 2024 03:34:56 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3860BC32782
	for <soc@kernel.org>; Sat, 13 Jul 2024 03:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3860BC32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3c9cc681ee0so1409411b6e.0
        for <soc@kernel.org>; Fri, 12 Jul 2024 20:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720841694; x=1721446494; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qtpF82pGCu7wb84OrfErGjGTloI1qsDbavb4Ik1U9k4=;
        b=dfb5YRfSHhK0u9/cfVYU1h1BAvmfy3Q3n/Y6ProS+ZOLKxa3w/8BY0ySZwWJ51ToKX
         fi8FA//mpwyFW0Ucie8vUkjrM7e6qQHHXfEio8Xt0HMV+orfO+B8T1K8I0rBowb+6RRE
         PtpsrEd63EJJdCbn69Rl1i9bBT1+WojTLg6kIAgj4YI05FfJKFJb2iUpdXb023iuSP5r
         HciGdIVhGcxCBtQ4bpxEFwyldrHWg3Z9x4OY72YeZH+SQ8OH750YiBHvkpKctfpK1BqD
         i7lr5NMse+YMy7gS7qevei0dKE5zsBIy7h1FqEdP2+CBX2Gi9PraIKDPtWjoD2XYc3Os
         UsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720841694; x=1721446494;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qtpF82pGCu7wb84OrfErGjGTloI1qsDbavb4Ik1U9k4=;
        b=cOJfQFlbpDxbkCuTjYoxaLmx4Z+nYvmG32mVoLul+F5slSSb9xwjywMhXHPp0WE2cP
         bPd2Ss2ajkWRgzNNda4+QvXWsSw0weFYwyiZjzhmvF18I5gRyjTVRGe/mHyZhi/Fa+Zn
         OsmmnykpZa4VV03ErBLq663N7wgKMHMbmt41D7p/gKaJMk2C5pjiHg2PykA8o25mSRt8
         ExoFGF+P7gcuEl6h3oY6hE7VtR0U0BG7qrboZi2yuwmFsNfbzgI198DgXSTWcHffBO8l
         4JqmmyDfDSt1gFY2IZ9ccZOFl6PXdXOFVdjCboIcqwY/EklbrQMSZcCjcX4RWiXqqFNV
         Q+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXrixlTFrXMigij5ljXmZZVCChnnsQ0lVnGwComGqyjqnGPtK16VgoxBLACFAYq91wJHv83PMy7SNNSJxK4Yg==
X-Gm-Message-State: AOJu0Yy5xa+4ES0h7RR4MvvCeEXh9CclXmb0FL6+LRJ/rNgzaJTW3aBt
	J4g0GKhXS30bgU4Ac8M/214rJZyzPLVai0pbtxbZdHlMVhDMuDuu
X-Google-Smtp-Source: AGHT+IEAQRPKj9vObpjqjTMQ1SxXWHqcDPT6yiLFS2pxj6JuUGMdA2t1ndhQuVrWxaZWwgd/m0HWVw==
X-Received: by 2002:a05:6808:191d:b0:3d9:b33e:d3e2 with SMTP id 5614622812f47-3d9b33ed905mr14745793b6e.19.1720841694100;
        Fri, 12 Jul 2024 20:34:54 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:669e:eb9d:e30c:18b4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eba4540sm298199b3a.43.2024.07.12.20.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 20:34:53 -0700 (PDT)
Date: Fri, 12 Jul 2024 20:34:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: pxa: fix build breakage on PXA3xx
Message-ID: <ZpH12w9vyZZDdzDb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit 917195d6f829 ("ARM: pxa: consolidate GPIO chip platform data")
tried to reuse the same instance of platform data for PXA25x and PXA27x
GPIO controllers by moving it into arch/arm/mach-pxa/devices.c
Unfortunately this file is built for other PXA variants which resulted
in the following error:

>> arm-linux-gnueabi-ld: arch/arm/mach-pxa/devices.o:(.data+0x167c): undefined reference to `gpio_set_wake'

Fix this by using #ifdef around PXA25x and PXA27x GPIO controller device
structures and associated data.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407112039.cyyIQ3Js-lkp@intel.com/
Fixes: 917195d6f829 ("ARM: pxa: consolidate GPIO chip platform data")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/devices.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
index d050a4c78f97..7695cfce01a1 100644
--- a/arch/arm/mach-pxa/devices.c
+++ b/arch/arm/mach-pxa/devices.c
@@ -633,6 +633,7 @@ struct platform_device pxa27x_device_pwm1 = {
 };
 #endif /* CONFIG_PXA27x || CONFIG_PXA3xx */
 
+#if defined(CONFIG_PXA25x) || defined(CONFIG_PXA27x)
 const struct software_node pxa2xx_gpiochip_node = {
 	.name	= "gpio-pxa",
 };
@@ -684,6 +685,7 @@ struct platform_device pxa27x_device_gpio = {
 		.platform_data	= &pxa2xx_gpio_info,
 	},
 };
+#endif /* CONFIG_PXA25x || CONFIG_PXA27x */
 
 static struct resource pxa_dma_resource[] = {
 	[0] = {
-- 
2.45.2.993.g49e7a77208-goog


-- 
Dmitry
