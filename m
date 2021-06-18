Return-Path: <SRS0=1/go=LM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF53C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 01:21:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B83CB6135C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 01:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B83CB6135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AyM49l9dZ9LpXlJS2ohrxw0oLaNxH9zQc45M/hILd8c=; b=3q1QRLjqAavH+X
	0aZ+3kxhRoMFruPaax9cJC92F2RsXh49g9IurHxAc/wPFZy9vqmjBlSJIX3dGu6cTqirfSPdN1clQ
	UXbOcfTfcxbbxsmyxekRlN2KTvExgYfYoi16A41tnvZ7uMfjnl7LaXf6x4RAvVHq07nRFdrsjN6XT
	5dE6YdEjZIA5NJ0GxSm5SyCOq1Sv0cKkpO0uRZySI9rphiPH9yWjBAW3Xrk0EuPrs149CWhyJJISL
	opp0S0AM6AywBY/EZ9K/bi04qg0Vk0vsz3RZQ6kL0Xp+gmK6igbTXiN12OqeJ2+D6bccXwKuGzkf0
	PQEWUHHMjl0ISex6yTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu3Al-00CGzP-Id; Fri, 18 Jun 2021 01:19:51 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu3Ah-00CGyg-Kp
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 01:19:49 +0000
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G5gxV3Q06zZd6y;
 Fri, 18 Jun 2021 09:16:46 +0800 (CST)
Received: from [10.40.166.221] (10.40.166.221) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 18 Jun 2021 09:19:42 +0800
Message-ID: <60CBF4AE.7040301@hisilicon.com>
Date: Fri, 18 Jun 2021 09:19:42 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
 rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
CC: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@kernel.org>,
 <xuwei5@hisilicon.com>, Hao Fang <fanghao11@huawei.com>, Zhangyi ac
 <zhangyi.ac@huawei.com>, Tangkunshan <tangkunshan@huawei.com>, huangdaode
 <huangdaode@huawei.com>, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, John Garry <john.garry@huawei.com>,
 Salil Mehta <salil.mehta@huawei.com>, Shiju Jose <shiju.jose@huawei.com>
Subject: [GIT PULL] arm64: dts: hisilicon dts updates for v5.14
X-Originating-IP: [10.40.166.221]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_181947_910620_B51F5115 
X-CRM114-Status: UNSURE (   4.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210618011942.6LjFOMOhFRuAb6VSNghlYL-EF42K-i1YyvH3zDm8IdM@z>

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-5.14

for you to fetch changes up to e3211e414d26cda43f3093fd09e5d8d0a797648f:

  arm64: dts: hisilicon: use the correct HiSilicon copyright (2021-06-17 01:28:15 +0000)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for 5.14

- Correct the HiSilicon copyright

----------------------------------------------------------------
Hao Fang (1):
      arm64: dts: hisilicon: use the correct HiSilicon copyright

 arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 2 +-
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts   | 2 +-
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi           | 2 +-
 arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts   | 2 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi           | 2 +-
 arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi | 2 +-
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts      | 2 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi           | 2 +-
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts         | 2 +-
 arch/arm64/boot/dts/hisilicon/hip05.dtsi            | 2 +-
 arch/arm64/boot/dts/hisilicon/hip06-d03.dts         | 2 +-
 arch/arm64/boot/dts/hisilicon/hip06.dtsi            | 2 +-
 arch/arm64/boot/dts/hisilicon/hip07-d05.dts         | 2 +-
 arch/arm64/boot/dts/hisilicon/hip07.dtsi            | 2 +-
 include/dt-bindings/pinctrl/hisi.h                  | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
