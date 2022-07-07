Return-Path: <SRS0=7UwO=XM=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2AFC43334
	for <soc@archiver.kernel.org>; Thu,  7 Jul 2022 14:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3A09C341C8; Thu,  7 Jul 2022 14:30:21 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06AC9C3411E
	for <soc@kernel.org>; Thu,  7 Jul 2022 14:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06AC9C3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ej1-f50.google.com with SMTP id u15so8321669ejx.9
        for <soc@kernel.org>; Thu, 07 Jul 2022 07:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=YozCDGheS6rcl72wsPSf5Zvk7xN97uSc4RBWmFtaB5g=;
        b=lm4lVfiHISR2Lr6nWJLGvCwR8zbJrI0JYfbNjp8vSGM+3AzGTFKXnM9hXvMUdYtWqf
         TOxt0JKck0LD3W7/2q7KcsXqI0GH5M5nKq1B0qwsLlYA+XZB1Jp4SkZb3C/JDTeTBS6j
         XCgiitSf+iFacCb3AtYQ3aifFFkGg6U4YJ/lNSULrozy4tjh8CBswGLsKUgXmJNUCpAl
         j/zgFk6elVbaXqWvIVTbtjwqzUjZ/YXm++X/KA4DCFzSHAuCSstrmhMk2IXVplUShQFK
         6yAoT3/6shkuaOrHjqhaYgjqVNj2E/WuEBDxHf9t4V8zGx7uLmndWkCpfAF5/gn70huR
         0PGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=YozCDGheS6rcl72wsPSf5Zvk7xN97uSc4RBWmFtaB5g=;
        b=G5qpZh+WWzhHdPFsSU5VrKnMDHanPSbNBfL1aDoFliVZq215XXGIMnG0CfZCMnrEnD
         7XPTSqDjybEP0t7twPacNmkTYoJvJdPnu/1CmoJvoQZylt3esKKjFnOLHSuJQpHVmijV
         YWSaMsW9hV/LZlAZbhGmb2GKkWMHbzooWcRNvDLBT3BWRqVJPCpUXjJjsv2n/jyAjceM
         qI/0+Q2gM9N6s/xMRyCVPhRUNiOOWRn3AaY150TiMdgYAZfD4o2Y/HygEU8ZlcQ1mZ2E
         Ll696+77vx8k0Vd4ZeAZYlQy1rP4KWkiC/RDw0YZBQoFCmP+gyWRU02CZ5oRvQbIF+h8
         dVFg==
X-Gm-Message-State: AJIora+7X0fz4CkSHxHeAHDiKENb+GzZT8bFx59OWEpuyKDKPitro/nG
	NhSf//VjY2J5t+r/yeecSijPvXyA5j8zjg==
X-Google-Smtp-Source: AGRyM1sNpDnsafd+ypuYnS2SMsp517va+8mUxRxtunUSVBrol3gjPdBUM0x/xZyXbEH4HZxL/hNWNA==
X-Received: by 2002:a17:906:5d04:b0:722:f46c:b891 with SMTP id g4-20020a1709065d0400b00722f46cb891mr46108806ejt.4.1657204217690;
        Thu, 07 Jul 2022 07:30:17 -0700 (PDT)
Received: from ?IPV6:2a02:768:2307:40d6::f9e? ([2a02:768:2307:40d6::f9e])
        by smtp.gmail.com with ESMTPSA id v5-20020a170906338500b006fed85c1a8fsm18879748eja.202.2022.07.07.07.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:30:16 -0700 (PDT)
Message-ID: <452e8c68-b63b-f4f6-a937-67f65c64a8a0@monstr.eu>
Date: Thu, 7 Jul 2022 16:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: git <git@xilinx.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.20
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull these DT patches to your tree. The part of pull request are also 3 
patches which targets zynq gpio DT binding. All of them are reviewed by Linus or 
Rob or both.

Thanks,
Michal

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-v5.20

for you to fetch changes up to 228e8a88b1915a2b467c83d8d0976605f1272fae:

   arm64: dts: xilinx: align gpio-key node names with dtschema (2022-06-23 
10:11:19 +0200)

----------------------------------------------------------------
arm64: dts: ZynqMP DT changes for v5.20

- Extend gpio-zynq DT binding (compatible, power-domains, gpio-line-names)
- Fix sm-k26 gpio comment
- Wire AMS device
- Align gpio-keys node names with dtschema

----------------------------------------------------------------
Krzysztof Kozlowski (1):
       arm64: dts: xilinx: align gpio-key node names with dtschema

Michal Simek (4):
       dt-bindings: gpio: zynq: Add missing compatible strings
       dt-bindings: gpio: zynq: Add power-domains
       arm64: zynqmp: Fix comment about number of gpio line names
       dt-bindings: gpio: zynq: Describe gpio-line-names

Robert Hancock (1):
       arm64: dts: zynqmp: add AMS driver to device tree

  Documentation/devicetree/bindings/gpio/gpio-zynq.yaml | 59 +++++++++++++++++++-
  arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi        |  4 ++
  arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts     |  4 +-
  arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts     |  2 +-
  arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts     |  2 +-
  arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts     |  2 +-
  arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts     |  2 +-
  arch/arm64/boot/dts/xilinx/zynqmp.dtsi                | 26 +++++++++
  8 files changed, 94 insertions(+), 7 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

