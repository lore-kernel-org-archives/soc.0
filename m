Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700E5423A76
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 19:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490065; cv=none; b=EFwCi+l6pejhlADKNZkF2lQez9LYLZxT6FP3MeOraCNJvYPbi3Os5Diw/Et+bOvgrWYtEyJx6nim/l2Lgpg9mLZy8aNNOtEOyQHt3gMRiS6B1jxxeFteKSnRdrcH5/jwOSXTvGEGdBa8MHPOEHiy8ZRDA+MWXGMIHmWXrzEdzIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490065; c=relaxed/simple;
	bh=M2o/Qr31tdSVgMGK7MGptHsdQ8CYwaC7nU5G71DmAdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gyw/12LO46GVZPDusHWpt2C62m6JXkGjdFIgpiOwfi9zVEau5iuK0/Q0zc7YVKpu9Uqqda7kKW5y35m5xHKQ1CGTNz8xoZgirMnt0J5ZVe18FcRhGXnZy6LW0KLIfrIl8Xk4sGC9zAUKfCfVMMmMSAtlA+6uEhistQdgLKU7MXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTufx7q3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTufx7q3"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483487335c2so1181005e9.2
        for <soc@lists.linux.dev>; Wed, 29 Apr 2026 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777490062; x=1778094862; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8a6WmnzhZriHz9vEWPuhbpYJDMw8zDZc78JguLRxNCc=;
        b=HTufx7q3C0w0iIW4F3cqJz+CCRiniUVkkvxnuTjJgsAf+Ks2AWIwFdwZFUX1QXC62W
         2CXr2KLtdcOaXs93q5ZDCMdzPOpmG00ycH8qPxdTuhFkfO7jjKcoqIwQyejUw+8MqISO
         XfzNxP5rV5UaTo8V3sxXJ5QUHFTzPnSOXsqDQekLu9ZWF3R5CHZAPrCSlJQIDRISf3O/
         ULj6fP3Dq18uiDAfMf/9Y3cTvAnIeNlbe2oLTtf+T44n0Um06xYE1T9TJMrQBKbpmY+a
         hcMT27tpHlWSkzOuAfYd2sX8ArPJEB71/aWswn1pO3eXoBpihV4suunNIMGR4EbQ8Vcj
         F1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490062; x=1778094862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8a6WmnzhZriHz9vEWPuhbpYJDMw8zDZc78JguLRxNCc=;
        b=S50L+KHzxDdWM82EFBjCTBSzWxDpeSGDnotepDckppvsS5FYPd7abrEl2Pyi+sEZOt
         YUtNE1x+KGI4MtjJ7m0QD4UzJi/0ggL8Nda1ygyvUMXBSAGNH7JGaj3vO93Fg78+cWd5
         KJDcXOQBRt6mjUzg9uPIBjoa5I+08xhY+hO23otT803vhW168bv2zwHZzQONaiSSFLaY
         5zvak5bIZ9w4aUIqps6OFb8j0skSSPk4pL3uHsTesVJ7Q+AIuPrgSOiwYTvs8HMdBtIH
         +ThzvXD4U63BFIXdDtidkSwz0duwayYGAuOZQhKHQSXNI9cjILZ8cmvWZydPdpMvr9OS
         0N0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8C9CpvdZTh6VP2Y56hvett4bkYDW4FXTAQhP+CZ81Xp2XdvTcUP8ZaU3iOE7GLGyJhAK4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwYBnl9n77hBB1QFPGKizepnAbHWvqSPUo2tzWJR5i40t4txFi
	JsU5Z+QOlkncpBXNzWIHyoYSiyJ4nXZlNTExoPil10I+y8Z5Mg9sPY6L
X-Gm-Gg: AeBDiev9Lu7sg+vEoQd5gq5jdFrzRspFAaEf2BhksxZLZ7N/Nd1cCf0L0VXHmT+wWX1
	3yoBzX6i+LCYr2E7jUbueeg15SZZmgg5ewL8/WJvT/q818AY7PfEKOLHIZYZK9JEcGiiYb3M/Zy
	RdrMDBL9vr0Jfuu37b95/nKcDjJh2keL8J2QOjEk8ZscUGSXv+3cT7JvBcpSHGR5aDnT1LBRVCo
	LJxUYqRhUdgNOOrazaxWKIyWut71oBVnTlCKIaEMFwunklZaWFthkSkpmVmCo6v85ambHowl0Bx
	qgkuVGSJCZW3yAhtqmTxgDF7RhvisEvFYR3ua5nklH3CHnp6INEoZ97ycIKgo59ooqBI1WqdvoZ
	n7D/9Bn3+IAlklMqCfZ6pafVDJB45ZeWtJYNr3DFVe2niBtZgPVUiw3xGjJenBQASGBhjb1VqzV
	PW0U1cE0dEP6oBpFgQE2q6NnoF/Hr2INp6TxMPWgVahk4lwQsK0ry3mg==
X-Received: by 2002:a05:600c:3d90:b0:488:b239:77ec with SMTP id 5b1f17b1804b1-48a77b1781cmr145135425e9.17.1777490061506;
        Wed, 29 Apr 2026 12:14:21 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c316d7esm23315005e9.24.2026.04.29.12.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:14:20 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 29 Apr 2026 22:13:14 +0300
Subject: [PATCH v7 3/6] ARM: zte: Add support for zx29 low level debug
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-send-v7-3-b432e00d2db8@gmail.com>
References: <20260429-send-v7-0-b432e00d2db8@gmail.com>
In-Reply-To: <20260429-send-v7-0-b432e00d2db8@gmail.com>
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
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp8lh1uHld2kPX/8v2HJbRvy3ZwFQDa0OSTcuv+
 3Kf5aBkmCiJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafJYdRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLcqA/6ApdrD8oX5RPE4JAHnJAWFBos5HFL/o2
 XpNBXS+K9DRL+91EY4to310L+6z8TQUfVqrk6vT7uP51Htp4rLo/uARsSbhPjQy1cNh3ao1SJDE
 QSKaiv7L6V28sOG3uZuFOr8tv0vpjoIeYnquTU0Gatryy6thQB8C/MkegTMkAnAC6cxYcHt8OD/
 b5r0sKjrMOJW5th8V6XCxmGEM284cWRjPuVCrhHf7+hBLRzu6eyMJITtCVq/PwWc6ORnu01LuEP
 tFBEjZcpB2AbeDG+Jadntjmrnnlw8UYCHth1SgL2z6Dp+HIqj4xUPu+cLoZiY/QpDHqW5bNyipa
 IrwZqC5FWMt+sSEHGAeTOaLIlgvbGgFrVX00vAk0llThQglR2tPjYi7LxhoF9w2OOc7DhaGD2uB
 vVM2bxL0GQxUB+O1ksEb4lW/cuySwq9iTj1xmwTncmyq/YtwpXrLybTkrMx6/Qg4ThWwsZqNnn6
 irosXvwUcEXciS1mNGEz8hhwrVmFo4y8q/vyn+TV2GMeLIH+lqeg+v2aC1JlY6mgqvR3y9LGLxB
 huWQ2AZwCam0n0gUIZj7xS+yXFhQTxgjPGbMsjhGqVh5leaw4Rvft7M/rnjjBbQOy3ALyM8WkJy
 8A116eIV8pRrCb6eTl0JrllUjOb02B99OzBB0OidNpqj3+C9ANvw=
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

