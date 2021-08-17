Return-Path: <SRS0=vjFT=NI=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A81C4338F
	for <soc@archiver.kernel.org>; Tue, 17 Aug 2021 11:22:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B6D0660FD8; Tue, 17 Aug 2021 11:22:21 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8764E60F38;
	Tue, 17 Aug 2021 11:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8764E60F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=huawei.com
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GppXM54T5z876g;
	Tue, 17 Aug 2021 19:22:11 +0800 (CST)
Received: from [10.40.166.221] (10.40.166.221) by
 dggeme758-chm.china.huawei.com (10.3.19.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 17 Aug 2021 19:22:18 +0800
Message-ID: <611B9BE9.8050904@hisilicon.com>
Date: Tue, 17 Aug 2021 19:22:17 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>
CC: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@kernel.org>,
	<xuwei5@hisilicon.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Zhangyi ac <zhangyi.ac@huawei.com>, Tangkunshan <tangkunshan@huawei.com>,
	huangdaode <huangdaode@huawei.com>, "Liguozhu (Kenneth)"
	<liguozhu@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, John Garry
	<john.garry@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Shiju Jose
	<shiju.jose@huawei.com>, "Zengtao (B)" <prime.zeng@hisilicon.com>
Subject: [GIT PULL] arm64: dts: hisilicon dts updates for v5.15
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.166.221]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggeme758-chm.china.huawei.com (10.3.19.104)
X-CFilter-Loop: Reflected

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-5.15

for you to fetch changes up to 2dc30eb9241c21cbeaf5b668f4eb276278149d97:

  arm64: dts: HiSilicon: hi3660: address a PCI warning (2021-08-13 08:26:49 +0000)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for 5.15

- Address a PCI bus range warning of the hi3660 SoC

----------------------------------------------------------------
Mauro Carvalho Chehab (1):
      arm64: dts: HiSilicon: hi3660: address a PCI warning

 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
