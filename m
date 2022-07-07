Return-Path: <SRS0=7UwO=XM=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ABDC43334
	for <soc@archiver.kernel.org>; Thu,  7 Jul 2022 14:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7BBBC341C6; Thu,  7 Jul 2022 14:20:48 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6EB10C3411E
	for <soc@kernel.org>; Thu,  7 Jul 2022 14:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6EB10C3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ej1-f47.google.com with SMTP id n4so13425178ejz.10
        for <soc@kernel.org>; Thu, 07 Jul 2022 07:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=1bX+jMty+niZ2cuzNRtB1L2R6hNAsun6sJ7BXCX5tOg=;
        b=u1QXy4NHhmyev92Tn43bH3QzdMvoiAcDaALTsV545IRS4OZGKRMGCN1lsPUvVOn75s
         dPWhhUvGpZS9oSdmHqf6JuxXUB9w4/jzP+9nPBJt5fJnYQ26jvRXgi/vGe1+AkZjPHR0
         /v3s14iaubv1cGu0qGEzyQ2NoCcWWfR2c/FCQXp9n7/ISDGk+KCF8lQMA2IPgrDdsP7x
         5GU9enq/1QMhsNDKeaSx6wQiL0hS+VF8r7YifQmXnJo8KQtna4ZwwueaqBx5Rbs+YhWw
         t8VM7jrP19f86tC4isf6YrUdIsFw1WC2T65muiUh2mAuOT+SjSQtzHf+FAqQMVOEE7w2
         hbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=1bX+jMty+niZ2cuzNRtB1L2R6hNAsun6sJ7BXCX5tOg=;
        b=wzZxFplVbTrwDb6BeIbDptY9wUSFhGpj/qgUUpjet8XL6lvH0zHDOmVhattR5C1w+K
         x/Ey2MyBVnK362H0dGcqKg5XjQdZC4ezNbLzvD1zoFRSO24Ytwhq2AoLTQH/f8KRUP7C
         KhKyihAUQwXeqfaRoHW2RL/pANn6LpNMtNm2TPovL05tq9zlEWWDCqvuPcuVHCGQPfXz
         R3ZL8MLPFsumVY8pEUR54S+hjXUx5zFYiGyFyo2E8tx2ngCXNirGZzGiGVLMQ8XzcMd0
         f99ypXPHHUXutRVXZb/AnL8gt4U5Jiba7ku9a2SSMOCDrgEjIvFj2KtmKo3iTCGtgQv/
         lGwQ==
X-Gm-Message-State: AJIora+Z9YLX9FjlBsIqLRBeR0JntQxnPlj6+pqj1S269sa5g5t3LkSX
	T3jVIcm2b0gdIFDEqhsm6vIftr98oenZYA==
X-Google-Smtp-Source: AGRyM1t0+XtoEVORxJJN5d+l6NVjYb07BTPA5KpHduDasujvBBkdrg2e6mNYap16pLJiQK2NQ5wZ5A==
X-Received: by 2002:a17:907:9619:b0:726:92db:2e83 with SMTP id gb25-20020a170907961900b0072692db2e83mr45166475ejc.289.1657203645350;
        Thu, 07 Jul 2022 07:20:45 -0700 (PDT)
Received: from ?IPV6:2a02:768:2307:40d6::f9e? ([2a02:768:2307:40d6::f9e])
        by smtp.gmail.com with ESMTPSA id d11-20020a1709064c4b00b0070cac22060esm18836034ejw.95.2022.07.07.07.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:20:44 -0700 (PDT)
Message-ID: <87d2bd4a-b90d-6396-17c5-c95ac64d17d0@monstr.eu>
Date: Thu, 7 Jul 2022 16:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: git <git@xilinx.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: dts: Zynq DT changes for v5.20
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull the following alignment patch to your tree.

Thanks,
Michal

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynq-dt-for-v5.20

for you to fetch changes up to c8b35008b4f1104b7d1296ee9508d45f9079e312:

   ARM: dts: xilinx: align gpio-key node names with dtschema (2022-06-23 
10:11:41 +0200)

----------------------------------------------------------------
ARM: Zynq DT changes for v5.20

- Align gpio-keys node names with dtschema

----------------------------------------------------------------
Krzysztof Kozlowski (1):
       ARM: dts: xilinx: align gpio-key node names with dtschema

  arch/arm/boot/dts/zynq-zc702.dts         | 4 ++--
  arch/arm/boot/dts/zynq-zturn-common.dtsi | 2 +-
  2 files changed, 3 insertions(+), 3 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

