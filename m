Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B44202F7E
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 22:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739400238; cv=none; b=sO4dby3xSrzbNEcxBU/pRMmeMVsjG1D3PKkhD0xz783BQB+UwbrJlfFQLbqy6gi7ricspVx5aJRkE7zscYQoGso0ysMHyjkRTCQg+4hF7vyMN0S/z99W9AqBSw2U/pv8vpl9UNsGbu5weW0eJEDZ/c70BXkDQ4jWCTgHuL+KmNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739400238; c=relaxed/simple;
	bh=8XeVwHSw3fMh3jLSmwjruyUOp6GzMgE1kFJYTL7bjZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sqKc8AJr7S7c2oV+ZMcBPhF+zwXXfmifj7lHjuQLC9fYz79U78ESbuPkvlH/MV4ILyUbuPYT6KCTPlseGHmx9dirgNYMfiCM79WrxPgYJx4yqt/Fdx4SvPsxZL0xvG3fF/sst8GdfYX49i6yVeuSqikR8KgfWbDxkoeK1ropj18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fz9HJVPQ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fz9HJVPQ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso305565a12.3
        for <soc@lists.linux.dev>; Wed, 12 Feb 2025 14:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400234; x=1740005034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sD1Sd6cAP8Th7UTJsJpR3D3J20e2A9Te/LBbAhEgPjM=;
        b=fz9HJVPQs4AuhLrocQ7s7b24UVD4Lr3NYC3m2Hc7AsCSeBMFYcAf3XXy14b2sy8e52
         MVtF/CN/+7wxh+PRmsBjrt/2sJpGy+s91CP65htWVgWClXQ0oJEhDF1Vcatzm4aDTWCJ
         nmBD+2oFKj8PKXnSksFBdGP9/7pkJ5pgrzmXWfXPkIijTot+lEJ4tr2kYyaJhhQgD70z
         MYUHiD3dbtscz3Uysz3BgSJzAFNq596Ppmb/v8x/qZzeIGnpgk4qDMsD/ttQdn/xGPGB
         r0MiuRUI08oySA1YGUYI0gDW7j+KAQhjnN6ejOXD2x1oOKon/oiD1M9U8OzQRldqyn67
         GjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400234; x=1740005034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sD1Sd6cAP8Th7UTJsJpR3D3J20e2A9Te/LBbAhEgPjM=;
        b=hrcrrKUdylwaU4nc7sYPDcpcXteVvVe+2fNka/uLKLvhlmnlZtbwCI1itacydJNk2W
         8UDSPEwt0e87OvX5eyi1DICUzHEYgovn8O7EOjEpTgylPiwrFUoXN7WcfV8pghtNANC4
         WMyQFnL6Hju52OUZjhGoASXjOyOMdESPqTHaURF37sh6z/AVx4RAqswNZiQ+0Dr/QJ9N
         fCTUcoZI4Ait0ILrp6UK+b0PaW0bN8DHAy23lB27KUMDJ5DibRGgH5sgpF1ViyQV50Vu
         P8fW8QJNv5WV5bPbpnzq3SSIPscJTJQ4orYWaVHDk+WkD2t2dhkgS7v6A1v0aq7vV11D
         5VFA==
X-Gm-Message-State: AOJu0YwCSiH28qTjPFiyj2THWhjJ/0ZTKVOVbSjpG1i5w5pRYfG2sCiW
	thMwB6vr1HvEksVJZd4YOxv/N8rTwdeGFoJAIGGi5mcX7VEYs7ytEB6wfdmr
X-Gm-Gg: ASbGncteOVY0HVrAhwntAfoyMSUYRkVBE491AmWPLQ4JGcRXapuhj9zLhgI1t2wxl3E
	FxWsLV9dmcNkog3rLIi6om69i7AhE6Z7obrXbJCoidGXqhq1aWseMQq+lSTabluNTk4kUyygrHK
	ahQ5KUfLsYY6RTTXUaixHKb1mKZb1a7GQ5bYeiFW74jv2474JoF95zKZU/ohwysIhqNNe7ASlqL
	yE9ORGEL0PQx6KEu2Ie7gTVpUUMVq/vASD3JJopt4henVXfDZyureTKQDuuKqN09q1ttCsTSo4n
	7pacZF1eSUI7sHBDd+M5Ft4miTLW
X-Google-Smtp-Source: AGHT+IGew9eYcM2URi/21CyZAiBNRVDDORJCErtMKBXGaipTpLhYOkMN7qo1rF4n3H1ilggRuIN5EA==
X-Received: by 2002:a05:6402:2748:b0:5dc:c3c2:225e with SMTP id 4fb4d7f45d1cf-5dec9d3eb64mr723602a12.8.1739400234330;
        Wed, 12 Feb 2025 14:43:54 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:43:53 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sebastian Reichel <sre@kernel.org>,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Subject: [PATCH v3 0/7] arm64 support for Milk-V Duo Module 01 EVB
Date: Wed, 12 Feb 2025 23:43:32 +0100
Message-ID: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
been chosen because the upstream toolchain can be utilized.

Sophgo SG2000 seems to be a continuation of the Cvitek CV18xx series, same
peripherals with an addition of ARM64 core. Therefore it would be
beneficial not to copy-paste the peripherals' device-tree, but rather split
the most suitable riscv DT into ARCH-specific and peripherals parts and
just include the latter on the arm64 side.

This series adds the device-tree for Milk-V Duo Module 01 EVB, which
in turn contains Milk-V Duo Module 01 (separate .dtsi) on it, which has
SG2000 SoC inside (separate .dtsi).

This series has been tested with Sophgo-provided U-Boot binary [2]: it
boots from SD card; pinctrl, serial, GPIO drivers are functional (same
as for RiscV-based CV18xx SoCs).

Partial SoC documentation is available [3].

This series lacks the support of:
- USB
- Audio
- Ethernet
- WiFi
- Bluetooth
- eMMC
- Video
- "reboot" functionality

It would probably make sense that the series will go into ARM SOC tree.

Changelog:
v3:
- &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
were moved into cv18xx-intc.dtsi to reduce code duplication;
v2:
- dropped all patches related to the new reboot driver and corresponding DT
and bindings;
- grouped DT-related and config-related patches together;
- added patch moving sophgo.yaml from riscv into soc (to share it with
ARM); added SG2000 SoC and Milk-V Duo Module 01 EVB into it;
- other changes are documented in the corresponding patches;

[1] https://milkv.io/docs/duo/getting-started/duo-module-01
[2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
[3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf

Alexander Sverdlin (7):
  riscv: dts: sophgo: cv18xx: Move RiscV-specific part into SoCs' .dtsi
    files
  dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add
    SG2000
  arm64: dts: sophgo: Add initial SG2000 SoC device tree
  arm64: dts: sophgo: Add Duo Module 01
  arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
  arm64: Add SOPHGO SOC family Kconfig support
  arm64: defconfig: Enable rudimentary Sophgo SG2000 support

 .../{riscv => soc/sophgo}/sophgo.yaml         |  7 +-
 arch/arm64/Kconfig.platforms                  |  6 ++
 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 +
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++
 arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 75 +++++++++++++++
 arch/arm64/configs/defconfig                  |  4 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 28 +++---
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       | 28 +++---
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi    | 36 ++++++++
 arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi   | 23 +++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 91 +++++--------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi        | 34 ++++---
 15 files changed, 347 insertions(+), 106 deletions(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (80%)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi

-- 
2.48.1

