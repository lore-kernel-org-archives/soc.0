Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9727D202F7E
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 22:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739400243; cv=none; b=j+6u9vzWodJt9w+rIB04rAuBoLs4HFWf7Vh0w7iYd6KefZUpxHmCq1dMTWFKHfhVwhzVTwcC/3HmmBFhHwDn9NI6svlVByJ037X2ZGrGUuGxo6BcRVB/hj4GJCquum2SwFT25CwhXezoN0/iBppO8bGSKKI6VTH1Mwc6OcZ7O0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739400243; c=relaxed/simple;
	bh=GDq/EzG6efSIjuAxKcyOcaNWoQlvEShBDR0clYJNdxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHB2j6G3yBA3hdhIRiSEJmDDmYTCxfWU/RBaPhayAnfMRbbVBQNH8T4OhjRsRkln3WOc7IFblQ65A12G1jw03bjFfaZBJISOX4IrJ53IrWmGBoPGPIyaaypVW2ZxXgar30HLqmmoIv7BnABYYrgOZ48Sk94VCYPrK47Iy9xll38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIvIzBA+; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIvIzBA+"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so443273a12.1
        for <soc@lists.linux.dev>; Wed, 12 Feb 2025 14:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400239; x=1740005039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cipA0zbozY6QT98Voya9/YK5DDhe2fsqlIMhAxSJu8=;
        b=jIvIzBA+t7aUVaizvUjMGgA8BgNLpZqK7YwMOd70H4oKWn4kkrNOahGV3r6qfa4s0q
         3JIrlKnyfjPI6TP2+kJa1QpNEDxiRKZmDG1Qx1YMavRloFhGONLyx34wNrXo+rwjXl4x
         UPa73bR3XmIuEblKnTWPCWQ+jJA4AomWT3kuIu/39/Ev20DvmaD6w7WaCulDh95buGNC
         EfJXgL+1TUxkM/hbmrfjOjpECRuZwPVfUwo8hPirsg0pAWkZRtvC5LBlKIViTEdeBuH3
         1P8VbaMMqhc86cpNhb8ZlgPPyOEF5rSwC69d1Yp9DuQQRj6LOAx74YfPo8SnLDEH3Ybo
         KUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400239; x=1740005039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cipA0zbozY6QT98Voya9/YK5DDhe2fsqlIMhAxSJu8=;
        b=wwlpteiaPZLV2eH+YxmKWXU5am6YMUKMXj6pHo+ieZjSNCS3h0+7YThIrZD9Hx7jDt
         mQBQDaltOoHLYDGHI9BsttYd8Vtj6o+Rge13A80abcI0iqnwsYhzH5RdxhAZLf9QLPgN
         SEHDopdFEKasmyR9K1F28lpnzkraOKxWTKiJWohrB8FuIebvV3H01AMvbzztS0I3FQ4w
         dRAx5n8Oz0XKelDi4cYSY/H9b8m4Jvs96ZkD7sX34dDuHcAqWnwONfFSuQvJn7jYKwel
         eK+Y7NYtzEa/648CZ+ZLs+34eOO2B1nd0fAz5c/IxiMi1NRzV0Wj5pS/PTKpMq07OiIT
         8YAQ==
X-Gm-Message-State: AOJu0YxDpCxnblghFFXX9c1OPEXQL4D0MLgd1QqjoYVIzuZKSKKds0XO
	15QvRJbNDqhFaqV6FnQZLVf6KPRkmvsIxl9GNPR2CZUIoM9m8I0W4EwtwCHn
X-Gm-Gg: ASbGncv55BNnHnTCGW7+sRW2ZsnY+AT2hoTWN9xFEjUdi75u8DkpERfnvYClnXG4pYz
	vpRB6J+Yq1mde9L7VQOWCd6ydkT7X8wQDNOcSnkNWMQDEGXWUDtEMt19n77+s9ilPROUj1LUyQ0
	Xt6hpNXrEwvvlqxbpM/CdKwkGW1w+oRSDdsoPlNUfvj/IJKMPbjP6QyEX2orfXkQu0y6fvPmfMr
	CCHPWbMxcjLV98PhRcMRLxadLe4QbYwMFgJ4lCuKX5OILA4Uk6J9Ho0aQIILTlHvjdE/AiIV0W/
	gCl+jm9QBOXTLuGFmf/jDafrssSK
X-Google-Smtp-Source: AGHT+IFwthENllbmOrWic3eDqrN776nf1GeDspbhA+7bZKq2ojkemmpLX+XbKy5VdLrDB8EdIzbctw==
X-Received: by 2002:a05:6402:3806:b0:5dc:eb2:570d with SMTP id 4fb4d7f45d1cf-5decba35546mr666739a12.2.1739400238531;
        Wed, 12 Feb 2025 14:43:58 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:43:58 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 4/7] arm64: dts: sophgo: Add Duo Module 01
Date: Wed, 12 Feb 2025 23:43:36 +0100
Message-ID: <20250212224347.1767819-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Duo Module 01 is a compact module with integrated SG2000,
WI-FI6/BTDM5.4, and eMMC.
Add only support for UART and SDHCI.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
v2:
- sorted all nodes according to DT coding style;
- added "compatible" property;
- renamed the new .dtsi not to use underscores;
- added status = "okay" instead of deleting it;

 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
new file mode 100644
index 000000000000..bb52cdad990a
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01";
+	compatible = "milkv,duo-module-01", "sophgo,sg2000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+/* Wi-Fi */
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+};
-- 
2.48.1

