Return-Path: <SRS0=7UwO=XM=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CDDC433EF
	for <soc@archiver.kernel.org>; Thu,  7 Jul 2022 14:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14B68C341C8; Thu,  7 Jul 2022 14:11:53 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 125BCC341C6
	for <soc@kernel.org>; Thu,  7 Jul 2022 14:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 125BCC341C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ej1-f52.google.com with SMTP id ez10so2500897ejc.13
        for <soc@kernel.org>; Thu, 07 Jul 2022 07:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=B75LWUPl8vD1TZLcQRsL9rfwdnUTeMluJfdzWmIe9IA=;
        b=SslEvRuz8dXwbPGBod/mQX/VtSQ0x43Q94lB/SR1VT0TUEq48qm1PJJKfLvJoCuNSx
         vSREfzyLPiHhDqJ3CPAwIL9qZt19mMhQ001RM7gzvxmIRUplclACvKHDtCJf8Xxmo0Zn
         DOg1mX2Id872kKKfZghCz1uKVEfJu9cviWLhmrfiQke0amj+CnsvOyX1K62RjoFLlogK
         28CKhPy7zo2yG5Ax5vmg+X6rF+1aSWFBSzL+Esn7lWY3U82N5NnxCp+WDoSnaRRxluGg
         3ZFFj2E20exgXnObo0/FAYUsTWln44RiyG01sTO+XXqHAAQFXavNA0AqgA+vH/7gU2wU
         9D+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=B75LWUPl8vD1TZLcQRsL9rfwdnUTeMluJfdzWmIe9IA=;
        b=AqgNQzPsSq5JitGkIG+2KtZW9lsT5+TnuYobnjwVJ4h6fL8bdbsyTq7IfsqpHqnT3G
         pcZLYPmF697+Q3PKiKJE9GfxOxwKFTmiy+cQ0zQfPGlfMqZI/fEycY9K/9JDNDYuAl4I
         3Lss9lgsRwV9YbmooYoCoVBsdpXhhHf1ZZJvLE9Uxa8pemi7bZNKkocHQx1hPKrIqBEs
         +vrG4Ndrti9+1UCnnP+DMLxTQjLvmQpxhuhBW2aJCPolEJOK1jJBi3Gs0Tc5JcEDb/Qm
         5vlRiR+Ja2MDD1rGABEnrs62QtoSIVH3TmL8gTuGhWn7PoI8L0v0dDx1gtnDhCy6j8U/
         2J3w==
X-Gm-Message-State: AJIora+nels2ongvd5RfRrgr0wAIdp8aW4hje77jX79sLYetu7bTaACA
	ivb4bT1HtIQKNsTJSwrAE+/qK6k8q9cDjA==
X-Google-Smtp-Source: AGRyM1vraL46akBp3z7UiIjGPfVceTvSh7Clr33CPYaBv4anzjuh0IYvywAxFJ2dy3IFoLAQYSUgug==
X-Received: by 2002:a17:906:5a61:b0:72b:1468:7fac with SMTP id my33-20020a1709065a6100b0072b14687facmr1906729ejc.440.1657203108893;
        Thu, 07 Jul 2022 07:11:48 -0700 (PDT)
Received: from ?IPV6:2a02:768:2307:40d6::f9e? ([2a02:768:2307:40d6::f9e])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906824d00b00726e108b566sm13315243ejx.173.2022.07.07.07.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:11:47 -0700 (PDT)
Message-ID: <0196d1f3-e9c7-ef51-143d-e98b14980f63@monstr.eu>
Date: Thu, 7 Jul 2022 16:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: git <git@xilinx.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: soc: ZynqMP SoC changes for v5.20
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull the following patch to your tree.

Thanks,
Michal


The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v5.20

for you to fetch changes up to acd6510dd7ab3664b69eb99e37c4fd6325a7d442:

   firmware: xilinx: Add TF_A_PM_REGISTER_SGI SMC call (2022-06-29 14:46:22 +0200)

----------------------------------------------------------------
arm64: ZynqMP SoC changes for v5.20

- Register SGI separately out of EEMI

----------------------------------------------------------------
Tanmay Shah (1):
       firmware: xilinx: Add TF_A_PM_REGISTER_SGI SMC call

  drivers/firmware/xilinx/zynqmp.c        | 16 +++++++++++++++-
  drivers/soc/xilinx/xlnx_event_manager.c |  5 ++---
  include/linux/firmware/xlnx-zynqmp.h    |  7 +++++++
  3 files changed, 24 insertions(+), 4 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

