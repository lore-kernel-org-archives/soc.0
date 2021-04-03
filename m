Return-Path: <SRS0=y6Nc=JA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13265C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Apr 2021 15:07:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 988E861056
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Apr 2021 15:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 988E861056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:CC:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1f6TjIcF9kHllWO553ijs/mBUERKKy4ZsRhoDioYrT4=; b=evk1jj9blLuqrB8mntm7DflI0C
	zca0PaAzdIEVkfP23t0VNeCaouOg7odcVHu7meMGHDfHoaEaHB9ZrK6W29B00YjPm/hj/VCLyMisp
	+9cQcCi6a9bQaIzZbpRy47JxFebyjRh/iTKAcvwsG8aQjKeocBic0/wgLrA2f5dyHs3u4cDoxG06q
	4y9Aa8+7eW7n11QoGQFb+B2CxICBcVovASB5jeJRiSQaqSK//CJQX2UHilZO0HJOd2lgI5PlmCMx1
	/MLV6D5cWw8zh2viz+Z2onj5fu5AQDtYupAArAssgqtsAnHfsKgGXSBPcAV6qdXle0cmwgqdPcYwd
	q7o+b3rQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lShqu-00ElBF-0M; Sat, 03 Apr 2021 15:06:20 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lShqq-00ElAf-Ea
 for linux-arm-kernel@lists.infradead.org; Sat, 03 Apr 2021 15:06:18 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FCKv20MpVz18GcM;
 Sat,  3 Apr 2021 23:03:58 +0800 (CST)
Received: from [10.46.67.229] (10.46.67.229) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0;
 Sat, 3 Apr 2021 23:05:55 +0800
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <olof@lixom.net>, <arm@kernel.org>, <thunder.leizhen@huawei.com>,
 <xuwei5@hisilicon.com>, <zhangyi.ac@huawei.com>, <liguozhu@hisilicon.com>,
 <tangkunshan@huawei.com>, <huangdaode@hisilicon.com>,
 <jonathan.cameron@huawei.com>, <john.garry@huawei.com>,
 <shameerali.kolothum.thodi@huawei.com>, <salil.mehta@huawei.com>,
 <shiju.jose@huawei.com>, <mchehab+huawei@kernel.org>
From: Wei Xu <xuwei5@hisilicon.com>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v5.13
Message-ID: <744291cd-a66f-dedb-fe7a-752a9032d6cd@hisilicon.com>
Date: Sat, 3 Apr 2021 23:06:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
X-Originating-IP: [10.46.67.229]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210403_160616_776683_0C3EDD32 
X-CRM114-Status: UNSURE (   5.82  )
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
Message-ID: <20210403150605.9bNDGlpsIlkQDcnXnCknOH1jdrGFUp2qqJdM3WyVruU@z>

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the git repository at:

  git://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-5.13

for you to fetch changes up to 3d208c8207bfaa861a783c8fed9f31438fc0bcc6:

  arm64: dts: hisilicon: correct vendor prefix hisi to hisilicon (2021-04-02 15:12:52 +0800)

----------------------------------------------------------------
ARM64: DT: Hisilicon ARM64 DT updates for 5.13

- Correct the vendor prefix for hi3660 and hi3670

----------------------------------------------------------------
Zhen Lei (1):
      arm64: dts: hisilicon: correct vendor prefix hisi to hisilicon

 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
