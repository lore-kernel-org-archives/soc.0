Return-Path: <SRS0=XMaa=DV=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CD8C001DF
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 11:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D88AC433C9; Fri,  4 Aug 2023 11:30:29 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 11C92C433C7
	for <soc@kernel.org>; Fri,  4 Aug 2023 11:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 11C92C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3177163aa97so1721473f8f.0
        for <soc@kernel.org>; Fri, 04 Aug 2023 04:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20221208.gappssmtp.com; s=20221208; t=1691148624; x=1691753424;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYXVbXx7ztoLwFgFiFC7F0f1verzCs/lA0nQFmDbtak=;
        b=b94+1RsofV1BzNaU2GokLWJa6Vwbx7WOmviSEzMH4Vhq7bEJyz241N5tgv+jpqd3T6
         bXpFjcczsxrvutqbdSj0ZpxXmBemfNhy12f/IzrTzh/NqhK41/KYnue5wCr0LF6E0mOx
         MxD/goWZdXQUtlCN0lagXvj0mUXEZO7mqcMLoyfXRqsmlWEZIcslwD7JnghgYVTOwBWm
         VdzV4dXr7uZLukDYbZdOk2fxZw11g5oF8Z71eU3HnLRXkWkGrXJGIES9MCkgQpRsV/c2
         6TejjwlgJVPH0rO9PIf7Lmejx2OvCP+r/0MV6mCLAeZNAZREQycSCgb58Wod28Awq/hr
         0SoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691148624; x=1691753424;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BYXVbXx7ztoLwFgFiFC7F0f1verzCs/lA0nQFmDbtak=;
        b=AaQUr8l4FA4XjN4HHBhe+pbX4dbTZ7S2YIbYPc7foLVc1ZzJ7rZ8flBIxT3Q8OUPd6
         5JtXLo1eJiYDIg4pdcgC7A9syUOY53DcLRSyVLz1fRCbJeSt444fT9vqg9sqrqvnYkIr
         pobmxQjMr/OPFhnWb43HI/pSXb/EAghFOjWjvnEzHsoYAp5p8mksJ+/ixxZCctTSzXn1
         dozmfqhFApNwKglbX0Y+EzvB+EbmnJUWKy4BV/OXz8spRgiYPGWpsz+eyj+9nDo0zRKZ
         itra7nG5Q4HS7H3ZmtHkUmpUjtqz1Vym/fHrLlqhYnA1bXMQH8XXSnPvxpXbk/8VKoKC
         3FwQ==
X-Gm-Message-State: AOJu0YwqG1hqACAFwssd1c/mxWJIuq9kCYZD3Cbod9bzwMxi5UTX9ep1
	0kkFC1CETcPE4h7UVulF0K0ONcUH4Hu/5JQAVV8=
X-Google-Smtp-Source: AGHT+IGCZKo/xe6z9U4rY+mIDwRG4bdt93RlATbLb0o93F9s/S0HwecHq97EMj3St7tT1X4OmShwyQ==
X-Received: by 2002:adf:dd85:0:b0:313:ded8:f346 with SMTP id x5-20020adfdd85000000b00313ded8f346mr1337705wrl.22.1691148623879;
        Fri, 04 Aug 2023 04:30:23 -0700 (PDT)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d4fca000000b0031751d7d8a6sm2302324wrw.18.2023.08.04.04.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 04:30:23 -0700 (PDT)
Message-ID: <399efa45-df0a-4ec7-e25c-774bb8bf6fb4@monstr.eu>
Date: Fri, 4 Aug 2023 13:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: soc: ZynqMP SoC changes for v6.6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

please pull these 3 patches to your tree.

Thanks,
Michal

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-6.6

for you to fetch changes up to 746db5d0b6d2a4bce0bc972bffd8428c606106cd:

   soc: xilinx: Do not check for 0 return after calling platform_get_irq() 
(2023-08-04 08:53:21 +0200)

----------------------------------------------------------------
arm64: ZynqMP SoC changes for 6.6

- Cleanup remove callback in event driver
- Explicitly include correct DT header in power driver
- Fix logic around irq = 0 in power driver

----------------------------------------------------------------
Rob Herring (1):
       soc: xilinx: Explicitly include correct DT includes

Ruan Jinjie (1):
       soc: xilinx: Do not check for 0 return after calling platform_get_irq()

Uwe Kleine-König (1):
       driver: soc: xilinx: Convert to platform remove callback returning void

  drivers/soc/xilinx/xlnx_event_manager.c | 6 ++----
  drivers/soc/xilinx/zynqmp_power.c       | 5 +++--
  2 files changed, 5 insertions(+), 6 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs
