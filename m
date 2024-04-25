Return-Path: <SRS0=2Wdg=L6=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1268C4345F
	for <soc@archiver.kernel.org>; Thu, 25 Apr 2024 11:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 971C5C2BD10; Thu, 25 Apr 2024 11:40:13 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA10CC113CC;
	Thu, 25 Apr 2024 11:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA10CC113CC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VQDMl4SXLzXmNW;
	Thu, 25 Apr 2024 19:36:35 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id A01D61800C4;
	Thu, 25 Apr 2024 19:40:06 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Thu, 25 Apr
 2024 19:40:05 +0800
Message-ID: <662A4115.9020805@hisilicon.com>
Date: Thu, 25 Apr 2024 19:40:05 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>, <xuwei5@hisilicon.com>,
	<zhangyi.ac@huawei.com>, <tangkunshan@huawei.com>, <daniel.shen@huawei.com>,
	<huangdaode@huawei.com>, <liguozhu@hisilicon.com>,
	<Jonathan.Cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<shiju.jose@huawei.com>, <salil.mehta@huawei.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.10
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.2]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd500014.china.huawei.com (7.221.188.63)

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-6.10

for you to fetch changes up to 5cff1135585f5f7d88ad1bbd67ca0f519714a809:

  arm64: dts: hisilicon: hi6220: correct tsensor unit addresses (2024-04-19 08:40:27 +0000)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for v6.10

- Move non-MMIO node out of soc for the hip05, hip06 and hip07 SoC
- Miscellaneous fixes and improvements like correcting unit addresses and
missing reg

----------------------------------------------------------------
Krzysztof Kozlowski (9):
      arm64: dts: hisilicon: hip05: move non-MMIO node out of soc
      arm64: dts: hisilicon: hip05-d02: correct local-bus unit addresses
      arm64: dts: hisilicon: hip06: move non-MMIO node out of soc
      arm64: dts: hisilicon: hip06: correct unit addresses
      arm64: dts: hisilicon: hip07: move non-MMIO node out of soc
      arm64: dts: hisilicon: hip07: correct unit addresses
      arm64: dts: hisilicon: hi6220-hikey: add missing port@0 reg
      arm64: dts: hisilicon: hi6220-hikey: drop unit addresses from fixed regulators
      arm64: dts: hisilicon: hi6220: correct tsensor unit addresses

 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts |  7 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      |  2 +-
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts    |  4 +-
 arch/arm64/boot/dts/hisilicon/hip05.dtsi       | 12 ++--
 arch/arm64/boot/dts/hisilicon/hip06.dtsi       | 88 +++++++++++++-------------
 arch/arm64/boot/dts/hisilicon/hip07.dtsi       | 84 ++++++++++++------------
 6 files changed, 99 insertions(+), 98 deletions(-)
