Return-Path: <SRS0=zSrM=FN=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB5DC433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 14:56:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5BA17238EB; Wed,  9 Dec 2020 14:56:50 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A590523406
	for <soc@kernel.org>; Wed,  9 Dec 2020 14:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A590523406
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=monstr@monstr.eu
Received: by mail-ej1-f52.google.com with SMTP id a16so2542994ejj.5
        for <soc@kernel.org>; Wed, 09 Dec 2020 06:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=HTobQiEkNPueZE6gn6zK1PHE2porppz4XM3wXfiHmTU=;
        b=vvSkivXaEtra84rKVw+VoTz8wxgDbEWUsKlTtDsQkA4UABiabGOREMQLj+VYxnEdQD
         kQp9GVTUZCQtiip0RUEzRrUuZwKxjIaldOZIf4D/PctRZjKENkNkfXIaXzZfoK/aNjzr
         1iCA8JXt1Rk+kkWKckF+8uGZB3iyq4BTdbBzjewlNhbFxAT4p+7Ii2mWLAm0QRle8Jwn
         RWvqjEDFutjpR8SVaHT383wPGQKqOc4r2gJEbrQU14PIEH9H1WJ206bjZdDlp26LQQw0
         caXgiWZhkqHEdO3e2XJXKBUwKG7MfIdjJva7QeFrBaw5mc+kMoBOv8VuxgXRyCd8czDO
         cZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=HTobQiEkNPueZE6gn6zK1PHE2porppz4XM3wXfiHmTU=;
        b=bycCV5v9ib8bzm3wZtc3TZlPU8/hRAzlDVNdC8MA8BUGo7MNfLxi9w1MjTsYgiThDl
         K14LYOjHgoK2gjaJwQBihzD/fwO+DYzYulpT6DcsFS5/WfRdg0qB7ZeJ8JOH2AO9efa9
         SfkzK5duAVI9E1MVId4Qorct/wjiwj0JhynMqFbRyMQufLjXhc0KO8OEHd5T1K9hJFxQ
         X48IkDhXAKBKdjoGKuF/505iErT1sR3Ih9TWBvBGgPqkpv22wdtKFhaXvP6TuBt62r5U
         n3VZtat88Fcc/xl9p7dMTaKhudSr4vttN2Hho9UrTG7aLLibGHqNNM4qnZuF3Drywooo
         Xx5g==
X-Gm-Message-State: AOAM533Pt4ndnfPGZFGi5Xm/F+Srl5PTrf9Bs3RMq49K0Jo2AnVSxWaI
	bzbpWqfJ9lkOwqxiFUPc5MJSyOFjcPRpGZ/M
X-Google-Smtp-Source: ABdhPJwGnzHiUd0empsBytxeB5/baA5ZjlmpYE1RB1Q9fCwO0jz4UU/bGtJarEeFsmNQDJy4zwdpfg==
X-Received: by 2002:a17:906:9250:: with SMTP id c16mr2415277ejx.355.1607525808216;
        Wed, 09 Dec 2020 06:56:48 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id r11sm1864865edt.58.2020.12.09.06.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 06:56:47 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.11
Message-ID: <f460f6ac-d235-a33b-3d0f-ca904a43e687@monstr.eu>
Date: Wed, 9 Dec 2020 15:56:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

please pull the following changes to your tree.

Thanks,
Michal

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-v5.11

for you to fetch changes up to 9854bc7dfa5f7661538b08dc44d5e6c8876832fb:

  arm64: dts: zynqmp: Wire mailbox with zynqmp-power driver (2020-11-25
13:29:54 +0100)

----------------------------------------------------------------
arm64: dts: ZynqMP DT changes for v5.11

- Wiring IPI communication channel with firmware driver
- Taking GIC to main bus to have only one
- Small fix in zynqmp.dtsi reported by dt_binding_check

----------------------------------------------------------------
Michal Simek (3):
      arm64: zynqmp: Move gic node to axi bus
      arm64: dts: zynqmp: Fix pcie ranges description
      arm64: dts: zynqmp: Wire mailbox with zynqmp-power driver

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 60
+++++++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 21 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

