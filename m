Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3368245024
	for <soc@lists.linux.dev>; Thu, 13 Feb 2025 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739470942; cv=none; b=rsRV/mz3tXoWui86kmakEfX9UVCSO/pp8la7O1EEBP+C2RNPDgVGb23v+OMFjizpTOHFiTIFgB81b+z2avkOAbvbIhAp9pQdy07hLUnYVSYyo7F29F/vsMPgsYjaegqygFWxwseBduhHL2B8AIcQtIDOs17wD8EeNq0OAYhMMb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739470942; c=relaxed/simple;
	bh=7I3ZjUyk2PozcGFzAyFdx01nt7YHiigZMQdN0OcdeJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPDXrUaCJOtWr9yMzeFYrvD7Bl0NLG8Tqhvr34OH5dGbhj6iiJc0xnsABgemAIz42Nny1YSJIr0+LEtaDWAoRwSXcHDzUCQTNU+eGX6/25ZIXAvsCk9NYMxO8bK2qpaZ77IHYpiXvymBuAgdMr74luqvz+UQ7sd5gGuTUfRtGY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fo8JQLX7; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fo8JQLX7"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5deb1b8e1bcso2251858a12.0
        for <soc@lists.linux.dev>; Thu, 13 Feb 2025 10:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470939; x=1740075739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQIZ1/JS/EZe8uaQG5MXz9aibtSuptWifTs0OB1seYI=;
        b=fo8JQLX7JovADNTFUZe6SmowSLnReCjGPM58muSk4qL6ZmRSRTBaS9mX/Hg8XSUdav
         elikA+nhMflPeA8bJcrPQ+bpnIWvlAF5y0d8mZWwMCM4C+51kKuAJqc+tChARCmObDen
         1r0Ht6lQF0o7NBiMIUePUV+KOsz1v6491tCDL2AHOUztDbZY7FnP1vIh2lIyHnxfCgr/
         UpLHIB8Jj3ZeP7ARlyWqbMQ1tuOo3now7r5eW5a++xd/EDLY9X+jtM5NpUMoWfE42Did
         SZJnEY3FzSLnZ5s+tCpFvTxwsPl06DyNpefxhmoS6A/A7oq80hhh2zBVW3FR1TCYTrpO
         NTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470939; x=1740075739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQIZ1/JS/EZe8uaQG5MXz9aibtSuptWifTs0OB1seYI=;
        b=KJ32j4xsaNUxfEQOOLfQ1qPx+xuXOAfT8OwmOUfnV00yufvGC8NIvzcINchiEXAqnH
         stzk0xlJ3LXJCDs/1jwF+2L2HUe9VPQ0Z95Sbc8QnBCmz8U+tImSiU3+bFivmvo4h6Bb
         BtOfBb+TIyl2cKoVYvrO+Ym95hehwLY/GDH6mOtj05bJMKzfaEoVDafUMdLxPAk7vSD5
         Uw2t0l9e3BXjM5/AZhKzf+WGjFEuMrzMUVNEm2FXZPsVXKNJ1YQO3fqlUA5lHFSZAwpH
         nh6NIRCcT1izxILxOgzqKkvvbymbxjnyw52lf7AAXUAzI4BZOlSEX7qAnErtzfjy0v8Q
         4kDg==
X-Gm-Message-State: AOJu0YzZ9bGBJwPIxssbCUthix89l9xFfMJl1B3zHxRUA9VMQmTizGJS
	42JZsvmt6Fs9cwcnxsU/oU9fMdwwonQlMBYivj5oPLKYKapqQAN1+I+tlHXi
X-Gm-Gg: ASbGnctOOWfrwW7Zrvw+JZP+L6sxF30uM2I1DTpnA3YSBU5Kf0WlVC0ceQu2du0jfq5
	//qb7A6oBG6VrX5cS5DEyWhvl8C6R/1AAMni+5lNmpbpk4eK0UActX8UHYW5u/xUeRl9p2ZeB0e
	anpReFFcVFi9bzNXxSWJBLLzZzkSLRwXuN8SJ3n7PEv51oFuWlvhcMifWhqaErPZUpqRe8619Cn
	I3LpOklNymNSNdMtfxuxVPRt9wlpp8OuWDcpZgdFDNKoDYVNy6YCkeamTg0bQ0H4sMxZ9Qy33G7
	m8+L7xp566Ie2yO6a+LO27MaskNO
X-Google-Smtp-Source: AGHT+IEK0PazKLsQo+heCo/hF/Iw69gOymEwNYP2zVHc0UNgs5uFW1IBvSpCogGh398D5LHBRlbScw==
X-Received: by 2002:a05:6402:4581:b0:5dc:7425:ea9c with SMTP id 4fb4d7f45d1cf-5dec9fabe09mr3983155a12.26.1739470938795;
        Thu, 13 Feb 2025 10:22:18 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:18 -0800 (PST)
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
Subject: [PATCH v4 4/7] arm64: dts: sophgo: Add Duo Module 01
Date: Thu, 13 Feb 2025 19:22:05 +0100
Message-ID: <20250213182210.2098718-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
References: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
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
v4:
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

