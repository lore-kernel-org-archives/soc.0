Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5900B257854
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 20:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632519; cv=none; b=FDaaI9RcDvRGYR7SHO5fbEBKdJjktQiAomcRMIA0oDKq5JBRaANZBK/DCM5+KXxDu8gLlAbH9G9/GuOMo6u7SC2cf45UkRgm8kZTnkoVuicL8eXvvdR1QRWb7kl2EYzO516quFMvDqTM1qtBDIzOU/rKtTyq4wOPDNsZ9JuDFq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632519; c=relaxed/simple;
	bh=D4lsEPEuAdBLjTHnWN02yQj/qChhhrsCdqYTGEgxEp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ou100AeMnXkFy3dr1EGaTFDjsajFLSEgVU7L9EO3ignpL0We116iYFjGw8rYlbQ/WEX1ASNF+SYcxfKM9URLRdhpm3D+ZeNxiGDDpmdEQt4jIoVeKdwo+ZqfZV/DwOh+2MK8YKSiufaLb1u3RrcnvalZyjunEOFfZ8okYDiazp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqHaa0fe; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqHaa0fe"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so268606f8f.1
        for <soc@lists.linux.dev>; Wed, 28 Jan 2026 12:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632514; x=1770237314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TG/VYLW8d8WUt5vElKzMRZGMulWbxOL8O7SIiAnHR0Q=;
        b=BqHaa0fe1SSorcx8u+Xb6KTEV7+Sw7tvLV5xhsBe4fYyNBhwhIzksqhmEOpgXhYi86
         ixYkp9gjvb3P7pEqDAcCzblS9uP114KI5ffJoo13+XHfP3dyDFXbcfN0Y/D+aBrmE6tN
         5NPe2MM8w3jJyHTWEb9Gavzjtlithc/xn5VH4mjR9dFdpO133W3ntxmqTRLdLtHFD6ST
         uGP+6ucTpRTAA98M7lFuly2Z34SET4Be89eZG3glIMcMIzyiVDkp9Rzf2i1tZQQSIwPY
         driKWOcIGjaHmm4gBDtGOeD6DQflKf0zCejFz95ZtvJEwM7A/gbo7I5PXsS4seUPJTzm
         SgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632514; x=1770237314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TG/VYLW8d8WUt5vElKzMRZGMulWbxOL8O7SIiAnHR0Q=;
        b=P0YD6edRzNZfvH+HVEy4UPdUaaemb2sq5I6Xg44cnNm7k1By3vfrKhkfJhZdd4i9rq
         nswdHRKFt2qb369VyqHvJ315QAM4kWSg5G26PT3yyJe15XzzSjjWtHMvMbxoKNSEIg3e
         pryz4PNnPUbX2HoPcqfZikh3HRZOwfRvh5K//A7er3CrxAbNZFhYThaKp6Q/K0hh9lTf
         zPEx+yu1Ku2hlNvdS0qfUUi9qgMKm7b2IVTeuACl+jtVNQ4kHDBZdLVD4vuyd0VKKJDX
         TwwTVl0HQzkwI1ocE8EWvynYqCtF09pO+/nHSN6rWS8MBlN+4jdprd8iRfRw81P2Km8n
         7M/g==
X-Gm-Message-State: AOJu0YymSanfjpP/Hdo00YeqJZlvc/JW95zjvsqIvGYgQQvtj5YxDNV7
	okl8ue02Izakz8WSITHg5JUYeS6Nk6eooSXGzaLjjkX55Jjoy8XA4dZY
X-Gm-Gg: AZuq6aJYi4zw9QO1075A+VwDSZdC3ozWvImunXxVpUfPXTz6rspKDe+GZ8NFxmZakmk
	2JzAQCj/DcKxR3TJ8NKWmmqPvnYw7CSx64Jw2TjfNfg89WalpVxPyLM9AmdO5QYxnK8Z6UKwO2a
	jP+Rxn08558IoK7myTrWacuwsSF1xKwr1eyBx2TmJleczcWboQcMou/BqeWP9vgT+05AswFnHtD
	RIPiBmtkjzAOUnMSoXnKIYS9coHNq+4yCcY/+gsnEfEXjxb9r5hTZpS8kv03fQJ0TQnj17IXNWW
	8GBnlYKyKgAtAqwgcjCnEsnhEz8GQoXznoC5COzC49obNP6iDnjgg3AIAlBh7rqRe0mef6E8y2Z
	MdeNG5zMmiuyI72dzZWUavWuYtzLyB+MQ67GV2L1GxulhR3kyPNHJ9HWVX3dAUm4FU3Usg13Gu8
	k8YhPWr/7DNmpUzZF8BlGgjLR7Bc0TGibZgu8=
X-Received: by 2002:a05:6000:2c04:b0:432:da3b:5941 with SMTP id ffacd0b85a97d-435dd030495mr8986801f8f.21.1769632513968;
        Wed, 28 Jan 2026 12:35:13 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:13 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 5/7] ARM: dts: Add an armv7 timer for zx297520v3.
Date: Wed, 28 Jan 2026 23:34:53 +0300
Message-ID: <20260128203455.38569-6-stefandoesinger@gmail.com>
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

The stock kernel does not use this timer, but it seems to work fine. The
board has other board-specific timers that would need a driver and I see
no reason to bother with them since the arm standard timer works.

The caveat is the non-standard GIC setup needed to handle the timer's
level-low PPI.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index d6c71d52b26c..ecd07f3fb8b3 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -24,6 +24,15 @@ soc {
 		interrupt-parent = <&gic>;
 		ranges;
 
+		/* The GIC has a non-standard way of configuring ints between level-low/level
+		 * high or rising edge/falling edge at 0xf2202070 and onwards. See AP_INT_MODE_BASE
+		 * and AP_PPI_MODE_REG in the ZTE kernel, although the offsets in the kernel source
+		 * seem wrong.
+		 *
+		 * Everything defaults to active-high/rising edge, but the timer is active-low. We
+		 * currently rely on the boot loader to change timer IRQs to active-low for us for
+		 * now.
+		 */
 		gic: interrupt-controller@f2000000 {
 			compatible = "arm,gic-v3";
 			interrupt-controller;
@@ -33,5 +42,20 @@ gic: interrupt-controller@f2000000 {
 			reg = <0xf2000000 0x10000>,
 			      <0xf2040000 0x20000>;
 		};
+
+		timer {
+			compatible = "arm,armv7-timer";
+			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			clock-frequency = <26000000>;
+			interrupt-parent = <&gic>;
+			/* I don't think uboot sets CNTVOFF and the stock kernel doesn't use the
+			 * arm timer at all. Since this is a single CPU system I don't think it
+			 * really matters that the offset is random though.
+			 */
+			arm,cpu-registers-not-fw-configured;
+		};
 	};
 };
-- 
2.52.0

