Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BC124E4D1
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 22:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739225410; cv=none; b=Ay5zTou/e6aIrWKdnFCZ3qxUxNZuTuHnNnOYoCPtBAeToMJuGrOzcUn+NxGtCA1zhtSMwLdyB3CruD0k+UCxEjZFTF1FLmtxlSY1xrMjvOVGcsefJkjGSOX9wsx1U+p8QYk4rKnnEEw77Yc/N8/POQKSHG/Z23LXilFY7v7En1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739225410; c=relaxed/simple;
	bh=jfa77/ONY496cJ8PEp5dYqJfCUfCX415nJ3UHlfDQpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9YFZ2rh4aHMfV7j+RAnqhqqJFFBjtQoa+zSxmTZ3jur54dcuJl+D7BQMd3xS+FZVLytjV6adHRxVdn72DLSfILU/KodeBqekl49uOBof0xSDt9it99MGVvjhtbliW6WAqTO9wMMPpa+RH2X+cDED+5rXEn7C1jblP6tHavkcCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJN8Tpa8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJN8Tpa8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38de1a5f039so1051157f8f.2
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 14:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225407; x=1739830207; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqTQGOfqcr22lakzrEU9GmH3j3SEvT+upsozoFTBBWQ=;
        b=dJN8Tpa8fR8yYqJGNsfgJKVLuEdsaTqyg25ou/RqGwDWFSLDf/Hz31yBGYw2KVfI/T
         qqpGBHSyQbWA7pxMgTgTAPUzCqdnrAUpk10kMCiqQJ5avxSPVGx4a8wwiosSXIGpn4Ph
         5s0IndhTemR6cC7cTeeA/GOrrv83N9KogJTwo2HVmPNvsHK/FsgDqUPApKgS+sBE6mVa
         BmPCtj7fF3j1AfAZakiepQcR9mlEfL1Nsipj4jiQvKRgl3Juf2B4QQAnuKmLhD9a5XFH
         yq5MfQqoPD8PFizGChNnNGQfBc/pj63gcOgeTaNhEebPibjY+QnhStIwN95EK7x9DLAI
         6wTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225407; x=1739830207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqTQGOfqcr22lakzrEU9GmH3j3SEvT+upsozoFTBBWQ=;
        b=DwKqHZUyHZpfN8kQu2goPXG6kbZSRAfb83MzGiwdZBl41ssDOtmDFnEFUL2lmMimOq
         KKAWWF8EHhxFOLY1dJtE+J/EdvNMj2BqMr12npWJvTc4SipOI7YrSMmypV/1FhhqOntK
         N+yprE1LZpba1KGx591F6Yl8mZhtE0s/Hmc2dRT01zWJ25NXR8xxQO8tfG0WNK1uMwZj
         lx7opYz5qkFoyEFm+or06mR36gm6Of22YT+I92XuI7QZP57VQANK3zsMSKgknm+P7K9c
         nmmEelqmAVPaKzynDNFdOUnDMDgBzz16aRG0F38h+4jENS2RcGoNRd8/GQIN2QGgqmp6
         F+0g==
X-Gm-Message-State: AOJu0YyVPIr+yR15xtiyN8b+sgXpt9XMdsyYTGC1OaqyWGVYJv6udMOG
	vvVj4dv4EGtudKTkXDKg94PMFvvpjAmn7N95ed9mW+5RZF76ZhO3/Zh072AW
X-Gm-Gg: ASbGncu706XqSgME3koXW9xBpOIEQopd1jflcUR6JEBO9d7w+0yJeaW+c3PuCPuDqPN
	EN3dM0KFJE1AgZQUGmGDLlcoaKECi5tmm8qqTsPJ2nxWaYxzKkZRop7kgqd4x9rRPA4i2Z0z+nV
	ILCt9hArvgzlSPcxx0xroUzbDzWOHtjlrruBfhMqidCw7wmvhSmVzDB7CfFYK+cgG3v+08UV9p/
	A0zL7RMtdA5frv6jPcZXi8G7bX8rpus1lbt6W9h6ELYPlAkncGwyEVKLz/rACzAzIzQcvV47mCj
	eYKeJIhreYAGH2unfLcfCco6K29P
X-Google-Smtp-Source: AGHT+IE8Rd+D6a5FfE4GhUBDXVPl11ELRUcMh1iUYQiQapnXPgx0wFseAaugMpCFZrWcX8Q9xU91dw==
X-Received: by 2002:a05:6000:1542:b0:38d:d0ca:fbaf with SMTP id ffacd0b85a97d-38dd0cb6ab6mr9753836f8f.18.1739225406495;
        Mon, 10 Feb 2025 14:10:06 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:06 -0800 (PST)
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
Subject: [PATCH v2 4/7] arm64: dts: sophgo: Add Duo Module 01
Date: Mon, 10 Feb 2025 23:09:44 +0100
Message-ID: <20250210220951.1248533-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
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

