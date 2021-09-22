Return-Path: <SRS0=I0Tm=OM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EFBC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Sep 2021 18:01:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1211360E52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Sep 2021 18:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1211360E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sIhEDKwdfiI9eXJ6P1tlL6rj6sU6NiMr4u5q4pC478Y=; b=uApsVmJ7lVks9F
	PwAtn60q42R5Y5JAfVGHF3bWY1szV1lDTQxkH8lxakxPKQ6Tnp++gsNrTngHEhtaOhazm6d/f4gnB
	eopbmJDwEBSQA7y4vdCMjUTU3y+oOoEw/Vn5S4rkIbo7Q4KKab5V1lHgLtYSEhAZelf+9ckqQvnEV
	YORB8apH9tJJYSd3ndFY9am2lGm43ZnUmS3Nl2qx8AteiYbpSXc0AdKlkOfF+gYRTnj29XsCrif89
	IGI13jTx7zD65uycFMRDcfeURoHAf1cl+DtL42+Ezpn+a+mG3KR8pOxTdssDw9UcLySZydbxmqJuZ
	+yG0fra27ftnrAcef+rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mT6Wo-009Owg-5g; Wed, 22 Sep 2021 17:59:30 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT6Wk-009OwB-O1
 for linux-arm-kernel@lists.infradead.org; Wed, 22 Sep 2021 17:59:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A6E711B3;
 Wed, 22 Sep 2021 10:59:21 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C97C53F719;
 Wed, 22 Sep 2021 10:59:19 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnd Bergmann <arnd@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] arm64/ARM: dts: juno/vexpress: Fixes for v5.15
Date: Wed, 22 Sep 2021 18:59:10 +0100
Message-ID: <20210922175910.2682172-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_105926_868755_87330CD1 
X-CRM114-Status: UNSURE (   7.72  )
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
Message-ID: <20210922175910.qSH1PaSXQVBqAXHAg19NhjVquctAzi-R7NVnvIgMuzE@z>

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-fixes-5.15

for you to fetch changes up to 078fb7aa6a8305bce09cdfbe77b4c987934442ba:

  arm: dts: vexpress: Fix addressing issues with 'motherboard-bus' nodes (2021-09-17 10:23:41 +0100)

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

Rob Herring (3):
      arm: dts: vexpress: Drop unused properties from motherboard node
      arm: dts: vexpress-v2p-ca9: Fix the SMB unit-address
      arm: dts: vexpress: Fix addressing issues with 'motherboard-bus' nodes

Robin Murphy (1):
      arm64: dts: fvp: Remove panel timings

 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi            | 20 ++++++++++++-------
 arch/arm/boot/dts/vexpress-v2m.dtsi                | 18 ++++++++++++-----
 arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts        | 11 +----------
 arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts         | 11 +----------
 arch/arm/boot/dts/vexpress-v2p-ca5s.dts            | 11 +----------
 arch/arm/boot/dts/vexpress-v2p-ca9.dts             | 12 +----------
 arch/arm64/boot/dts/arm/foundation-v8.dtsi         |  1 -
 arch/arm64/boot/dts/arm/fvp-base-revc.dts          | 23 ----------------------
 arch/arm64/boot/dts/arm/juno-base.dtsi             | 12 -----------
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi      | 21 +++++++++++++-------
 arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts         | 11 -----------
 .../boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi      |  2 +-
 arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi   | 20 +++++++++++++------
 .../boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts      | 12 +----------
 14 files changed, 60 insertions(+), 125 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
