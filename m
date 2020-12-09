Return-Path: <SRS0=zSrM=FN=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E3AC433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 18:41:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B9FA423AAC; Wed,  9 Dec 2020 18:41:56 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E4DC22B4B
	for <soc@kernel.org>; Wed,  9 Dec 2020 18:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E4DC22B4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=monstr@monstr.eu
Received: by mail-ed1-f42.google.com with SMTP id c7so2694161edv.6
        for <soc@kernel.org>; Wed, 09 Dec 2020 10:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=8RqaQ7XgudbyVp4IXxqQ9rHJaYf+ZXQi1yhwiXLgsQU=;
        b=oFTHVDdMXwRmYq73BcpW90ijU0/MVOyUsax/WRs6Le0imND5Y6o8DmgJXHs0djsuDn
         r8GTDEvdmvCpNXiSh31dDbhnItMpFG8vdRz5fjTmn7/reWbkGfIrKyWz+WZ/Pwknkdmz
         AXjPRYrgaEYW/QXC/6r6CW5Tz4dW9QFEBewMD+E8TOG28xSxdhvo8dlTldFP8FWxQPs+
         5y74Rc+NObF2PbbHhHMXtYCO2gJckj4/+pqXFf2cqzWkVvibPhFwQ1l5mlGLufzcXhOu
         7DLqpLUHtBl+cWmJf2/CZ09l1RlLzBAGICVUB61rGOL5l4bu1lbouQyPAsw3wk7txNJo
         sIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=8RqaQ7XgudbyVp4IXxqQ9rHJaYf+ZXQi1yhwiXLgsQU=;
        b=RkxB0FKrd6i1T1FHKwegK0/OZVrwsUZ7BUqjFiloBdnp73zHfuxer56rcZ/aG8OMZY
         vTwRPJq3umn8TtPBBYcASeCul5OMIILbFamvhpxFBOW/JIMR/YZGNEDoQehuQMdwzZme
         VMWv2Tf77xfmd8ZtvTRIFymLKu8uqMaratdD0yrLq9ypsD2Vs+QjP4lgy2Rp/KIpNLat
         H6zRo6xrlkjFhL554e7Sc9h/RT6Cx24aXNxrNoQYVd6YZhO7fnCZobhxNx6kSfh2UVkG
         4Zf/VGtZH9ghtKfJ/3gIcskDojwwQNO3CC8AnXco77hDekKCMERz6dzEaeuDfWbJwy8q
         0Jfw==
X-Gm-Message-State: AOAM530QuEY0vxBkFUxA/zwS3QYWbvmnSpuAg0fOqCzDqBmj9rhJ51qM
	8P98Oj4/bsSo07c43kZknKKzZA==
X-Google-Smtp-Source: ABdhPJwI4IMiHZaFmSAXaw3pk7lHvkM5NUr/SqlnoogKj+onwvXNIwYSn51HAM7l2aEkQs1MEWCGSQ==
X-Received: by 2002:a05:6402:1d9a:: with SMTP id dk26mr3314461edb.283.1607539313756;
        Wed, 09 Dec 2020 10:41:53 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id c11sm2548787edx.38.2020.12.09.10.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 10:41:53 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: soc: ZynqMP changes for v5.11 v2
Message-ID: <71d38756-4456-29fc-26a3-341e1d09aafe@monstr.eu>
Date: Wed, 9 Dec 2020 19:41:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

based on chat with Arnd I am sending v2 pull request which is based on
v5.10-rc2 with dropping one patch which will be queue later.
Arnd wanted to target arm/drivers branch.

Thanks,
Michal

The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v5.11-v2

for you to fetch changes up to 311c2520de21cb2f44291ad3d984b42191126628:

  firmware: xilinx: Properly align function parameter (2020-12-09
19:36:34 +0100)

----------------------------------------------------------------
arm64: soc: ZynqMP SoC changes for v5.11 v2

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

 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml |
34 ++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt           |
9 ++-------
 drivers/firmware/xilinx/zynqmp.c                                    |
46 +++++++++++++++++++++++-----------------------
 drivers/soc/xilinx/Kconfig                                          |  1 +
 drivers/soc/xilinx/xlnx_vcu.c                                       |
96
+++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------
 include/linux/firmware/xlnx-zynqmp.h                                |
45 ++++++++++++++++++++++++++++++++++++++++-----
 include/linux/mfd/syscon/xlnx-vcu.h                                 |
39 +++++++++++++++++++++++++++++++++++++++
 7 files changed, 186 insertions(+), 84 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
 create mode 100644 include/linux/mfd/syscon/xlnx-vcu.h


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

