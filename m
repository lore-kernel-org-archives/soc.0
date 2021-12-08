Return-Path: <SRS0=IjFi=QZ=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A3CC433F5
	for <soc@archiver.kernel.org>; Wed,  8 Dec 2021 11:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADE2DC341CA; Wed,  8 Dec 2021 11:58:53 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B97F3C341C7
	for <soc@kernel.org>; Wed,  8 Dec 2021 11:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B97F3C341C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ed1-f43.google.com with SMTP id w1so7550314edc.6
        for <soc@kernel.org>; Wed, 08 Dec 2021 03:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=76QFPJ9zgkaT5eYSqUyHe14SSPvuCULq0d5f0tEfH0A=;
        b=7saCuOxkMR/A86vtrV3kthq75GlsSGhJdXRSZjcy77IlsBG0XoGmU125eHMbYtKnVX
         w57w5YJRGEYfGmUk5XJS9IY6l5GgYlI1OyACRZ4uun5miDvrJG0Dpjx9oqvdOfXdc7UQ
         BcTm34qhwmYfnQMH2MXKrhr+wamBEK4IG0hveqSNEBcW7VD/I1y68wX6AtMY63BJI7VM
         PHrbOqZrxLIY+MY+nWKH9uy96hnQ1pyYac7dX4n39nyzDCHb27yFW7d4T35mjWMg8w64
         CaM5QscfJ7aMu0MH5TVuRtQj4/WciaIdDHG6n6D82n75q1xqkRlFNS3rfV75Nh/Y7Zrc
         RJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=76QFPJ9zgkaT5eYSqUyHe14SSPvuCULq0d5f0tEfH0A=;
        b=UVjEQ28+8mnBsnKA4gFl0LhmeZVmhcmygL9kq4apJNA+dNHxUCm7nNLQ7QC/A7VKQo
         O3oc1BtjCsD3PCz321wSAn5M30a2mfiWTEEDuMmzrXFhLDgJaTxawEWSE5RQsmLyVKN6
         ehrq/3fNWY5+FvtzSx0ifN5HG1lbMKuXfXcKIChjXudjnWgZ3XvXfDz4g9WeTkq/cNfL
         xrA8pTNBSzmOcWw8QkbFrRkF4aSG1HtHBgf9d2VJVGqaydXlhrtRmNu29brD3e1NM2CT
         x45JsVQnUI5iC/xo9TL5auMy/Z1FytmcJf2BHQVMGraPe0uuQDDoV9W89KJ22bnVa/9+
         1wqA==
X-Gm-Message-State: AOAM532GWd1lo9ufN6Kk1safTweO5tMTpXk4vBR/pGJ+m+lUFTLU5r7+
	fer/B+VoRKhbqszXVSVjuN6XVHqQSGWIRQ==
X-Google-Smtp-Source: ABdhPJxPg79rm7J2GByvKrD69adV1dSVNCWWtn8EDduBNouUq9iJygEol47IZJunZD3+07Jeew2Myg==
X-Received: by 2002:a05:6402:147:: with SMTP id s7mr18542148edu.8.1638964729713;
        Wed, 08 Dec 2021 03:58:49 -0800 (PST)
Received: from ?IPV6:2a02:768:2307:40d6::e05? ([2a02:768:2307:40d6::e05])
        by smtp.gmail.com with ESMTPSA id gn16sm1394229ejc.67.2021.12.08.03.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 03:58:49 -0800 (PST)
Message-ID: <48dec441-2c1f-73a0-3e6c-aa0d7be5ba26@monstr.eu>
Date: Wed, 8 Dec 2021 12:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: zynqmp: Xilinx SoC changes for v5.17
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull these patches to your tree. They are doing small cleanup and
fix handling in power domain driver with also checking firmware api call.

Request for 5.16 came late that's why sending it again rebased on the 
top of v5.16-rc1 but with the same content.
Previous PR:
https://lore.kernel.org/r/0ea5d885-c770-af56-7de0-bcf6adc61bcd@xilinx.com

Thanks,
Michal

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v5.17

for you to fetch changes up to 168e05c131cd15932f95364b103b8cb7dbf19546:

   firmware: xilinx: check return value of zynqmp_pm_get_api_version() 
(2021-12-08 12:53:36 +0100)

----------------------------------------------------------------
arm64: dts: ZynqMP SoC changes for v5.17

- cleanup and fix PM_INIT_FINALIZE
- check return value of zynqmp_pm_get_api_version()

----------------------------------------------------------------
Michael Tretter (4):
       soc: xilinx: move PM_INIT_FINALIZE to zynqmp_pm_domains driver
       soc: xilinx: cleanup debug and error messages
       soc: xilinx: use a properly named field instead of flags
       soc: xilinx: add a to_zynqmp_pm_domain macro

Rajan Vaja (1):
       firmware: xilinx: check return value of zynqmp_pm_get_api_version()

  drivers/firmware/xilinx/zynqmp.c       |  5 ++++-
  drivers/soc/xilinx/zynqmp_pm_domains.c | 91 
+++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------
  drivers/soc/xilinx/zynqmp_power.c      |  1 -
  3 files changed, 55 insertions(+), 42 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

