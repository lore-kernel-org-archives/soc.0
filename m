Return-Path: <SRS0=VUrm=H2=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16162C35274
	for <soc@archiver.kernel.org>; Fri, 15 Dec 2023 14:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F138CC433CB; Fri, 15 Dec 2023 14:23:36 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8FD63C433CA
	for <soc@kernel.org>; Fri, 15 Dec 2023 14:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8FD63C433CA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-54cde11d0f4so966895a12.2
        for <soc@kernel.org>; Fri, 15 Dec 2023 06:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1702650212; x=1703255012; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h56swPUytYW76bH6vs5F4zvFr5/b0yCe4cE+NnnQHPM=;
        b=wZVzG1Gj6A/dTlDORJlUNV0Se6TwfThPC+jrophPQ9uzw97IZrt/fTCIqObDIig2Et
         hsH4GlAN3Hx+J1Nbw0CjT/9vQf5TXr7Hp2TZ1rmznZkyYNbCOUJe92VsdB6bC68zTRaO
         Fv57bKQU59tDqUguBCWqoOeqfKYBO6nO+Kc8SJG3/I0vcTwb7T/61QEV4MLzrUDNuu+d
         LBFRohAmDj4yG9m25StCZgfJ/IZLdM8vz+FpT/MsxSYLWwRK75AY2FiXCpZG6PE0ce1c
         t2qMWlJ5M7WvnMGbzZQPrSr9qheU7K/XGacYAWdNflmFtJsmEdvDXSq2B8FsyPNvqIDb
         obsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702650212; x=1703255012;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h56swPUytYW76bH6vs5F4zvFr5/b0yCe4cE+NnnQHPM=;
        b=SBpWySDQmv2C4jbaG+EnJ2mZAdfCoEdlmJ4goipUVQX907Ujgr96u+reNaTxiib3Bh
         3VDUmPtd9r9+NXDZ8Jak5EqZaPAneJ0h4pnBTwoaS00Zu/YWkkEi19qDsCSAho6gSJra
         YQabsKnKu54MsIidcSGbTCqHWOy346hYE/CGW/dFUBjiUIK1oHDhyn4E7dTh2gIKfbJR
         Ix9H9bhVgqEb99QOKIrKg16LM6bSoVkSBPteVA7ahBxtZcWOZ955XKEyHXbExn/tl2HZ
         fBQZ3sXeGFXFEpchqCQ7lG9wnyDorKq8peLRsq4LJ/tQBqQT0yXEYgGRLUr8iwzlMH8G
         i8Ag==
X-Gm-Message-State: AOJu0Yydz3wS+Ekz3jhnjTDnn8Gfi0G5/da1QQNw5nfoW5qkjN6nE74o
	s4QNScV61Kv3ptOtxkMadyGyItRX4e3hpwe1VvmHnQ==
X-Google-Smtp-Source: AGHT+IHXNw7QVOh4qEMRy1hfVQ1sKRjMfcs7s6D9VCHnF9gYGoee/yqx3qhBxw86XUSdqeA6B1iCGw==
X-Received: by 2002:a17:907:3f91:b0:a19:a1ba:da49 with SMTP id hr17-20020a1709073f9100b00a19a1bada49mr7257924ejc.112.1702650212046;
        Fri, 15 Dec 2023 06:23:32 -0800 (PST)
Received: from [10.254.183.223] ([149.199.62.131])
        by smtp.gmail.com with ESMTPSA id vx12-20020a170907a78c00b00a1ddb5a2f7esm10859025ejc.60.2023.12.15.06.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 06:23:31 -0800 (PST)
Message-ID: <678c4116-bb16-4d07-b70d-d417405c8266@monstr.eu>
Date: Fri, 15 Dec 2023 15:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for v6.8
Autocrypt: addr=monstr@monstr.eu; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull these changes to your tree. Most of that patches are related to dt 
schema fixes or solving issues reported by W=1.
FYI: I have rebased the queue this week because Masahiro sent fixes tag Dec 12 
against Rob's aptch and wanted to record it.

Thanks,
Michal

  The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

    Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

  are available in the Git repository at:

    https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-6.8

  for you to fetch changes up to a98b6987de7d44cb621294041364f70285b3d2c6:

    arm64: zynqmp: Add missing destination mailbox compatible (2023-12-13 
16:52:47 +0100)

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
   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso              | 40 
+++++++++----------
   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso              | 42 
++++++++++----------
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts                 |  8 ++--
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts            |  8 +++-
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts            | 16 +++++---
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts            |  8 +++-
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts            | 26 
+++++++-----
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts            |  8 +++-
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts                 |  4 +-
   arch/arm64/boot/dts/xilinx/zynqmp.dtsi                            | 15 ++-----
   13 files changed, 104 insertions(+), 88 deletions(-)
   rename Documentation/devicetree/bindings/{arm => soc/xilinx}/xilinx.yaml (95%)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs
