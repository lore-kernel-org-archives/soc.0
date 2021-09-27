Return-Path: <SRS0=MvIc=OR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F386C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 10:54:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB5760EE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 10:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FB5760EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfHwSoh2NMowC5Q4369QE0Rg8aAkA0jFELXEhJIUfbA=; b=Vp1megipo0b84K
	2ej+lUpIlgpnMbBHoWY0Esw+wLXeqQW1If6dfZoxcfoelfQOR33S62wN0ZMUSyjD3rx+E5sodv3wp
	3KSc/+fDeeRgnGPc4WqmyTlA++oX81TOO6gx2ucNvR6s47G7Vik1oUHD/BKOMQretJVxJC+YczhkX
	ASwQgTyYpb7JyODHfKOqPvjdRQJs1/xPBI8ZGiVbEGhP4OHV4Dny7yGF7HnJrjtQHpyUmpFQhhQY/
	bHJaU/ttaA4sxNfK7koD3Yj7xst4RnFi206XuWiznUZSZ7IO0cdDjZyjFaKRcKpO49RCZF/J+/JDY
	2NVk6IoDcITLsBxpt1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUoFs-002M9S-1M; Mon, 27 Sep 2021 10:53:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUoFo-002M8c-QM
 for linux-arm-kernel@lists.infradead.org; Mon, 27 Sep 2021 10:53:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD1CE1063;
 Mon, 27 Sep 2021 03:52:58 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E92D3F70D;
 Mon, 27 Sep 2021 03:52:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnd Bergmann <arnd@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Olof Johansson <olof@lixom.net>
Subject: [GIT PULL v2] arm64: dts: juno: fixes for v5.15-rc1
Date: Mon, 27 Sep 2021 11:52:49 +0100
Message-ID: <20210927105249.3583380-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922175910.2682172-1-sudeep.holla@arm.com>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_035300_928335_C92974E2 
X-CRM114-Status: UNSURE (   9.14  )
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
Message-ID: <20210927105249.NSZx0LsHK_c9tQQcaETvBzzmiAIQPz5_eVVIooTbhik@z>

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

v1->v2:
	- Added the fix for motherboard bus 'interrupt-map' which fixes
	  the boot regression reported by kernel CI.

-->8

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-fixes-5.15

for you to fetch changes up to 319aeaf69c85dc39768b3754c1786225e38e2871:

  arm: dts: vexpress: Fix motherboard bus 'interrupt-map' (2021-09-26 15:33:30 +0100)

----------------------------------------------------------------
 Juno/Vexpress fixes for v5.15

Bunch of DTS fixes to resolve addressing issues with some of the device
nodes, dropping unused/undocumented properties in various nodes, and
aligning node names with dtschema.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      arm64: dts: arm: align watchdog and mmc node names with dtschema
      ARM: dts: arm: align watchdog and mmc node names with dtschema
      arm64: dts: arm: drop unused interrupt-names in MHU

Rob Herring (4):
      arm: dts: vexpress: Drop unused properties from motherboard node
      arm: dts: vexpress-v2p-ca9: Fix the SMB unit-address
      arm: dts: vexpress: Fix addressing issues with 'motherboard-bus' nodes
      arm: dts: vexpress: Fix motherboard bus 'interrupt-map'

Robin Murphy (1):
      arm64: dts: fvp: Remove panel timings

 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi            | 67 +++++++++++++++++++---
 arch/arm/boot/dts/vexpress-v2m.dtsi                | 65 +++++++++++++++++++--
 arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts        | 57 +-----------------
 arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts         | 57 +-----------------
 arch/arm/boot/dts/vexpress-v2p-ca5s.dts            | 57 +-----------------
 arch/arm/boot/dts/vexpress-v2p-ca9.dts             | 58 -------------------
 arch/arm64/boot/dts/arm/foundation-v8.dtsi         |  1 -
 arch/arm64/boot/dts/arm/fvp-base-revc.dts          | 23 --------
 arch/arm64/boot/dts/arm/juno-base.dtsi             | 12 ----
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi      | 21 ++++---
 arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts         | 11 ----
 .../boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi      |  2 +-
 arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi   | 20 +++++--
 .../boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts      | 57 +-----------------
 14 files changed, 153 insertions(+), 355 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
