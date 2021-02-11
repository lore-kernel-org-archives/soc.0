Return-Path: <SRS0=yep3=HN=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41C4C433E0
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 09:59:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 90DC264E87; Thu, 11 Feb 2021 09:59:34 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 267B664E9A
	for <soc@kernel.org>; Thu, 11 Feb 2021 09:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 267B664E9A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=monstr@monstr.eu
Received: by mail-ed1-f52.google.com with SMTP id z22so6282190edb.9
        for <soc@kernel.org>; Thu, 11 Feb 2021 01:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=ngz90GTrvLzbG2BfdzIsnPJ98qYrRWMZRN1INwXEI6g=;
        b=msqKad3cd/oOCtNrzujnqcl1vNalNNGtKMezuT87N5vQMrh6dFhiosXALf8Ome8d2v
         /spj7PgxBZvfcRY5unqVmgFXLV3z/Z3CJhAbNMmW4lHowlJEbcfiCq13HiOFdC6tccr0
         PUvlgFs3/OthU2oJNOZJXeGplub5U2OqDWUPl4Y9Q343wgCAPM4X6cEZ1xdnW9NHgn9s
         bUc3VYzOMlj/9KMk5sG7/CmkJ1TpclzIbmGKxjxh5pol4Q8nnek9YgRQRQJLMTJHU8j3
         n1pBZzunU9LpYS0g01tRwQUoXa/VP9JlX9LIrWNSAFgzFt+zfiqAZYLcpCeTz4GqNW/9
         5eLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=ngz90GTrvLzbG2BfdzIsnPJ98qYrRWMZRN1INwXEI6g=;
        b=SVoxw6mFdXh5VwyDCFkWmG+gtbQBpeGUfswk4/SYyIijgtvSsZyvXqIt4KuvLMSF+1
         q2g5aVT3oE+Q/7iRoCY7WSXROgjnGGsqKRa2dD2PV0W4gYy06kbnIxHydxIs913fqGnO
         AOAFeI0T1fVw1KgUBCmhw96J1xJcU4mpI6WZ0hDZK+zUIv9Ow3QA2eeBI1MKN9AjyUbu
         Ertd/dNaFDDH1jNGxhqAubS3ZAGzoUCL53ru4z8Bmhwl95MZQogTUUg37+EAZAoB0kL9
         T0F3qeGRHcKC3IifC7jSkoplZeikfaY2IE/TpRMV748R5syAtjJKanPira0BcRVwTm95
         X9sg==
X-Gm-Message-State: AOAM533ROjI+nrVGBKQJvarsAyHRXM1I/U6hFhVL7tLbvI+5WH7aeUNx
	1ij5y1IEBWtVRwaXn+zqKXk1FQ==
X-Google-Smtp-Source: ABdhPJw4lNxsQVVMiXCd1h4okyOFMQO0a2/6YsICdD6BULpCZZjib9dZHTG/ZhT4B0PzESqcfEsRqw==
X-Received: by 2002:a05:6402:3198:: with SMTP id di24mr7548385edb.340.1613037571314;
        Thu, 11 Feb 2021 01:59:31 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id b11sm3831268eja.115.2021.02.11.01.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 01:59:30 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.12
Message-ID: <90f55633-98ca-e67f-313c-26ccc5297149@monstr.eu>
Date: Thu, 11 Feb 2021 10:59:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

please pull the following DT changes to your tree. The major part is
adding one new board and qspi dt binding conversion.

Thanks,
Michal

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynq-dt-for-v5.12

for you to fetch changes up to 4e1d557c6ad893c71bcfb6cea62176ba9cca5399:

  dt-bindings: spi: zynq: Convert Zynq QSPI binding to yaml (2021-02-11
10:38:55 +0100)

----------------------------------------------------------------
ARM: dts: Zynq DT changes for v5.12

- Add Ebang board support
- Add missing zturn boards in dt binding
- Update copyrights
- And convert Zynq QSPI binding

----------------------------------------------------------------
Michael Walle (4):
      dt-bindings: add ebang vendor prefix
      dt-bindings: arm: add Ebang EBAZ4205 board
      ARM: dts: add Ebang EBAZ4205 device tree
      ARM: dts: ebaz4205: add pinctrl entries for switches

Michal Simek (3):
      dt-bindings: arm: xilinx: Add missing Zturn boards
      ARM: zynq: Update Copyright date in DTS
      dt-bindings: spi: zynq: Convert Zynq QSPI binding to yaml

 Documentation/devicetree/bindings/arm/xilinx.yaml         |   3 +++
 Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt   |  25
-------------------------
 Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml |  59
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml    |   2 ++
 MAINTAINERS                                               |   1 +
 arch/arm/boot/dts/Makefile                                |   1 +
 arch/arm/boot/dts/zynq-7000.dtsi                          |   2 +-
 arch/arm/boot/dts/zynq-cc108.dts                          |   2 +-
 arch/arm/boot/dts/zynq-ebaz4205.dts                       | 132
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/zynq-zc702.dts                          |   2 +-
 arch/arm/boot/dts/zynq-zc706.dts                          |   2 +-
 arch/arm/boot/dts/zynq-zc770-xm010.dts                    |   2 +-
 arch/arm/boot/dts/zynq-zc770-xm011.dts                    |   2 +-
 arch/arm/boot/dts/zynq-zc770-xm012.dts                    |   2 +-
 arch/arm/boot/dts/zynq-zc770-xm013.dts                    |   2 +-
 arch/arm/boot/dts/zynq-zed.dts                            |   2 +-
 arch/arm/boot/dts/zynq-zybo.dts                           |   2 +-
 17 files changed, 208 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt
 create mode 100644
Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml
 create mode 100644 arch/arm/boot/dts/zynq-ebaz4205.dts

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

