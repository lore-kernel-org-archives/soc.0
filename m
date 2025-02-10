Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5BD24E4B1
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 22:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739225405; cv=none; b=cO7HwXxigL27OrzSUF2QwmP85MT9F3XhUvvma1TZu0ZvCOiJWRNGKLWWaSsvl4fJF3N4i8QwG+U1VqkyY+mf6IzS1PK0kKUcM7RRak09Mx/ezgI2zqWrfvIoJP+FllWS/qz3EAjnMc+FF9xX9iYmJ9T+chbe0cGylF+4g6or/vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739225405; c=relaxed/simple;
	bh=n/w2b7Sjc7V9PG8urLEvcLmESDrzmi3ZtRXA0E0OXCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gGLUMvDGB126/7lNLG2r7O6Cg9Juv2CCPBUi0XS93jwWXI/lRriw0vxYo73oeFi/y+zLKVnxFgT7woDnUtgXb/ZjAzG/pHfOZSQXvFSePj+wbwSZx9+1SeOnKxoA3gOSbBZh6YLZBgUrDCpsXoRWNfb0I9ytrGw89MIGXRxlTC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBAIlH/r; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBAIlH/r"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dd0dc2226so2642580f8f.2
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 14:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225402; x=1739830202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWyO6Omj46BLGouriEYcHBj4I5jL2cpuWdyYPhlUQ7g=;
        b=EBAIlH/romuFqXmeg5gYQLe8Hd6Q+gVbJwB6LswiAIsWscEDET8ojYOcBmBsOY8HI+
         iWOBR69LtgrZvsAuMSt1rjwHC/qJgRsmp33P/AHGIeobmE0amNbXgZiYxeRmL0tnhSfg
         mcTwzgwU+Oxe3bKgX+H9CYfikrcWfGICe63Rej+G/M+jPatUBYOPxgWSOO1kyUOTmrCt
         0schV4R0hN9DVVug/GaKnNz2pbLzPjPhS5MNNUzR2dPsOBovbCjIxRqEg+e6kLUo5Dvd
         Ekta6n5NnXLhdQEg6ffvjowIQ+FOeCN7IcKlD6NQH8gk/G6kITFo2nlZkLWJSymz2Vgx
         3+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225402; x=1739830202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWyO6Omj46BLGouriEYcHBj4I5jL2cpuWdyYPhlUQ7g=;
        b=eNsscELTWyP6hi+3O/5gahEolanBl+wCjlgOHa9z2DTc/wtppf7uuUqTus37Hkqmv7
         6qAm7ltGwXsnhkxYyj19gSN8gQo7AswgOU7t8oCW/mrY3QfkEX396sw4qwse6C/GWyzn
         zYn6QldCJ5IfDoFGe1qTr7SmdhVrKP0w8fceZpj4uUL/EejUhL09ulXj3f8fWsrkZMZL
         ns9t44dRgh+NHNS/tWcOUbVeiLZ0iHyu/yyL0tAIe8onsot8h7+lX7Itg3kpL9pPDIJK
         ivICJZXBq1Gjnv7jsKLr5wkFmDT2dccxVadJ6WzQv0Q+bUs6Zd2nLbz1CxKkm9Svunm1
         2V8g==
X-Gm-Message-State: AOJu0YzXovtErzwTKaB8b2LoSxZH/B86HQl+7fG9kKkLvfSOzqyrq18v
	jqV545kmGO4PQJPOpOFOhLJYV9e6Y7SwYXA3qZGxpTtK2ZQ+RFaquxcVfms1
X-Gm-Gg: ASbGnctKkHWrrJV77E/0h3df0mVmndgqcxCTUJYN1mNezo1mG0sXP4R9xQbjwSaAkat
	ungEKNvNjIsiSMu1d95fZc3f+s6AAITR+p5YtsizHdZAZSf35EctcobbscIro/76C55O+wNXuMO
	x5LageBsmWxOfSjeTNTPPiO0EfXPBObMnmVyI9/n33NMMAnn/SPdjD2Zpk7eidX29zfgWu8SOeR
	Hq2ogVXFPKCoP0NYusMO1HE+lkX55J8eV6RDXav+ah3QRLVNodsACTLrh/i9XoIvTT9J/VfT95k
	2FOddKtKW6rIgFicpKcsZAbNPzkT
X-Google-Smtp-Source: AGHT+IEMaGIcU19hT3jyRgsUsaV8XvP59su/yVG0KhKsBGbkZitk0/Jmb/o11eWD/isTEql3vIA+Cg==
X-Received: by 2002:a5d:6da4:0:b0:38d:dd32:c939 with SMTP id ffacd0b85a97d-38ddd32cd83mr6651606f8f.36.1739225401776;
        Mon, 10 Feb 2025 14:10:01 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:01 -0800 (PST)
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
Subject: [PATCH v2 0/7] arm64 support for Milk-V Duo Module 01 EVB
Date: Mon, 10 Feb 2025 23:09:40 +0100
Message-ID: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
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
 arch/arm64/configs/defconfig                  |  5 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 64 ++++++++++---
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       | 64 ++++++++++---
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi    | 57 ++++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 91 +++++--------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi        | 64 ++++++++++---
 14 files changed, 451 insertions(+), 103 deletions(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (80%)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi

-- 
2.48.1

