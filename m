Return-Path: <SRS0=g+kj=FV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AA2C1B0D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Dec 2020 00:58:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68DC923B27
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Dec 2020 00:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68DC923B27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0oZDsGekGzaMyqjWegG8Q3IuwrL9e+2Jm+HWgugUGU=; b=OExBpog1IxTmuMb4p5tQ7mgUku
	8GsDsE88tR4jWQOGwXV/N8BrgrGDtTE01sM5I6Bp6vtNqRLoADCfHJN1yEYAbdj58pzDKSiRKrk0J
	H6XAm03vxuglAqbvnEfLn1aDHE2vfpHrbifHZBaEx0mvdYVv6x0V4CEBe1rhVpnTpEZzKVGorb86x
	ZPjogUt/fGcFvANncrAL547EKqJBnPQeHWREX5hIXJMu3Y2XcVliDok+Sg9ZbXuvcM7vuM/ShO6QD
	wUFhSWXla97aq09HruC9rhpaDyHBtgXZ207wVRZYXRMMABQi7hXK8Nxpk63oyIO+LH1tTDLycNzNO
	tnV9LwXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kphbk-0002mm-Ih; Thu, 17 Dec 2020 00:57:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kphba-0002kj-0G
 for linux-arm-kernel@lists.infradead.org; Thu, 17 Dec 2020 00:57:20 +0000
Subject: Re: [GIT PULL 3/5] ARM: device tree updates for 5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608166637;
 bh=cLkV5JRR274hP/6WLmIZXUjpdGoQvgcmSiDg4OOi9FA=;
 h=From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=jmrR9c1wO6HNc80ZoTCx0FmojLSn1N2wvE75ka31F9ouYfaF7jQg49YbI9n7Ml/X7
 pr5rI78JCbNBAJLMONqNcxta+6+rmwMq1BGYq/4WvW1jwjcfgnfpQ2D0NImqwRDdfn
 Bgnb4lFhMr1JrPxYrVtM6McvJHj18EFkuRp16Pl/oLmlyXgy7ce9Z8NFMGKtkd5VfQ
 3Ze6kJklcbsmziXnGhly8WGmIQ55me661YDj77wKGgKw03WN+sJT+YLdprpFHu8pYY
 V/ei5I96+EhTQD8749gnCogLmRWuXFs9FKdlKlidhd25j+hNbfRlQY3DhDkLH/kIw3
 zq4Z4oNWvOutw==
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0hXcgTioiGi+CGrF6ePbkSSUkNpt7xE4ks=zeMjeyBSw@mail.gmail.com>
References: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
 <CAK8P3a0hXcgTioiGi+CGrF6ePbkSSUkNpt7xE4ks=zeMjeyBSw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a0hXcgTioiGi+CGrF6ePbkSSUkNpt7xE4ks=zeMjeyBSw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-soc-dt-5.11
X-PR-Tracked-Commit-Id: 13719d8d0d67998435c5748998ef686a10eefb4a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9805529ec544ea7a82d891d5239a8ebd3dbb2a3e
Message-ID: <160816663729.8160.5801103938851693563.pr-tracker-bot@kernel.org>
Date: Thu, 17 Dec 2020 00:57:17 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_195718_187937_A21A729C 
X-CRM114-Status: UNSURE (   5.38  )
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
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201217005717.LX82DcvFyH2hvyJkk3PQ5gPRP_-85GH7wyOyEBOzs-c@z>

The pull request you sent on Thu, 17 Dec 2020 00:26:14 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-dt-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9805529ec544ea7a82d891d5239a8ebd3dbb2a3e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
