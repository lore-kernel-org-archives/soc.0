Return-Path: <SRS0=1Zlv=H5=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FB2C35274
	for <soc@archiver.kernel.org>; Mon, 18 Dec 2023 08:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA166C433CA; Mon, 18 Dec 2023 08:09:18 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5215C433C7
	for <soc@kernel.org>; Mon, 18 Dec 2023 08:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5215C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbcfd61bd0fso1880604276.1
        for <soc@kernel.org>; Mon, 18 Dec 2023 00:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1702886955; x=1703491755; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fdfcNWtIOyQkG4XKiRkS3F7fIm5uJnYfnytV8cZKfso=;
        b=REC6bJLnMt9pi6jfculp06vecGfUBCFEzHyMv5IORXE/1YrCJ3iqU0z4WDJEo3Ukkr
         eTTOYpJk7y39KEy/IGGBEWOkvgIRUcZt7jn7AROo60RbzJFtOmRWzJOmb/W2zv4RFouG
         99xc/gtwNB6YbYEzqcVzyfM5SUoKmmkOgsRs4CBJUHWWyJfaUij4jpVJq6/K6JxoVqEI
         nCuZyqHUuDnNRUg/9IuSJB+51unBkX6ZQvKeVGQSvyPzz7h+KJ2TTMqpv2ILQXD7vXc9
         6AAJweoaugKhJzJ/97g6nh3vlDxV/zGOfuIHtjMYHMs0VES4e+fCyzTkwEGtn+DHuw0w
         FXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702886955; x=1703491755;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdfcNWtIOyQkG4XKiRkS3F7fIm5uJnYfnytV8cZKfso=;
        b=cbANmJmZ35+iTBMQIxM78UtRWKer6vPOtRdmVz8dyWl0qSfubzI8KbUx0JjYnBJRRJ
         o8rgNsL/WccaxGztj1tjsukHOLgT3d5TJOYom2gwDuHD2uLZ+dBNUIsovXpUOCyflKpy
         HPNIdeUglSYzEmCzFpIEgdNL+CqoHznlfdP8CbEPDAFgcM+ZPAiUT9xKOpjOd+PiH75x
         yDXueaBAFg3if8L2tNpzc0b21lM33V0p6OxeXZelczp72SWAD8pgZCTJwe1LwUhFcysi
         m/TJUtWC5cZjaZyozA9jYeeXhMI5qWE4iljGVjgJh3Jc/L9a81H5y12En4mfgqYdLEi5
         NlLg==
X-Gm-Message-State: AOJu0YxB2GREdDPME7S1huk3+nV/glw2ju9hKDpzJgL0xjg/HZfuBEh3
	/wRTO+FW4sQ7vdKVhDPEvj+vqxJzrOuAjmYliwWVCVllmp1JihbHOJCc2g==
X-Google-Smtp-Source: AGHT+IEHmnA2fcGabLP2mTX21YCnDvUR1XdalNm257Oam46kJl6M3s+9+maxOVysNAi5orFJEkemefsVtRR2gBZ9fhQ=
X-Received: by 2002:a25:db44:0:b0:dbd:1dd:41cb with SMTP id
 g65-20020a25db44000000b00dbd01dd41cbmr2920655ybf.7.1702886955006; Mon, 18 Dec
 2023 00:09:15 -0800 (PST)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 18 Dec 2023 09:09:03 +0100
Message-ID: <CAHTX3dLyA1Y9guLKSNJTChFVvkspMfTa0odULyAdcuFUSiSH3A@mail.gmail.com>
Subject: [GIT PULL RESEND] arm64: dts: ZynqMP DT changes for v6.8
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these changes to your tree. Most of those patches are related to dt
schema fixes or solving issues reported by W=1.
FYI: I have rebased the queue this week because Masahiro sent fixes tag Dec 12
against Rob's patch and wanted to record it.

I see origin email in lore here
https://lore.kernel.org/soc/678c4116-bb16-4d07-b70d-d417405c8266@monstr.eu/T/#u
but I can't see it in patchwork that's why sending it again and see if
that goes through.

Thanks,
Michal


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-6.8

for you to fetch changes up to a98b6987de7d44cb621294041364f70285b3d2c6:

  arm64: zynqmp: Add missing destination mailbox compatible
(2023-12-13 16:52:47 +0100)

----------------------------------------------------------------
arm64: ZynqMP DT changes for 6.8

- Fix overlay rules to remove KR260 targets
- Move ethernet phys to mdio node
- Fix couple of issues reported by W=1
 - Do not use _ in node names
 - Use lowercase in register address
 - Remove address/size-cells from nodes without child
 - Moved fixed clock to root on KV260
- Fix issues reported by dt-schema
 - additional compatible string for qspi on SOM
- Move arm/xilinx.yaml to soc vendor to cover also other archs
- Describe new Microblaze V qemu platform
- Add missing mailbox destination compatible string

----------------------------------------------------------------
Michal Simek (11):
      arm64: xilinx: Do not use '_' in DT node names
      arm64: xilinx: Use lower case for partition address
      arm64: xilinx: Remove mt25qu512a compatible string from SOM
      arm64: xilinx: Put ethernet phys to mdio node
      arm64: xilinx: Remove address/size-cells from flash node
      arm64: xilinx: Remove address/size-cells from gem nodes
      dt-bindings: soc: xilinx: Move xilinx.yaml from arm to soc
      dt-bindings: soc: Add new board description for MicroBlaze V
      arm64: zynqmp: Move fixed clock to / for kv260
      arm64: zynqmp: Fix clock node name in kv260 cards
      arm64: zynqmp: Add missing destination mailbox compatible

Rob Herring (1):
      arm64: dts: xilinx: Apply overlays to base dtbs

 Documentation/devicetree/bindings/{arm => soc/xilinx}/xilinx.yaml |  7 +++-
 MAINTAINERS                                                       |  1 +
 arch/arm64/boot/dts/xilinx/Makefile                               |  9 ++---
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso              |
40 +++++++++----------
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso              |
42 ++++++++++----------
 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts                 |  8 ++--
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts            |  8 +++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts            | 16 +++++---
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts            |  8 +++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts            |
26 +++++++-----
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts            |  8 +++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts                 |  4 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi                            | 15 ++-----
 13 files changed, 104 insertions(+), 88 deletions(-)
 rename Documentation/devicetree/bindings/{arm => soc/xilinx}/xilinx.yaml (95%)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
