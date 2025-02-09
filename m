Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0421D220693
	for <soc@lists.linux.dev>; Sun,  9 Feb 2025 22:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739138832; cv=none; b=RmA99wQut7KYSdo8PvkPU+qNx9OYQHB8R7dxoxIbWvyvpQLCC5nPIGF73zWehHXsGMmkWZKnaF7sQseWfdERI51qRRZFKAtVpHFHuCvjXflaJy1pYm5ubhO9cO1tt6Eph9JwXIC8AN/9g396S6ssZM4v7TA78r2Cs1AAGu/OpZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739138832; c=relaxed/simple;
	bh=E/omfcuwY+biZG2Pg0pqpxRoO7ep+f3AJMj3nMXakuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGIKioDFR/AdWOEPinThm615x+k57IZ4Xzcliquh6GeT4aoCDG/FtIeoIevn+hM4wp+wG4/o0y7iVH+X8LxnTcBNhxkAHuQS8oyEY+vQyjdWlbJL1Xpwj9WJC6UVKA/dN5YA3itoZGGYoF6xgtw55C0ZOU2s2OIaMIGmX1GzFbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuFkJ6Ql; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuFkJ6Ql"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dc660b56cso2669909f8f.0
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 14:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138829; x=1739743629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vt58qBJVemIGGqEfVTnyjQvkxHCHLvzkYRzz/VP6lvQ=;
        b=OuFkJ6Ql7A/UBXy9gyeoRU6Hzkg971AooE9zZlXS4r5Wd14VKBzC79ryzZYu6iJzc4
         wH4lHYHdm0m0bTY1JGt/CnRYJBmgTBlsgejIVblrrzfw9klckpE5X0qda7srBUmvJBV6
         nxy3RR4DiB12VhuprxGu1SfgsAXdmQTVdRljhUJNkkRVqcaC6XTZg2P1ciCAOcTLG3b7
         XQhy3SShnvKcVvfZoIg0AqgNgRljCFTwb0lw13KWhwdLriu8muEFGgNu6LQ32kIKKfqo
         9O38THa5/5sFTdgjCBj/TRe+ywnSh/sgCxhuvrQEK7tSmpTqk9ZZFvSMUeBWGbmS0bDc
         YD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138829; x=1739743629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vt58qBJVemIGGqEfVTnyjQvkxHCHLvzkYRzz/VP6lvQ=;
        b=uqRqR4CE6eKo3h3aMpt3cWThxodicaTOdjkrBJbLTMcuRt/BphnA+FhMXloq664GaH
         ohLvLUpkVWcEgun0Ed75mtPZEIt7Xl3yjKs+OYrUeGq6USV6atLZ6ckjf4rm9gPymzfP
         CG1a8CmfI5p7yFcaNdQNQsDlrV71X0Ggu/4wdjUfLH1qB0e5Kv6YdnDMWl9CdSQrXuQx
         GgCfpjIbc/MaQEnpFZdokk5KSFyNnFL4iJmSa4WKWgKfoPaP3qaWs55P/ec+igtUPWSp
         idts58kB9XjDAL1B+jUb2zk5+ymJSHSHdqIF85mCV7CPU+9Pa4sZTLREeHjuiIB7quSi
         aZdw==
X-Gm-Message-State: AOJu0Yx1X85a3T2VF5D30QXhtbmcljeF8pMUEeop24N51bqtLlAto2MA
	8CGURjdxiDCrLEkpeMCP7tpwZJMm+kDY1YZUBsRzUHL1mhGIcy41nGOrxa+L
X-Gm-Gg: ASbGncsAh+ZQBx42WUDVdExqKEg+SNvD56IYlCrUSAmsOmr9lciii20AoZcbq0RDL6Z
	ShzeKVS0RsGXq5fIYA11SP9VV5m6LXwW6bh38GD4g0I4HsF/6FZA1lknTCkIqWOCxFVRs78JOZy
	ouzl7ncKXzj/fVRKnXCHRUfX/Oik7W2wznKUyBoU2K8iF4speAzIT8kLbKV/TLvYhCreNryLMEc
	lu/0pRObF9AlrReaOJ1lRtDKAMdjruSWusT0f90dUk0JZMLZzHkKhHDTRFHWgfZZDYdNETQvRJM
	TXpVzEN3V/7SiBny7o0alPAcp2oz
X-Google-Smtp-Source: AGHT+IGlozVsf/D6m3LbJIZJ2CuRmWh8Ek+/gWJZ7Ur5gu6Hztc8qhcrFEYMzrN7igLcyNVl56iqCg==
X-Received: by 2002:a5d:47a6:0:b0:38d:d9e4:9ba6 with SMTP id ffacd0b85a97d-38dd9e49c91mr2505479f8f.3.1739138829351;
        Sun, 09 Feb 2025 14:07:09 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:08 -0800 (PST)
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
Subject: [PATCH 05/10] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Sun,  9 Feb 2025 23:06:30 +0100
Message-ID: <20250209220646.1090868-6-alexander.sverdlin@gmail.com>
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

Duo Module 01 Evaluation Board contains Sophgo Duo Module 01
SMD SoM, Ethernet+USB switch, microSD slot, etc...
Add only support for UART0 (console) and microSD slot.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 ++
 .../sophgo/sg2000_milkv_duo_module_01_evb.dts | 30 +++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01_evb.dts

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
index 000000000000..fcabaf0babf4
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000_milkv_duo_module_01_evb.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01_evb.dts b/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01_evb.dts
new file mode 100644
index 000000000000..f3533892453d
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01_evb.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000_milkv_duo_module_01.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01 Evaluation Board";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&sdhci0 {
+	/delete-property/ status;
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+};
+
+&uart0 {
+	/delete-property/ status;
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+};
-- 
2.48.1

