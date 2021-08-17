Return-Path: <SRS0=cSn/=NI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7318C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Aug 2021 11:24:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DDE860F38
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Aug 2021 11:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DDE860F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fd4fspnUGq10lZbfsbaXZuRJgqPGCZy/OU97Ouuqbm4=; b=UyHA3ecMFHkvzm
	/9+nagPjJe5grKqrzwDoFqrImpojVFpLaLaYa075fYiQ1r1jd+Vyzk1wV9U/2pg2snt1u7JFGHDHp
	/nvmGhTyOCmkTm71vxTRnmVqBtKbS2xAPkXyKmQmjY69SJE9wtNs9abZqcksM3YH9wp2MTqm+wbqh
	dVfbZ0zmB+4rz9iVoDpYutHM/AAX6iUL6eObIeq0XfnlBAMpKIE9NOoP0lj1slr/7ePg/LtIwcwg/
	FBTpuRJCDh22apQU1L8uvl8yIVUB/sKM7xHtCSokrpk3JSA7Zk3iDIGfNJIcwKqNSoK/t9BOJh9iC
	LcbB/CKRwDuiRQdWlByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFxAp-002Dov-LD; Tue, 17 Aug 2021 11:22:27 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFxAm-002Dmw-0V
 for linux-arm-kernel@lists.infradead.org; Tue, 17 Aug 2021 11:22:25 +0000
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
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
 rv:24.0) Gecko/20100101 Thunderbird/24.2.0
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
X-Originating-IP: [10.40.166.221]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggeme758-chm.china.huawei.com (10.3.19.104)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_042224_251402_39025871 
X-CRM114-Status: UNSURE (   5.72  )
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
Message-ID: <20210817112217.12xpY9vd1KgfcwCkIR1c1lS-Yidp8z2XDQri2hoA9Dg@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
