Return-Path: <SRS0=Jg7J=FK=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75006C433FE
	for <linux-rockchip@archiver.kernel.org>; Sun,  6 Dec 2020 18:32:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1ABF2311B
	for <linux-rockchip@archiver.kernel.org>; Sun,  6 Dec 2020 18:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1ABF2311B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DRXtjje7fMc2zu+JdrR8DD4K/msuAQW0Ru8pMnPOiUc=; b=xN8BjMmoVNUsv8S0uev4QFXClz
	mCmOPU8iCjeihkoc6C1mFCjl3uPvCjlrYCGW6ES9jg2aQPT5lLUxPxzA6bql5sD957ljDBsVmu2cE
	kiM/H/sa18MPRCmkzM1xKjP8x07G2q4jLcjNa+GizHFoIqE+yZKhez46ZCOtAikLV2SQb8BzV0ZkJ
	b1ba7PCyZb66+/QHE2MDI8DB326I4/Z3SF1qpt0+PggZqyXaCLk15L11Phnb85IPTf+xnxDrxIVQ2
	elbM3d4gBaXyDVMv3+vhAw5FnHGDcl4Jr4a9Wbc+4raw6blDHI0UU86FvarI+34tIwUwyRipun7TQ
	p2WusaBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klypM-0003ES-50; Sun, 06 Dec 2020 18:32:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klypK-0003Dh-2h; Sun, 06 Dec 2020 18:32:06 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1klypJ-0003wy-7V; Sun, 06 Dec 2020 19:32:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Subject: [GIT PULL] Rockchip driver changes for 5.11
Date: Sun, 06 Dec 2020 19:32:04 +0100
Message-ID: <2045618.irdbgypaU6@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_133206_151631_35F44180 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-rockchip@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Upstream kernel work for Rockchip platforms
 <linux-rockchip.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip@lists.infradead.org>
List-Help: <mailto:linux-rockchip-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: linux-rockchip@lists.infradead.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
Errors-To: linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
Message-ID: <20201206183204.PBbWePHX21J9dXwVyVU4WpssRP8j9nIPT1aZUMyrw1s@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.11-rockchip-drivers-1

for you to fetch changes up to c2867b2e710fc85bb39c6f6e5948450c48e8a33e:

  soc: rockchip: io-domain: Fix error return code in rockchip_iodomain_probe() (2020-12-04 11:20:47 +0100)

----------------------------------------------------------------
Minor fixes for the io-domain soc-driver

----------------------------------------------------------------
Lee Jones (1):
      soc: rockchip: io-domain: Remove incorrect and incomplete comment header

Zhang Changzhong (1):
      soc: rockchip: io-domain: Fix error return code in rockchip_iodomain_probe()

 drivers/soc/rockchip/io-domain.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
