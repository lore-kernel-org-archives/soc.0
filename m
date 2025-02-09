Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267AE22256F
	for <soc@lists.linux.dev>; Sun,  9 Feb 2025 22:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739138831; cv=none; b=WUOQhORzQHwsS9VrGNilFMoell/CpcjKBE0uDnt5WmMufQ7h7AGOszo4R/oWwc7E4QA+qbPg9TS9qiYRX58zjGWRyiDbwoPO9K3b+zecfHrZ/oo3mLwcnEdaXCqvF0lwJ8l+bbf98mln+/INEysmHJEoK6IGgfL3TNlmm/eoUFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739138831; c=relaxed/simple;
	bh=vO9SlIRdivY1Vbgt3sqdWWIyvjtvuLfx9tw6qxqkx94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5eoJE8Xu/PEgCr4yFN70VqqDelMMY2d2LlsqWdXz13NlZde7MSk5O678Fhdyzgmphc9B4WRwjbc2H6EDVr3J8/gDh7pAdq1+DlTER3uSmYKTFmL2Z43Cc6IuF6NXrjpAVKTWrRVWRgGaaZfp43fbCjSvXHIcg3i5lHhfJIMuP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9GYOcN9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9GYOcN9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43634b570c1so24438845e9.0
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 14:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138828; x=1739743628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n14WLjNeVm3jyFICfo3nmxlNSDZ1JTTnxOPrJZHnJuI=;
        b=f9GYOcN9BztrJPlgNlVNoB+A8wrb18cx5ANO1peuJ1TuxHDBWCFLq/ZdPYOQMuXkDh
         ZHVb8uThTJN8ziuN3Q/9rqdXDi7Gb/N+fI2EkwYspVhAGTlGgTyIYAVGfCJOVnQnzwEF
         t55t/MEa2zm5DBmfmnnZgEAioEWcc4CEWs4BSCk6IqZgt8aev975/5KrUk/os6lbhNSl
         CgBtM16O177hAlvTn4Ml71ooh+MM+X4LBdNoATkoFAI4rnPcMxYyzUr+VFCqk9bAntFp
         kR2c+rfYfiAttXBVBUZB5PFNCDej6RxMQ0VmdnBgRTnZmjDhsZJ71QpbG8S1yFPISUGU
         yN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138828; x=1739743628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n14WLjNeVm3jyFICfo3nmxlNSDZ1JTTnxOPrJZHnJuI=;
        b=XrJjY+SIQSzGKcr6RLI7lIWWOPw1DO+7lUP47QDW/NEBLHfVVz1C90h8qIDIaiDbEL
         lZsNrs7Llyg9q3TnBwIYacxNVwkJb7TBT/2GBkkRIdZOqskt3I6W33dLLszL9+/1XMC+
         iyhqvU8W95bT6JU8FbH5w5DxYe0NL0bKo/iF+QL5OOB2siwwLghJsZqxuM56ykNiypJz
         GuAGyQN40IqkoNN0hCAaUgeqfpqzFHPT9uvMqrEDz6XJknFwAQCcK5ySwBckVx7hBDkj
         8lWzpfBlE9i21fTPsgIUs/OnlRFQxmCcLj69hqiwykRvkLIQont57d0vM5e7NWvUpPFq
         X67g==
X-Gm-Message-State: AOJu0Yx6jWjvbYbHg8DIF5mBsGfDwu9UWRmZqycNJqOGDO1nqodJ1hkQ
	miyYwDCE5SyINlrO97/VrzRZq/YzDcflmYiHoa8WPBLfyqJSbHy9agse0XLv
X-Gm-Gg: ASbGncsfea+sTDC3sKwHYV1NlYYppHyFUTVFLHOjLGpBTF23uC8JmUprGQrmRJpVsTD
	euWG8+C74jxO9Nln7MDBDc79bAh73IAF7CFV0MnxCKAF0bPeNa3X7ZCS6jBNVwNWwYoVvKFQ7/e
	pT3ox8k7wqSHEkYZwcD1ohhudXg5G6UilX3z0KUmQw8V7Tj2Ap1DPe5wJzQKsJYWx7ZyiHbtyn1
	+FXt+Ls1gxGKvsSlHKcXLGpe10/9Ep3yVj3U7tvwcGP3fgsHObadMiBwdIaWA2kRfx7ibGW0J9p
	ugd/EyyIdO38A5T68/sjK22yfT79
X-Google-Smtp-Source: AGHT+IFnnVaS6q04jBo0CqYl+rd5w1TnOLdiL3DvrdfmPcV54sx21PtnBEVHObPWcPkV67SwoWEUWQ==
X-Received: by 2002:a05:6000:2c2:b0:38a:88b8:97a9 with SMTP id ffacd0b85a97d-38dc8d91f1fmr8017485f8f.2.1739138828332;
        Sun, 09 Feb 2025 14:07:08 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:07 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
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
Subject: [PATCH 04/10] arm64: dts: sophgo: Add Duo Module 01
Date: Sun,  9 Feb 2025 23:06:29 +0100
Message-ID: <20250209220646.1090868-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
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
 .../sophgo/sg2000_milkv_duo_module_01.dtsi    | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi
new file mode 100644
index 000000000000..7edcc4d03cc4
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01";
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
+&emmc {
+	/delete-property/ status;
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
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
+
+&pinctrl {
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	sdhci0_cfg: sdhci0-cfg {
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
+
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
-- 
2.48.1

