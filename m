Return-Path: <SRS0=FTHW=E6=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FE0C56201
	for <soc@archiver.kernel.org>; Tue, 24 Nov 2020 14:22:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4F1012083E; Tue, 24 Nov 2020 14:22:42 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D70C2076E
	for <soc@kernel.org>; Tue, 24 Nov 2020 14:22:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20150623.gappssmtp.com header.i=@monstr-eu.20150623.gappssmtp.com header.b="mB6B2Z41"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D70C2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=monstr@monstr.eu
Received: by mail-ej1-f50.google.com with SMTP id o9so28782520ejg.1
        for <soc@kernel.org>; Tue, 24 Nov 2020 06:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=XgA7dRUgZq1U1Lw2+UbHeJMi1CKFatrYfIOTV6USWs4=;
        b=mB6B2Z41dd5ksxPUzqmkce6ygCYmT6wO835k+Xk30JfyDAebyX72XgT/hIU3k6WVJt
         zeBqsgMhiKnVmk3E96SU66nwR+mGbOx3vz4lpFa6j5MLalZOL5Gyit9fK7OQ/XDojG21
         oPsKlQCHE6XZlh2t18NNht8PCyCaX38UqRoCgtj/LhXie8ajMd8Li3xFNoEY4MQCGDbp
         igWfYizN3VcB6SaTdMoKvH5ukS8KvxPnhKtg4gCwn83kVPazF58RbUOM5aC5revdAKQv
         4gzke2NrYblkSaoOm/gpCJTMeH65o1BZ+3D8v+HSwI0oHAoFZ6aF7qFzlFhijMJbwknz
         m1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=XgA7dRUgZq1U1Lw2+UbHeJMi1CKFatrYfIOTV6USWs4=;
        b=amfuzORrqSTp1NN5cbaaxegI4A3eBHniBzQabDlNjLO8OQroG98c3EdIPasU1ZiQko
         DXLOj95AGf0ayf4NlJEa2FSd0Zn8rCgViGvTF5XaS5Hcu8GSIYvihXx8DMEikWTyP5Ge
         tIz5yS2NRrzGfwZ3j1xZncAqhaREZkV9WMv1PLoY3L5fsB6YLoqhB3JRv1guE9Nt7zzS
         tZsT9V8W9ODyDb0hzdwjlgm6V5w6itLunOrTzUYFLaaQfyJzc7zb4IN9B9KEzQHMhThn
         ICPELfFYHtClR4G1q6xRnEV8HTY9VZIYoQ8Y2oxS042+R0c7a2565NRtjaes1VkY77ds
         saqA==
X-Gm-Message-State: AOAM531VoJFbngRjLg8NnPveysCAuKRaaJzitNtE6PzB7ODN4UGaXDtp
	bHYdox5mYD01PqaaKwWvwid0QWcLzH9vo7rg
X-Google-Smtp-Source: ABdhPJyKxuXzaKHcyLWtl7TLT72FAw0wMZs/6bbqitlBRp7OGrz+mHTwohoupizMbSLqz69tJRJWkA==
X-Received: by 2002:a17:906:e082:: with SMTP id gh2mr4315963ejb.406.1606227759258;
        Tue, 24 Nov 2020 06:22:39 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id 22sm2813991ejx.115.2020.11.24.06.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 06:22:38 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: soc: zynqmp: Xilinx SoC fixes for v5.10-rc6
Message-ID: <fd5ab967-f3cf-95fb-7947-5477ff85f97e@monstr.eu>
Date: Tue, 24 Nov 2020 15:22:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi guys,

please pull these two fixes to the soc fixes branch. It would be great
if we can get it to v5.10.
The branch is based on v5.10-rc4 because Arnd's first patch was applied
to rc4 by Greg which is causing panic on Xilinx Versal SoC.
The second patch is fixing issue with SD reset by using proper ID.

Thanks,
Michal


The following changes since commit 09162bc32c880a791c6c0668ce0745cf7958f576:

  Linux 5.10-rc4 (2020-11-15 16:44:31 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git
tags/zynqmp-soc-fixes-for-v5.10-rc6

for you to fetch changes up to acfdd18591eaac25446e976a0c0d190f8b3dbfb1:

  firmware: xilinx: Use hash-table for api feature check (2020-11-24
15:13:54 +0100)

----------------------------------------------------------------
arm64: soc: ZynqMP SoC fixes for v5.10-rc6

- Fix SD dll reset issue by using proper macro
- Fix PM feature checking for Xilinx Versal SoC

----------------------------------------------------------------
Amit Sunil Dhamne (1):
      firmware: xilinx: Use hash-table for api feature check

Manish Narani (1):
      firmware: xilinx: Fix SD DLL node reset issue

 drivers/firmware/xilinx/zynqmp.c     | 65
++++++++++++++++++++++++++++++++++++++++++++++++++---------------
 include/linux/firmware/xlnx-zynqmp.h |  4 ----
 2 files changed, 50 insertions(+), 19 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

