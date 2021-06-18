Return-Path: <SRS0=1/go=LM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF38C48BE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 07:06:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B98F8613AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 07:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B98F8613AA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+nNVjaymEjbsbt+5wPVP0TmVTXtprEBwAHv8IiFcg5s=; b=Y3Og8gWAidl0kL
	sJr7sZSSnG1NExqgE5g64KFRor7YTCkutyxDY/yTD9kBrnXUpZ/tXmhBTd6z7QMvcht8vUI4wI+OO
	wtjKeIZ9ExToo7k2f3h+PD7Iq+ILWn+EiY0aY9HYM4epQt7rlzYPEgNop4V210akKPen/6x9EuaQ/
	cT5Ci5k+uMSCeK235J6iqZ4AZJvWsUmp7xVvCCzLzUHc7Eh/c+HTt1z31j0QIiDNniYxw+P/VY4W8
	9LrE5LwOeZyVDsTEps5g42TtmtUBdA0yQA5Nn5wkqJRzLGiveMT64luPMYOo4GjbPqf1j4OJoo04e
	OaYlpqF/x196IHqkXHLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu8Z1-00D1G7-FQ; Fri, 18 Jun 2021 07:05:15 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu8Yx-00D1FI-PO
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 07:05:13 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id E3F56807E;
 Fri, 18 Jun 2021 07:05:18 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] USB4 regression fix for TI DRA74X
Date: Fri, 18 Jun 2021 10:05:05 +0300
Message-ID: <pull-1623999845-180025@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_000511_932485_B1569480 
X-CRM114-Status: UNSURE (   7.77  )
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
Message-ID: <20210618070505.8m_yriTCSJGF7cooi5nrZWnXnjpsZqdh94zrKto5Cz4@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit bae989c4bc53f861cc1b706aab0194703e9907a8:

  ARM: OMAP1: ams-delta: remove unused function ams_delta_camera_power (2021-05-26 14:01:27 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/fixes-rc6-signed

for you to fetch changes up to 78b4b165280d3d70e7a217599f0c06a4c0bb11f9:

  ARM: dts: dra7: Fix duplicate USB4 target module node (2021-06-11 08:30:42 +0300)

----------------------------------------------------------------
Fix duplicate usb4 regression for dra74 variants

USB4 is only present in DRA74x variants, and I managed to add it for the
other variants too with the recent legacy platform data removal.

----------------------------------------------------------------
Gowtham Tammana (1):
      ARM: dts: dra7: Fix duplicate USB4 target module node

 arch/arm/boot/dts/am5718.dtsi  |  6 +--
 arch/arm/boot/dts/dra7-l4.dtsi | 22 ----------
 arch/arm/boot/dts/dra71x.dtsi  |  4 --
 arch/arm/boot/dts/dra72x.dtsi  |  4 --
 arch/arm/boot/dts/dra74x.dtsi  | 92 ++++++++++++++++++++++--------------------
 5 files changed, 50 insertions(+), 78 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
