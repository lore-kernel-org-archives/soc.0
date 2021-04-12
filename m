Return-Path: <SRS0=DvCw=JJ=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDACC433ED
	for <soc@archiver.kernel.org>; Mon, 12 Apr 2021 08:29:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 45AD96120F; Mon, 12 Apr 2021 08:29:55 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 684B761263
	for <soc@kernel.org>; Mon, 12 Apr 2021 08:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 684B761263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=monstr@monstr.eu
Received: by mail-ed1-f49.google.com with SMTP id f8so14009530edd.11
        for <soc@kernel.org>; Mon, 12 Apr 2021 01:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Amc2LskPzEPJ/lntSSNH6enJaQg5HmwehQo3JE3bhmA=;
        b=TwWkbmRk2sAPMMe8uxguQ/yZVefGvbjwl+iir4D832FNABHNURbxmXeL9lsbQlBVSI
         TTnv125E11y1rykHTBADNnazz5YMlw7ZsdV48avNNV7uNK2Rix1fbUSj9HhT+TlIlKyO
         ESURXubPwJ1w6o3fWUHqX/iIhiCmStxwxUEd9VcSw3Ulv4PHgRpLtsYGCDRtBg3tDaRL
         +20y8eXtlSHIM2Mwp2QczII0DJg69EmLzHRLaAM+ci2MRKt+5RORk4zBNm6piT202AzZ
         vgbHrh1k99qEAwc4I5diJKiIqhlUV2/3Fs70o+epRvkP+0VZekjiJsaeDUNIUk9iyfRD
         zH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Amc2LskPzEPJ/lntSSNH6enJaQg5HmwehQo3JE3bhmA=;
        b=WRbUHVh+vaZJ/6eWM+tkR7Oq0rle7wy30nCPRVUkmlIfccePvw6Sk7iaGx/KCT37QP
         UDF4bXNEjCD1xd44E0goi+0EcY1g1LsEmeIVf2/H7BGppBlSbxjJh8nUSH67h1c5SiTp
         QfMrWhGRKI80vtQIDmD1N2HufcefsD9i/BYivtnFzHkLDQMMRdzmYUKTg2bywAbjlDhP
         2Wphq+l93vbhVJN8DzZYgcWxJwAcs37EkASD5sxdQ2cZzOQpjPif8HnK+7pl/wLEEsPw
         fSiVP7ST4qRWEruqWOSzW5wDtWuIvg6fuwpy1//lRl0l77DbV6utaAut+Fru50VHnboq
         jMzw==
X-Gm-Message-State: AOAM530wzjWhUqcUoOFp2FCl5TpJKbzvGDyhvvXmoqFRNbCqiQl5l1B5
	EPtOmsk+yeCFai1/UFp/8ucarg==
X-Google-Smtp-Source: ABdhPJywqGmOLTkQJZfDGrFBInB2FVsx+9QTOZVrYHRnYpkIHLASR8nAfSfDA1DZKt/MYLjHuagCHQ==
X-Received: by 2002:aa7:cf02:: with SMTP id a2mr27901050edy.59.1618216192818;
        Mon, 12 Apr 2021 01:29:52 -0700 (PDT)
Received: from ?IPv6:2a02:768:2307:40d6::45a? ([2a02:768:2307:40d6::45a])
        by smtp.gmail.com with ESMTPSA id a9sm6027910eds.33.2021.04.12.01.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 01:29:52 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: soc: ZynqMP changes for v5.13
Message-ID: <a44f8e9f-cea7-57ef-c3bc-10f5f5e064fc@monstr.eu>
Date: Mon, 12 Apr 2021 10:29:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

please pull these two patches to your tree.

Thanks,
Michal

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v5.13

for you to fetch changes up to 79bfe480a0a0b259ab9fddcd2fe52c03542b1196:

  firmware: xilinx: Remove zynqmp_pm_get_eemi_ops() in
IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE) (2021-03-01 12:52:07 +0100)

----------------------------------------------------------------
arm64: soc: ZynqMP SoC changes for v5.13

- Fix firmware removal path
- Cleanup eemi doc and *ops()

----------------------------------------------------------------
Nobuhiro Iwamatsu (1):
      firmware: xilinx: Remove zynqmp_pm_get_eemi_ops() in
IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE)

Tejas Patel (1):
      firmware: xilinx: Fix dereferencing freed memory

 Documentation/driver-api/xilinx/eemi.rst | 31
++-----------------------------
 drivers/firmware/xilinx/zynqmp.c         |  5 +++--
 include/linux/firmware/xlnx-zynqmp.h     |  5 -----
 3 files changed, 5 insertions(+), 36 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

