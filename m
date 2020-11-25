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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA2BC2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2020 02:41:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4B4120872
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2020 02:41:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2Ry6U0uZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4B4120872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k1EWZjPXM8JU9Kksqmd4NT+mN8EPISz8hytpdPkr38A=; b=2Ry6U0uZKfYW1CdN1szY3Qcnn6
	qw689RFT/i7+CNnAtHUB46YxiFb0SCei1pxgaL6IfJCGuaqOkZfsJhDo4HTJJGTl7O06/DuOrs9n+
	tJRFCWMLoDO/5gi9GRvHfZsKL4U9sjj8IymLg7qjFmZTNfCeM9D+PRmioPnVGDwltuU26TVgPQRVY
	4WmYsTY3ULxrnM6zdhPxu1DeSMIDK4WVuXU7lwVDI1M1XG+t6l/mW7L52k3VmecbybXE7sex/u4l9
	KU9v0Jr2zKYKK7ksEBz/TS95ZLALZCHbHoHSKY0q2y0UZ37I+Lngm/amRcLeIEjNOW6e5fjOAGeRV
	QWk5PdVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khkjT-0004hV-Mp; Wed, 25 Nov 2020 02:40:35 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khkjQ-0004gE-Mo
 for linux-arm-kernel@lists.infradead.org; Wed, 25 Nov 2020 02:40:33 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CglVK5b9Jz15MhV;
 Wed, 25 Nov 2020 10:40:09 +0800 (CST)
Received: from [10.57.101.250] (10.57.101.250) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 10:40:23 +0800
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, "arm@kernel.org" <arm@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Wei Xu <xuwei5@hisilicon.com>
Subject: [GIT PULL] arm64: dts: hisilicon dts updates for v5.11
Message-ID: <5FBDC416.5060008@hisilicon.com>
Date: Wed, 25 Nov 2020 10:40:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_214033_040285_3672C08A 
X-CRM114-Status: GOOD (  10.12  )
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
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Linus Walleij <linus.walleij@linaro.org>, Jonathan
 Cameron <jonathan.cameron@huawei.com>, Linuxarm <linuxarm@huawei.com>,
 Wei Xu <xuwei5@hisilicon.com>, Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 huangdaode <huangdaode@hisilicon.com>,
 "Leizhen \(ThunderTown\)" <thunder.leizhen@huawei.com>,
 Olof Johansson <olof@lixom.net>,
 "Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
 Zhangyi ac <zhangyi.ac@huawei.com>, Shiju Jose <shiju.jose@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201125024022.jKmJ0-yj0JtkG7hkYaKJeiIl19qrseGGvJgkHUG9zYM@z>

Hi ARM-SoC team,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the git repository at:

  git://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-5.11

for you to fetch changes up to 25df3e1f64f54cfb4b23ff3ed1292c3eba94b22e:

  arm64: dts: hisilicon: Use generic "ngpios" rather than "snps,nr-gpios" (2020-11-24 20:06:18 +0800)

----------------------------------------------------------------
ARM64: DT: Hisilicon ARM64 DT updates for 5.11

- Cleanups of the hisilicon DTS to align with the dtschema. All of them do not
  have any functional effect except passing dtschema checks or dtc W=2 builds.

----------------------------------------------------------------
Jisheng Zhang (1):
      arm64: dts: hisilicon: Use generic "ngpios" rather than "snps,nr-gpios"

Serge Semin (1):
      arm64: dts: hi3660: Harmonize DWC USB3 DT nodes name

Zhen Lei (11):
      arm64: dts: hisilicon: normalize the node name of the ITS devices
      arm64: dts: hisilicon: separate each group of data in the property "reg"
      arm64: dts: hisilicon: write the values of property-units into a uint32 array
      arm64: dts: hisilicon: remove unused property pinctrl-names
      arm64: dts: hisilicon: place clock-names "biu" before "ciu"
      arm64: dts: hisilicon: normalize the node name of the SMMU devices
      arm64: dts: hisilicon: normalize the node name of the usb devices
      arm64: dts: hisilicon: normalize the node name of the UART devices
      arm64: dts: hisilicon: list all clocks required by spi-pl022.yaml
      arm64: dts: hisilicon: list all clocks required by pl011.yaml
      arm64: dts: hisilicon: list all clocks required by snps-dw-apb-uart.yaml

 arch/arm64/boot/dts/hisilicon/hi3660.dtsi      |  13 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi      |   5 +-
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi |  27 ++--
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      |   4 +-
 arch/arm64/boot/dts/hisilicon/hip05.dtsi       |  24 ++--
 arch/arm64/boot/dts/hisilicon/hip06.dtsi       |  14 +-
 arch/arm64/boot/dts/hisilicon/hip07.dtsi       | 178 ++++++++++++-------------
 7 files changed, 132 insertions(+), 133 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
