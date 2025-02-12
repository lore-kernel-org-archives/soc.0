Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D473204594
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 22:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739400241; cv=none; b=NHGPYrwiXugkpSz14DpKw1Trr7JZybBcoHAJjAArwbFe8ctpsI+C4QOrZ6S6mclVSrfdAmQNRMM/DNcyzEAr7zxdaZjxiaN0Suu/DcxBa29LK+T+PlRT71WyItYd/BLwKj1Wiwm2bggRxdmH8Zn7Eh2vZllWyOPW6ZTRV8N02+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739400241; c=relaxed/simple;
	bh=B/NZAXNMpuTU3z3Dt8D45KXiKfShFiznnsLHvMRI4qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H9AlQeJp/XWWMkEyg8pEJcRDwdrUkeqNXg3WDdxfvr+eCC9k1qPJQpAjjgRIZ7sraOXUUBVXk0iX7QSBvyfh7d3wuncWa9oEGyJte3cHriRV9syXJhqJ6K4dYGNDsNVjN+KETn8Ltb0cH/4vY4wcddYwqZ9mxd1ZN5rU5eXs0Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QW98Xnwb; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QW98Xnwb"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so477572a12.0
        for <soc@lists.linux.dev>; Wed, 12 Feb 2025 14:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400238; x=1740005038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+40mL3jZJ6m57RT2qXKG2PKW8kpulSlmUXjQH5BVdhU=;
        b=QW98Xnwb8iRr2lmeMEZTva15ZkegiPbbEvWSfI9/AFDv+a94cpdyv3aVyf/4/FrnMh
         w64rBxs4UXwXuWdCDyv7DTCL9NHi+O9Dd50JgWptuFTbtNxe3cb1OXZoSqlp9D5IQNDm
         DNnh96Sw/vQw+wEU3EtP2nklV1Mi9SAVRAse/oAjvEUYLL5ZCFk2tbuz5LE8d6CuMfmx
         zrr8IjNc61cWP3pEl4pUS+bJyENtiMZXG1sTD/LqAu14y2TfQ/ArM8xq6mNVucVDSuB1
         LARK8t2IRq0Q5eg9LtlG/EI96iva+M9NeLY+d4g0L7Mi4aVBHqbGMw+w+z8wTSXOlwTz
         z5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400238; x=1740005038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+40mL3jZJ6m57RT2qXKG2PKW8kpulSlmUXjQH5BVdhU=;
        b=M+TY5WtcXUApxcIoKItepwG5teJXY9xsBXQ23I5Jw7wZ/Yoqw9xJRKhT5ncxx3U+sn
         IoDMuAA4Ewy1mg1gCp10t/H9woRZu44cCe8sD88GgSwh6PUp9XhhJ9cjvBATOuw0SrX4
         MrDIvb8pgU4a9yM2bKVSUTGC5eTNaUykR8QaP4mShElrzuBydiZqK9NWlK/pleOiTPqs
         G2L45Cj5EPQjaDSDS0Bi4T+uHNDtMU7Q7gWnsqPwASkD2ZqxwSsTIiclDaFD8Nn00nSw
         o1LR6jlwNgHAyAHrtyRvWgBcNGtdm+8n27e2LRW62fiE3fybNBL6kgOlsWNgcT5X7HIM
         WkUg==
X-Gm-Message-State: AOJu0YwEtwT2KGmHP8bpjkOG993ufspD2yRnYIpNEhhziTnzKlUz2X3o
	OSSWkAG+CgZYVzmw/hIFnV21GWkluipNlO24QuK3iKDpHRg5ex6X1FbtHPXf
X-Gm-Gg: ASbGnct+pXrJCzBaQp3V+fayubRXXJTO7522Pdw355OA7b36Q497uWIsVbzkaPwaquG
	ML23Ochjt6IYjDb8XPv9uWtjaYrk0lkxIaO0K8wvsBslzmXkvFmGE+OXcsZZHdiBvgWj6+009OY
	YwSegUplcuZYQCsyZ43XzvPlnkNpWWBSHr/CnNMb4X+JhVJUhe6iEFn3KaTEAWSjYOgkrSRMlaA
	oni9xaTfadTL6K4ONIEE+LqZdtElYEg98C/q/AT32e9VzlovZwiIjE2mzP2itj3QEL4aStaA04r
	VEoucUt/S06m7nRquCIR0JqpvYAm
X-Google-Smtp-Source: AGHT+IEv+/AzdknABejwMbnqDJnaCwlQfqvJh/OI5EUKfTNWF0GxuzkjTpxXDZ3NzmJ5AaWO5+exLw==
X-Received: by 2002:a05:6402:3495:b0:5de:5e08:babd with SMTP id 4fb4d7f45d1cf-5decb8d50f6mr651452a12.11.1739400237691;
        Wed, 12 Feb 2025 14:43:57 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:43:57 -0800 (PST)
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
Subject: [PATCH v3 3/7] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Wed, 12 Feb 2025 23:43:35 +0100
Message-ID: <20250212224347.1767819-4-alexander.sverdlin@gmail.com>
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

Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
v2:
- relocated "memory" node according to DT coding style;
- moved GIC node into "soc";
- referring "soc" by label;

 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 75 ++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..98c8d300347c
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <riscv/sophgo/cv18xx.dtsi>
+#include <riscv/sophgo/cv181x.dtsi>
+
+/ {
+	compatible = "sophgo,sg2000";
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0>;
+			i-cache-size = <32768>;
+			d-cache-size = <32768>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x20000>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;	/* 512MiB */
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		always-on;
+		clock-frequency = <25000000>;
+	};
+};
+
+&soc {
+	gic: interrupt-controller@1f01000 {
+		compatible = "arm,cortex-a15-gic";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		reg = <0x01f01000 0x1000>,
+		      <0x01f02000 0x2000>;
+	};
+
+	pinctrl: pinctrl@3001000 {
+		compatible = "sophgo,sg2000-pinctrl";
+		reg = <0x03001000 0x1000>,
+		      <0x05027000 0x1000>;
+		reg-names = "sys", "rtc";
+	};
+};
+
+&clk {
+	compatible = "sophgo,sg2000-clk";
+};
-- 
2.48.1

