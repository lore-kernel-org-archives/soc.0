Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3F93A0E8E
	for <soc@lists.linux.dev>; Thu, 16 Apr 2026 20:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776370779; cv=none; b=DLSf67HPO3Qm2V0NzVuWVnsIoCGR8Sopxml5QQF9lMlkGn6ZuoDIvgdKdl2/Xc7UgbjGrTUdZg1eQp7teU2VmwtSQbPS9aUhBHsQwKBGAavGXULn9azw4jtYPwHexdcBXdQaLMCekwVg1EGd4cLsVqxfgpRXEKYqYajyKAyOHLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776370779; c=relaxed/simple;
	bh=7HAu9409XS2mSrrSyv0Alnlrsv+y0tOov9p9fjQcR0g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t38QNWaXm4CCzx8LqFPAnYigwqZGENtvAH+NSW4PlAl0Ft+8M0VeRDFw6LGnh7oKl3UVoNtbSzKaunkkoGMxStaMUU5Axy5ESR6pbR8eTnCoYQtfUoph8SWKT/OQxxwBX6z03Rw0R0VBY0e9HW9NngtONnyHwdpdEyW/3daBToA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2RD8wT3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2RD8wT3"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so5367172f8f.3
        for <soc@lists.linux.dev>; Thu, 16 Apr 2026 13:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370768; x=1776975568; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W8nZc0xy0duswt5stMQc278vwujXUsWzZTQDCqL9tXM=;
        b=Y2RD8wT3ENujS9aKDAJ63yKcab4TK4Pgs9hvFQCq+Anp5EGat03n7b1HRtgc1n5+P5
         cUWDyqnRux+CifLnHCmBRPHYlswwXfd2Er/Ls2K65a3/Q0b+oaPHVckyCXl0fK2jSohB
         y0esqD1bCMd7XbARoVV6ZkXJqDazKpjpG3AO0FuG+iYF+g8inIQVt5E8b1ZY9pxvw3Ji
         1P7EbPCDxGk5AYXVFkX3XJaTw2HgN0ZG8glvXIDkCRee2//UcM+dnPNMIl/aIa+ja1d+
         nNjrOiuo6ecQOEo4ijYMogKGCtTlSLLUa5V+5BFJ5CS3tHh3/P2XETnmLlCdV7dMsLbX
         l2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370768; x=1776975568;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8nZc0xy0duswt5stMQc278vwujXUsWzZTQDCqL9tXM=;
        b=pIOJYmzKc4YG05xUl3TNYZV9HCMS2qrFMEdmLlayhjGJyB+1OY2eoXuDYhlmC08WhP
         Iu6vNSj7zfAOzpKYKt1tqD2brbyKxALbg93UwGOBj5hOg6xDyz3CfBZoj+4aUFStKlJI
         J9ixfQ1Tw1vMTmHlKi+ZnPmqIJar+Hp8wk2spKtM6wEpvs29Gomo1aRzh4vPyNjCbjUb
         7tAKvMDWBa3m5ioIecCP43eKXa0Y2D5yV2l1dLaSCuaDmg7puyu2meXMesgAmXQaBV4C
         rKB7pTDX/bYzH2yzAFhHq+eYT7Smc+xPrkkd1dx6Q8n9Wx2wVJCKXjz7fmd/nJI8vfv2
         tXFA==
X-Forwarded-Encrypted: i=1; AFNElJ8gVRb+cyp10GMCS1m7pbNBXMc/jT9Z0jqIReyEV1GzpjDwCHepVbdlTvCk5Iuy3x5N9Ds=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCnXefUruWpypRIrJOH4+YvxSkmqtil/3tu7xHbQo+L+p08Lo/
	T7+sUBtWHySVJ5j8jQGRK3I6tOeDiakUVeZW3MGN783Da9r+A1OhrgFr
X-Gm-Gg: AeBDietw8riF/V1Vh8PsqkI9IFhjbkrriOvFeJmUQ/lTfpNlw0UhyDo+kyTmjvH1m9m
	+VDMpCypyAde3vAXim8zczxKkjEUn5V94L5Fphsx3OGy0dO24C012PJEnCwOMNcVWy99UEvH/01
	YGHgRLvXJNK3+jUDXmdDQDQTG8MiLm2szFO+aZu6wx824gy1xGVx2LPRYqoJIYB2okvD6daskHT
	MIxhIWg6KO/Wb9bp7WTUyqwqHE0XiYEBARxnqoXcffzsRv7Uxevi8mbml5K6Ky/x1v0oDp/pzTl
	F0Nao/xsVDMj1eZFcYxQyPR3Gnceg2CYOVgam8MdO5fgKKXFHpF+D4aDSUjTwHmsYRGToxtI2uU
	r/GYfmxW7LyRfnREoPX0Bd15cG063QVBmQW+a6CSyrLyHIKnj1fnYVBW+7+zlBpJMxbAzILu+0N
	KcE9flHYss2P+ZubIFMFpoW7kNZ+uqXVOW/vXRGthnkcjBwg==
X-Received: by 2002:a05:6000:22c3:b0:43d:3004:5fef with SMTP id ffacd0b85a97d-43fe0ea3667mr1302338f8f.7.1776370767968;
        Thu, 16 Apr 2026 13:19:27 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:19:27 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v4 0/8] Add support for ZTE zx297520v3
Date: Thu, 16 Apr 2026 23:19:08 +0300
Message-Id: <20260416-send-v4-0-e19d02b944ec@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADxE4WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Mz3eLUvBRd02QDi1QDS9NU02RLJaDSgqLUtMwKsDHRsbW1APKUMK5
 WAAAA
X-Change-ID: 20260416-send-5c08e095e5c9
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4069;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=7HAu9409XS2mSrrSyv0Alnlrsv+y0tOov9p9fjQcR0g=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URKrT6XMtZiyJrbaPR7qc/RFSCsMcn+h+B6/
 JgQ1+HrddiJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFEShsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIu1BAAjlaJHP867qOApRxS4iItx61iEqXtDj6
 UDOM4lTZjUjVTnDxtQvhePQRk58NIRDpDCFcoGau64b1+E0H6+Rtt4V409u5suYtD3PFmK8LDHJ
 6jPtYooFJ+VIcqfylazdeVELYKHYapukRAmsft7FykhxLSoOAf7hzebqqC4ZBjhM6C3wvat8V68
 +bn4GJT11BYeFkZKfYaosuZ5W5ScLD8AiCJqNyEsrNfOXU2gm6nCT8hJoHhFd7xxJZtKBNySssv
 8r+7LC/jCTasqR/8uuA2s8uSly1LKJhJvqTIt2MGpFj+5rXyU9QYOa8ZeYewGje43HUSB31gcgm
 blVjAWzBLyurMsqIcQnEW8cQN0Gsls78sYyv9LFyreYHGd3HYNxFeA1KeEBvl08Az4VYvHxY6lX
 CXI0r/CsjWykTCKYoELJBaTCb7kvKbOMKeqBKEyyGsd/hUYy55oIfl8rkWhN6dhSws++b3S3qSj
 av75J8cYPxxxw0m3gMB1I1niwcjFvIJoc2kQiSVDZ8icrQTebOc2rZuAeMHH9ffQTuR2ojSwRuE
 dk5CZhW6WR5quSpi+M3RpJnzTKqWt4xlBpP+0o3On+XwtqfykvyE1dnWVBSr6rNNijmTSXE0JO4
 jrRfmJBlifeFvGqUnmxqQYMq/fsfymG5KG8qh3jOLOpLC/b+acD8=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Hi,

This is a follow-up on my RFC patches from January [0] for ZTE's 
zx297520v3 chipset. This chipset is popular in cheap LTE-to-wifi routers 
sold in developing countries. My goal is to run OpenWRT on them. I made 
more progress in more work on this SoC and it is time to get serious 
about code review and upstreaming.

Since my version in January I managed to get more hardware running: SPI, 
I2C, PMIC with real time clock and voltage regulators, Watchdog. LTE is 
not working yet, but I am able to start the coprocessor that handles it 
and talk to it via mailbox + shared memory. Wifi is working on a few 
more devices. Since WiFi, USB and Ethernet are working, the devices can 
have actual use with OpenWRT even without LTE.

Another hacker created a free software program to talk to the USB loader 
[1] and boot U-Boot and Linux without modifying the on disk files. At 
the moment it needs a proprietary blob, so my documentation is 
emphasising booting with the on-device U-Boot.

This patchset here is mostly unmodified from the version I sent in 
January. It is the bare minimum to get an interactive shell working on 
the UART. Future patches can be found on my git repository [2] for those 
curious to peek ahead. The first 30 patches are in reasonable shape, but 
the further you go the more cleanup is necessary. I expect all of the 
patches go require a few rounds of feedback though.

My plan for upstreaming is largly this:

1) This bare minimum boot patchset
2) Add clock and pinctrl drivers
3) Add standard hardware to the device tree
4) Add zx29 specific drivers one by one: Watchdog, spi, i2c, DMA, PMIC, 
battery
5) SDIO backend for rtl8xxxu
6) rproc, mailbox and rpmsg

I am willing to maintain support for the SoC within reason. My patches 
add myself as maintainer. This is a hobby project for me though, keep 
that in mind if you want to ship a commercial product with these SoCs 
and upstreaming Linux.

Cheers,
Stefan

0: https://lists.infradead.org/pipermail/linux-arm-kernel/2026-January/1099306.html
1: https://github.com/zx297520v3-mainline/zx297520v3-loader
2: https://gitlab.com/stefandoesinger/zx297520-kernel/

Patch changelog:

v4: rename zx29.yaml to zte.yaml and add board enums
v3: Remove [RFC] tag, add defconfig
v2: checkpatch.pl fixes

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Stefan Dösinger (8):
      ARM: zte: Add zx297520v3 platform support
      dt-bindings: arm: Add zx297520v3 board binding
      ARM: dts: Add D-Link DWR-932M support
      ARM: zte: Add support for zx29 low level debug
      ARM: dts: Add an armv7 timer for zx297520v3
      ARM: zte: Bring back zx29 UART support
      ARM: dts: Declare UART1 on zx297520v3 boards
      ARM: defconfig: Add a zx29 defconfig file

 Documentation/arch/arm/zte/zx297520v3.rst      | 158 +++++++++++++++++++++++++
 Documentation/devicetree/bindings/arm/zte.yaml |  25 ++++
 MAINTAINERS                                    |   6 +
 arch/arm/Kconfig                               |   2 +
 arch/arm/Kconfig.debug                         |  12 ++
 arch/arm/Makefile                              |   1 +
 arch/arm/boot/dts/Makefile                     |   1 +
 arch/arm/boot/dts/zte/Makefile                 |   3 +
 arch/arm/boot/dts/zte/dlink-dwr-932m.dts       |  21 ++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi          |  83 +++++++++++++
 arch/arm/configs/zx29_defconfig                |  90 ++++++++++++++
 arch/arm/include/debug/pl01x.S                 |   7 ++
 arch/arm/mach-zte/Kconfig                      |  24 ++++
 arch/arm/mach-zte/Makefile                     |   2 +
 arch/arm/mach-zte/zx297520v3.c                 |  19 +++
 drivers/tty/serial/amba-pl011.c                |  37 ++++++
 include/linux/amba/bus.h                       |   6 +
 17 files changed, 497 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260416-send-5c08e095e5c9

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>

