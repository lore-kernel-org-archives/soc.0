Return-Path: <SRS0=zSrM=FN=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE77DC433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 14:41:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BD08720829; Wed,  9 Dec 2020 14:41:21 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA0212332A
	for <soc@kernel.org>; Wed,  9 Dec 2020 14:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA0212332A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=monstr@monstr.eu
Received: by mail-ej1-f50.google.com with SMTP id x16so2454512ejj.7
        for <soc@kernel.org>; Wed, 09 Dec 2020 06:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=5dywgSQ0aQtEnwiqFifnZqRaC7VolhAVOBBw7J9VYnM=;
        b=u89SdTE8900uShQhz6lanO2LcvyD3H4IHStUbORrTInHQd+3xh6UghDhA0f/VCQStH
         6EvWj7KJpF8ffWBPgbUhWF4WTdqKJzZKEdFmqF2U7pVJ9rWg8oIKK8GMhpwrpafVjWd6
         9vR8/yV9pEJoS9V7owQX2TL0lBkOac2ieHQ5tB8S06Rxb06xlbvXss3VMLkqwFgBZRl3
         s0+ggPirXD7q5KrxOWZVK38yon7vZ30UdLZNHTPFVaFvWHktnVuoYp9Cah9l/tu17h0i
         BH8pKEP3+w7gLwU374SO4cNqxdPrStslgxYAfDDUPFWYHVK/7kAwXkOyIqgZQaXySmL6
         bXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=5dywgSQ0aQtEnwiqFifnZqRaC7VolhAVOBBw7J9VYnM=;
        b=Y3PhuKOMpdhCi0zjECFSoEDrgg0836tLqbEG14G2KVNNfzoKqSqzUknAwevrzMMqAG
         Qk5g7DQhjxsM0I1YIKs+BTb/euV2fnbz/2SuH5gs4gGNRV4o5ZufEXtWpQMd3OLUM+7g
         HAyrMML+ziwE8LQRJuY+KSldp6oytBMp7oNYQN172TdYa/eYXNWr1Eff5qsSuJ/KDBNV
         R4xzCjeTvdqZJPCkGdtddi27sLQalC1YM5gyiROQtuBvVNDebyQZS1PR8ix78U2V2O28
         CliIqQeG+awrtmgO4L2pZOEjkuUjoiNXnLV1xgIVTezMixeHhs/9jZkEujrMh50XkImS
         maBg==
X-Gm-Message-State: AOAM530V1q0fb59p3BXuO6WyuGZrVrMN9sAUrcwmlpiEmv0AYpHmvF+T
	8LhTF3J3vjMQkyylq+0hPhqFyV+jQihIqzGE
X-Google-Smtp-Source: ABdhPJy//CD1xynVfrEAeLGtucsiu2wm+tsGI0/9vsaGOUi4kll48rOCn7BavCErcnURv2aeeElOmQ==
X-Received: by 2002:a17:906:af5a:: with SMTP id ly26mr2311115ejb.416.1607524878876;
        Wed, 09 Dec 2020 06:41:18 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id i24sm1684710ejx.31.2020.12.09.06.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 06:41:18 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.11
Message-ID: <35b7d53a-f91d-9254-885b-5e45de8f9ce8@monstr.eu>
Date: Wed, 9 Dec 2020 15:41:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

pull pull the following patches to your tree.

Thanks,
Michal

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynq-dt-for-v5.10

for you to fetch changes up to a508f620b5a6e9b359a2baa46ec9a714c3e2f420:

  ARM: zynq: Fix incorrect reference to XM013 instead of XM011
(2020-12-09 15:20:11 +0100)

----------------------------------------------------------------
ARM: dts: zynq: DT changes for v5.11

- Adding support for Zturn-v5
- Small DT changes to clean errors from dt_binding_check

----------------------------------------------------------------
Alexandre GRIVEAUX (1):
      ARM: zynq: Add Z-turn board V5

Michal Simek (6):
      ARM: zynq: Fix compatible string for adi,adxl345 chip
      ARM: zynq: Rename bus to be align with simple-bus yaml
      ARM: zynq: Fix leds subnode name for zc702/zybo-z7
      ARM: zynq: Fix OCM mapping to be aligned with binding on zc702
      ARM: zynq: Convert at25 binding to new description on zc770-xm013
      ARM: zynq: Fix incorrect reference to XM013 instead of XM011

 arch/arm/boot/dts/Makefile               |   1 +
 arch/arm/boot/dts/zynq-7000.dtsi         |   2 +-
 arch/arm/boot/dts/zynq-zc702.dts         |   8 +++++++-
 arch/arm/boot/dts/zynq-zc770-xm011.dts   |   2 +-
 arch/arm/boot/dts/zynq-zc770-xm013.dts   |   7 +++----
 arch/arm/boot/dts/zynq-zturn-common.dtsi | 112
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/zynq-zturn-v5.dts      |  15 +++++++++++++++
 arch/arm/boot/dts/zynq-zturn.dts         | 101
+----------------------------------------------------------------------------------------------------
 arch/arm/boot/dts/zynq-zybo-z7.dts       |   2 +-
 9 files changed, 142 insertions(+), 108 deletions(-)
 create mode 100644 arch/arm/boot/dts/zynq-zturn-common.dtsi
 create mode 100644 arch/arm/boot/dts/zynq-zturn-v5.dts

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

