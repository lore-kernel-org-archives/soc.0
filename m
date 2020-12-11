Return-Path: <SRS0=f/o2=FP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5B2C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Dec 2020 08:39:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57F4B23F2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Dec 2020 08:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57F4B23F2A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mSaJMAjVqtSVTu9zjE08YEOYP8X2gfILM8pImGV9TZs=; b=3gInYF0NExi6MKNcjfWzGh6jxK
	jh3NZ9YavoUP3fO/vSVJnd0N8uL+/627AaHP6qI58BzqNQGEzzi58+aoygwjW4B9AzUtgijHmF7VR
	XDRGGO9vhCkXA0o6silKpBVdxazqSmymhU9EzyaGkUdPbaAu2pow3bCuxadCOwCTazjmJ1XZGFRGP
	oMZ3Mg8u7CmcTvKJYZ1SWy7DGtpSndnI3WRoYdwtMr3+g5OgI4PZfLTrKVILtTl1B5oWdykyYOvgF
	qZS+ZhiFepf6bzyCr0vjFgx12scoo4rEstlGcw6WWCdpv5OKuLWHRqk5Mv4UwUvrJ8PzqaYInokao
	U0bzH6Yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kndw0-0002q2-A6; Fri, 11 Dec 2020 08:37:52 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kndvx-0002pT-Jy
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Dec 2020 08:37:50 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 419E180C8;
 Fri, 11 Dec 2020 08:37:57 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 1/2] Late devicetree changes for omaps for v5.11
Date: Fri, 11 Dec 2020 10:37:41 +0200
Message-ID: <pull-1607675790-251347@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_033749_718913_EE7FD370 
X-CRM114-Status: GOOD (  12.33  )
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
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 arm@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201211083741.t-15dRBT0SMekRPdtc7kls4-usc9nCOV5dfWl8C67u4@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit d7356a7ab125c3a4fee521b7530f3122bc842ac4:

  ARM: dts: am335x: Fix comments for AM335X_PIN_GPMC_WPN pin in GPIO mode (2020-11-16 13:38:29 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/dt-late-signed

for you to fetch changes up to 4d4ce69f19d4991701e84d5eaa0fc0e506210042:

  ARM: dts: dra71-evm: mark ldo0 regulator as always on (2020-12-08 15:57:43 +0200)

----------------------------------------------------------------
Late devicetree changes for omaps for v5.11 merge window

Here are few more late changes that would be nice to get into v5.11:

- More updates to use cpsw switchdev driver

- Enable gta04 PMIC power management

- Updates for dra7 for ECC support, 1.8GHz speed and keep the
  ldo0 regulator always on as specified in the data manual

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: dts: omap3-gta04: fix twl4030-power settings

Grygorii Strashko (2):
      ARM: dts: am33xx-l4: add dt node for new cpsw switchdev driver
      ARM: dts: am335x-evm/evmsk/icev2: switch to new cpsw switch drv

Tero Kristo (3):
      ARM: dts: am574x-idk: add support for EMIF1 ECC
      ARM: dts: dra76x: add support for OPP_PLUS
      ARM: dts: dra71-evm: mark ldo0 regulator as always on

 arch/arm/boot/dts/am335x-evm.dts   | 13 ++++++----
 arch/arm/boot/dts/am335x-evmsk.dts | 14 +++++------
 arch/arm/boot/dts/am335x-icev2.dts | 14 +++++------
 arch/arm/boot/dts/am33xx-l4.dtsi   | 49 ++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/am574x-idk.dts   |  4 ++++
 arch/arm/boot/dts/dra71-evm.dts    |  2 ++
 arch/arm/boot/dts/dra76x.dtsi      | 36 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/omap3-gta04.dtsi |  4 ++--
 8 files changed, 113 insertions(+), 23 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
