Return-Path: <SRS0=Z6O2=72=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB038C761A6
	for <soc@archiver.kernel.org>; Mon,  3 Apr 2023 07:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87193C4339B; Mon,  3 Apr 2023 07:42:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EBCEDC433D2
	for <soc@kernel.org>; Mon,  3 Apr 2023 07:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EBCEDC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id v1so28259194wrv.1
        for <soc@kernel.org>; Mon, 03 Apr 2023 00:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680507746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsljtCJiazE5NkGm88Tojg7L6Z8lihqck8h8eoHTGEg=;
        b=ERYeu1hbMOABzJJIf6abhps9hFWp8DcXj2oDxzp/+9rTEOPxfhbQIkNedDGIqLvYVV
         X9EhMi9RWzcaYrOj38qxaTk2u2uhRdfiIT1V6NKXbvRc6UPvDQEsRqkazeNpb2Hs6UYX
         Gk5vYKoCUPqzs8DHgM4nV0HhtQ2FkIoIG2qQfEVNPmA8llVQPymDbMMFHPFhZGmf8enp
         wRNDpAy7bBi1jjtKp5ZGlGkBpN+T0tv0qZPuCKxXSt4MhiYYGNtOTBqfqtcBB4C5iJYG
         jSetrrI681iFXZiJhAwXAmR3wo2jD7HqpJ32bALf0z0k3OsW90iNMkBXqrKROktYBaMw
         PGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680507746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XsljtCJiazE5NkGm88Tojg7L6Z8lihqck8h8eoHTGEg=;
        b=HAgvra5rMyS5lVwp+W1pMr8c67q50iru9eq/K1QewLf1oo6C6mwG1a0TatBll8yUpL
         VpobfSczxtA4LnXXUPJMi3vZXMU3zQALqSRnue9cqkLXmMT5FhWUixqXaReN64cbXHI8
         l7FX5DHksuBsbjcBBC0nn1u1V9Bcs8xdWisj1AnX8eA34VQvh9kGEOC7aJ8cFNYL9soC
         VzeQGFaq+LF1gtXv7LWcQDy/EiAec4LsyCvk9kHSAubi4j2vGtcwIZt5QQtZQi3KTHe/
         +AGXT6ltgJydHotzJs/ZY7yPhswK/8wX3DqWhqzxL3xGnJ3I4zXAK4YaltP7m2I6NBrI
         jmaw==
X-Gm-Message-State: AAQBX9ccrkeo5jHCjQtcGo/OL1EXSoW/VflZWgW+KyvB4npBP3WlW76G
	9BgkdRo4wzByv4k0laSMhV1XKg==
X-Google-Smtp-Source: AKy350Z6e6J7uSkW2Hv2dRYhOElAG4NTAcR0nwGJ0pugXPyWTFpVuEPcRywE7wwpOPRnYtIXtriOjA==
X-Received: by 2002:a5d:55c7:0:b0:2d2:ab47:3ef4 with SMTP id i7-20020a5d55c7000000b002d2ab473ef4mr28234897wrw.70.1680507746014;
        Mon, 03 Apr 2023 00:42:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020adff94e000000b002e62384d17dsm8180482wrr.21.2023.04.03.00.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 00:42:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 03 Apr 2023 09:42:20 +0200
Subject: [PATCH RFC v2 3/4] ARM: configs: remove oxnas_v6_defconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-oxnas-upstream-remove-v2-3-e51078376f08@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-oxnas@groups.io, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Daniel Golle <daniel@makrotopia.org>
X-Mailer: b4 0.12.1

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove support
for OX820 specific defconfig.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/configs/oxnas_v6_defconfig | 92 -------------------------------------
 1 file changed, 92 deletions(-)

diff --git a/arch/arm/configs/oxnas_v6_defconfig b/arch/arm/configs/oxnas_v6_defconfig
deleted file mode 100644
index 70a67b3fc91b..000000000000
--- a/arch/arm/configs/oxnas_v6_defconfig
+++ /dev/null
@@ -1,92 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ_IDLE=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_CGROUPS=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EMBEDDED=y
-CONFIG_PERF_EVENTS=y
-CONFIG_STRICT_KERNEL_RWX=y
-CONFIG_STRICT_MODULE_RWX=y
-CONFIG_ARCH_MULTI_V6=y
-CONFIG_ARCH_OXNAS=y
-CONFIG_MACH_OX820=y
-CONFIG_SMP=y
-CONFIG_NR_CPUS=16
-CONFIG_ARCH_FORCE_MAX_ORDER=12
-CONFIG_SECCOMP=y
-CONFIG_ARM_APPENDED_DTB=y
-CONFIG_ARM_ATAG_DTB_COMPAT=y
-CONFIG_KEXEC=y
-CONFIG_EFI=y
-CONFIG_CPU_IDLE=y
-CONFIG_ARM_CPUIDLE=y
-CONFIG_VFP=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_CMDLINE_PARTITION=y
-CONFIG_CMA=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_IP_PNP_RARP=y
-CONFIG_IPV6_ROUTER_PREF=y
-CONFIG_IPV6_OPTIMISTIC_DAD=y
-CONFIG_INET6_AH=m
-CONFIG_INET6_ESP=m
-CONFIG_INET6_IPCOMP=m
-CONFIG_IPV6_MIP6=m
-CONFIG_IPV6_TUNNEL=m
-CONFIG_IPV6_MULTIPLE_TABLES=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_RAW_NAND=y
-CONFIG_MTD_NAND_OXNAS=y
-CONFIG_MTD_UBI=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=65536
-CONFIG_NETDEVICES=y
-CONFIG_STMMAC_ETH=y
-CONFIG_REALTEK_PHY=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_GPIO_GENERIC_PLATFORM=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_CLASS_FLASH=m
-CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_TRIGGERS=y
-CONFIG_LEDS_TRIGGER_TIMER=y
-CONFIG_LEDS_TRIGGER_ONESHOT=y
-CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-CONFIG_LEDS_TRIGGER_CPU=y
-CONFIG_LEDS_TRIGGER_GPIO=y
-CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
-CONFIG_ARM_TIMER_SP804=y
-CONFIG_EXT4_FS=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_UBIFS_FS=y
-CONFIG_PSTORE=y
-CONFIG_PSTORE_CONSOLE=y
-CONFIG_PSTORE_PMSG=y
-CONFIG_PSTORE_RAM=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_NLS_UTF8=y
-CONFIG_DMA_CMA=y
-CONFIG_CMA_SIZE_MBYTES=64
-CONFIG_PRINTK_TIME=y
-CONFIG_MAGIC_SYSRQ=y

-- 
2.34.1

