Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3340A2505A2
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 22:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739225411; cv=none; b=MhAWEHJtrAQiM/R8yuQ8IqkqBuvkr+C8yAIYP1vQguSMLGilSZb4HHQoBGS837UG8AWw9RrNrgSozNKNPcgK6jszCnKLwMeRP6y3+2+Ih+NRMwd3nIvq9S+8yKyDXuyn9TiokSVbp1gFUUBIYNpk459VJWGpbSaQ/HBfKjv3OV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739225411; c=relaxed/simple;
	bh=G+mOyo4FIopZWgVDrcKuyZa9MY79r3sTlPlRPoc6AWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kb9YDPLCm1c7gsRE13X+W6H14vOURaaBGRH9me18jpg1vAFJnCTOLn182IKC19y7JzdNtI6gXTq4Bw/ZxI/041vMLfzO4fNogKPJ11Ty0pnnP27AIQGaVOqGrZwhOLNrHFjBJ58yn86kihOjoJ4e/fVzOilHDhuQI0ThNKaIjy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gECANsJ8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gECANsJ8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38dd93a4e8eso1681076f8f.1
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 14:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225407; x=1739830207; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZhOnOs3JzDC/c26qPk+IYrYmiO8/esxJoqOId1pTR8=;
        b=gECANsJ8uJdgRyI9HE1/XFlzs+qqxTfXw6r5qXT4jfenPrHZVuO7wp0SariMnP1A2E
         Q4hN0lEXPT8Xp2RFrfHGQDfV0qeKtajgYBJSpS5jB4OUAtuCYeB1/IG7UswFsBCHl6IM
         PijydAjoWFDxuVyEKnSB1T6sx4wj49JjM/oKuEpKcN2IkV6ehFYAgxpUR/dshKGFKbFt
         fxEu3wZ+0zEoea0PMKmen+I1AG8HUByICgAuGlQS1VjTbDZb0OY08f3B3rFU9vmR6C28
         naV79bgFxitTOSHXOHXGkTofSERm+vs7U8vnj1oDLlZTsljwA7LOcaCeC7BDK3oUH8f1
         Bxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225407; x=1739830207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZhOnOs3JzDC/c26qPk+IYrYmiO8/esxJoqOId1pTR8=;
        b=COGbufSrZZGIwbLmjG5a8av8GivCDZq8jTHcb7snHfOiFlCF4wM6hSNwxaiBrhwtz+
         Me3YNboEkhNPUvGivJY58meO0OEzGr4ZE5WqeQC6GYBqlDrLpntWUBLiiCCOfsCjOrQ3
         ws+04YDFT+056vUVf5h06lP0nE7Ef2+KtZzGKWtsmL9OKdrtyMd55bp3FYv1+1KVxzGS
         P/vuPpUSoFoZ/ljJhzjJ5vGDWNgamErpbQKlfvdS1ebXkxAuMiUcMS8fqWfsShiE0QWZ
         A8EYmMXn0seUL6CMfGRDBQ3/r4lGJINhP3+KIn/0uvxySKg8RrsjLAi3PVNF3eb5oC0v
         /p5g==
X-Gm-Message-State: AOJu0YzCg8yW4LhX+FI0LmtxFTiBRAZDT8+V80MQM5Ga33K4nvmmGpMm
	OTyb4OfQNkpzx0k7XNvKZYtb1OqokHBpbwcFS8ykXH0Y4XMt7LTpqoxZ+KSq
X-Gm-Gg: ASbGnctpCJGxEuFP+PN/sUI6T4xqZJ/YyZY3iwMb0hlDAXKME+0uae/VyS0I3t6V2oA
	tNdCkV4y5P0mB7w8FOObhEdsosw1pXEvjVbT326AJU12QryNZDj8y9CyfbukafR8jEabYFbxA7W
	ZTG9lI5L7cvAND7KE/pWfcEaOddkdgcOEns4T3CucLBgRhrFq0jYeeRKXP/No3rMjcpB11WEeqZ
	3qOi36RP6zzSot89QVYn2HTJwMgw+H5FCD96yB9wqQ0m3oLXeZ6TAcEHfSV3stpMBOA8gWFwFTG
	Z0nM2QF1i5OyG5YU6wC6miK+cYL7
X-Google-Smtp-Source: AGHT+IHwNH6hgR8oTQ3a1y0apV2p0yZ49mWYWJA1q/BXd9mTz6QrzTQvriO0UNbrNrMx/g4JSHPQzw==
X-Received: by 2002:a5d:6c66:0:b0:38c:5cd0:ecf3 with SMTP id ffacd0b85a97d-38dc8da6393mr12235260f8f.11.1739225407504;
        Mon, 10 Feb 2025 14:10:07 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:07 -0800 (PST)
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
Subject: [PATCH v2 5/7] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Mon, 10 Feb 2025 23:09:45 +0100
Message-ID: <20250210220951.1248533-6-alexander.sverdlin@gmail.com>
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

Duo Module 01 Evaluation Board contains Sophgo Duo Module 01
SMD SoM, Ethernet+USB switch, microSD slot, etc...
Add only support for UART0 (console) and microSD slot.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
- sorted all nodes according to DT coding style;
- added "compatible" property;
- renamed the new .dts not to use underscores;
- added status = "okay" instead of deleting it;

 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 ++
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..3a32b157ac8c 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -28,6 +28,7 @@ subdir-y += realtek
 subdir-y += renesas
 subdir-y += rockchip
 subdir-y += socionext
+subdir-y += sophgo
 subdir-y += sprd
 subdir-y += st
 subdir-y += synaptics
diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
new file mode 100644
index 000000000000..94f52cd7d994
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
new file mode 100644
index 000000000000..b1f8a5787861
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000-milkv-duo-module-01.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01 Evaluation Board";
+	compatible = "milkv,duo-module-01-evb", "milkv,duo-module-01", "sophgo,sg2000";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.48.1

