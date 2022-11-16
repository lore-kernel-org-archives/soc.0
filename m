Return-Path: <SRS0=B0BC=3Q=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF362C4332F
	for <soc@archiver.kernel.org>; Wed, 16 Nov 2022 02:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97BF4C433D7; Wed, 16 Nov 2022 02:32:18 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D194C433C1;
	Wed, 16 Nov 2022 02:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D194C433C1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NBn6m3X2MzJnlf;
	Wed, 16 Nov 2022 10:29:04 +0800 (CST)
Received: from [10.67.103.39] (10.67.103.39) by kwepemi500011.china.huawei.com
 (7.221.188.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 16 Nov
 2022 10:32:12 +0800
Message-ID: <63744BAB.5020307@hisilicon.com>
Date: Wed, 16 Nov 2022 10:32:11 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
	<xuwei5@hisilicon.com>, Palmer Dabbelt <palmer@rivosinc.com>,
	<zhangyi.ac@huawei.com>, <tangkunshan@huawei.com>, <huangdaode@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<salil.mehta@huawei.com>, <shiju.jose@huawei.com>
Subject: [GIT PULL] HiSilicon maintainers fixes for v6.1
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.103.39]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-maintainer-fix

for you to fetch changes up to fc2292bd01a25279bf3e29c99e60bfe52d900a91:

  MAINTAINERS: git://github.com -> https://github.com for HiSilicon (2022-11-15 03:04:45 +0000)

----------------------------------------------------------------
MAINTAINERS file updates for HiSilicon sections

- Use https instead of git for the git trees listed

----------------------------------------------------------------
Palmer Dabbelt (1):
      MAINTAINERS: git://github.com -> https://github.com for HiSilicon

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
