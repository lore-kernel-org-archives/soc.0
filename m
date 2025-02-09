Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA36220693
	for <soc@lists.linux.dev>; Sun,  9 Feb 2025 22:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739138830; cv=none; b=pCzfvOkDmaknOzSaD5Ccuh2Vm2YSDR6HAMCDMNynqXkdCHIWsTO/CVSEXIRW8fuBVLErtqfl+0v+kvWQY/2kjMO6yekjGf5IZirDnKKvJSOCGe8TNIphcGAPQ6Zq7yMipREGMlIhSyr78QV0/0tmkpCOfmvHDAlVW3JIMW1EQr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739138830; c=relaxed/simple;
	bh=U/cG2ioMpkRe6fgM0d2HZF3wubSWOio5hF5rJPFhWhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGi9P14Rs5HGLdKUc+EZBqmcG/cTrTSwZyO7jI9GSTgpOMb6SHzOtaJLdcrw4d7h+BojRMHqeZbmiKSmY4ZC3QxWG/0uUltrlzdj3b0fsIlaRZDa73HpeMv7qYFcBorI2P4/dRfFTXZXK1Ln0vB94WBp2nVZaAWXQE8JkzzNWHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVVkq56Z; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVVkq56Z"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dd14c99c3so851615f8f.3
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 14:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138827; x=1739743627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYZnRiqYA/3AuJOPS8/sXM1oAhH2+rwBgg6UvDiejPo=;
        b=fVVkq56ZE+rfbBnRIgZ3YNl/PTNylzuxLT2cQgC7BpG4JAqA0ltN45GA0hQ00croXE
         G/LAfVvzVSIfeMseitBxIA1MnniQLisMnv/UwWtKGukW3rTiO8izvh59Hga1/oE4cSg1
         JV8uEt6t/wkiIozxXgz6DtMVgX87XhrZVaUsaiQ7pafABk6T6s8OjDUJG6BRmGMq9FuE
         sIGEanM8rhnW+erCVrBvR+HzJQcq7yM2croGS2EdoEVJhWCrWmp7yIqQZ6z82elNIUeG
         D4EhNpC0A3WFwrD/VzGr6pYZK/vM08QBH6OAoaW5562VujCWDKngWq4MFyQlBGggaV8K
         pDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138827; x=1739743627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYZnRiqYA/3AuJOPS8/sXM1oAhH2+rwBgg6UvDiejPo=;
        b=TRsglvFP8FgK53QsrianQ7c7iFTLp8U9mawqtvHL9sDU7zWp9SRbEq65xNOWIK67s9
         V83BDpvnwmbAf0L4eszXt74WHU3s/8IAkzgG1GuOnTcE+e69Rh9LOP6xseOOr+fNZI0B
         a5Y2+F7EafOvSX+pnWx4t1Rms29N8CCZY0hIfFpkDXVJTBewKvJiqIc0dndqoRpsHJ2h
         V4SUTfg2XYaEaNJ7OmiiOgX9fKD+eRLWr3HoWBHoGJivthsFwWZ1b/6jE+6pmDOGVpFS
         w1M/cW4OW1t7z6pSOniQNOkhFiKXrKVwPRE5XcbG4JQzKu/g3+OJPPETZ+AgiJqjdrIR
         SrPg==
X-Gm-Message-State: AOJu0YwOPDiPI4HsRaiDLPY/C6cyGsVXfW1d2/3aXsTcjzXzCOUFPwak
	8GcBJz8GvDbMfMrIbSXweYDLqjr+ky7Kj5ztZKDVJmKxTeNGLHEPJHH+hRnO
X-Gm-Gg: ASbGnctUJYxqKCL/VRUzebVr3LVHo+YhdXNOZvjEXrDHKcg0YBzPKXY3YxrK8lSX3TV
	uZWEpTAOClA6Rw07F+i8kCthn98Tp81ISH430IANrfBlaRlB9u2gFWaO6KTUwvewSzS4HPe6ekh
	Gn1nS7JbLypE5uNsMjiCIv5Z0idCt82VMnz4Xzm3jWfSD3VBv+wvuDYBb+V3Hcw/byl35nxaD9J
	k/ViET9vWIMCulxrV8VoALgQ7PWxiRq+C+lcR11mlegH/3hNKfvb+IGqKLybzET8eyscKbRt+Py
	07YP2tDMx7w8phoa4NYiJezA8UpV
X-Google-Smtp-Source: AGHT+IEyqgIT9wueUucI24s6gIrK7u3iqKOPSnxaAF3USSSpsBx/UxeCNnH9MSQjBJFg2UsKqEJFsQ==
X-Received: by 2002:a5d:6a85:0:b0:38d:c75e:b208 with SMTP id ffacd0b85a97d-38dc9375829mr6730578f8f.54.1739138827272;
        Sun, 09 Feb 2025 14:07:07 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:06 -0800 (PST)
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
Subject: [PATCH 03/10] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Sun,  9 Feb 2025 23:06:28 +0100
Message-ID: <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
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

Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 79 ++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..4e520486cbe5
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <riscv/sophgo/cv18xx-periph.dtsi>
+#include <riscv/sophgo/cv181x.dtsi>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "sophgo,sg2000";
+	interrupt-parent = <&gic>;
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;	/* 512MiB */
+	};
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
+			cache-level= <2>;
+			cache-size = <0x20000>;
+		};
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
+
+	gic: interrupt-controller@1f01000 {
+		compatible = "arm,cortex-a15-gic";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		reg = <0x01f01000 0x1000>,
+		      <0x01f02000 0x2000>;
+	};
+
+	soc {
+		ranges;
+
+		pinctrl: pinctrl@3001000 {
+			compatible = "sophgo,sg2000-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+	};
+};
+
+
+&clk {
+	compatible = "sophgo,sg2000-clk";
+};
-- 
2.48.1

