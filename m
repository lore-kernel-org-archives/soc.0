Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC1C3EE1C9
	for <soc@lists.linux.dev>; Thu, 16 Apr 2026 20:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776370804; cv=none; b=i+Me5GZjoRQYaoWSeSQAUWXhICl/HsQbT4DC/ojb2p5gR/xK9j//TSegRbo0agNWmb5Lm5GBr7H+ZpMHU6v3H9p4lsU8giDZAxA1Qi+XxPkZgXpigWig+zAqaVXQsYrrFQjO/PkCiZ1/Wu9LBSnjlZEXoDqAwyNE5aWCSMqR3uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776370804; c=relaxed/simple;
	bh=qznDUZF4ymL51U10pRa61DaVkLGHZutq7Ba8beA/2rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CRLfRDnDpjtKMdkqOWVrbTc/ZA+zVpcQSWG4uTMZVReaAy6lljZJOxQ3I7Nw78oMQxljq2+qjdmgaaHMcUkczaVaadcyvzB26D9pRkkBZg9gGyF3QWutpMG3iRBxVNmkGIlGnTwXMz6fql0mF82WZPfkkmQU9nG+iK77jPez7nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbBDUI2M; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbBDUI2M"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cfd832155so5834336f8f.1
        for <soc@lists.linux.dev>; Thu, 16 Apr 2026 13:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370793; x=1776975593; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8h2Y0LqQPmXTQq5JIHTyL05LcABjHyNOjfeQXRiytA=;
        b=RbBDUI2McYrGnDq5nuU/1IBHX0rJo6BvIBohDzymF9ec2Dd9ChCq9gDS9z/xWPio+L
         l7SGKojXA75I/pcd832PSZwy56n6E7blyB48MoXyQW4NmSOSRRu02bbvtKKLIy1AC6vn
         a+CYPYsFoSirUzzysNH1dXkWVkToAlx7j4IO1eBSm20aYNVQUtBzbUOygMdfcykI3VBo
         7pyzItFCGudrT2KhrcdAeCDNn5jD4JH6Uc/Fsy7tpqFV2WdhDDt11bzkzQWHyAHp0MhV
         eMijNpBPmq51OtzsdF3vYphpJBGAMSuVh+hAPHVW/fLEuDFs5FLQmM7JX+rF24e3PVOx
         B5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370793; x=1776975593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8h2Y0LqQPmXTQq5JIHTyL05LcABjHyNOjfeQXRiytA=;
        b=W1G+RSWKNQHWM0Wpee5+D0/QbjHs6DOVlrRdVxjZZUmoF67faoEDYW8met/o09jz4m
         e9SZVDj11DazeSSexgDkqDwM4XsMTd5QooyGvMclR9odYYUr52/II0VNWN4g1ewFg/aJ
         h/HoqbCuxQyhUyIbMd6JRIsX0kZSgEQmHxyc1GiilzrBhb56fbgqCJV1p0cmQsvDWqKc
         +FRhLVsPkFBWxd92WdctQm1V1cRw8MOdKrhqEZR9cZKIV45U5abtW0+SiAxgETNKpL7M
         ZOgWwVrWllvvGx2KxNFjTycv1bI7xvTUFsp9sN4LRt0rLLWhFDKI8bYd09I1fVEH3QIA
         SEpA==
X-Forwarded-Encrypted: i=1; AFNElJ+/RTply5V3lIQJul9igq76uCgRTEv+cMwn5Jwv/yJsfEPYRjqPi3X+O3hoVMDR4wEwlME=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfsY2MqvcKWFgFSoBIC9aI/92z1RZhW4o6QtuW9oyqDezcZ7/c
	tUmBPBLb7yi69041uKcPUFPKrsXisbSI+y4gW2PG8fOh0kNYt77C1/eG
X-Gm-Gg: AeBDievFXMBHKnpjd1IoX90jS+1PIiO7+u6/9l4parxrCcWHpY80SndULXBsdKeYnxS
	oRuPWAm+6DbL7AfGgtaSdFdTx4rRC65K4A6Fc1M9kn9HQJYLNf+Wc87XuH3k/EmNzdLTqq/D8YV
	pU26Ae9yTgAE9mSedSiMFmarrpzw0P40+WNCOUUDN+6fiS3aW16ZepdKKOUaahpl/QSzDobHwYV
	6Z0No82xfM2dEk1642E44j7tZY1e4jsPx9msCTe0rqhvWr2OV6e1JQMMLdbH6Gpai9hgszsY2N+
	pJRgAntgH2sTYCaioK6grMStXsbijO6eaxYiAkdaGPm/mNUSlplQsVDN0mfhfIIge+RDtDFzeuk
	0sQvAavuePGXzSipXDTkDw09VeHvcLsfAw8RMMMSF76e83qWQbREu0cz/OZeniZaDPZdL1/R8lA
	5Jg3A5sb86aYit9oJbfjt8M1v1HAYDvp0esRU/hVHil7lu4w==
X-Received: by 2002:a05:6000:2507:b0:43f:dd91:b022 with SMTP id ffacd0b85a97d-43fe15921d9mr1107123f8f.35.1776370792338;
        Thu, 16 Apr 2026 13:19:52 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:19:51 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 16 Apr 2026 23:19:13 +0300
Subject: [PATCH v4 5/8] ARM: dts: Add an armv7 timer for zx297520v3
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-send-v4-5-e19d02b944ec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=qznDUZF4ymL51U10pRa61DaVkLGHZutq7Ba8beA/2rQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URLmC/Ml0WI6oXBseumjwXn28obZZCF4EpdN
 YrIUFZfFdCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFESxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLhmQ//UVrPeabRAXHovU4jP/ngUiwqsT0Mhf0
 iBG/XcA4xed8cfu1/ySQqe+/PWLyX6Cipm7fzVo64+FethSj9Izuj6UJLgcMhiWGudtOt48RqtR
 1uwTO9iw20JHJaoZ8+bfhpYXVIEP+5DwPvZgVnHvhyv48I9tcDq0n+cZ1/QQFEKmMB2r+T+ti0j
 I/Cum4GyJNkgVjB+s9uyDPjDLxhprXBiNyTPuRjjgr/go24CU9z6KbDtIRcF+Jk2DI+s85qiV+8
 pg/t6wnkPSH1Bun+K0gdz/hG+lqZxBlxLXYSGCpE9sTQe6ANvEk8zblgqtyfOwobHn66F6r6Oj4
 XHoxuxicDDhRxV+G9QFRZ2PSfISr+F8kzXxFnsLYmWs46rtdLzgekmb+lGlAwaDpv7E7O5RaRcN
 fF8d4Zd8Ozn3Q6d5cGmdV9Y1WU80kl6PdQ455AxH6Oyh3Pz24bHiTAxi1L3qXGK68r/4LTgWYj3
 LItQiRqLd8M5sl4c6OqTE9gI1g7XqCUPyco3cNHGZS1f4bLcSHklxj0fSMpEh7XEaqD6OqU/g3C
 YhP8RQzokDwE0Nsao1Gx5X+38CZptNXSg8bOSsCM8erfIRLS6Bk5BuLXadRJ8fxES01bOkh6Jh4
 6XVyBsq25YqVCPC3g8LoSU3YWxL9XL5e7EtrA7cR1uWEtgbBAagk=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The stock kernel does not use this timer, but it seems to work fine. The
board has other board-specific timers that would need a driver and I see
no reason to bother with them since the arm standard timer works.

The caveat is the non-standard GIC setup needed to handle the timer's
level-low PPI. This is the responsibility of the boot loader and
documented in Documentation/arch/arm/zte/zx297520v3.rst.

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

