Return-Path: <SRS0=Z+PL=DV=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD68C001DE
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 06:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E6C4C433CC; Fri,  4 Aug 2023 06:24:46 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87A79C433C8;
	Fri,  4 Aug 2023 06:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87A79C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RHFyq18wyzrS70;
	Fri,  4 Aug 2023 14:23:31 +0800 (CST)
Received: from [10.67.103.39] (10.67.103.39) by kwepemi500011.china.huawei.com
 (7.221.188.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 14:24:35 +0800
Message-ID: <64CC99A3.5030701@hisilicon.com>
Date: Fri, 4 Aug 2023 14:24:35 +0800
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
	<salil.mehta@huawei.com>, <shiju.jose@huawei.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, David Yang <mmyangfl@gmail.com>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.6
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.103.39]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-6.6

for you to fetch changes up to dc8cbdd9c68d1e840aec926bee714c38f5e315a5:

  arm64: dts: hi3798cv200: Fix clocks order of sd0 (2023-08-03 12:37:20 +0000)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for v6.6

- Miscellaneous fixes according the DTS coding style
- Correct the clocks order of the sd0 for the hi3798cv200

----------------------------------------------------------------
David Yang (1):
      arm64: dts: hi3798cv200: Fix clocks order of sd0

Krzysztof Kozlowski (2):
      arm64: dts: hisilicon: minor whitespace cleanup around '='
      arm64: dts: hisilicon: add missing space before {

 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi |  4 ++--
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 24 ++++++++++++------------
 arch/arm64/boot/dts/hisilicon/hip06.dtsi       |  8 ++++----
 arch/arm64/boot/dts/hisilicon/hip07.dtsi       |  8 ++++----
 4 files changed, 22 insertions(+), 22 deletions(-)
