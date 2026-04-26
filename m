Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A151735EDA4
	for <soc@lists.linux.dev>; Sun, 26 Apr 2026 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777204503; cv=none; b=CIhnM/4vJrbI8z5Gr3mCHPtWHaBrzlQNKmegMEacxYD2kts4hTtbJ+Ay/wfffos9oxN2Kkbb3EmQ4KsV8dwDQytsANyjfIfgUC6/gR+DABDu6gZxD2neOJkZ2362w3MmHoF8pWE2YPvYeS53W1RrHQOHexSc1OvP1jU045dALtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777204503; c=relaxed/simple;
	bh=M2o/Qr31tdSVgMGK7MGptHsdQ8CYwaC7nU5G71DmAdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ppRqoyQvxwrh3IIysu5OcWmP65WavYpf0nVlQfLf56FzrpUwRMYSVau1rx7Y6P1zpcfE8f+BYH1drOK/MO9mdiU38B9kNjm1bS7Ms47ZdSe7DBB/uE/tLLUnb7eLTj2pFu/E/3QI3b/IO2GLMlfqVPiAGaDkvusDqFi+/ChAwYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwCzmvmc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwCzmvmc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891f625344so80978465e9.0
        for <soc@lists.linux.dev>; Sun, 26 Apr 2026 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204500; x=1777809300; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8a6WmnzhZriHz9vEWPuhbpYJDMw8zDZc78JguLRxNCc=;
        b=ZwCzmvmcPNnlPJeUJaFd/1xq8v2orQaOsf7iHG/AtzvDUvuZ7KmnW/PreQnb1Mtfnj
         w8p3up7pWLtXmt1wYW87vkAXkn3O/KMAUfwxODpbb7/ZBJNWb6he5ZK8kFFW/T7Fs0gA
         3ipymFetdgFrOVPyFZ+k42wfUNj4Qbti6HY6x4qPMu2mzrVGSosI5TvyfEHjduYdGYwl
         gm0myayYQ/zqZKqcJiREmU1cvlV2ljRBuMhyiStU0KAq0v9tXEGt12UkYaMMtS5DnGQm
         ZZLF5HaNqabI72Pw0satIs5XpGzpmjwFN4c1v9G4nfGGD8T3fhh2waf4GTRvJuv9nFQq
         4miQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204500; x=1777809300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8a6WmnzhZriHz9vEWPuhbpYJDMw8zDZc78JguLRxNCc=;
        b=FL/lH23ajH3OqLcDDAJBn46Slw36Hro4HsNkWiEY+kCnmG+uvYEwHgj0ayXWLNZlUn
         DEsqvMLhjuQK8ZFrGEV5LuQeAS97WszrZHIuoN0HBF76VEEsleCo/gGgynjnUhgWkqfs
         2OkGN7vRIBbB5nSHuSAya7b+XVC2jmuHrex0zTzXNqmZ3JJiaJvUPUWc0SpGto08sfhR
         sATHRq75mUP7ZBlrB5qzbR9lDt1x/qrsXXm4Mlo8MmOYWX2aeKEU6xmvRVK0ySvWXrrC
         VZu138dbHyvS1C24ZrqlTeO+rz88l82Nah53mpcvIaS3BmEhWlhzvjLV43g1S6GMXz3d
         vdiw==
X-Forwarded-Encrypted: i=1; AFNElJ+fhvNew3n2KiJ9Pi5s59XylXiQ3INgqahokHb6XetFyQWYk7ed5TI7hjbAE6dNzM9O8i0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOb9kLczsSCnbUKSm2y2AFtEcpAUjuMHhj3x09A6sP+hD1q02l
	1f+uAnNyjK4/ZmQ6XYjZ2FwtQCO8473GaCuDAyo1A2Yucp0j8rS9pKqcNGgKKxeptDY=
X-Gm-Gg: AeBDiesMQDciPADV7Pm5HNskX/D+AOIkXh+V9eQ5TopU9yveLR1+AOmxLv6g29YcAr3
	uIAk8FAp59pk4iHhhI+/d1z/Tll4uFiaO63lQaD7UKqUre+aG68YEKiufIPe/5jmXUz6jqmWr1V
	6LKO9UAmCFcydSXCVYEMhTlHWk/Yn/VpDsG9evcUOy+XD8bRAxswXEyCe5DufNzXKRuaW8CGxR1
	/Swp3k8GWG0sr4RxCP6tWAtTcKv2tlbJGkPDLWiu/JN55M9zPlszc94j7NVUnXvD4A2ZWnhu3hd
	U/C/ZW/jIYIokVWTlC8vGdvd/Zrl5lv/PuAx3EerEwSI0dadPL7Y6N1T22DnbAydqDt+TYYPu7B
	Mbn0mWbKkKJvLcr31uIaV/+3aFPTajKW8UQAz+DnJcV/tukxIDrq9JAuH5V7aPlrRru0ylS1ypE
	/O0PuoV2GCBgQBZuhOr1Uy2q1BOa52zbmB1F3MMJA2
X-Received: by 2002:a05:600c:3ba0:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-488fb8b91a7mr505266375e9.12.1777204499997;
        Sun, 26 Apr 2026 04:54:59 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891df9e50asm424018575e9.0.2026.04.26.04.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:54:58 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 26 Apr 2026 14:54:16 +0300
Subject: [PATCH v6 3/6] ARM: zte: Add support for zx29 low level debug
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260426-send-v6-3-d49efa72bb09@gmail.com>
References: <20260426-send-v6-0-d49efa72bb09@gmail.com>
In-Reply-To: <20260426-send-v6-0-d49efa72bb09@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2630;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=M2o/Qr31tdSVgMGK7MGptHsdQ8CYwaC7nU5G71DmAdM=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp7fz+JzGxmOauk8aKEVxmo6rh72jTY/V8V4KqY
 rsSLPEGRV6JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCae38/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJ21A/+PDdEZrFyDSxgwC3ikMTxEDtoXKJ21YF
 T4OgfXM5uzdBNtVEE2VXmoT8+onMkZ6FOHlCLXWOdi6tGbLpetAo6nyajSoscloMOPmDx6lDq6X
 NZIhU2RHcHS/AD09GyHqMtEGLfLMvphbRcDKIaiB6NNDLqnqidMr20pUDuZ5Pem3+0swtV/+o8x
 FnlitxZw8wAwtDKEvqr0/vzWmTLWUX2L8cf7EI9uTXmeDCYVLHgegg6v8QzxM/vnegDEuB1TVaV
 1yaVEyP/iZircjTa8uyt8CGGDcr0yJF2ikPhOEzJ8QC+GyeEqnyyykpbJ1r6kxCY8vEMcjGuPpQ
 liWg/2byZsoC6P+NQjfLd+ZFWSs5nV1TnNl05wdY8Vrz3srEYpV9TKmnHXi42R/riC1Qi/A1ark
 GFe/vhs+/1MWvXpYF1t+OSfKOFMlSO7xi3C8ecuhYbB2pDHPaFrjZNmK6eF4durdbCwguTDiKlI
 QlTBsIBIh2NqiAw0yqfYaTeCXJ9YmSOfXbBX7xqcaHaxVKobWvpBAixMWbb7G+1LF8Jong2SL5I
 2Q2HjehVhCFhqHEu6XiILZXXO/Bp4MA+ZZ6sx7A6UTDOF28td6/0oroVCFayKelST8ScOAU2c6L
 d/UKHI8icsM61yMF+feTpybi09g0e8+C7uMxKegPyWlWDNKSdApE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on the removed zx29 code. A separate (more complicated)
patch will re-add the register map to the pl011 serial driver.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

I am unsure about the virtual address. It doesn't seem to matter, as
long as it is a valid address. This address is based on the old removed
code. Is there a rule-of-thumb physical to virtual mapping I can use to
give a sensible default value?
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
2.53.0

