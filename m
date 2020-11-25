Return-Path: <SRS0=UpL1=E7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9ABC2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2020 02:38:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2237920872
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2020 02:38:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qQfAwsou"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2237920872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/FNzAyetyKa3PUqaHAZMLrbo9L6q6PuBPYHffL/rLIo=; b=qQfAwsouqOMiQWYXeE2YHAfJNy
	289OW2ipugrHrkfSI6pF5khaIRC6c6KKAIauRzAsD3KF5vciLgAlBspzpaBttNiCkaLiEBTUQXMMi
	zyeuY1i6s3rMKfB56DeQJao0pvcOWS5aqVyjzl4/IK5a+3ULb0ZFotAifKUsB+AYyAzKf8Xhfkqq7
	TM6xPzc/QN9ADL1VlX/oy9r4+tsT6IeQUpxW6+aGf7KIyhi+ADyeM8T5Nl7UDMc8xi85+F8jaXY5p
	ksXK2DEIQGX17GrMmpzccKUJamVdh3TYnMG0oqaHzyNeI5yHpc1w1BAab/Ne9bk7gmsmAKROmWySh
	AgE3HqYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khkg9-0004LZ-LD; Wed, 25 Nov 2020 02:37:09 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khkg7-0004LE-Bo
 for linux-arm-kernel@lists.infradead.org; Wed, 25 Nov 2020 02:37:08 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CglQD4yLPzkdg3;
 Wed, 25 Nov 2020 10:36:36 +0800 (CST)
Received: from [10.57.101.250] (10.57.101.250) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 10:36:55 +0800
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, "arm@kernel.org" <arm@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Wei Xu <xuwei5@hisilicon.com>
Subject: [GIT PULL] arm: dts: hisilicon dts updates for v5.11
Message-ID: <5FBDC347.4050102@hisilicon.com>
Date: Wed, 25 Nov 2020 10:36:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_213707_661995_2F812033 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Salil Mehta <salil.mehta@huawei.com>, John Garry <john.garry@huawei.com>,
 Tangkunshan <tangkunshan@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, Jonathan
 Cameron <jonathan.cameron@huawei.com>, Linuxarm <linuxarm@huawei.com>,
 Wei Xu <xuwei5@hisilicon.com>, huangdaode <huangdaode@hisilicon.com>,
 "Leizhen \(ThunderTown\)" <thunder.leizhen@huawei.com>,
 Olof Johansson <olof@lixom.net>,
 "Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
 Zhangyi ac <zhangyi.ac@huawei.com>, Shiju Jose <shiju.jose@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201125023655.N-UDN2bZf3bXqTJEW_1INtdBbwfSWaDcEy-8OorOjtw@z>

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the git repository at:

  git://github.com/hisilicon/linux-hisi.git tags/hisi-arm32-dt-for-5.11

for you to fetch changes up to d48b6ef74ab06c5b29bd9ee9e830bdc639b196ee:

  ARM: dts: hisilicon: fix errors detected by syscon.yaml (2020-11-24 19:43:18 +0800)

----------------------------------------------------------------
ARM: DT: Hisilicon ARM32 DT updates for 5.11

- Cleanups of the hisilicon DTS to align with the dtschema including
  serial, usb, amba-bus, memory, mmc, spi and syscon. All of them do not
  have any functional effect except passing dtschema checks or dtc W=2
  builds.

----------------------------------------------------------------
Zhen Lei (8):
      ARM: dts: hisilicon: fix errors detected by snps-dw-apb-uart.yaml
      ARM: dts: hisilicon: fix errors detected by pl011.yaml
      ARM: dts: hisilicon: fix errors detected by usb yaml
      ARM: dts: hisilicon: fix errors detected by simple-bus.yaml
      ARM: dts: hisilicon: fix errors detected by root-node.yaml
      ARM: dts: hisilicon: fix errors detected by synopsys-dw-mshc.yaml
      ARM: dts: hisilicon: fix errors detected by spi-pl022.yaml
      ARM: dts: hisilicon: fix errors detected by syscon.yaml

 arch/arm/boot/dts/hi3519-demb.dts    |  2 +-
 arch/arm/boot/dts/hi3519.dtsi        | 32 +++++++++++++--------------
 arch/arm/boot/dts/hi3620-hi4511.dts  | 24 ++++++++++-----------
 arch/arm/boot/dts/hi3620.dtsi        | 32 +++++++++++++--------------
 arch/arm/boot/dts/hip01-ca9x2.dts    |  2 +-
 arch/arm/boot/dts/hip01.dtsi         | 26 +++++++++++-----------
 arch/arm/boot/dts/hip04-d01.dts      |  2 +-
 arch/arm/boot/dts/hip04.dtsi         |  6 +++---
 arch/arm/boot/dts/hisi-x5hd2-dkb.dts |  2 +-
 arch/arm/boot/dts/hisi-x5hd2.dtsi    | 42 ++++++++++++++++++------------------
 10 files changed, 85 insertions(+), 85 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
