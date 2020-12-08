Return-Path: <SRS0=uTbi=FM=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51EA7C433FE
	for <linux-rockchip@archiver.kernel.org>; Tue,  8 Dec 2020 23:32:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 065C523AC8
	for <linux-rockchip@archiver.kernel.org>; Tue,  8 Dec 2020 23:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 065C523AC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6FPbb22C+1blf0t7GlAe+FZP7FEf6s0jdiLOMkmv5wI=; b=Q2uNdi1T0FM+7Gkee8C87ZiNU
	H23p2eP9tejwpptMc5wAy27TGGdCJTweHq1o4MB8pkmEVyuzJxC8fHN51VM4bxUykbUV66z0JxJUe
	HudutFYCaIasT0CwYntY21YJWshu748nWSn3lgWoON+g6Jqlox/rHFSWTmi0SRieIQzlR9nYhvuX6
	+1mo+62vGhqX9HgkXaD8AB2/o5kIekjQBYvb8zamwVovgynOy0k4+7CDMzIGcAxtZkVReixOiNmfg
	8G1TULjPslFpy3/7jGLriJaVvQ9AOWilxIox6ypSTjJEOwAC7o9ZxzmnLf/+cJJwszq9VNRfxQveS
	C5UhDoF3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmmT6-0002mi-5w; Tue, 08 Dec 2020 23:32:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmmT1-0002lH-5t; Tue, 08 Dec 2020 23:32:23 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Heiko Stuebner <heiko@sntech.de>,
	arm@kernel.org
Subject: Re: [GIT PULL] Rockchip driver changes for 5.11
Date: Wed,  9 Dec 2020 00:31:37 +0100
Message-ID: <160747024231.3766805.886914278440068286.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <2045618.irdbgypaU6@phil>
References: <2045618.irdbgypaU6@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_183223_311416_488A7491 
X-CRM114-Status: UNSURE (   8.35  )
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
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
Errors-To: linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208233137.psZRP3deN9dFzG_ANyYhDx1X8ORXqV4uU9kBawDZh3A@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 06 Dec 2020 19:32:04 +0100, Heiko Stuebner wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.11-rockchip-drivers-1
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: d7f9c26b45254bce50c0a4ec030d44abeb6eb22c

       Arnd

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
