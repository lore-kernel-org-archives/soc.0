Return-Path: <SRS0=5QJf=NQ=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451B0C4338F
	for <soc@archiver.kernel.org>; Wed, 25 Aug 2021 07:31:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 01476613AD; Wed, 25 Aug 2021 07:31:34 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A789C61374
	for <soc@kernel.org>; Wed, 25 Aug 2021 07:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A789C61374
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ed1-f54.google.com with SMTP id b7so35565379edu.3
        for <soc@kernel.org>; Wed, 25 Aug 2021 00:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Uix0zP6cMyfE/QzBW8A2nUJhcMKISWo3miITx0Z1iE4=;
        b=vSouYeTswYT3DsXvnzEIC1ukeveAsbhKXyuJ856d6IUE6qdCekArll3S92LXd8oqSK
         RXSX7LKTUGS6R75yxoEs9GRlZ2N96ZhFPYitXdBlJTyoYcH5yBD2fDiAVWt26t4d+uzq
         caU4KE2qmrblH5N6rHt0ndUgZzvLB9lwqNRAw/yksdzSsU42AO9duChPrBciKZALyIvD
         CbwysJXdIpbpGSASowO/5tvdOJ+EeRbFZg2KbdVPuT7xsJ7u/8LywZhZmqlW0uIpr9yW
         PeO0gpeL1oIbpIdT3OwFR0wiyqiwQbXF7t+aK8U1m3mC/du/ocR69ufiyRlbRaOiSDWV
         Oprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Uix0zP6cMyfE/QzBW8A2nUJhcMKISWo3miITx0Z1iE4=;
        b=RmfiCjicDSqY1fXIwQ7aQmXtmA18NzdKKpNBajwejJ/mw9NECaFT1QuSTXD7sgtGeb
         Y4jqHu885hRQ16U7eOO7S72xLZIZNkB5Au/Nv6Frovh9R7XiXI9fjIaH1CwkYGDo1dbw
         e2Vh6zt9pQksWUBWqR9YqDd2k+z0ibD+KYGeEQjvJmHYugPaqq83Om5AnQnQzyycy39U
         KdJbNAPkx0SFwHsBA3ffTDeJ4jpA8k6NaCrKKdG8Nu2QiVny6b1bIjye6xF6WhLCzJsX
         rXf8DHFfmSMr1iVuW53zkPU+HC8pL79pvieJ/eo+lvOn2NfmVoaKrGUESc74ca1DnY0y
         wwQA==
X-Gm-Message-State: AOAM532cSSYuAKul7W/WORaekyGWT2BiNTQhcMBEqp42rUnuGAAflely
	pL/HoBhyzsO+Q0PxyybnD0uIcQ==
X-Google-Smtp-Source: ABdhPJyPlxjqLM52IlNaVHrUj8uNYenpchf6u8jWSAQU5NLlVSRnqN+gMpwUiwHH3C2wWwhzdkzTYA==
X-Received: by 2002:a05:6402:1b10:: with SMTP id by16mr10099276edb.297.1629876692323;
        Wed, 25 Aug 2021 00:31:32 -0700 (PDT)
Received: from ?IPv6:2a02:768:2307:40d6::e05? ([2a02:768:2307:40d6::e05])
        by smtp.gmail.com with ESMTPSA id d22sm10734452ejj.47.2021.08.25.00.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 00:31:32 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: dts zynq: Xilinx SoC changes for v5.15
Message-ID: <5a25f882-103f-4df0-0d90-868d264c900b@monstr.eu>
Date: Wed, 25 Aug 2021 09:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

please pull this one patch to your tree.

Thanks,
Michal

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynq-soc-for-v5.15

for you to fetch changes up to 75b4c5deef011c7d7b1e23b623455185d60e72a2:

  ARM: configs: multi_v7: enable PL35x NAND controller (2021-08-06
12:19:05 +0200)

----------------------------------------------------------------
ARM: dts: Zynq SoC changes for v5.15

- Enable PL35X nand driver in multi_v7_defconfig

----------------------------------------------------------------
Michael Walle (1):
      ARM: configs: multi_v7: enable PL35x NAND controller

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

