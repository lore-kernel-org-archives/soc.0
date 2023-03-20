Return-Path: <SRS0=M4Ht=7M=gmail.com=lukas.bulwahn@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3718EC6FD1D
	for <soc@archiver.kernel.org>; Mon, 20 Mar 2023 13:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBD1FC4339C; Mon, 20 Mar 2023 13:02:04 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA10DC433EF;
	Mon, 20 Mar 2023 13:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CA10DC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id b20so13458318edd.1;
        Mon, 20 Mar 2023 06:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679317321;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c2sQm27Vp/HhAftIFTylROdy7YRt+aXlwqBwwRN7xc=;
        b=Gw/kM9iK38FS85c7Bhsi2I3/0vb0G7m0AGdGUQ7ve5Chf9VXT1Xbx6EeFf/iBr1h4L
         5Sh6I4yk3Q9FX9mvphR/SGVkc21Tcjbwsj40Ws2+SflPwjB69XoMRWwlqwWGQRaqIHll
         vHI7+I1OTHDehSAGqEZOHUo5RRW79QN09+wAqvFm/AvO9zDe1QvWJse/EP5wDoCdEdJs
         z4OymjGG1SkCnWKCq69xEq0Mgoj10g/Yl4Nd2vvK7vrZljhgC4AgRnzCiv8aspFdYKGT
         FBlI1D/naH7UwEUJWDj/3wxzmA9oC3YsRxwhHS/h3/AwHcxFiXM5Ivc9wiwt1Nh3rxpP
         H7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679317321;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5c2sQm27Vp/HhAftIFTylROdy7YRt+aXlwqBwwRN7xc=;
        b=4y21kw6oiDY/9msIZr8hBWbm5yqu6UFofuQLeftj/BLzmMrsLrvFi5fYnpqIuWA3PX
         IP4nqWBQ91IHQMUQejeeUp1LlSj3CblRZtA7TuVBPdUPgjyUvxyyNXS9EoslC619RMZI
         oO0a9JPjfWExcUL3NbDD0n3Stc8HU+mjicEhHNJCtG+hoaZbtGjMe8N6YLOjC48aw4cW
         yDpAWr42SvG+lRntMatnc4F33nix2Hu6lVR6Ketl4oFtzmQxET51OoTWjtiFyloOEBRI
         JILSFiRmLuTL4UcLMh6lRrjPeOJrDG7CzYzMMH9cc2dteJ5AymROQDt4PW/fJ6UyTzPt
         U3QA==
X-Gm-Message-State: AO0yUKVz/pzXEc0+4W3OrMBDBYe6rPiwI8o1bh4K4fSKwYrsQ+5PIXqL
	KqnXWu+YmwgJG3xldEHsV206cRiKvmZM9Q==
X-Google-Smtp-Source: AK7set+1rtX0rl0Ssjz/WjGKPyvlO4Ny2whG20GaytLyE+jjEr8JawHoWubHAJcBnhM95g55DgJXng==
X-Received: by 2002:a50:fe81:0:b0:4fb:5a36:1539 with SMTP id d1-20020a50fe81000000b004fb5a361539mr11117966edt.25.1679317321551;
        Mon, 20 Mar 2023 06:02:01 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:2a40:1104:394b:6c53:31d8:7b18])
        by smtp.gmail.com with ESMTPSA id d2-20020a17090648c200b008ea8effe947sm4411441ejt.225.2023.03.20.06.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 06:02:01 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] ARM: spear: remove obsolete config MACH_SPEAR600
Date: Mon, 20 Mar 2023 14:01:59 +0100
Message-Id: <20230320130159.32316-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

ARM: spear: remove obsolete config MACH_SPEAR600

Since commit ddb902cc3459 ("ARM: centralize common multi-platform kconfig
options"), the config MACH_SPEAR600 has no effect. Remove this config.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/mach-spear/Kconfig | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/mach-spear/Kconfig b/arch/arm/mach-spear/Kconfig
index 1add7ee49b63..7108ad628f8d 100644
--- a/arch/arm/mach-spear/Kconfig
+++ b/arch/arm/mach-spear/Kconfig
@@ -81,12 +81,6 @@ config ARCH_SPEAR6XX
 	help
 	  Supports for ARM's SPEAR6XX family
 
-config MACH_SPEAR600
-	def_bool y
-	depends on ARCH_SPEAR6XX
-	help
-	  Supports ST SPEAr600 boards configured via the device-tree
-
 config ARCH_SPEAR_AUTO
 	bool
 	depends on !ARCH_SPEAR13XX && !ARCH_SPEAR6XX
-- 
2.17.1

