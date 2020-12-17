Return-Path: <SRS0=g+kj=FV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E34CC2BB9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Dec 2020 00:58:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9DAD238E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Dec 2020 00:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9DAD238E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IMyr1Djdq3AD2Zaf4eGeZ5UbyINeZdkrfduaN7L3wg=; b=2qqtL0DLJuuTRuIZxqnQ6s9duL
	80TLo2ziQ5srw20L8suut8zqBu56xinIp0jb9yOsCouRsdc/5SHkd9ByTNjh/7r5BGpSq1lZimyAm
	qtlbCpmrt3o1kA7S1ogtFGGVwCOH6+i/dJL9lZWeOHmfDwkfV5SvU/QyvgrHnp8CRtS9x4KHWFtYq
	Qbv5+ORSkyCQ5JDso7ctCIEeN1LgC3Ei/IN71AeN5wosEU+YR0fTOblzAxxG+MByDrv6YMHYaTJi3
	c6NaSDN66bBEBrpmCKzUr1EaWcjCeYS9yXzPYIDnfdjrEVncVTNmrYPOosXnBGhKQnteKjB82Rmpc
	WG/7S5Mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kphbe-0002mQ-I0; Thu, 17 Dec 2020 00:57:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kphba-0002ki-0H
 for linux-arm-kernel@lists.infradead.org; Thu, 17 Dec 2020 00:57:19 +0000
Subject: Re: [GIT PULL 2/5] ARM: SoC defconfigs for 5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608166637;
 bh=1ziuKHdS4+L2OBqluOXZF/W/jrOj+T1Ayq/fMUC5vv8=;
 h=From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=Bz6WNICV21vO+IPutWysFUQNjQXhmwJAJyUwEkWmVKDwMkylsd/hCbrfF2tRy+FPk
 Rb00ZDJiJEni2M5vHs7hCfXhYcLJPo7+cFD0o/+XhBZdiEX+TdJoN6XNMkenzRCx8S
 +HTwTkf2fdLpK/Oi4jnhe689t0Ln7Oud4o3do+D5YvjorIJXVUj/UYYThQuufKRX0d
 xZDIYJB3x1IuBoalyADjiiZBIdiZzLz6Y8fslSCXcF2VgbpmfZw4ffvpYKFwWj9vfK
 jq7aslOCJ85K+BAot9vzVJ7G0/9TaCTPR0UMy+Gb4o8hoMuxA2hHiQuDbQ7x/EzNzq
 TK9tXXUz5Llvw==
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0zh6RKR6rRm93hCb1VVpb86LxWeL9U4-3eGJm9+TPJVw@mail.gmail.com>
References: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
 <CAK8P3a0zh6RKR6rRm93hCb1VVpb86LxWeL9U4-3eGJm9+TPJVw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a0zh6RKR6rRm93hCb1VVpb86LxWeL9U4-3eGJm9+TPJVw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-soc-defconfig-5.11
X-PR-Tracked-Commit-Id: acf689134a66cc9c85e571d33b6bd5d72e4078cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b0a6cd29e00a317d7fd823e0db57abbbd9bbb610
Message-ID: <160816663692.8160.1770340131168084108.pr-tracker-bot@kernel.org>
Date: Thu, 17 Dec 2020 00:57:16 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_195718_174770_AACDF300 
X-CRM114-Status: UNSURE (   5.26  )
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
Message-ID: <20201217005716.vzMTSbpMND8NU4e4-yJWpYF3aDHiYN-f2b2AWHiiaXs@z>

The pull request you sent on Thu, 17 Dec 2020 00:23:23 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-defconfig-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b0a6cd29e00a317d7fd823e0db57abbbd9bbb610

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
