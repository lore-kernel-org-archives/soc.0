Return-Path: <SRS0=q7mD=CA=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9F8C7EE23
	for <soc@archiver.kernel.org>; Mon, 12 Jun 2023 02:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA267C4339B; Mon, 12 Jun 2023 02:54:03 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74A43C433D2;
	Mon, 12 Jun 2023 02:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74A43C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-652d76be8c2so4259575b3a.3;
        Sun, 11 Jun 2023 19:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686538441; x=1689130441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SJ4E1TgPuKj4e6/UbDNdpEAQ2dguYdZ7sp49HDGjVLI=;
        b=XtbMv+TYZ2FCIG+gAx6eT3GNWYeuNplC2pPNxGhm9EH9ap2kumPpsKtqD1kPX+XAgX
         4DWnK/wX4PxZNW6Mbi9J26d0wzkkj83dIcOfFTIH/qjHfD1s99JWV7y8PsCwbfeW2Yf9
         jReHN1bOYow/ky/pr6wcF76qoReaqOfWXJFhodWVcN9XN9TkZ6nN5F/h4evPjVDzoVjU
         AWoN+SkrGbtWh8uOWS6e2lhQ25VchunRJ6P5ELxJvabIzdRbATRsjh9WhVZyDoddLeX3
         NHAh3194LeKCNkEtQBNtdenoA4Lf2BGp/LtIyqjf8mA4niY+i7yrx/HS28aojBX0YC1S
         NHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686538441; x=1689130441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJ4E1TgPuKj4e6/UbDNdpEAQ2dguYdZ7sp49HDGjVLI=;
        b=QCmfHUVdNIAR2NboLKOwXI+UODbSvNWLQrj3uHorVLEtzmrmLw54zE3Hd9jBHmndes
         Hww0+Jvw18WvJ8vBnuQL1ZWP7s3S/obSuO6AMQXgFT4ESk39vlzqo2NrxV3xJIoiRWgA
         A+z8yaGyzG1vRkquF7bUKm0Ic4luRmyxXpjoXPuNig7OOp11cegq0G7Bk3R/pJLHDELy
         5a7Nk63NPYBYMWw29DH0hRpaAKfTM0rQxOn4wA3ckQSCwU4rb6jcjnR/y3IXL5CNTRc0
         xPl2xxHTHf9e8EwvLc+xopTwljqQQYb299jGuf59bzyi3gQmWexuoyInm328uxE0EROV
         0WlA==
X-Gm-Message-State: AC+VfDwsuIMcx9O1nougPFkLs/6+T5fKukZm79c07aSuEv5ZCDuqC55Q
	YsFwTbZC61zqTornk88ok5p8CD6MaIc=
X-Google-Smtp-Source: ACHHUZ5Mvcf8OPknIRnZQm3CgeiEWpRcROv0fp6QqNJv5Eu/nEMOEz9silQMOUqDgNY/o+eGRaeiLA==
X-Received: by 2002:a05:6a20:244d:b0:10c:dd4f:faa9 with SMTP id t13-20020a056a20244d00b0010cdd4ffaa9mr9762483pzc.14.1686538441367;
        Sun, 11 Jun 2023 19:54:01 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id i21-20020aa78d95000000b0064d34ace753sm5931403pfr.114.2023.06.11.19.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 19:54:00 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	tmaimon77@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	arnd@arndb.de,
	soc@kernel.org,
	schung@nuvoton.com,
	mjchen@nuvoton.com,
	Jacky Huang <ychuang3@nuvoton.com>
Subject: [PATCH v14 0/1] Introduce Nuvoton ma35d1 SoC
Date: Mon, 12 Jun 2023 02:53:54 +0000
Message-Id: <20230612025355.547871-1-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

This patchset adds initial support for the Nuvoton ma35d1 SoC, including
initial device tree, clock driver, reset driver, and serial driver.

This patchset cover letter is based from the initial support for Nuvoton
ma35d1 to keep tracking the version history.

This patchset had been applied to Linux kernel 6.4.0-rc6
and tested on the Nuvoton ma35d1 SOM evaluation board.

(ma35d1 information: https://www.nuvoton.com/products/microprocessors/arm-cortex-a35-mpus/)
MA35D1 porting on linux-5.10.y can be found at: https://github.com/OpenNuvoton/MPU-Family

v14:
  - Removed patches PATCH v13 1/10 ~ 9/10 as they were applied
  - Modify serial driver
    - Fixed coding style issues

v13:
  - Modify serial driver
    - Added a check for oops_in_progress in ma35d1serial_console_write to
      determine whether to perform the spin_lock.
    - Rebased drivers/tty/serial/Kconfig and recreate the patch
    - Rebased MAINTAINERS and recreate the patch

v12:
  - Modify serial driver
    - Added PORT_MA35 to include/uapi/linux/serial_core.h, and apply to
      the port->type of ma35d1 serial driver
    - Added check for the return value of ioremap()
    - Fixed several coding issues
  - Rebase MAINTAINERS and recreate the patch

v11:
  - Rebase on top of 2023.05.24
  - Modify serial driver
    - Fixed several coding style issues
    - Fixed ma35d1serial_set_mctrl()
    - Added the 'MA35_' prefix to all register and bit field definitions.
    - Used 'ttyNVT' instead of 'ttyS'
  - Modify clock driver
    - Added 'source nuvoton/Kconfig' to drivers/clk/Kconfig
    - Fixed several coding issues
    - Removed unnecessary inline specifier
  - Modify reset driver
    - Fixed typo and added comments
  - Modify ma35d1.dtsi l2-cache node
    - Added cache-unified and cache-size properties

v10:
  - Change from using ARCH_NUVOTON to using ARCH_MA35. The following patch files
    have been modified:
    - patch 1 arch/arm64/Kconfig.platforms
    - patch 2 arch/arm64/configs/defconfig
    - patch 7 arch/arm64/boot/dts/nuvoton/Makefile
    - patch 8 drivers/clk/Makefile
              drivers/clk/nuvoton/Kconfig
              drivers/clk/nuvoton/Makefile
    - patch 9 drivers/reset/Kconfig
    - patch 10 drivers/tty/serial/Kconfig

v9:
  - Combine MAINTAINERS patch into patch 5 'dt-bindings: arm: Add initial bindings
    for Nuvoton platform'
  - Modify clock driver
    - Use the helper function for 64-bit division
    - Fixed minor issues
  - Modify reset driver
    - Refine coding style and add required header files
    - Add spin_lock protection
  - Add error return handling to the serial driver probe function

v8:
  - Remove '0005-dt-bindings-mfd-syscon-Add-nuvoton-ma35d1-sys-compat.patch' as it was applied.
  - Modify MAINTAINERS NUVOTON MA35 and NPCM path settings
  - Remove 'syscon' from dtsi 'sys' node and modify the corresponding yaml
  - Modify clock driver
    - Remove the header file and move definitions into .c files.
    - Use parent_data instead of parent name.
  - Modify serial driver
  - Modify reset driver
    - Modify reset register/offset lookup table to be indexed by reset id
    - Combined reset and reboot structure

v7:
  - Fixed dts system-management node and compatible driver
  - move 'nuvoton,npcm-gcr.yaml' from 'binding/arm/nuvoton' to 'binding/soc/nuvoton'
  - In ma35d1.dtsi, create the soc node for ma35d1 SoC
  - Modify the issues found in serial driver
  - Modify the issues found in clock driver
  - Modify the IDs of reset driver to be contiguous numbers and use lookup table
    to find register offset and bit position.
  - Modify MAINTAINERS NUVOTON NPCM path as npcm directory name to nuvoton

v6:
  - Combine nuvoton,ma35d1-clk.yaml and nuvoton,ma35d1-clk.h into one patch
  - Combine nuvoton,ma35d1-reset.yaml and nuvoton,ma35d1-reset.h into one patch
  - rename Documentation/devicetree/bindings/arm/npcm directory as nuvoton
  - Remove patch for adding include/linux/mfd/ma35d1-sys.h as it's not required
  - Update dtsi & dts files and move board-specific nodes to dts
  - Modify reset driver
  - Modify serial driver, fix coding style issues
  - Modify clock driver, rewrite the PLL calculation functions

v5:
  - Add ARCH_NUVOTON to arm64 Kconfig
  - Add ARCH_NUVOTON to defconfig
  - Add the clock driver
  - Add the reset driver
  - Add the serial driver
  - Add us to the maintainer

v4:
  - patch 4/5 is a resend
  - Fixed dt_binding_check errors of nuvoton,ma35d1-clk.yaml
  - Modify ma35d1.dtsi
    1. Add a node hxt_24m
    2. Fixed the base address of gic node
    3. Add clocks and clock-names to clock node
  - Fixed borad binding mistakes of nuvoton.yaml

v3:
  - added patch 4/5 and 5/5
  - introduce CONFIG_ARCH_NUVOTON option
  - add initial bindings for Nuvoton Platform boards
  - fixed coding style problem of nuvoton,ma35d1-clk.h
  - added CAPLL to clock-controller node
  - modify the chosen node of ma35d1-evb.dts
  - modify clock yaml "clk-pll-mode" to "nuvoton,clk-pll-mode"

v2:
  - fixed dt_binding_check failed of nuvoton,ma35d1-clk.yaml

Jacky Huang (1):
  tty: serial: Add Nuvoton ma35d1 serial driver support

 drivers/tty/serial/Kconfig         |  18 +
 drivers/tty/serial/Makefile        |   1 +
 drivers/tty/serial/ma35d1_serial.c | 817 +++++++++++++++++++++++++++++
 include/uapi/linux/serial_core.h   |   3 +
 4 files changed, 839 insertions(+)
 create mode 100644 drivers/tty/serial/ma35d1_serial.c

-- 
2.34.1

