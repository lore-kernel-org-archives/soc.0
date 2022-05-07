Return-Path: <SRS0=MVLl=VP=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6D3C433EF
	for <soc@archiver.kernel.org>; Sat,  7 May 2022 08:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9920EC385AC; Sat,  7 May 2022 08:29:49 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EFB23C385A5;
	Sat,  7 May 2022 08:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EFB23C385A5
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KwLDb2qnSz1JBrR;
	Sat,  7 May 2022 16:28:31 +0800 (CST)
Received: from [127.0.0.1] (10.67.102.125) by kwepemi500011.china.huawei.com
 (7.221.188.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 7 May
 2022 16:29:37 +0800
Message-ID: <62762DF0.30602@hisilicon.com>
Date: Sat, 7 May 2022 16:29:36 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, <arm@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <olof@lixom.net>, <arnd@arndb.de>
CC: <xuwei5@hisilicon.com>, <wupeng58@huawei.com>, <zhangyi.ac@huawei.com>,
	<tangkunshan@huawei.com>, <huangdaode@huawei.com>, <liguozhu@hisilicon.com>,
	<Jonathan.Cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<john.garry@huawei.com>, <salil.mehta@huawei.com>, <shiju.jose@huawei.com>,
	<prime.zeng@hisilicon.com>, <hesham.almatary@huawei.com>
Subject: [GIT PULL] HiSilicon ARMv7 SoC updates for v5.19
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

--- 

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-armv7soc-for-5.19

for you to fetch changes up to 9bc72e47d4630d58a840a66a869c56b29554cfe4:

  ARM: hisi: Add missing of_node_put after of_find_compatible_node (2022-05-06 02:27:49 +0000)

----------------------------------------------------------------
HiSilicon ARMv7 SoC updates for v5.19

- Add of_node_put to avoid the refcount leak

----------------------------------------------------------------
Peng Wu (1):
      ARM: hisi: Add missing of_node_put after of_find_compatible_node

 arch/arm/mach-hisi/platsmp.c | 4 ++++
 1 file changed, 4 insertions(+)

