Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE19EC4167B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 20:32:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5814923B99
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 20:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5814923B99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZZqW7I2tHhO/rveH6XJvXzEBToU7F/eDBTQZArrh1AY=; b=M1uYQf0Amr3PlqANnshtjxeDH
	fyyfLWlnB7nq8TBbItEc/psOq6Q7oULNOvjN20w6nFkDonbdEp8AnbrDBn6aE/OSX/rpfC/E6OvkY
	gkHvOS25RI2N3h9NzmFzA3aBy+bwtElP43K5mA6jw4skcPflwPhs5ebbab1tmCTWqE+nQEcDs9ft3
	UtWBFpblWYH9mKEOLPqpHKN36FuF45e/davmIFlKqFpnqo/c2fKihvxzUTzAQYifhJIw2RvPrcwTq
	GEPsrHyYq8j8ZyFvimrvz9wJ3RxRTLvBRmWjIjwLoevTvu5bnq/kSxbrwgopjWHjEnWBsnTX2BupJ
	pWgQDSsAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn67F-0004Dk-PL; Wed, 09 Dec 2020 20:31:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn66r-00042F-T8
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 20:30:50 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Joel Stanley <joel@jms.id.au>, arm <arm@kernel.org>,
 SoC Team <soc@kernel.org>
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.11
Date: Wed,  9 Dec 2020 21:30:38 +0100
Message-ID: <160754580117.2405127.13379631047169707253.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
References: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_153050_094097_3D8A5CD6 
X-CRM114-Status: UNSURE (   8.27  )
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209203038.hNcmJYWyo0prLao4P8R7r8Yrz7UNf6OfCxNPZC6lSds@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 06:30:44 +0000, Joel Stanley wrote:
> Here are some ASPEED changes for the 5.11 merge window.
> 
> The following changes since commit 2ba56f464f0c1a7264160f8675063b3df92e7966:
> 
>   ARM: dts: aspeed: ast2600evb: Add MAC0 (2020-11-19 22:31:18 +1030)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 419fd286274e32c2533f1305d76b04b32ae49853

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
