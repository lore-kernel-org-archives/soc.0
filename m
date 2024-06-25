Return-Path: <SRS0=L3CL=N3=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338C3C3064D
	for <soc@archiver.kernel.org>; Tue, 25 Jun 2024 13:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F40EEC32781; Tue, 25 Jun 2024 13:21:28 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6287C32786
	for <soc@kernel.org>; Tue, 25 Jun 2024 13:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E6287C32786
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dff36345041so5505916276.3
        for <soc@kernel.org>; Tue, 25 Jun 2024 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1719321684; x=1719926484; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CmFr89GOMGXoKKD1T+BPB1RGe5bW9XuwQH2SHEPcgtA=;
        b=FndFeRjOp5xYhN9VV61xfwtbX3y5N7FIGMOBbb03qbGtLe3ZHJ0p4h/wuktp+h+/dw
         aL7brzsHKmmgBsHMEHxUG43EtjDP1dhGtPWFSoOjoN5Vj4PvqvRxjRme/Kj573bmSQO0
         M3/jU9TXaEW/K0BAjJwUdGRGs0GCBwpJKXswN/dkbuk8Y2WxGEKMEtThkk+HLtGa5oDh
         MdrJgpH8Y4v/8vXFAM2TZEUYvVzLtpw4mr/N0PuRrHgFZ0W3XoQX2/BfeK0/HDLIw0wB
         E7N+DwxdmTOVbMOc/p5hYQ4pCdYlKZk6eMmtMG+0ijNWjwc9c6DZzOrIGATf9WBpAym4
         wdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719321684; x=1719926484;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CmFr89GOMGXoKKD1T+BPB1RGe5bW9XuwQH2SHEPcgtA=;
        b=rXHO6OAuQEgUkBOxrt/2evl995g4gLLgGnjKb7+geLKLulWOmnSbp6RCiWE3X6kcKu
         1kYgjpZMcVK6tvXg9jV8a1a7zfjCtfAuedMWtddNDgQ1c1k6iuKslN373pSHaUMmYIml
         pn/gL1yxVnTdqHr9V+0wbrb02rnI7ph8/KwNJ3sl/f5pPxCQ3NKT+839z1PnO6GhoA1a
         q4SHastJpCAICDAj4ecoBZLEYXgD/igdPqlW8g698B0AQNBiC4jFNKLXC97K0sMRRbft
         bZ0hmKvc5TpON3oeaSMO0jwtNWLcjwyxHSH5a2pj5xiweigqXnLGnfqG/diOjF4ZLIOp
         covg==
X-Gm-Message-State: AOJu0YxIXMjwjEb8+bCZ0rFdzwzEg8FVwVuyDiIVEWk4bXh2tvDIlIzh
	5mDKXHg9rBncv48yriLRyHwZoFVSNAKd4RUDLpwf8tb58x2C0ZpJW/nEjjig2VouVthpnlKOaFr
	wvnzOZRTlQxtoy35Z8pxObJ/l6IN1Arg5kAEFDZZvQOPxuI0lH8/V
X-Google-Smtp-Source: AGHT+IFa34gsOjI2mzo79I9FobHeaRDi3AVDNNQ75leOtAssb2oUxNW+9MOFAvAF6OW0pqMc7TNUw+W79Ascvzca1G4=
X-Received: by 2002:a25:69c6:0:b0:dfa:ff7e:d410 with SMTP id
 3f1490d57ef6-e0303ffb521mr6391963276.40.1719321684153; Tue, 25 Jun 2024
 06:21:24 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Tue, 25 Jun 2024 15:21:13 +0200
Message-ID: <CAHTX3dLbNAYL4hm+bs=GByA4DqjRr3Rt6WESram8VyU1By8Mow@mail.gmail.com>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for 6.11
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these changes to your tree. I described it in two chunks
where the first is describing new
features and the second is only targeting issues reported by
dt-schema. Most of that changes target
Kria (kv260) platform.

Thanks,
Michal

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-6.11

for you to fetch changes up to f9508ef9976e8596f8a1139430ec439691f3337f:

  arm64: zynqmp: Add pwm-fan node and fix ttc0 pwm-cells property
(2024-06-17 08:36:23 +0200)

----------------------------------------------------------------
arm64: Xilinx DT changes for 6.11

- Add remoteproc TCM support
- Add coresight cpu debug support
- Describe OCM controller
- Disable Tri-state for SDIO on kv260
- Add compatibility strings for kv260 overlays
- Add support for k26-rev2 SOM
- Describe ina260/DP/TTC and PWM on kv260

DT schema alignments and fixes
- Align soc-nvmem binding with dt-schema
- Fix fpga region node
- Add description for efuses
- Describe USB wakeup interrupt
- Fix ams-pl node

----------------------------------------------------------------
Michal Simek (9):
      arm64: zynqmp: Align nvmem node with dt schema
      arm64: zynqmp: Use fpga-region as node name
      arm64: zynqmp: Add missing description for efuses
      arm64: zynqmp: Describe USB wakeup interrupt
      arm64: zynqmp: Describe OCM controller
      arm64: zynqmp: Remove address/size-cells from ams node
      arm64: zynqmp: Add compatible string for kv260
      arm64: zynqmp: Add description for ina260 on kv260
      arm64: zynqmp: Add support for K26 rev2 boards

Sean Anderson (1):
      arm64: zynqmp: Add coresight cpu debug support

Tanmay Shah (1):
      dts: zynqmp: add properties for TCM in remoteproc

Tejas Bhumkar (1):
      arm64: zynqmp: Disable Tri-state for SDIO

Vishal Patel (1):
      arm64: zynqmp: Add pwm-fan node and fix ttc0 pwm-cells property

Vishal Sagar (1):
      arm64: zynqmp: Describe DisplayPort connector for Kria

 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi       |  16 ++
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso |  19 +-
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso |  41 ++++-
 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts    |  19 +-
 arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dts   |   8 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dts  |   8 +
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi               | 186 ++++++++++++++++++--
 7 files changed, 270 insertions(+), 27 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
