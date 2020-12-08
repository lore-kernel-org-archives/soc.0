Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591C0C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:34:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2037623AA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2037623AA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZGRNsDxaMhu/0p+uQgLrGTfTk/ZKsf46CS0LRYs4hhk=; b=cm73wD0+/qYOm+PxjQSLtmRxm
	UnwAfZMujkRy1YOx5HJkv/dT0SSEXdJqBDJDdwtx5Z3QDuj+bvbgfOQ0hDNMkJREv5Qk3+aD9Ry8b
	FtgPQF0EDgmXJRQRE1yfDk9HP/y8FsUyWTmmxrz3k/9adjW9ql5PVmy/tB8QvcnGQVPrXc7PuNENW
	R86K1kDfuiJEIG0t0tj+OzJ7axqIBTtai32GV5M3tRBSXFBjuDhkzMs6E1KJF/rqmTpcgS/jKaVm6
	2SlBa6yg81KPHbnabwvjLrog1Ya8wHRBCJ3TG745y0iCQOEmbxVf9s1mpcgO9L7ErR1gmuoQ4zduh
	fKjgexRXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmmTj-0002xm-Ey; Tue, 08 Dec 2020 23:33:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmmTK-0002rM-QK
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 23:32:43 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Subject: Re: [GIT PULL 1/4] Driver changes for omaps for genpd support
Date: Wed,  9 Dec 2020 00:31:44 +0100
Message-ID: <160747024154.3766805.2738479830140196782.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <pull-1606806458-694517@atomide.com>
References: <pull-1606806458-694517@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_183242_962425_07143CDC 
X-CRM114-Status: UNSURE (   9.73  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Arnd Bergmann <arnd@arndb.de>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Tero Kristo <t-kristo@ti.com>,
 arm@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208233144.Zhhl4wyZ6WlEobiMknRqbHDzmawZegPgzGvj5F6e5GM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 09:18:46 +0200, Tony Lindgren wrote:
> The following changes since commit e7ae08d398e094e1305dee823435b1f996d39106:
> 
>   bus: ti-sysc: Fix bogus resetdone warning on enable for cpsw (2020-10-26 10:08:53 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/genpd-drivers-signed
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: e5b14e46a2ad023fbb388c42e24ff7117d0f135a

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
