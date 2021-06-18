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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46857C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 01:18:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15F7A6135C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 01:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15F7A6135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q+KyhcawOIRaSEx8C8jDYtK2eQP5BJq1llfyTj9NyE0=; b=CoxkDto3S2UaN0
	b/fxFIdbEYxsv23SIEdMlCtUVOkjP+pM/hcy1fiPshzpWaod8p60zX8x4k+zGPW0U1DqQIGyXGMqr
	HoOvJw/z8/dPQmn7AbILIwQsVDe8xi/Lv4m7suPZlpqCFYH6EXN27FDO4ZqeaITfPWTBoI0Z+hSjP
	dLq40VsBUTsCCnGG8jwGlNFIBrTIWatXxURTrz1/InFT0GsLPCUA1303R7DeKsuaXQi3yW6hhfCkY
	VGLF+Kr60zP55Dn9AMYBM1ysgtUkBIrc8wlcxGRM1k3smkilJtCeRJr+sutpK3AP6JrPXp1ZbkHl2
	52N/V7yCTrJyWH05patw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu38D-00CGaA-Ra; Fri, 18 Jun 2021 01:17:14 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu388-00CGYH-TI
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 01:17:10 +0000
Received: from dggeme706-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G5gs40f4Pz6yXr;
 Fri, 18 Jun 2021 09:12:56 +0800 (CST)
Received: from [10.40.166.221] (10.40.166.221) by
 dggeme706-chm.china.huawei.com (10.1.199.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 18 Jun 2021 09:16:56 +0800
Message-ID: <60CBF408.7040302@hisilicon.com>
Date: Fri, 18 Jun 2021 09:16:56 +0800
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
Subject: [GIT PULL] arm: dts: hisilicon dts updates for v5.14
X-Originating-IP: [10.40.166.221]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme706-chm.china.huawei.com (10.1.199.102)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_181709_163418_8B949264 
X-CRM114-Status: UNSURE (   5.39  )
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
Message-ID: <20210618011656.rc8R5NIGjgqZ2IhKG5bBkj54yBlp5eeJvXIl8WBKv1Q@z>

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://github.com/hisilicon/linux-hisi.git tags/hisi-arm32-dt-for-5.14

for you to fetch changes up to da1eab9e15ef96c10e5cadd73ebe113e7947f8f7:

  ARM: dts: hisilicon: use the correct HiSilicon copyright (2021-06-17 01:53:05 +0000)

----------------------------------------------------------------
ARM: DT: HiSilicon ARM32 DT updates for 5.14

- Correct the HiSilicon copyright

----------------------------------------------------------------
Hao Fang (1):
      ARM: dts: hisilicon: use the correct HiSilicon copyright

 arch/arm/boot/dts/hi3620.dtsi        | 4 ++--
 arch/arm/boot/dts/hip01-ca9x2.dts    | 4 ++--
 arch/arm/boot/dts/hip01.dtsi         | 4 ++--
 arch/arm/boot/dts/hip04.dtsi         | 4 ++--
 arch/arm/boot/dts/hisi-x5hd2-dkb.dts | 2 +-
 arch/arm/boot/dts/hisi-x5hd2.dtsi    | 2 +-
 arch/arm/boot/dts/sd5203.dts         | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
