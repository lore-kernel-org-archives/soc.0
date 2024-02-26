Return-Path: <SRS0=hzE+=KD=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A4FC48BF6
	for <soc@archiver.kernel.org>; Mon, 26 Feb 2024 12:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE288C43390; Mon, 26 Feb 2024 12:30:49 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D51BDC433C7
	for <soc@kernel.org>; Mon, 26 Feb 2024 12:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D51BDC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc745927098so2778357276.3
        for <soc@kernel.org>; Mon, 26 Feb 2024 04:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1708950646; x=1709555446; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8lDSFFCqMdMytYx4AagDsndZMbOw6+CY1kV5lHBk1/8=;
        b=HO7NNiUs/iXtLVt1XALNSuGi60PhFKX6Lg+S8d7I+dIgoIei+/mdLxSMK/3yu4vIuh
         wPXl8mVkhV3A8GMWMWYs032ZIfv26hfNKN8ixCgqrbmW4e/IxVREgMY56Ta0UOoZsL2P
         gh61ivxUw/FYTpXpwzpLJx17hmuXbdfEYgc3jEpkGqlbrlOrU+8trSqcBhW4wcwqk5pS
         CNJIGWwuD4kKrSTFZGMEuu+Fqj3XT73MEFvy6B134xPkZGOw7N2sR2Ezr120/mWoE1bg
         PnQlT0XAI+qUY/QHCoiQYnuKuh+7THxSbmFy3YP7/f7zU4dQkJ5Z/BRkvz9vJh3alQ9/
         279w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950646; x=1709555446;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8lDSFFCqMdMytYx4AagDsndZMbOw6+CY1kV5lHBk1/8=;
        b=lvbca666DO6M8ltQXC+Dw8BkywKfgktupBKyc5x5NQLtfDI3Eur/REGekNQZOL08LH
         db9cdqp/q/bdSw1sBZQ0V4zYI8HjSVtBpyk11LWHJBp9yIMIpnorO77K5ZWoS077OTHa
         SshpbmSVAjEUicRknW6iplXhf5VLlva4EiDNZBQCCzkNZUJC2UyB+gDgUjmyF114xRAv
         KWsMPpoQNGC5YKJcC+cOEd+VwxDimXauHZjpP2S9hD9ASzhtbPK/67/jK6qfBeqT1Msz
         4YYq22BcjpFc4H1Ii6ZWLNEkP9fcIGUErgEfRiuA/oruI1d0ynLTKQWq0/tWmGkCUXmj
         hIdw==
X-Gm-Message-State: AOJu0Yxj4zhILBqsRMCtuh86f/AYyqnCIHjwJQ5CMCxJagVRU1pnisL3
	XX1eLmPIP1dBYjQHFlEN0e83duaoFvDK6ts0OsqGXumCISq0gZqHt7WAEWgDNBJ4QENvGvOsDko
	KtQbMm/jhqU9ayKNjB2eLkoPesyFkhP60jNYtNYst47gFcngRDaQY
X-Google-Smtp-Source: AGHT+IGfiPenwVo+Lm1ktXjRIi+zttWgs7Wm4jy/i2Z1mK/lPO5hUmRFGTcPfyRWD60ZPeJo/ktr8k41JPAuucgLSUk=
X-Received: by 2002:a25:bc49:0:b0:dcf:5be3:3ed4 with SMTP id
 d9-20020a25bc49000000b00dcf5be33ed4mr3565429ybk.17.1708950645944; Mon, 26 Feb
 2024 04:30:45 -0800 (PST)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 26 Feb 2024 13:30:34 +0100
Message-ID: <CAHTX3dLEoFMTGg1Q4+OuOwWYd8N73YBTXki8Vvj3cGHUpLJ0=A@mail.gmail.com>
Subject: [GIT PULL] arm64: ZynqMP DT changes for v6.9
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these DT changes to your tree. There are some SoC related
dt binding changes and associated DT changes. Also followed by some
small updates.
All the changes have been checked against DT schema but there are
still some older descriptions which should be updated in future.

Thanks,
Michal


The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-6.9

for you to fetch changes up to d8764d347bd737efec00fae81133ffad0ae084bb:

  dt-bindings: firmware: xilinx: Describe soc-nvmem subnode
(2024-02-06 08:01:32 +0100)

----------------------------------------------------------------
arm64: ZynqMP DT changes for 6.9

dt-bindings:
- Describe firmware for Versal NET
- Describe all firmware child nodes
- Align versal-fpga node name with dt schema
- Describe k26 rev2 and kv260

DTs:
- Align firmware node with dt schema
- Add an optee node
- Describe reset for CANs
- Update ECAM size to discover up to 256 buses
- Describe assigned-clocks for uarts
- Add u-boot node
- Comment SMMU entries
- Align dwc3 nodes with dt schema
- Rename i2c groups to match dt schema
- Small DT updates (comments)
- Fix default clock frequency for si570 (zcu102, zcu106)
- Add output-enable pins and cover MIO38 (SOM)

----------------------------------------------------------------
Ilias Apalodimas (1):
      arm64: zynqmp: Add an OP-TEE node to the device tree

Jay Buddhabhatti (1):
      dt-bindings: firmware: versal: add versal-net compatible string

Michal Simek (15):
      dt-bindings: firmware: xilinx: Fix versal-fpga node name
      dt-bindings: firmware: xilinx: Describe missing child nodes
      dt-bindings: firmware: xilinx: Sort node names (clock-controller)
      arm64: zynqmp: Rename zynqmp-power node to power-management
      arm64: zynqmp: Setup default si570 frequency to 156.25MHz
      arm64: zynqmp: Describe assigned-clocks for uarts
      arm64: zynqmp: Fix comment to be aligned with board name.
      arm64: zynqmp: Introduce u-boot options node with bootscr-address
      arm64: zynqmp: Remove incorrect comment from kv260s
      arm64: zynqmp: Rename i2c?-gpio to i2c?-gpio-grp
      arm64: zynqmp: Comment all smmu entries
      arm64: zynqmp: Align usb clock nodes with binding
      dt-bindings: soc: xilinx: Add support for K26 rev2 SOMs
      dt-bindings: soc: xilinx: Add support for KV260 CC
      dt-bindings: firmware: xilinx: Describe soc-nvmem subnode

Neal Frager (1):
      arm64: zynqmp: Add output-enable pins to SOMs

Srinivas Neeli (1):
      arm64: zynqmp: Add resets property for CAN nodes

Tejas Bhumkar (1):
      arm64: zynqmp: Disable Tri-state for MIO38 Pin

Thippeswamy Havalige (1):
      arm64: zynqmp: Update ECAM size to discover up to 256 buses

 Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
| 96 +++++++++++++++++---
 Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml
      |  2 +-
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
      | 70 ++++++++++++--
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
      | 16 +++-
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
      | 36 +++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
      | 37 +++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
      |  2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts
      |  2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts
      |  4 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
      |  2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
      |  6 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
      |  2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
      |  2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
      |  6 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
      |  4 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dts
      |  2 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi
      | 85 ++++++++++-------
 17 files changed, 295 insertions(+), 79 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
