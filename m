Return-Path: <SRS0=zSrM=FN=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A389C433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 14:51:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1DCF523406; Wed,  9 Dec 2020 14:51:39 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1647B233EA
	for <soc@kernel.org>; Wed,  9 Dec 2020 14:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1647B233EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=monstr@monstr.eu
Received: by mail-ej1-f49.google.com with SMTP id bo9so2480288ejb.13
        for <soc@kernel.org>; Wed, 09 Dec 2020 06:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=L1IO19qXY1NcTfwwUfbiAFQGNNIV2Z5deXmNuyxW8Ts=;
        b=sw9ocUGOkIKJ9XR4bSBdvkEXzfCpjjvu1Ppn2NuuZJc95S3whPcBdxmGE3E3MZy+DL
         bW0Wbjzq03CR96a45mTtwau6YtlvML0iH9r/xgu/PIEThWNIdXBFDEVeHt7lJnWsOTOI
         Thi1S0HSRRPp4XBNnBNX7xsn9jPQvojWCYa4l8YftysS/rqzPQu6v4cWrK0agUj2hq54
         SsMqktxUJzTHGB4IW2rKOB7udirJSSyh2OtzOhBBQl8GwVosD9SMmUQQmvx6wVk50xZN
         Ty1jodJV36KYChy24CuZF51HRM1CFvMEQk84YYcYp9/S2QXTZ7AwAOFlyidMn1wwZ6Ld
         lcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=L1IO19qXY1NcTfwwUfbiAFQGNNIV2Z5deXmNuyxW8Ts=;
        b=WPHfq2QKJGK4FlF18O8/mjql1TJSoT6WiZs0ZNSds/JogUXKawgypgZQ4hM9owm73A
         DAkyPx/poXvFrIvKxmlgi0Nfa+zrOxjXmS+Ri53Yr7zQTdb6bedRed7TlSdGiImapxhA
         PhShSTVIeHe1lNScbz3M4r+eF8h41mSNKCbT1+AMYieE88AIc7UwzCh4mKxwfqQGBvow
         7Rk9n3Ga3dCFV2zYCU0vqrP9tw+ekd01hi46zVCfTiNG6EWMIflMckxt1TueuMS+SY/y
         O0UVrLulZkgneaDFvGrihdWZVxwE6zHnEBNCk9nUfuD0JeG5QKc31d0FC6wzOHl3Cm3u
         wh+g==
X-Gm-Message-State: AOAM531jsVJcBVEAhes+geslkoYqQ3YMA35fp9rJ5Mxa140vbm/8jysw
	Agcb0ihYS5/B5oRfmptbXUloEA==
X-Google-Smtp-Source: ABdhPJzpH9WM0l02jTMF231K/eO7gRxb+cTiaOY92JaY6vCHVH+p72LFzONnlgJihnkURE0e0+d/rw==
X-Received: by 2002:a17:906:1e0c:: with SMTP id g12mr2449404ejj.214.1607525496412;
        Wed, 09 Dec 2020 06:51:36 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id e14sm1720250ejh.62.2020.12.09.06.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 06:51:35 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 arm-soc <arm@kernel.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.11
Message-ID: <752fc10f-c2eb-736e-8a11-13e770f50c90@monstr.eu>
Date: Wed, 9 Dec 2020 15:51:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

please pull the following changes to your tree. The tree is based on
zynqmp-soc-fixes-for-v5.10-rc6 tag or acfdd18591ea ("firmware: xilinx:
Use hash-table for api feature check") which went to v5.10-rc6.

Thanks,
Michal


The following changes since commit acfdd18591eaac25446e976a0c0d190f8b3dbfb1:

  firmware: xilinx: Use hash-table for api feature check (2020-11-24
15:13:54 +0100)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v5.11

for you to fetch changes up to b8d6b5c241b3dedaa03f845e25412935fef81c6b:

  firmware: xilinx: Properly align function parameter (2020-12-09
15:09:11 +0100)

----------------------------------------------------------------
arm64: soc: ZynqMP SoC changes for v5.11

- Small alignments in Xilinx Firmware driver
- Exposing syscon interface for VCU driver

----------------------------------------------------------------
Michael Tretter (4):
      soc: xilinx: vcu: drop useless success message
      dt-bindings: soc: xlnx: extract xlnx, vcu-settings to separate binding
      soc: xilinx: vcu: use vcu-settings syscon registers
      soc: xilinx: vcu: add missing register NUM_CORE

Michal Simek (4):
      firmware: xilinx: Fix kernel-doc warnings
      firmware: xilinx: Remove additional newline
      firmware: xilinx: Add a blank line after function declaration
      firmware: xilinx: Properly align function parameter

Wendy Liang (1):
      firmware: xlnx-zynqmp: fix compilation warning

Zou Wei (1):
      firmware: xilinx: Mark pm_api_features_map with static keyword

 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml |
34 ++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt           |
9 ++-------
 drivers/firmware/xilinx/zynqmp.c                                    |
48 ++++++++++++++++++++++++------------------------
 drivers/soc/xilinx/Kconfig                                          |  1 +
 drivers/soc/xilinx/xlnx_vcu.c                                       |
96
+++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------
 include/linux/firmware/xlnx-zynqmp.h                                |
45 ++++++++++++++++++++++++++++++++++++++++-----
 include/linux/mfd/syscon/xlnx-vcu.h                                 |
39 +++++++++++++++++++++++++++++++++++++++
 7 files changed, 187 insertions(+), 85 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
 create mode 100644 include/linux/mfd/syscon/xlnx-vcu.h
[linux](zynqmp/soc)$

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

