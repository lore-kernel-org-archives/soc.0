Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D373EDAD6
	for <soc@lists.linux.dev>; Thu, 16 Apr 2026 20:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776370810; cv=none; b=EB1+uD5ws27Eba20MWx+O02l5GciAarrFjn/RXMHJvTyA4YlT2r/6EBB2LoiYtlDG1DwCnxb7Sv/dlxDDYFqGT5Acb7Q+H9wRnEl3wyTVcVVCz+f1XEVNQyEZBkSrm+SghCoCBIxDeN6TitQ0m9qZ8HcJpPWGqH9SMvuMWNs/2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776370810; c=relaxed/simple;
	bh=OkP3mdKoK/wb2ZT5jYJ/ZVN3/jOhvWuJhUE9h0qF2VQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tuujyYLZ2DJeAwfx00/3Y9kR5F1Tw/puJBkJjK/lY9PsPWikntP3tNZyvYulBjLVBgFG4kaNVmjGoJrK8aLBtWnDkXtU/NOourNl2XVWZzbNHA/eMmOxAdCMyDAk+b1TaMpGdg6RvMnjnSizclihXf1eAZVEK6QY3Bz+Jcwg8Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hof+Z5Im; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hof+Z5Im"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cfce3a195so5121716f8f.2
        for <soc@lists.linux.dev>; Thu, 16 Apr 2026 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370801; x=1776975601; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sy9TqEHIxN6NK0fYsnvnEQIWM0euuGHsvcvwSpdM1gA=;
        b=hof+Z5ImG9BcbTYKnEd0AwQQdi+2Gp5vQ/UwGSsLfs5Zb6xG8VBHvFsxSsTkDsxVTi
         qbzvElAxCDR+eRt2b+jLi4u1F1DHfoy736vGSHm2ES6GjxFehmF6YeVdnbA+LVAXp049
         0+x3pLHuS/gCRB55UfO8ktkCMzl3HVfzFYJxQ60KxYeTZya02O27kLpuHD6QqF3uYXyR
         85C+Y10pR7spaQnTjdThPIg95mkIFrwUu3BbAO7a3zJaEybfOrjHoSvUEzrSUq3v6Thb
         ul6M+8DIxz7IJv12PqBuceNnzwzNNGFv5UDISd3wFtQm3Oto2jG4v/XWr73Y5a7rK/Sz
         Vlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370801; x=1776975601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sy9TqEHIxN6NK0fYsnvnEQIWM0euuGHsvcvwSpdM1gA=;
        b=etQwibJNR/vyWZJcVO15btWtaMh6SRqqPDpQ34OkJQmIU3g+oVxYoXPt3J20grI1Pl
         X8qeSCrXaXEKTiKk6eDleUkWxgXzG6F/W15fmFFsjLYWlIme9oklC3KG234WYBq9h1TO
         giYTq+56VsoIvkDn2+eFukQOvYPqWVmeBP7IP7U41XckpvKXe8k8CI1Wivp3h9+u8vXv
         LMIAxQfMBQ7hLrZlOV/frVVG4y/fy2qL+QCoyBCPgkXKgmZLw4Qe6tdm2YS9Kf66ityK
         HbP60tXgLQNIkuo4zqUstTFGz2s+tosHGAIcpW5aigpu4ZJ0Zkl+KAD+s7vIPJxj+G2v
         szEA==
X-Forwarded-Encrypted: i=1; AFNElJ9GMLWPqyeXcstg+dRVjA6IQ7JqQP8FyXEH//UeEfibsHuSj4YliaXtO60un38RXYUPXCg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr4wbMYSrFlcJk3YpvnN9IkPwTphWhehHWxfzut6UZBBxesL8B
	RyXCXYkXGIBWENXVJef1HXkEoPvWc0vBCMZFXLmYZAnFkF76k+weA3Vh
X-Gm-Gg: AeBDietvz9qrRy4umR0VEKqsY+1ukqKY/auLojDS1wH0rXk8Iq9p5m+YYlSde9ZH61z
	zV2PeEla0t1L2If1YGokl5aB8ca6zX8qrKR6JdaKLaB0TeMZdgesnx44e3MmH7rKf+oP12YwO4X
	kkD6DPuW3PU/15lZtComo8HoqfE68OSW+MYs7t9FqxiOcLyPWOeIBn9XWJUDIiaVZh6XG5iAH6p
	AFbKiz1IjjRz7qXts/uaEJh/Fh/wNdcVNqKNk4eovy21Psjm89igGvmDnMyTBjfLMgokOad7Zrk
	9+5KpGgw8pXOaI4tgScnHWg1cJRw5LcYm4UwTPjoEe7dRybemYe1yuPj6toNhSMF6IsDdQILs7m
	u5ijGZrJWAw9iWLcg17geqD1cJ2XjKLWq6uzeF3qLDM9Br/oPi5PE9wi8DTYs5gxkuE2DWMxiJo
	XTBS13AFY24zcM8pgVB4EVNAkfHA/d+7h68PDVg9/EnmNRdg==
X-Received: by 2002:a05:6000:26cf:b0:43d:4a43:53db with SMTP id ffacd0b85a97d-43fe1596617mr1025259f8f.26.1776370801383;
        Thu, 16 Apr 2026 13:20:01 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:20:00 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 16 Apr 2026 23:19:15 +0300
Subject: [PATCH v4 7/8] ARM: dts: Declare UART1 on zx297520v3 boards
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-send-v4-7-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
In-Reply-To: <20260416-send-v4-0-e19d02b944ec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=OkP3mdKoK/wb2ZT5jYJ/ZVN3/jOhvWuJhUE9h0qF2VQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URLcuxim/TQS8pbKO5tQensiaHCwPrFRWbsQ
 gPtxXIEKtaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFESxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI07g/+J3gFaCAibP2Uu0oP9XXc2ViXRxyXuQ6
 FAr5syZvJc3oJiuQ8lPxaVfhIeRQ/TzRFaWYm4TqFFcoF8CFQku3LTCQ6CC3inaT1TFnlUH7LDB
 DsBg/9ZCh836vnGTHhbrR4IiqackyVH2zvAqFSqk4mfvSASEuNdyOXELcC3/moctlguw8xpR/qk
 ienfNlJqmmmy50hafQi8gmr7xx9zwBLOV4aBbQfX+Zp6v1KZ7hxMaSknODVoa4AmVKIpSOzbulH
 NsGOCLhnJyeYwYU9Uu7CRZqf2cCVeLSJf7fWHvmVxa94/DoAHMl0O4d+EweIqKbH1zPxkQQJ0TF
 bi3cfdDQI3GNgboNRWpm1kyhyplaw/+CG0r8OaZbt9z7DVw3+bdKEVaKDkCl6Gfw3PcJjfYTjsj
 rC/vAByXUmH5gMnozEauB6uMQX1ZY/mcqfvfymRnOOu4CokkWbDMLvFnvj9XEmNjYI4Tc1qlhEH
 KgQKGHrK/pBDTb027GsLc9Gqcb00VrrniSvf3V/AjwlJ/yhMILQzBrgaSg5BJKxcL7EEUTU7vDO
 pqzhEYa/7l+q14+34gB9Pu9fangdFK4cB/jwYClSMrZNlZFnnmlYXtwGeIWRMrvkq2s3haie5dj
 uD7zjc/BZ/mFFBqWm9n9JhgrrQl25WEY1fsfP7pI8rXoDDu79KTc=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is the UART that sends Uboot messages and is accessible via pins on
the boards I have seen so far. UART0 and UART2 exist as well in the SoC
and can be used with the right pinmux settings on some boards. They will
be added later.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

The reason why I add the serial1=uart1 alias is to keep console=ttyAMA1
stable regardless of the other enabled UARTs. UART0, as the name
implies, has a lower MMIO address, but uart1 is the one that usually has
the boot output and console.
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index ecd07f3fb8b3..09fbb1d052e3 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -6,6 +6,10 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	aliases {
+		serial1 = &uart1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -57,5 +61,23 @@ timer {
 			 */
 			arm,cpu-registers-not-fw-configured;
 		};
+
+		/* The UART clock defaults to 26 mhz. It will be replaced when the zx29 clock
+		 * framework is added.
+		 */
+		uartclk: uartclk: clock-26000000 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <26000000>;
+		};
+
+		uart1: serial@1408000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x001feffe>;
+			reg = <0x01408000 0x1000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>;
+			clock-names = "apb_pclk";
+		};
 	};
 };

-- 
2.52.0

