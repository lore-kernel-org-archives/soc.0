Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9312F744A
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 20:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632522; cv=none; b=FCA6zNIeErSpdoRk7Z0R8phlltmHxsR1Xn5W3Ng/wbtGJVyaay01VDWpIxku8PYVGC6S6L+3MFmc1CNawOUxWaCyMw3wSpqZNkFmiu2bVTGUM4EB2V9lidOKZdz8ybDH3K32R/qkH95G4OnHra7cWeBeZAJePu8vndikEC39koI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632522; c=relaxed/simple;
	bh=kdAdOGFgUZKRwr8AtGLjG6tefPK8/cAUNXpeNA7qVZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RvyIWZ0XGzTR9+Uepdds9pEBKxcAvb8zBGEm5JajLvFQqYUaxE6z/x13szvvVyF5AgaTqdS3qDIduZVU2UcSW28eWrs3EwYKwWh7PWinZi6b2ekR097M3OtCnz1HqhfJkJdJiVPB1v3QDMTeSZjah/4/qZ6iuw/vYYpnIBB9sa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7ieEESW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7ieEESW"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so1797185e9.3
        for <soc@lists.linux.dev>; Wed, 28 Jan 2026 12:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632519; x=1770237319; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEmpOzcIBlkA1huyHqaVTW0k9KksYnxs738QX2I8sa4=;
        b=T7ieEESW1L0DpwZD8rGxiKmRlksGs58jGe4M3FzAxno4bcqd5/y0h2g+RBNLqGr6qx
         4KQXiamOdWqfnoDG4beTrX3htQhBimufcJiihJElrPaUi0ZfzJTr4d9cTwHfkEUWYpaC
         EqTBtwwpqyuokG8LzqTf3wAfvGogJHUasp6izNzl1HnJuVMPlxCMzDM3YNzpueo7/A57
         VPrg5R8m7EHpcIJhO4zLiqsNHYI+xkeZgIaZ2vr3JjjivTSN9vSpBw5kuqnarfHKFuvV
         HXc1AooPcetXeOriGIJr+YMw8cadZTbBrVNYHtKquwGAW8ImtorzXfsa8PL7FdFqvHGH
         vTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632519; x=1770237319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NEmpOzcIBlkA1huyHqaVTW0k9KksYnxs738QX2I8sa4=;
        b=d/ocbI/YDQ75CTgo0vGJB52tTRKjdtbZN3dImMUqBZBqH+OMjGsnDUCKBr7caCMJ8v
         eeF3MxuX1Ssya4qzqQhQgy8TAnPzHDxhIjHoX47B4IEHuJGRn2/5ShB6qnJ2fcR9+Ojf
         +n6QW4awmj2en0iPg2/4mujZjVUJ3G9UVuVi7mUxnO7buLZWVTSl28hfQhEiNLuevIE9
         iZUbM2bgF5QYenEsV2LqLUJtsoa6/VAFRRInWbrgnyOAgvZvgzGk/CwFhRDGm8rl3c4k
         s+xFEWr88ZNWxB+q0K08a56KvQzrfMhrBTCI2+zeQj5rA99ObmGvcQx4EqSIh23nxikC
         /8Zg==
X-Gm-Message-State: AOJu0YyJbS/4TIF7lioo1jrmZTVo/EVArD95bD8dtWVSj5piz12krE9j
	RtuLNOP9PtymmJrQLftQgGkbRl0tHZkYhD/SEvHW6LNGhKmoKfZy1PfA
X-Gm-Gg: AZuq6aJLzDfrq64i/PvoRxR2dxrKFjrl3tnntNQuKTIg1Jdj0ArYUUkX6dVh2mOqw5x
	+wEEa3mnpm8deSHVRzbge+gTllJ0Uw+1YqGnsVxr6DIEPk/I74tTKVJp+AF8gOxbXDTGY5turm5
	X28cLfjHyi25ttDRfUlrrX6XKjeREOeCACbQM/3jNbKNR/hlxKYES0QjqAu0+Q1caYhzM9BG91/
	d2M3xktzWVYcYqlh30SRXDdWYDH++K0RoU5enMrNAHKBRIwfHIn6M7olSxvnhSPS7TTAOc5CX/p
	98p3HbZjuC/VauElME+cfA/+3dB+YXI8vFqp5B4QAxjUiETwKP9Vm1a1lz4pvxQmaJFSWblPaD9
	TrnhQAWyEV15UJtYmwLGSWNot/c+MLhUYrO9nL3q5i8PT5tN4WYVFVK6788JCm8gHnhVvq5PirQ
	NBRzQnVlva6Oj9DmRx5VT0WXQdwqEcLTCEbgs=
X-Received: by 2002:a05:600c:3f0b:b0:47e:e20e:bbb2 with SMTP id 5b1f17b1804b1-48069c0e198mr86825655e9.7.1769632519415;
        Wed, 28 Jan 2026 12:35:19 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:19 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 7/7] ARM: dts: Declare UART1 on zx297520v3 boards.
Date: Wed, 28 Jan 2026 23:34:55 +0300
Message-ID: <20260128203455.38569-8-stefandoesinger@gmail.com>
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

This is the UART that sends Uboot messages and is accessible via pins on
the boards I have seen so far. UART0 and UART2 exist as well, but don't
have pins enabled by the bootloader. They will be added later.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
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

