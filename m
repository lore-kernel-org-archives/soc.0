Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6FF314D0F
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 20:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632516; cv=none; b=iN1sI7gwDhOquP6/suOpHd96Df4yY2UOvIVPHi96kC8+373ZGPCKbnTHkoyKN9Db9NuNk/1a7iI7Bp7dUiOoO8WK94nl41vesoH4pl1uHFBOkeaUDMA8uwy2HswZdTi4/fwhvSboCKE0VySfsm/8QvUwKXr7HCc+NTjk6t35YuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632516; c=relaxed/simple;
	bh=9UIpxGoAkeNxOUfJe1A1H4P64wCmGg/E+JsvN8kIjME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JYZrJx8J+/mwb5oKQSRN/LdoiKPfcCYSkrW8yRgJ9DNmK0B/Aixox8q5pBESJPmd5denx5ZPDzd2FRj+P2hRCCej9aTgkW84QM58dOhnqu+Du+rjv/6RQbLceuyqo0xRxPr3naQHFdhk1kPuehw77s6yB8u8mnKAZFuxdhib2pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kU6Rqif9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kU6Rqif9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359a302794so204517f8f.1
        for <soc@lists.linux.dev>; Wed, 28 Jan 2026 12:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632511; x=1770237311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3F9HezMKTEaGVPPyjWsbKZwsTZraFwywQfjSl+q2oLo=;
        b=kU6Rqif93K86qW4K7bblwcL/dgjnB30LkB5dbZzIOpYzxJk7+RgnirT2ejBAiJWvof
         FvkdevrqX4q5+nthYMBkm7WKln1djdqIpr+Gd+/FUr3w7Mb6BaElnwTywvZkD260Ghc2
         5R14Z0Czf52RG+e5Xgzb2z9Ld3lptQ1gXMjtdPcsJ7bG4rT/5QvUY8mPfWWP2q/ZNu6p
         d/94aIFahVHlh6wfdV0woR+ATvOQmV6QFkLyBI9rZR1X1K3lhZVCAW7Bjon5DgOXcczE
         QBBwWy6T1yMfmeEin0vbQToyDmBBH11tlVtNztwHFjGk3ybLN6OTnWuTDnuU+LRaSTSy
         hDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632511; x=1770237311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3F9HezMKTEaGVPPyjWsbKZwsTZraFwywQfjSl+q2oLo=;
        b=Jvo6kJl/Tq71jF5MJID8pgQqDCvFqmhklaU12EJOJfNH5efwVnTtlLNYq+Cku68LqT
         VmdlTQJSFG4nI9S9/XmVlavRGCQwzu4LH8N050KCV9KL2UkMkdfldTiB9L7F7GKzn38p
         1GlrOAyWm4BboRm/ujAsgpngsVbAuOPmaD+2L3gtY8Q4lVZHNHx+CvUMEmIsMCJiWBEO
         oVi/46rTNU/W1yCJ4sWY07BBxpTAEwm4wpU34Kr92X7vir3QPDoB+ako2tvO3tVwmARb
         4Va+6YtaoymkktFAMa0f8U8rQvI9L9PdrOJgDIa0mR2G6mxTdz0WPcHk7wFfZIP5OwrY
         +iWg==
X-Gm-Message-State: AOJu0YwtHJvncuXxS5XvU2+nR6IhsnsfYr7N0Erw+PVwBqhepkENp1NE
	tXSr7IIUh39RGzuqu34CrBWRrai0cF8sHkjscJ6O0MwuXWPUPA8axO18
X-Gm-Gg: AZuq6aJBjQc7aO+r9e0iJIf7034dhrNK7+NBnhIQ7xYOQKX3OuYOjZVkScKjI5c1+CI
	bf5ggyjdTAV3SEM2DEoSr05yjJsA3oZT23qq4qje+QMDCuwXsLbEyQ3Of4/K5iIBQBREJmkNSlY
	H2guVux9wm9OEQ57HZweGuUI41FC6y6+CW2m9dGB5AXV3/jCO6h69iTeDiICYW+Vk5j6X0IUJNC
	WX0ywOKLIRuXcS5xe4GZYk1Q/ErI0e99D8N+gsrdFCMidF6YeIPaXZAV17fZJotPsLvQL+imW/f
	/lmhZX22gJcXu8O8fa9Dykj41kIrhZZ5+mp8JQ8hZlPipDx4YdyAHa3FxYzG57f6oztlDsBHTTu
	H/I54Nvp6vsuKpb2uRAI8ab3xQSUSGhr5SecxTlpLtQ1u0aY1/DRaaCzycmuC/XYE8AqfX7VPo6
	tfQZM5TzpuY3Q2Le0lGp2cDceS
X-Received: by 2002:a05:6000:2c0a:b0:435:a258:769 with SMTP id ffacd0b85a97d-435dd1d380dmr7717968f8f.59.1769632511430;
        Wed, 28 Jan 2026 12:35:11 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:11 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 4/7] ARM: zte: Add support for zx29 low level debug.
Date: Wed, 28 Jan 2026 23:34:52 +0300
Message-ID: <20260128203455.38569-5-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

TODO: I am not sure about the virtual address.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/Kconfig.debug         | 12 ++++++++++++
 arch/arm/include/debug/pl01x.S |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 366f162e147d..98d8a5a60048 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1331,6 +1331,16 @@ choice
 		  This option selects UART0 on VIA/Wondermedia System-on-a-chip
 		  devices, including VT8500, WM8505, WM8650 and WM8850.
 
+	config DEBUG_ZTE_ZX
+		bool "Kernel low-level debugging via zx29 UART"
+		select DEBUG_UART_PL01X
+		depends on ARCH_ZTE
+		help
+		  Say Y here if you are enabling ZTE zx297520v3 SOC and need
+		  debug UART support. This UART is a PL011 with different
+		  register addresses. The UART for boot messages on zx29 boards
+		  is usually UART1 and is operating at 921600 8N1.
+
 	config DEBUG_ZYNQ_UART0
 		bool "Kernel low-level debugging on Xilinx Zynq using UART0"
 		depends on ARCH_ZYNQ
@@ -1545,6 +1555,7 @@ config DEBUG_UART_8250
 
 config DEBUG_UART_PHYS
 	hex "Physical base address of debug UART"
+	default 0x01408000 if DEBUG_ZTE_ZX
 	default 0x01c28000 if DEBUG_SUNXI_UART0
 	default 0x01c28400 if DEBUG_SUNXI_UART1
 	default 0x01d0c000 if DEBUG_DAVINCI_DA8XX_UART1
@@ -1701,6 +1712,7 @@ config DEBUG_UART_VIRT
 	default 0xf31004c0 if DEBUG_MESON_UARTAO
 	default 0xf4090000 if DEBUG_LPC32XX
 	default 0xf4200000 if DEBUG_GEMINI
+	default 0xf4708000 if DEBUG_ZTE_ZX
 	default 0xf6200000 if DEBUG_PXA_UART1
 	default 0xf7000000 if DEBUG_SUN9I_UART0
 	default 0xf7000000 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART0
diff --git a/arch/arm/include/debug/pl01x.S b/arch/arm/include/debug/pl01x.S
index c7e02d0628bf..0c7bfa4c10db 100644
--- a/arch/arm/include/debug/pl01x.S
+++ b/arch/arm/include/debug/pl01x.S
@@ -8,6 +8,13 @@
 */
 #include <linux/amba/serial.h>
 
+#ifdef CONFIG_DEBUG_ZTE_ZX
+#undef UART01x_DR
+#undef UART01x_FR
+#define UART01x_DR     0x04
+#define UART01x_FR     0x14
+#endif
+
 #ifdef CONFIG_DEBUG_UART_PHYS
 		.macro	addruart, rp, rv, tmp
 		ldr	\rp, =CONFIG_DEBUG_UART_PHYS
-- 
2.52.0

