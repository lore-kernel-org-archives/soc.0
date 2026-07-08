Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB743AC0F1
	for <soc@lists.linux.dev>; Wed,  8 Jul 2026 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499125; cv=none; b=I8pzvKvb3KJs/U5Q4+BMAMU7fFiVJH3eOylcdUadn7NNvyDaC67JoZFFPn9YrLZTFQ4NTqaj/WInzMgEBZuaru2JdYCLHBW3xYWT8zE+0lZx80b9od7iakvrIF55ODRD9Wy8RTqe2+IS8eFM6ZaIe15Rle3BjFC2bgEDb7tDaMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499125; c=relaxed/simple;
	bh=6+AWnhGvzr9BcTVL8+ch4QRT0EtaOFi7bOI5xBH/z0c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hCucGbYAmKnOdkkbFsd35okUJTnhXFzvVDPfBht4YxDA9WUehXtOFsFKc9GmuBr1ZvJnHwKjVnAgw6TbmL6jpybAh1PGtQ1r6g3eOC4/keOZbwtDb+cANJbZK34tPA9f0GY8Wh6rfLcO1L5g7qFgr/p1+/EsWYkZP1sUAJv8Ujw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdY6vANw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdY6vANw"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c7c61b5292so8401125ad.0
        for <soc@lists.linux.dev>; Wed, 08 Jul 2026 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499118; x=1784103918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jyaycIlFsITmoKtSt+baeUtSj03KZOHsdXm+Zi9cFI=;
        b=QdY6vANwCjauAfTn4ve/uCDWVKOpEk+rt+x0d2X2/2BrqKvbF7QDeSrBqlAzqEMgZ4
         obN+koqdOMTrAtWj1u2Z7oZE6O0cl/sag+K87paMKYrY8JPr4EiU1Eh+4Be+9Ns+bsSV
         a76W3GstzWcqwJPnG+OvUgGj9LkPaeWYq35zLDhXOdak0X7lvXzy1zfbgQUu0Ui/5ohi
         Rtg1fyCUYf1J7GUYeHoTXt5O24xW3pY/PgLs7l7dfm6zyJIhuBUEPP8y0CQedWQ/p5Dz
         dGP9C+DfM4DlzSmDu2+eJ2ANuC+BiVJCsYyeg0v9g2rD08tetTv282ezf5uxhfK/yHAQ
         f0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499118; x=1784103918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jyaycIlFsITmoKtSt+baeUtSj03KZOHsdXm+Zi9cFI=;
        b=QCK12QoSw/AC6te2YAqQp/1QWij0WY6oqSoIuhnfdnpyh145MoO3/vnRdzY37vKelM
         i7lWY7U9oA8zLDCcuAV70xsSpniq+WsPvo8L5Bur1sKcaTjx5VWT5zVIQky6trEWbJ/r
         AWNeKMUUZ/Fhq9vyyH3c6YHScq6fA5d/ZeOToSJ+oTCDgXgLG7xhI+Z/MsZFppKX3mRz
         guUSCbfDVdOXOdGkqWE8WmjfFJKrMublQUqO//0ebr8aw7NePfqsQu5nhOVq7/f8AQ08
         jglQlpDCJuDQ9ICqijAGphtceTcK6yxWVoH8yZU2Dlde1TfIW1QA/PTJMfbIJPnUYz7G
         j/Rg==
X-Gm-Message-State: AOJu0YwHFx5a7ZxEcdk9+tozNNr48W3USsVnquxct9haCLbKDAIRonSh
	v3dYUUhYGqwvS9Km8/idX+++CSwMdps3SYzG3hMCAb1Tl13w8ODi6U9NgemNQA==
X-Gm-Gg: AfdE7clk1sNEyiM5gshXyiJfRzbVRe/GPcsSyT42gMi1FbF8ekhhgMccrGxMCUxKem3
	iTMV4dPBNewqfWw3dDnzBa31l/R143l0yjsw95TwRI8I6Q3snZ25+BuVExT9d2nWYkmAbyPMrbV
	mkqIy3VjEzgEDeKOE1dcLK5JO2TjngDDC5e/wSxnZKzK6N/k78JNuuzbSN8OBm0x9EeAIyxu9LY
	H0yOxUq7EundLAxS8fbw7yMQ7Ej0HK+WMmo5H+wOBgjOaEa/2kK6uPRm3uW0D88dMRHTT6ItPBm
	EhG3BJGgG7wqz7thE9mYyxu4T6HZc3s/sbYyPf+b+B+C280bFNuIWDGVeA3ydVqSuBjl3ZFmM0J
	aI/nwJa9HH1i980Zp8JRY9N1ye3PCXV5Q+uT9OgKUp+aTE+D7Cnwu7vy75VMTBCZ+VNmkZamcMY
	KleeNVpr5ezOUXmUNK786iu0ggJwVLU5yy4gGYulJFyahLTg9o7WcIg47IjoMsX45VcLhy+K0=
X-Received: by 2002:a17:903:b07:b0:2c8:1c05:16aa with SMTP id d9443c01a7336-2ccea2d56f0mr17414495ad.19.1783499118444;
        Wed, 08 Jul 2026 01:25:18 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d952sm24010315ad.61.2026.07.08.01.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:25:18 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: arnd@arndb.de,
	olof@lixom.net
Cc: soc@lists.linux.dev,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
Date: Wed,  8 Jul 2026 16:24:57 +0800
Message-Id: <20260708082457.460710-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add controller nodes for the four Bosch M_CAN blocks found on the
Nuvoton MA35D1 SoC.

Additionally, configure pinctrl and enable CAN1 and CAN3 on the
MA35D1 SOM board. Also, update the APLL frequency to 200MHz to ensure
the CAN controllers receive the required input clock for 50MHz operation.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
Resend note:
 - resend with the complete Cc list; no patch changes

 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 +++++++++++-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 52 +++++++++++++++++++
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..fb23b0573bdc 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -37,6 +37,22 @@ clk_hxt: clock-hxt {
 	};
 };
 
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1>;
+	assigned-clocks = <&clk CAN1_DIV>;
+	assigned-clock-rates = <50000000>;
+	status = "okay";
+};
+
+&can3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can3>;
+	assigned-clocks = <&clk CAN3_DIV>;
+	assigned-clock-rates = <50000000>;
+	status = "okay";
+};
+
 &clk {
 	assigned-clocks = <&clk CAPLL>,
 			  <&clk DDRPLL>,
@@ -45,7 +61,7 @@ &clk {
 			  <&clk VPLL>;
 	assigned-clock-rates = <800000000>,
 			       <266000000>,
-			       <180000000>,
+			       <200000000>,
 			       <500000000>,
 			       <102000000>;
 	nuvoton,pll-mode = "integer",
@@ -56,6 +72,20 @@ &clk {
 };
 
 &pinctrl {
+	can-grp {
+		pinctrl_can1: can1-pins {
+			nuvoton,pins = <11 14 4>,
+				       <11 15 4>;
+			bias-disable;
+		};
+
+		pinctrl_can3: can3-pins {
+			nuvoton,pins = <11 10 3>,
+				       <11 11 3>;
+			bias-disable;
+		};
+	};
+
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
 			nuvoton,pins = <4 14 1>,
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..494724a25f3b 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -244,6 +244,58 @@ gpion: gpio@340 {
 			};
 		};
 
+		can0: can@403c0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN0_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can1: can@403d0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403d0000 0x0 0x200>, <0x0 0x403d0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN1_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can2: can@403e0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403e0000 0x0 0x200>, <0x0 0x403e0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN2_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can3: can@403f0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403f0000 0x0 0x200>, <0x0 0x403f0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN3_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
 		uart0: serial@40700000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40700000 0x0 0x100>;
-- 
2.34.1

