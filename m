Return-Path: <SRS0=Be1g=HF=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB69AC433E0
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 13:38:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AF59964F4E; Wed,  3 Feb 2021 13:38:24 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93FEA64E31
	for <soc@kernel.org>; Wed,  3 Feb 2021 13:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93FEA64E31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=monstr@monstr.eu
Received: by mail-wm1-f41.google.com with SMTP id l12so4480426wmq.2
        for <soc@kernel.org>; Wed, 03 Feb 2021 05:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=ZqYuwkqJjFtx3+CqGJEsmGO2Y2Ix/J1mTtHiy7iPzno=;
        b=LUrGVScWzOjek/G8mjFIcU/PQmR0sTqeG1FdOuVLwn0CxwPYdzGH5tiai0BJv2fA45
         sAl0hrWVuAGZKW1nodkkYPT21UCbALW8PYcBDr6t5s2JoO3jnRKwlDYnoDRfQwqGhEOH
         UUXvK1a8RIxgTK+rZwib6VJVlq10QK/cPl13WYHwvbJL9UJDAe19LxtLE9tiYi1ZxU0a
         oQgL4OArqHgeUp6WXihTjYZE9COANmWI5ygvvh2+dubeW8XkiYMCgw2npnAb3i6fOmlU
         Vf0mcE6wfKPDYfMMEH8U5qc1TV5D9rtsk7HccdYe5x010leSCv/gYqqyGjTygzqL79GV
         l1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=ZqYuwkqJjFtx3+CqGJEsmGO2Y2Ix/J1mTtHiy7iPzno=;
        b=TLZzr5pdSmPuk6BhWKinj8oIqZuJbtxIi0VP8d+LS+2ROuSALS3Oxq2vnzuuLtdlom
         6K6moB7a+8qzyP5v/vefE1Kli5hGJW4yt03dyBHGYwZgfhrSmnT3SAhr0SPACWoz59ox
         wVnnNw5+dz6M6TJ0fK+8Zs6G6+11nQE1+Ts57706UOpCq5pT1lK1J+Nbx5HqILHeoQD7
         NYq5rcfYFBsgc3BG8BTZFJrVcqWxpncF1cQNRUgYA1VHoPYq9pJrQV2earhnf4HoB6gs
         yOpNoQMBnZGCL07twxDp282PhGlNXpxU+wfVBwqW/s7STo3RAXRRLPzSuXRmn6vlL94+
         PWZQ==
X-Gm-Message-State: AOAM530otBb4TVWV2i+jshggm3J2vQRgPK6dKryKne9DHYrm6z6S2miz
	B3IoKQItuta1jKGPAdn5tW4YMveZw2HJrxwJ
X-Google-Smtp-Source: ABdhPJynepeIiN04s+kkCOGrg0gXSdHq56arbfmCEHngSCuUiGZy4WzrjkL8QjuRrxYX7oZ4cAiaaQ==
X-Received: by 2002:a1c:7e0c:: with SMTP id z12mr2958641wmc.85.1612359501908;
        Wed, 03 Feb 2021 05:38:21 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id q19sm2929581wmj.23.2021.02.03.05.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 05:38:21 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: arm64: soc: ZynqMP changes for v5.12
Message-ID: <2b0f6314-13ba-375a-9231-925b0a07be82@monstr.eu>
Date: Wed, 3 Feb 2021 14:38:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

please pull this simple defconfig change to your repo. Maybe it
shouldn't be labeled as soc change that's why please let me know if you
need me to change it.

Thanks,
Michal

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v5.12

for you to fetch changes up to 75e9e9764c2aaaa125944b47490893300336b8b3:

  arm64: defconfig: enable clock driver for ZynqMP platforms (2021-01-07
10:44:57 +0100)

----------------------------------------------------------------
arm64: soc: ZynqMP SoC changes for v5.12

- Enable clock driver for ZynqMP in defconfig

----------------------------------------------------------------
Quanyang Wang (1):
      arm64: defconfig: enable clock driver for ZynqMP platforms

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

