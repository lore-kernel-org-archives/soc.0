Return-Path: <SRS0=uveA=E7=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7920C56202
	for <soc@archiver.kernel.org>; Wed, 25 Nov 2020 02:40:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6411220B80; Wed, 25 Nov 2020 02:40:35 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9354520872;
	Wed, 25 Nov 2020 02:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9354520872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=xuwei5@huawei.com
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CglVK5b9Jz15MhV;
	Wed, 25 Nov 2020 10:40:09 +0800 (CST)
Received: from [10.57.101.250] (10.57.101.250) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 10:40:23 +0800
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, "arm@kernel.org" <arm@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Wei Xu
	<xuwei5@hisilicon.com>, "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>, Jisheng Zhang
	<Jisheng.Zhang@synaptics.com>, Linus Walleij <linus.walleij@linaro.org>,
	Linuxarm <linuxarm@huawei.com>, Zhangyi ac <zhangyi.ac@huawei.com>,
	"Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, Tangkunshan
	<tangkunshan@huawei.com>, huangdaode <huangdaode@hisilicon.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, John Garry <john.garry@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, Salil Mehta
	<salil.mehta@huawei.com>, Shiju Jose <shiju.jose@huawei.com>
From: Wei Xu <xuwei5@hisilicon.com>
Subject: [GIT PULL] arm64: dts: hisilicon dts updates for v5.11
Message-ID: <5FBDC416.5060008@hisilicon.com>
Date: Wed, 25 Nov 2020 10:40:22 +0800
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

  git://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-5.11

for you to fetch changes up to 25df3e1f64f54cfb4b23ff3ed1292c3eba94b22e:

  arm64: dts: hisilicon: Use generic "ngpios" rather than "snps,nr-gpios" (2020-11-24 20:06:18 +0800)

----------------------------------------------------------------
ARM64: DT: Hisilicon ARM64 DT updates for 5.11

- Cleanups of the hisilicon DTS to align with the dtschema. All of them do not
  have any functional effect except passing dtschema checks or dtc W=2 builds.

----------------------------------------------------------------
Jisheng Zhang (1):
      arm64: dts: hisilicon: Use generic "ngpios" rather than "snps,nr-gpios"

Serge Semin (1):
      arm64: dts: hi3660: Harmonize DWC USB3 DT nodes name

Zhen Lei (11):
      arm64: dts: hisilicon: normalize the node name of the ITS devices
      arm64: dts: hisilicon: separate each group of data in the property "reg"
      arm64: dts: hisilicon: write the values of property-units into a uint32 array
      arm64: dts: hisilicon: remove unused property pinctrl-names
      arm64: dts: hisilicon: place clock-names "biu" before "ciu"
      arm64: dts: hisilicon: normalize the node name of the SMMU devices
      arm64: dts: hisilicon: normalize the node name of the usb devices
      arm64: dts: hisilicon: normalize the node name of the UART devices
      arm64: dts: hisilicon: list all clocks required by spi-pl022.yaml
      arm64: dts: hisilicon: list all clocks required by pl011.yaml
      arm64: dts: hisilicon: list all clocks required by snps-dw-apb-uart.yaml

 arch/arm64/boot/dts/hisilicon/hi3660.dtsi      |  13 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi      |   5 +-
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi |  27 ++--
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      |   4 +-
 arch/arm64/boot/dts/hisilicon/hip05.dtsi       |  24 ++--
 arch/arm64/boot/dts/hisilicon/hip06.dtsi       |  14 +-
 arch/arm64/boot/dts/hisilicon/hip07.dtsi       | 178 ++++++++++++-------------
 7 files changed, 132 insertions(+), 133 deletions(-)
