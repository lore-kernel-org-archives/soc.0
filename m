Return-Path: <SRS0=XMaa=DV=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBE7C001DB
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 11:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C084C433C7; Fri,  4 Aug 2023 11:22:38 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E06DC433C8
	for <soc@kernel.org>; Fri,  4 Aug 2023 11:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E06DC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fe426b86a8so11898995e9.3
        for <soc@kernel.org>; Fri, 04 Aug 2023 04:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20221208.gappssmtp.com; s=20221208; t=1691148153; x=1691752953;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vt9MIkmpgHbpgvEyNBt/LpTCD7wlcJKGef4PNrlE7n8=;
        b=r3wfZayTHBPavG2GgRFvIYLhNwsgAFRVRFO4BBMjdU4ysRuiE2Xo40fye4adBytESC
         4VSK41CUpgQqS/APM5JVENaGikHQRKAZNkpfyHn2lCIJdbO0EJ/bMcgVgt0Hc1MG5Scl
         CO0RIePGgpYTSQfAefrMRyWT0gmT/ccNU47bhi8vj31XulODXeW+Cdz2ib/UPWsPO80K
         FEjiysMv6t7I5u6P3UlIVqKBg89Xvf5BCZ1fXy/FdekrcoJCeacUl11Gn/sK1qJlr/m4
         54KkYoQH0Z/zNU//yUXBlTm6JbsxqOw6I0Y4LUOMLIPrBXqa5fwVI1ZPjGWeycM7VUXh
         Ywkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691148153; x=1691752953;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vt9MIkmpgHbpgvEyNBt/LpTCD7wlcJKGef4PNrlE7n8=;
        b=I6wvG90rWNR46qtN4z7/Pr7J69/Fi/Vb2fFSAaGIlCR4hIxd0yYMSLBKNgTeAbGVXT
         KfNo1kwdg5ARWiM6xsw3SDYly/lEv7lgqMAxewtD++6ILP6HnJi6Xrps7BhboxLwRN9M
         kqX9+XOQAQMO2PUbwbOIsTteoF5vdI4CzMc2vOXs66+29VdY3y+O6NyU3HWFwgeR2kPq
         JfOXs3agi5FspaT7deZtugskIM6ljZZ7eTrxeFdeBurw7wg8jaGXa6+JjKyetfnfnFC0
         tQ/cGUuXMAlENBEb531+7N+G7hHVM0byYpbiQ/V/BcIpo5YaX4RnliBf7TmwKAQIH3O5
         agtg==
X-Gm-Message-State: AOJu0YzvideL4xhwvNkcgPgvZPUgBFLs2vKv/Ynb39yk9dg0H/Dz3UaU
	7ExcM+baLMR3ujhNnvI7jeA1uoASLPxs997HqPU=
X-Google-Smtp-Source: AGHT+IEkhqewa85nBqXaKPLcbwFtDonZKi/qRmcWRDl1cYbR4gYd5UCCKEZAxBU49wWJe6oS57T8eQ==
X-Received: by 2002:a05:600c:291:b0:3fe:22fd:1b23 with SMTP id 17-20020a05600c029100b003fe22fd1b23mr1363353wmk.34.1691148153391;
        Fri, 04 Aug 2023 04:22:33 -0700 (PDT)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id k14-20020adfd84e000000b003177e9b2e64sm2264600wrl.90.2023.08.04.04.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 04:22:32 -0700 (PDT)
Message-ID: <fde6d7b4-c751-219d-3ec5-04e5bad2aa17@monstr.eu>
Date: Fri, 4 Aug 2023 13:22:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: "git (AMD-Xilinx)" <git@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for v6.6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull these changes to your tree.

Thanks,
Michal

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-6.6

for you to fetch changes up to cf0e27cd011775f63001e1e925969106c9464fca:

   arm64: zynqmp: Describe interrupts by using macros (2023-07-27 08:29:50 +0200)

----------------------------------------------------------------
arm64: ZynqMP DT changes for v6.6

- Describe caches
- Fix i2c gpio recovery description
- Setting up default i2c frequency
- Describe GEM TSU clock and assigned rates for SOMs
- Reserved 1MB for internal firmware usage
- Fix dwc3 IRQ description
- Describe interrupts by using macros

----------------------------------------------------------------
Harini Katakam (1):
       arm64: zynqmp: Assign TSU clock frequency for GEMs

Manikanta Guntupalli (1):
       arm64: zynqmp: Fix open drain warning on ZynqMP

Michal Simek (2):
       arm64: zynqmp: Fix dwc3 usb interrupt description
       arm64: zynqmp: Describe interrupts by using macros

Radhey Shyam Pandey (1):
       arm64: zynqmp: Add L2 cache nodes

Sharath Kumar Dasari (1):
       arm64: zynqmp: Add memory reserved node for k26 Kria SOM board

Varalaxmi Bingi (1):
       arm64: zynqmp: Setting default i2c clock frequency to 400kHz

  arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi         |   4 +
  arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso   |   5 +-
  arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso   |   5 +-
  arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts      |  15 +-
  arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts |   4 +-
  arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts |   4 +-
  arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts |   8 +-
  arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts      |   4 +-
  arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts      |   8 +-
  arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts      |   4 +-
  arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts      |   4 +-
  arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts      |   8 +-
  arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts      |   8 +-
  arch/arm64/boot/dts/xilinx/zynqmp.dtsi                 | 201 ++++++++++++--------
  14 files changed, 173 insertions(+), 109 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs
