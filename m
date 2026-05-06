Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA79332629
	for <soc@lists.linux.dev>; Wed,  6 May 2026 19:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096055; cv=none; b=YvGDbQKkR1Ci1F8hhLMawquELnHjkE0j7itHlcBpqQuGdKOrEvecOFrLcoRhJEhL5+1K6S6nIOQUEUL6QC9IXLeyxdtfL0cLDVxd1JP9F14EkKPEqSuPxVTzRA4i/QdQ30lwpewe2u1NOdRIo/AsUEHFaxZqVMGnr8KCkpmgq6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096055; c=relaxed/simple;
	bh=fcg5dGJNBAQyU4b2cL0nA3wqgVJTqz/EfkeGsaL9qZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9Vq30jnAt/3xz640LRBUizRjHNjbfjUDTNIo3G8+GfZcDIHo5IwZ7c0PneuLXj/AqdKLR3LRUcCtFJn6HD9Yn7w/Srk84AR8xvHtCORTnjJydiV/ogy4DqIY3DtCGrqc3WNzFoNGthZhqx0UAn2/LQkGtKaJTHNQDIg7hlbLNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+7kgTqH; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+7kgTqH"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44c350a5b87so49419f8f.3
        for <soc@lists.linux.dev>; Wed, 06 May 2026 12:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096046; x=1778700846; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilUL26n1rjGYeNrOGQ28D9s1uztNCB3AEwbB2W2pXWM=;
        b=r+7kgTqHuh88gLmwzBYnLL+7GA0+nnYSvb7U2q2+hHSBmiXCbhFdp46PwJ2YumSm2C
         U4M5rlZrCN437VQLRcJ1Vgmxar0S8qPQ2QIhvMCLrt8PWnJzsswJWrXUjuKEHc4csLRA
         OKLyD5bDvOPJA7qmqLl/5VZUKa7AAhCltkH44uEqSt7a0+kVXXKQhAzeA1A2MTOigbFz
         glOCKEq05S8H6Lu234RrJ0QUy6XI6rT4xElfRkRvptg+t9Mu4WZwo9H6lYt4FnU9s345
         LgXiiTfLJFxx0bXq6Pe4hl2Em+VB04uC6E7frOp1qwTRQtf0qG3nQOXRmdA7Yp+NjP8p
         X9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096046; x=1778700846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ilUL26n1rjGYeNrOGQ28D9s1uztNCB3AEwbB2W2pXWM=;
        b=K9O5RoSKFM2Blglj/VDx2H/oP9SuoRMQxh7Jt8MeCh9y6argJLDfOITxD+aQBI+Sw+
         ggvuDY9scnxc+gWV8lxnRVft4n8t2H+NZ5M8gkNiqf3NikYj1sgsdYWlxcgD6ZGFDvG2
         cvBBNaQhJzsiHLDXT09h7fJHOn8nOWRk/xu26AggeQ91lxBXVME1W2tK5wc9cNNNnnFq
         ZfG0URBXHPuE+tF4two1uqI9smzjKC2yMSAi9As5xThDtQTvwTXW0t62vXBUGORziXwm
         ZnWIhgB4Oqps5hI3oL3gvZC/3+MMa2S5iFfk1kNvkhPyV7RV/N+7z+YbmmzbY3eai8Bg
         FVEw==
X-Forwarded-Encrypted: i=1; AFNElJ+ogIyERp5+B8RnIeWQzIRX7PJIRjc54Btujoj1td0uLhtTUPBUFmcRS7T5FZS+ydiK25s=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb4bGo2l6XEeCGlbJkrbBXcBy21M+K1erjfw1thgJZXfpIayoY
	JEuFbnHB7sWvXFhwqQU4OoDHl7jR33xzyn3B1f8vRH/k/17sGc9ZKRxW
X-Gm-Gg: AeBDieunvXI3r5c7U0L6RBn76gyy4sRyjmnF1pwX5uWGKuMgEOe2qkJGhvVK8EmXVZ1
	39+j2w3YSY64DpDlWlX/j2MeRwgsh8Ylv+rvjfQW6G7+YrznREdXYAHqvy7LbYHC+Yaca040Zit
	uVQOBypxkXHJX2ynAAfKGSI108s0lsW+F2aywdjncKvwtxfU8LhN2YCks4p7HeLzO77gEFQ0iE6
	KQDIp8zC5mkt9gZx7qhf836Hq4P3lFt9Q5Lr1f6LIrKw9xpBgJyyXtJuLy3/llhqvRvbH4J7x1s
	gHG2zxOhYlP6RgnF7uRIzuKyueef5sIVRPvy0il+3kyT7bS/W2asId6rPAziNkds9fJKZUCGDKC
	O2+ophTcBdXUFzrXiKWjIn+bdU59WnrUv0Utv4I9+l9CX5epyaVmWC/eg0e4Q+EpEbzJicsuerE
	BWVfNlY4Fb53lXoNeqFFLsfiqYMQByL2SazYt5oAtIFgE=
X-Received: by 2002:a05:6000:290c:b0:43b:4982:fc73 with SMTP id ffacd0b85a97d-4515c57465amr8159966f8f.25.1778096045780;
        Wed, 06 May 2026 12:34:05 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm14895673f8f.26.2026.05.06.12.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:34:05 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 06 May 2026 22:33:20 +0300
Subject: [PATCH v8 3/6] ARM: zte: Add support for zx29 low level debug
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-send-v8-3-f1bdf3243b34@gmail.com>
References: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
In-Reply-To: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=fcg5dGJNBAQyU4b2cL0nA3wqgVJTqz/EfkeGsaL9qZo=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp+5eWHMnqBAGLcyW54UYM1CAyGLQMWIHuikrQl
 y0IeI0wWVCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafuXlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKoNg//WNV3zil9essnB/1w2NGojHfI3ct0p7k
 s7kK2TKGuBVgMsUetJH7xCF8c94Nm2AUnnEPsAnWf2ORenjfzAdvqtuDTw7JbVtCCtEoMnm8JwF
 GepqzU6j4p4z9t1hiNP615EHi0cY+N435sJnmOvXK/+WPKwThqx7rCFaakJlr4TdvuxULALOOXx
 pdqSI0dvr8DzynlLLQyc6nPmm0dGtNAZ31NkyoavEiDa6CnoZJtovW4U5OPyp4RS+NNHj+Et3ln
 Yw1qcLBkhYr3KpmzA/qxpFUtgrP1XOxuJweDcPJT0RB9I3UBl/1HpTYmt4uNEIB6QuwDaV1yjI3
 XWPKMwZ4NjPb1uuM2Y+ioJTzAxewvaXU0R1WTmsnnOU3U1qnvqfIpnIcHhP1c6kQi+IXnNyAAnh
 /TBWYv4ajE5JdtAAr0B12Ordg/FiOMm9DfDnhQnlNUaM564a93xn1iMFnH7df8Rk99mIL3kwiEf
 p01lGtGtq+w6+I0gBaDGzzgur+b5yxijspBSodKyeddnGLtUiT05+yWRkvPSJ5fUeasctGdRBQm
 O8+Dx/rgTRRYlBL+rOf5UeDw1v01Jd9dz0HokUTWomjidhZBzCYQCQjeWHWw0e1zxzPPJgugrwD
 ZHx/OHabjruoyJ6LFV/e9OCJiEfpbi+049Ae3I/wZKG+qjcNqHbc=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on the removed zx29 code. A separate (more complicated)
patch will re-add the register map to the pl011 serial driver.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Patch changelog:
v8: Adjust UART01x_FR_BUSY to match the different ZX UART registers
(Sashiko). I am unsure about UART01x_FR_TXFF and my boards do not expose
flow control pins to allow me to test if it works.

I am unsure about the virtual address. It doesn't seem to matter, as
long as it is a valid address. This address is based on the old removed
code. Is there a rule-of-thumb physical to virtual mapping I can use to
give a sensible default value?
---
 arch/arm/Kconfig.debug         | 12 ++++++++++++
 arch/arm/include/debug/pl01x.S |  9 +++++++++
 2 files changed, 21 insertions(+)

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
index c7e02d0628bf..9dcdeed2357d 100644
--- a/arch/arm/include/debug/pl01x.S
+++ b/arch/arm/include/debug/pl01x.S
@@ -8,6 +8,15 @@
 */
 #include <linux/amba/serial.h>
 
+#ifdef CONFIG_DEBUG_ZTE_ZX
+#undef UART01x_DR
+#undef UART01x_FR
+#undef UART01x_FR_BUSY
+#define UART01x_DR		0x04
+#define UART01x_FR		0x14
+#define UART01x_FR_BUSY		(1<<8)
+#endif
+
 #ifdef CONFIG_DEBUG_UART_PHYS
 		.macro	addruart, rp, rv, tmp
 		ldr	\rp, =CONFIG_DEBUG_UART_PHYS

-- 
2.53.0

