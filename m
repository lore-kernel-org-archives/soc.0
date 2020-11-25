Return-Path: <SRS0=uveA=E7=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C5BC2D0E4
	for <soc@archiver.kernel.org>; Wed, 25 Nov 2020 02:37:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9559B21527; Wed, 25 Nov 2020 02:37:06 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EE0F20872;
	Wed, 25 Nov 2020 02:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EE0F20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=xuwei5@huawei.com
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CglQD4yLPzkdg3;
	Wed, 25 Nov 2020 10:36:36 +0800 (CST)
Received: from [10.57.101.250] (10.57.101.250) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 10:36:55 +0800
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, "arm@kernel.org" <arm@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Wei Xu
	<xuwei5@hisilicon.com>, "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
	Linuxarm <linuxarm@huawei.com>, Zhangyi ac <zhangyi.ac@huawei.com>,
	"Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, Tangkunshan
	<tangkunshan@huawei.com>, huangdaode <huangdaode@hisilicon.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, John Garry <john.garry@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From: Wei Xu <xuwei5@hisilicon.com>
Subject: [GIT PULL] arm: dts: hisilicon dts updates for v5.11
Message-ID: <5FBDC347.4050102@hisilicon.com>
Date: Wed, 25 Nov 2020 10:36:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the git repository at:

  git://github.com/hisilicon/linux-hisi.git tags/hisi-arm32-dt-for-5.11

for you to fetch changes up to d48b6ef74ab06c5b29bd9ee9e830bdc639b196ee:

  ARM: dts: hisilicon: fix errors detected by syscon.yaml (2020-11-24 19:43:18 +0800)

----------------------------------------------------------------
ARM: DT: Hisilicon ARM32 DT updates for 5.11

- Cleanups of the hisilicon DTS to align with the dtschema including
  serial, usb, amba-bus, memory, mmc, spi and syscon. All of them do not
  have any functional effect except passing dtschema checks or dtc W=2
  builds.

----------------------------------------------------------------
Zhen Lei (8):
      ARM: dts: hisilicon: fix errors detected by snps-dw-apb-uart.yaml
      ARM: dts: hisilicon: fix errors detected by pl011.yaml
      ARM: dts: hisilicon: fix errors detected by usb yaml
      ARM: dts: hisilicon: fix errors detected by simple-bus.yaml
      ARM: dts: hisilicon: fix errors detected by root-node.yaml
      ARM: dts: hisilicon: fix errors detected by synopsys-dw-mshc.yaml
      ARM: dts: hisilicon: fix errors detected by spi-pl022.yaml
      ARM: dts: hisilicon: fix errors detected by syscon.yaml

 arch/arm/boot/dts/hi3519-demb.dts    |  2 +-
 arch/arm/boot/dts/hi3519.dtsi        | 32 +++++++++++++--------------
 arch/arm/boot/dts/hi3620-hi4511.dts  | 24 ++++++++++-----------
 arch/arm/boot/dts/hi3620.dtsi        | 32 +++++++++++++--------------
 arch/arm/boot/dts/hip01-ca9x2.dts    |  2 +-
 arch/arm/boot/dts/hip01.dtsi         | 26 +++++++++++-----------
 arch/arm/boot/dts/hip04-d01.dts      |  2 +-
 arch/arm/boot/dts/hip04.dtsi         |  6 +++---
 arch/arm/boot/dts/hisi-x5hd2-dkb.dts |  2 +-
 arch/arm/boot/dts/hisi-x5hd2.dtsi    | 42 ++++++++++++++++++------------------
 10 files changed, 85 insertions(+), 85 deletions(-)
