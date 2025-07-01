Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2F32797AA
	for <soc@lists.linux.dev>; Tue,  1 Jul 2025 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381897; cv=none; b=lpNnjMj+1K2os5ga2y9GD1DYdprbRuvNdfGQOs4qBAS2Z39cnuwsK5R0xLvtf3xg5XYs/JGCcMxjV+jNhrZQaNOcus3qoW9nWH14Gmy+HYG0+W8BmUvzqP7EKyfDR8zb3oF7cYTHlOJVeBIcEmAQ+/EET5m6jHIv+V6/mxXCj0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381897; c=relaxed/simple;
	bh=V3/1Jhz+8jf7kFbZFnPBPOCuvUVUSIhpyy7UQB/kU4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S6G9J1JCjaYKXHH0KWTnwHm91LN44hx+TquFAt1CTFofyBa1rvIJnoRqyCp5aCoLfGavaTWV9ZQacbn+63PXFdgd1n+nyAORM6WIXb++KVBDewRKwfaXEdGTLK/Df8nrt2UnH7eJFWPqY/MGHbTcKKLC5qzBTqRS22vxD1ADkvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GaiH4NsB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GaiH4NsB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-453749aef9eso21895215e9.3
        for <soc@lists.linux.dev>; Tue, 01 Jul 2025 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751381893; x=1751986693; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9SnrP3NnfwuDtIo3bxA5uNn9yAXYdP3Skxl+K4FHxq8=;
        b=GaiH4NsBIeSxuXCCRHWMyRglPNUPHhRnnPCyqOQElhATZ4xOG4ufMosLr5N5xLfpTc
         jcqtwSo9QfZNhn+74L5SxLKUqePKYZ6+Zq/e5AkAay6Cz7cJupGdkFgoiwwpBduTitcI
         7vomrzMygxp+NNantLweNV+aPLkeD/QIA9WzUCAc5CZjQ3Yqb5K7lIGc8ujrR9+yjEyH
         XDQB1icB/R8beIGYyS808CByVXzdGMG6Cc2h4nA2xt0h40+A0HvJKk5UBXrmy36Y672A
         /Qlemv5IdK9/cd2viNAkEF0z4gL29fV0WFYAFAmFUbfni8FheiyVM87j9p6K324QJ4wg
         oXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751381893; x=1751986693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9SnrP3NnfwuDtIo3bxA5uNn9yAXYdP3Skxl+K4FHxq8=;
        b=SHg5wp2Bs7bPsctzKRpNNLxrHkbgGAgSxUd+SCJt+6qO6sQL3lKHSsDhWXpH8ds+GT
         peHY9Lap6WquqC33fWuxlmwOSZ3dC6owxlvVk5V2CQjbDxqT5m3Upwyw3RiRVLKFA33T
         HJPSGQv60Tv2jCyWcuQBFqW5o4wUqKfdD4eIpnHjVEaCpGK7SCoVpx15Ltl09mgpShBZ
         mzHnqlxwr98AE3F8PYwm7Aibq1IeUlTRmxrH/B7Xf75DOyc6B4b1VPwsmj+82qHhthUA
         NZzoaKUxvmPcvlvbhXs8iRVRIoKB5TCBLh6xcGKH04hfknEcAqWjjmcOGCQgIQAAhp8H
         9UGA==
X-Forwarded-Encrypted: i=1; AJvYcCVw4U0UPOtU2BqZjADE8wCWbu5ew5+OhV9UO7o8RY9fvvKbKROWBFdCJyEwhO5fde69J0o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFrHGJ2k6b4XhjggDmYl0Dmh8OxIIC4mQIkDFgNBk2n8Itun3+
	sSun20p/RxsUoYRJs+PulwywdfklYdCQy313WVXiolsU1JKIiSZVoY8QpWgsh0zWDKc=
X-Gm-Gg: ASbGnctfO/aA6elJXrHKanYBrPjmA/jCLb0jQhpoCJfNlrgMLYRD1L0B+02bRBtAGVb
	IodkpY0h78Q3qKs7wA21Khlwnh+LpcyLIC02PfsZGRzHNC5Vo9OOcr+a0dvIRjz7HbokulqsoFg
	p/lZ0cUEbM4s1PFDXuZO5NSQ5Tg4xOcjJdJ6ll2+9c6KN7bGa4RZVMu1gj5pEZ5I01Zx+1WpVVO
	UYT3+KohaFVsmPWG2+5pFL6oGAwZ2BYI7WPVee5UhIKP1/AIZj57/sZOmLW+9JvnOJDqtdzY4ki
	lMJDafrCYVLNAACtzTZSPbDtj8+s1WbCFaejN1Xi3mdeuchgBelUnPO3w0qj2oaAsSFuq7dnuQJ
	28gWVsrTnbOxQ+hq7Zl0z240mRqQUSb+sHJnSHX4=
X-Google-Smtp-Source: AGHT+IHUmoDZ1xCqHU/YoX1VGjQsqIcwCI4NeUvfcRvvMvB3GVl/xxbnk7JsJ/Hkt3zYQQizDFlazQ==
X-Received: by 2002:a05:600c:358d:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-4538ee5d5f8mr208971115e9.16.1751381893014;
        Tue, 01 Jul 2025 07:58:13 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5972bsm13611051f8f.68.2025.07.01.07.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:58:12 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Purva Yeshi <purvayeshi550@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH v2] ARM: dts: lpc32xx: Add #pwm-cells property to the two SoC PWMs
Date: Tue,  1 Jul 2025 16:58:03 +0200
Message-ID: <20250701145803.140004-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1890; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=V3/1Jhz+8jf7kFbZFnPBPOCuvUVUSIhpyy7UQB/kU4E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoY/d8toMLlz9lxSI2Llq56+YvDEDL4asEd5CrC RI5bWIYEqeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGP3fAAKCRCPgPtYfRL+ TktAB/4soWg74PxIEoMJ0HCcBne4dGY+GAy12UbwZonUtaMNIbvMcY+uICUI5B0u1OWZl4yv+VP 6SfkyOG7IK0m4xe2NQdRrvpsoqRmAd/G7pPUziwN2ofDvpNCX1BFZzgaTEufOWjDmCHa1DbbiKf baPqXHW8A7MdPSigqhloWsBqwBlb7rXdL4DruYiINyvGdgbArsjyWVp/UQPptAzln1vrUtu1bN6 vc4Yk2hFGT/YWCRmQqf1sO1BiJLTtZ7tn+jrnlhqwfI9oNZ3LK09QMzYU1jeMKNCuLZqgR+kpGu Y+opYi8G0asrxrSO3LpY3t2rH4Xxj8WqY/RXFk58Py9/d9c2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

If these PWMs are to be used, a #pwm-cells property is necessary. The
right location for that is in the SoC's dtsi file to not make
machine.dts files repeat the value for each usage. Currently the
machines based on nxp/lpc/lpc32xx.dtsi don't make use of the PWMs, so
there are no properties to drop there.

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this patch was send to linux-arm-kernel@lists.infradead.org and a few
other lists but not soc@lists.linux.dev[1]. So Vladimir's appeal to Arnd to
apply it was lost.

The changes compared to (implicit) v1 are:

 - rebase to todays next
 - add Vladimir R-b tag
 - add Arnd and soc@lists.linux.dev to recipents

Thanks for considering
Uwe

[1] https://lore.kernel.org/linux-arm-kernel/20250403104915.251303-2-u.kleine-koenig@baylibre.com/

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 41f41a786f9d..6cf405e9b082 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -481,6 +481,7 @@ pwm1: pwm@4005c000 {
 				compatible = "nxp,lpc3220-pwm";
 				reg = <0x4005c000 0x4>;
 				clocks = <&clk LPC32XX_CLK_PWM1>;
+				#pwm-cells = <3>;
 				assigned-clocks = <&clk LPC32XX_CLK_PWM1>;
 				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
 				status = "disabled";
@@ -490,6 +491,7 @@ pwm2: pwm@4005c004 {
 				compatible = "nxp,lpc3220-pwm";
 				reg = <0x4005c004 0x4>;
 				clocks = <&clk LPC32XX_CLK_PWM2>;
+				#pwm-cells = <3>;
 				assigned-clocks = <&clk LPC32XX_CLK_PWM2>;
 				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
 				status = "disabled";

base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
-- 
2.49.0

