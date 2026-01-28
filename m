Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07546314D0F
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 20:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632504; cv=none; b=joel0YC3inA0Iac8psqDaYT0t55Frtz5NeEMkx4MpoJDI+lJfeXx8pEzH8GyYlgcnKJJYGx0qZrMtiJdg6OQEUBnBLyYE0MfCP8uYfOGL44BSfhJS5WCUoY1UdYNvbjZLFMciJKsx8cxNa0PL5nWMXhzsHuTpe3uj3aTyy9Sn5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632504; c=relaxed/simple;
	bh=T7qoPf+uZbKyuHwJfT8eMKflJZDM3D9Zq0bqULII/aY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IsW55hHte9ttUmOnDTei07qvTmv+1t0n7a7cK034Qh1ujQsyvuhRFVhRlxQ/ta4rcsWLpRHYufmYpE6ueCMgUVTGaLZSqRkqcXhfbFqHGBiiboBelCV10EgPfLwJRoHHOiLnALwZ6tNWSoNYSwAASai6Um5H13k2wvXHTHHFGvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hY1YC98i; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hY1YC98i"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so185021f8f.3
        for <soc@lists.linux.dev>; Wed, 28 Jan 2026 12:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632501; x=1770237301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xSpcBA8PE/QFRkRmf1Tiwdq7sxrOhpi43Y0N5xmGRqI=;
        b=hY1YC98i3Gnsloyj7wLuj3e4CFxhT4dCRDoA30uwKd55pSEEQoR7ryaGb+E1Xsqs6R
         8G9HS7xcX46iTjDFTAxfY7xdKIFrKu2lK951RBleWf1gzrTDzTpyG3Z8sFF9IzLDh/LX
         bxXcwx0aaS++rR6hMEtxn3wFZRt8eQoMADw9+HHwA0B66TA8Vq/ps4o0SFIMPJgW1Vwh
         GogarxTqVbBMDJ9EolsPpUDeJ4wXNVmsHiamDyVU5iWgQYlauffTC21pr55RBbFh3uTY
         5YFTCCaElqh+jglMcNoZwxa46nGRlDwHdzT3o8Ycp8hyKakHi+0tRFhJSsPtWBwVWvU8
         1i4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632501; x=1770237301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSpcBA8PE/QFRkRmf1Tiwdq7sxrOhpi43Y0N5xmGRqI=;
        b=CssJ1XNJAU3r0zjtG7te8foM1XszMLHjzo/SF6rHvSE1RiKPUIJ0wSLM0ZsM/6nVy0
         yuSsNmOq+t6epIxpgT40xC4tqwuGi7BEHcBI/JqE5BUiyq4r0qBVOjrWjtRGGnua6OAN
         BHiausekQ4IUvVNoIyOLwPEKj4nulLmDAct0tlcaSBvO27j/eNuLuTo788sS7QY8BTDd
         PtLxhXRJ6LlzyBc+RcDogYxxpcJu7dra12jVxowdezzFlPVu1uqCZpnJzw4ErxlHo+2y
         cF4T5kmKDHCMaMGHrFRQPg0Doxc89q5p8eZALtqIwvoRcwQcmeaeU/jFUYYNdWD+rO8s
         d30w==
X-Gm-Message-State: AOJu0YzfD6QuJ2cP+j8PAdbl9iw3UX9aO9S1vRGh3ei09bVlLQTwZCH6
	pRJVN+J3q6Hgcbvbla1nFg8dt5seypE6xfH7XiYf4fKfdrKFaJnWqLVc
X-Gm-Gg: AZuq6aLQOuV71RgrUvQf72y4H4f8OHR5IqHiVElhHefMlZGnugvx97yZEUupOJxH/nO
	mf5CeTWMTUaVHIdmHXJunYtiXPC3/5pRRQ5r/2RcO2rjLNuqDQEXe/aSVZ80GFC6G1np6eWLTck
	70QNBBSr0LTVFepUaRvfvZ17gXAGspHDfyFAuHXv5MtZOsBvg8/BdLyRPPjQZniGPcCvnz6BvMZ
	vq4irgHE8JVL657sz5KEgsWcxXKDRzRCgYvAHz1Zt9PoT6VR5PpHBHJPDhpH2RY57FfBw20x0JB
	6S4UrDv5tpgUsBvLW/X2SLfV0PlNP9IGPQLXMiygsm+RjeMQ24wZPoSYyVFNh3uHXGJdEpJIrpV
	fQTHlJ2zJuGkG76bA6dAckKdyCz+u+IeMYbCqQRPWY/kIVm/BipaMnDo9XprwjpK3IkFD6PEHKZ
	tmBnBx5nVtz8YcZMllY7lfXF3g
X-Received: by 2002:a05:6000:2c11:b0:435:9612:2d24 with SMTP id ffacd0b85a97d-435dd1cc5acmr9922322f8f.53.1769632501132;
        Wed, 28 Jan 2026 12:35:01 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:00 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
Date: Wed, 28 Jan 2026 23:34:48 +0300
Message-ID: <20260128203455.38569-1-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

In the past few weeks I worked on booting my own kernel on ZTE/Sanechip's 
zx297520v3 SoC. This SoC is a relative of the zx296718 that was once 
supported by the kernel. It is in use in a lot of LTE to WiFi routers in 
Africa, China and Eastern Europe, although some devices were sold or 
distributed by ISPs in the EU too. My goal is to make OpenWRT run on these 
devices.

I would like to ask for comments on these 7 patches to make sure they are 
going in the right direction. They are the bare minimum to get the kernel 
to start and run an interactive busybox on the UART.

Here are a few questions that I couldn't answer myself:

1) The GIC is a GICv3, but there are some extra registers (probably on a 
different chip) to switch PPIs and SPIs between level high/level low or 
rising edge/falling edge. The only device where this matters appears to 
the timer. It uses level low IRQs, but the GIC has PPIs configured to 
level-high by default. By setting some non-standard registers, I can get 
the PPIs to level-low and the timer works OK. Is there any precedence on 
how to handle this? I am tempted to make a zte,zx29-gic-v3 .compatible 
glue that sets the PPIs to level-low on init.

2) The boot loader doesn't set up the secure/non-secure world properly and 
doesn't enable register access to the GIC CPU interface. I found the 
Raspberry Pi 3 boot stub as a good guidance and put sample code in 
Documentation/arch/arm/zte/zx297520v3.rst . An e.g. OpenWRT build for this 
device would have to include a similar setup sequence that it runs from 
U-Boot before jumping to the kernel. Did I miss any alternatives here?

3) The SoC has clock and reset controls in the same MMIO space, even the 
same 32 bit registers. What is the preferred way to handle this? Two 
separate clk and reset drivers that write into the same place? One 
multifunction driver that exposes clock and resets? One syscon that 
contains the reg values and two separate clk and reset drivers that 
consume the syscon?

4) The CPU is a Cortex A53 running in arm32 mode (in the shipped firmware 
too). It doesn't appear to have an FPU. Reading FPSID results in an 
exception (so vfpmodule.c/vfp_init says VFP is not available). I tried 
enabling p10 and p11 in NSACR, but without success. NSACR seems to always 
read 0 too. Is this really a Cortex A53 without FPU or did I miss 
something?

5) Relatedly, are there any advantages to running in arm64 mode? The 
devices are relatively memory constrained (64mb), so the larger binary 
size from 64 bit pointers is probably a negative, while the larger 
register set might be a positive. I doubt switching to arm64 mode is 
possible at all, but I'm nevertheless curious.

6) The old removed zx29 code used "zte," as the vendor for the 
compatibles. Sanechips is a subsidiary of ZTE that designed these chips. 
Are there any preferences for either "zte," or "sanechips,"?

As for the rest of the hardware, my entire patchset can be found here: 
https://gitlab.com/stefandoesinger/zx297520-kernel/ . So far 3 people from 
the OpenWRT community are helping with testing on different routers (Tecno 
TR118, ZTE K10, ZLT S10 in addition to my D-Link DWR932 and HGSD R310).

USB: Standard dwc2 WiFi: rtl8192, but in the SDIO version. I hacked sdio 
into rtl8xxxu but it'll need major cleanup. ethernet: STMicro stmmac. ZTE 
wrote their own driver for it. I spent a week re-implementing it before I 
was able to match the HW to stmmac. SDIO: standard dw-mshc NAND: A 128 MB 
SPI NAND chip connected to a homebrew QSPI controller. The driver is 
copypasta from stm32-qspi, but the hardware registers seem incompatible 
LTE: A Cortex M0 is doing the heavy lifting and talks to the main CPU via 
RPMsg. I hope to be able to handle this in userspace, but I haven't looked 
into it yet. clk, pinctrl, pmdomain: My own code based on the zx2967xx 
code.

Patch changelog v2: checkpatch.pl fixes.

Stefan Dösinger (7):
  ARM: zte: Add zx297520v3 platform support.
  dt-bindings: arm: Add zx297520v3 board binding.
  ARM: dts: Add D-Link DWR-932M support.
  ARM: zte: Add support for zx29 low level debug.
  ARM: dts: Add an armv7 timer for zx297520v3.
  ARM: zte: Bring back ZX29 UART support.
  ARM: dts: Declare UART1 on zx297520v3 boards.

 Documentation/arch/arm/zte/zx297520v3.rst     | 106 ++++++++++++++++++
 .../devicetree/bindings/arm/zx29.yaml         |  20 ++++
 MAINTAINERS                                   |   6 +
 arch/arm/Kconfig                              |   2 +
 arch/arm/Kconfig.debug                        |  12 ++
 arch/arm/Makefile                             |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/zte/Makefile                |   3 +
 arch/arm/boot/dts/zte/dlink-dwr-932m.dts      |  21 ++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi         |  83 ++++++++++++++
 arch/arm/include/debug/pl01x.S                |   7 ++
 arch/arm/mach-zte/Kconfig                     |  23 ++++
 arch/arm/mach-zte/Makefile                    |   2 +
 arch/arm/mach-zte/zx297520v3.c                |  19 ++++
 drivers/tty/serial/amba-pl011.c               |  37 ++++++
 include/linux/amba/bus.h                      |   6 +
 16 files changed, 349 insertions(+)
 create mode 100644 Documentation/arch/arm/zte/zx297520v3.rst
 create mode 100644 Documentation/devicetree/bindings/arm/zx29.yaml
 create mode 100644 arch/arm/boot/dts/zte/Makefile
 create mode 100644 arch/arm/boot/dts/zte/dlink-dwr-932m.dts
 create mode 100644 arch/arm/boot/dts/zte/zx297520v3.dtsi
 create mode 100644 arch/arm/mach-zte/Kconfig
 create mode 100644 arch/arm/mach-zte/Makefile
 create mode 100644 arch/arm/mach-zte/zx297520v3.c


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.52.0

