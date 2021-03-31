Return-Path: <SRS0=X/nU=I5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8D3C433C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 10:06:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C53C61964
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 10:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C53C61964
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eLsFuSo6jcpnYzeKUhFDohkH1Apfpca8epxRuKOCyK0=; b=ZBs3SacacUpkPXSqpgSNmqwiQQ
	jkalICwJHcG8bv0ow62RWs9jY+5y7Zm8SDmdNIjk7DIe8vd0nvOINt1gwcuxeWVwLUndZKbCx54Qu
	TyLqfXJ6PNNBjB0XXU99VuafJVbdUDtgXcVE3hI9WFcbPNDMjfYLTGlM1EUYshQrhkPFAsEVuQ2iI
	6ZPBGLxx8PNGNF6wAo1rKDDtwLOnDX1piQh9x0wlPeLZ281MSlr4bd/iY7CQXDMoKvSu1ZiFa+oJ8
	4yI+NGKM+Wk7CCNVN49JmmTMVIerhHdbSDWh/rQlS7CKWUcx0Dw27GFC9R8cyGrIYW/wHHxdgpy7K
	8gM8g1uA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRXi4-006DIT-JZ; Wed, 31 Mar 2021 10:04:24 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lRXi0-006DHx-Td
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 10:04:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E5881042;
 Wed, 31 Mar 2021 03:04:17 -0700 (PDT)
Received: from bogus (unknown [10.57.57.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F6773F792;
 Wed, 31 Mar 2021 03:04:15 -0700 (PDT)
Date: Wed, 31 Mar 2021 11:04:10 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] arm64: dts: juno: Updates for v5.13
Message-ID: <20210331100410.cenuhvpqoumvsk52@bogus>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_110421_247769_63610569 
X-CRM114-Status: UNSURE (   7.52  )
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
Message-ID: <20210331100410.puBg180mAYoFqUPPzd4odDwJ2Vv1rntzKtX8NeoHrRw@z>

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-5.13

for you to fetch changes up to d9df28ba587f646b50a7e307bbb0e6f85c7deb21:

  arm64: dts: juno: Enable more SMMUs (2021-03-15 13:24:09 +0000)

----------------------------------------------------------------
ARMv8 Juno updates for v5.13

Couple of changes to describe PCI dma-ranges correctly which was
previously removed and to enable the PCIe and DMA SMMU.

----------------------------------------------------------------
Robin Murphy (2):
      arm64: dts: juno: Describe PCI dma-ranges
      arm64: dts: juno: Enable more SMMUs

 arch/arm64/boot/dts/arm/juno-base.dtsi | 5 ++++-
 arch/arm64/boot/dts/arm/juno-r1.dts    | 4 ++++
 arch/arm64/boot/dts/arm/juno-r2.dts    | 4 ++++
 3 files changed, 12 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
