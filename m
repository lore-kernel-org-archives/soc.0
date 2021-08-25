Return-Path: <SRS0=5QJf=NQ=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8C0C4338F
	for <soc@archiver.kernel.org>; Wed, 25 Aug 2021 07:28:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BB5E06138B; Wed, 25 Aug 2021 07:28:58 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D847261178
	for <soc@kernel.org>; Wed, 25 Aug 2021 07:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D847261178
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ej1-f41.google.com with SMTP id u14so24710668ejf.13
        for <soc@kernel.org>; Wed, 25 Aug 2021 00:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=EWkv2LY4ATYPWVUsgzFkn/MR1kSUr3gSJNpViVJ9w2g=;
        b=MXhkijdXuekbIWw615VyzNQ8aLwUnZKOxWrp3lVywq9GjnMwcHZE7lrRaC2XN0i1st
         XON0UatRG/BLPxGzQ9A7UgFmo+OBiLUfoQi9hfu+5WY7h7jrOJQp2T30fFyrH1elBNZc
         UfmydetaBDObN/Rb4rnqEv8a7laJEWiVCHAgKNyzHfAjoGwnU88/RbsOzt1gSjFKBPXY
         FAINQpXeDn9kJbZPa8ptwCxNdI5cLxbfEU8aRAYTNyW+h0P6/SRg0HdMb7KfnxDxbbNI
         XjTvx2ihKVFANnnPyIBnzI888pH6yCfH+kc5UOZ+om5NAJOqxRqRV3/BN80kI0Ccm5XK
         mTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=EWkv2LY4ATYPWVUsgzFkn/MR1kSUr3gSJNpViVJ9w2g=;
        b=ELxEbg/yCiIH9e8QDnASmh4ovEIomEYP+1i+o2Z7ie1GnbFb4C2BtU6PRkcenvo1ny
         oRDWz04dAiOWRSOjS8pXu7Kj7ezpctUSCgqMF5VgAFb5NGqQy3/Xw3fRICS/JTs/4F4Y
         B89nE2Mqokatv+Dp53yofQYWKdUT/G0G5DH+VYhxEzWEiue80sn3ZfymcvToDZTQFQsp
         b2/SWJ3TzfD0aJinjiRM/kHrdgStOe6Q2XNzO75Q560zoy9WsB3XNpy5vrtCQbAD+MTR
         m2saNFMVoN+MiWwLAx9CtStMOpYIpv2BRYgOuoNqwG8x11B5z2xZMYN8lJZNvxM8nufJ
         z+mg==
X-Gm-Message-State: AOAM531KiXB76DUZfS4K3x+LxmXiJMONfMf0I5kLOqsdtqRz7ycIQzRI
	TTyRdgBcIRLghVXX8AoNY9hDlA==
X-Google-Smtp-Source: ABdhPJx5sJVhqc6ZZhm+ZMukInZb9NG7LBF1Wt+ZH+SrbtAqaeeg1M48XOZYZDofUQ9cXWHULadQAg==
X-Received: by 2002:a17:906:6ad4:: with SMTP id q20mr46387480ejs.433.1629876536424;
        Wed, 25 Aug 2021 00:28:56 -0700 (PDT)
Received: from ?IPv6:2a02:768:2307:40d6::e05? ([2a02:768:2307:40d6::e05])
        by smtp.gmail.com with ESMTPSA id b18sm4412707ejl.90.2021.08.25.00.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 00:28:56 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.15
Message-ID: <f3dc69c8-8a22-e938-4ddf-b1052b8c1437@monstr.eu>
Date: Wed, 25 Aug 2021 09:28:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

please pull these two patches to your tree.

Thanks,
Michal

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynq-dt-for-v5.15

for you to fetch changes up to c387eea58f931fe5d008df88cc75dfc3c704e3bf:

  ARM: dts: ebaz4205: enable NAND support (2021-08-06 12:22:40 +0200)

----------------------------------------------------------------
ARM: dts: Zynq DT changes for v5.15

- Enable nand flash controller for ebaz4205 board

----------------------------------------------------------------
Michael Walle (2):
      ARM: dts: zynq: add NAND flash controller node
      ARM: dts: ebaz4205: enable NAND support

 arch/arm/boot/dts/zynq-7000.dtsi    | 21 +++++++++++++++++++++
 arch/arm/boot/dts/zynq-ebaz4205.dts | 12 ++++++++++++
 2 files changed, 33 insertions(+)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

