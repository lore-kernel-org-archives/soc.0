Return-Path: <SRS0=kCD1=PD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1D3C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 02:47:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F86060EFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 02:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F86060EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=18O7S9Z7GBvLT7zDPGstKJAVCDJkk5DHevYVC6Oo0PU=; b=iiYc5mameCLLnc
	RL6bttCkDYZB/7YCBdrinsjEowsmjQiaclTJ0ISH9Zuxda0sCOF8C4DeuTDNnEOyU+dFcOsz5uwhQ
	/s+40Uc9K24a6zLL+QFOpMo9HW87hqRG5SMdYxV2kZyTwseCgXApzmejG98zdIdiwgwvF19am+12O
	zTK55qbMgDJ2VRPDWxhzUl4YY5SLnnXT8S3fMRnbroBvXzO3rC/9fbMqZMHYNwFFl+FHcIYAen6Lm
	qFrExKTtLTbYxpt+AU3mkM94rwXDG0X1Eb8xeCL+pXAU44tZ8NWwOaaERTx9KtzR68eeech7KwQiJ
	eFuWm5Nh87aPlrfxkXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbDEI-0059Ay-Sw; Fri, 15 Oct 2021 02:45:55 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbDE8-00597m-NS
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Oct 2021 02:45:46 +0000
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HVrFq4sBRz8tcw;
 Fri, 15 Oct 2021 10:44:31 +0800 (CST)
Received: from [10.40.166.221] (10.40.166.221) by
 dggeme758-chm.china.huawei.com (10.3.19.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Fri, 15 Oct 2021 10:45:40 +0800
Message-ID: <6168EB53.60503@hisilicon.com>
Date: Fri, 15 Oct 2021 10:45:39 +0800
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
 <shiju.jose@huawei.com>, "Zengtao (B)" <prime.zeng@hisilicon.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski@canonical.com>, Michael Walle
 <michael@walle.cc>
Subject: [GIT PULL] arm64: dts: hisilicon dts updates for v5.16
X-Originating-IP: [10.40.166.221]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme758-chm.china.huawei.com (10.3.19.104)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_194545_028283_F7709583 
X-CRM114-Status: UNSURE (   7.61  )
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
Message-ID: <20211015024539.90v6lUu79a_uGNwJdHj6_7SbtpCXT1og7TFcWOrqWXY@z>

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-5.16

for you to fetch changes up to dcc3f56519b6e0fdc6a6c13dbdbf123425231e89:

  arm64: dts: hisilicon: align operating-points table name with dtschema (2021-09-22 01:44:37 +0000)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for 5.16

- Add SPMI PMIC support for the Hikey970 board
- Correct the sp805 watchdog compatible string to match the document
- Correct the operating-points table name to match the dtschema

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: hisilicon: align operating-points table name with dtschema

Mauro Carvalho Chehab (1):
      arm64: dts: hisilicon: Add support for Hikey 970 PMIC

Michael Walle (1):
      arm64: dts: hisilicon: fix arm,sp805 compatible string

 arch/arm64/boot/dts/hisilicon/hi3660.dtsi         |  8 +--
 arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts | 22 +-----
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi         |  2 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi         |  4 +-
 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi  | 86 +++++++++++++++++++++++
 5 files changed, 96 insertions(+), 26 deletions(-)
 create mode 100644 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
