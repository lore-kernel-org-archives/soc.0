Return-Path: <SRS0=EHW9=GH=gmail.com=lukas.bulwahn@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB26C25B47
	for <soc@archiver.kernel.org>; Wed, 25 Oct 2023 11:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B774C433C9; Wed, 25 Oct 2023 11:21:47 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AECD0C433C7
	for <soc@kernel.org>; Wed, 25 Oct 2023 11:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AECD0C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so8637645a12.0
        for <soc@kernel.org>; Wed, 25 Oct 2023 04:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698232905; x=1698837705; darn=kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2rHfcsjlV4rlBGbf4CfwSEr1+dgsfk+VxIq/saYt7A=;
        b=P7uMTe6xWFuWQsZoeLgKgChzgQCb3jRxKWaPpl+xecdzDmLvLJsXkuk6pXyf8mvbuX
         sd6MhaR+NW9BCG21zt+sk9OjsyoRLtc32WnNXBWdWVuVd+EORhPwP3pjfesSeiXIeTXl
         3Xth4GXcTX6V6dQ4yJp5dEdAmayZ6Oyzm5u44io+IlUj5u4X1pAniwRw3pKm9CePUZQY
         DrHxXfgpoIjha5y5z9yo7fVEZ0Kl8fgdeWhzfwvxVP5knPiwfS2LjicF652vRjToTMEv
         H89NYvZyaTxa9ANw1i8gsZ03XIPaacApO1SrOnm2C2GRzTl0wMRUQZRx8OBxY4T6+Q4I
         EenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698232905; x=1698837705;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2rHfcsjlV4rlBGbf4CfwSEr1+dgsfk+VxIq/saYt7A=;
        b=Wpd9VuvdFPxbA80aZx4oQap1mbWCKX6kFkIbzq1z/Pb9Mw2sr4YwOldOe4t5v8JioV
         gZ06zRKKnK9MUhGPCauylGwJI/2oTjlMSxZ2aNEY0rVmBmxRu1R5885j1RR5vVhOr6vr
         uxb7IUcRfgoL5+AS/a674L52ymhKDFgS2JJBP36MwRcoQMAzAJUPaqE/MGpe+WR9RNpr
         KL39d0Cmhv1B/B5/PfKsQipqZVh5zVg2wnUXvsC+Vi6XzqMjs1y2HrczRUC8aB1DeEL5
         sScrnFZjEtw13+ZX2xBd0T+HaMBlJzKBi2y0+M3Z/RnCcCUpVwQCzBuOEGcif2Lq0b/u
         MkBw==
X-Gm-Message-State: AOJu0Yw+YW+dktLV1rM2Qht0DYJImeQOhQcNllnIcy+yfOFfU0QwBKG/
	vnQbcIQ10U+YC/YjiuNjJgU=
X-Google-Smtp-Source: AGHT+IGPuYW/6V1UmkcJQL53Gndt5qS6mrifdkq1FD6CQye3uPK1nErdTXZVKKpQwX3DZ2hm9yT2yA==
X-Received: by 2002:a17:906:6a0e:b0:9be:45b3:1c3d with SMTP id qw14-20020a1709066a0e00b009be45b31c3dmr9871645ejc.48.1698232904750;
        Wed, 25 Oct 2023 04:21:44 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:2cbd:f9ec:f035:ebea])
        by smtp.gmail.com with ESMTPSA id xa22-20020a170907b9d600b0099bd1ce18fesm9841288ejc.10.2023.10.25.04.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:21:44 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] arm: debug: reuse the config DEBUG_OMAP2UART{1,2} for OMAP{3,4,5}
Date: Wed, 25 Oct 2023 13:21:36 +0200
Message-Id: <20231025112136.3445-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

Commit d2b310b0234c ("ARM: debug: Use generic 8250 debug_ll for omap2 and
omap3/4/5 common uarts") adds address definitions of DEBUG_UART_PHYS for
OMAP2, OMAP3, OMAP4 and OMAP5 in ./arch/arm/Kconfig.debug.

These definitions depend on DEBUG_OMAP{2,3,4,5}UART{1,2}; however, only
DEBUG_OMAP2UART{1,2} are defined in ./arch/arm/Kconfig.debug, and
DEBUG_OMAP{3,4,5}UART{1,2} are not defined. Hence, the script
./scripts/checkkconfigsymbols.py warns here on non-existing symbols.
Simply reuse the config DEBUG_OMAP2UART{1,2}; there is no need to define
separate config symbols for OMAP{3,4,5}. So, just delete the dead
references to DEBUG_OMAP{3,4,5}UART{1,2}.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/Kconfig.debug | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index b407b7b9b715..fc2b41d41447 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1593,10 +1593,8 @@ config DEBUG_UART_PHYS
 	default 0x48020000 if DEBUG_OMAP4UART3 || DEBUG_TI81XXUART1
 	default 0x48022000 if DEBUG_TI81XXUART2
 	default 0x48024000 if DEBUG_TI81XXUART3
-	default 0x4806a000 if DEBUG_OMAP2UART1 || DEBUG_OMAP3UART1 || \
-				DEBUG_OMAP4UART1 || DEBUG_OMAP5UART1
-	default 0x4806c000 if DEBUG_OMAP2UART2 || DEBUG_OMAP3UART2 || \
-				DEBUG_OMAP4UART2 || DEBUG_OMAP5UART2
+	default 0x4806a000 if DEBUG_OMAP2UART1
+	default 0x4806c000 if DEBUG_OMAP2UART2
 	default 0x4806e000 if DEBUG_OMAP2UART3 || DEBUG_OMAP4UART4
 	default 0x49020000 if DEBUG_OMAP3UART3
 	default 0x49042000 if DEBUG_OMAP3UART4
@@ -1719,10 +1717,8 @@ config DEBUG_UART_VIRT
 	default 0xfa020000 if DEBUG_OMAP4UART3 || DEBUG_TI81XXUART1
 	default 0xfa022000 if DEBUG_TI81XXUART2
 	default 0xfa024000 if DEBUG_TI81XXUART3
-	default 0xfa06a000 if DEBUG_OMAP2UART1 || DEBUG_OMAP3UART1 || \
-				DEBUG_OMAP4UART1 || DEBUG_OMAP5UART1
-	default 0xfa06c000 if DEBUG_OMAP2UART2 || DEBUG_OMAP3UART2 || \
-				DEBUG_OMAP4UART2 || DEBUG_OMAP5UART2
+	default 0xfa06a000 if DEBUG_OMAP2UART1
+	default 0xfa06c000 if DEBUG_OMAP2UART2
 	default 0xfa06e000 if DEBUG_OMAP2UART3 || DEBUG_OMAP4UART4
 	default 0xfa71e000 if DEBUG_QCOM_UARTDM
 	default 0xfb009000 if DEBUG_REALVIEW_STD_PORT
-- 
2.17.1

