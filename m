Return-Path: <SRS0=6ihi=JX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7F2C43460
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 19:46:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AF7461042
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 19:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AF7461042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrAaZLF9KZWBrDiBky4OwF4ZSvymJ/L1mxOwF0BtxoI=; b=bQn5G71zaZBsq/9CRuwefLRDnb
	pFGjShJbO740eyoGe2V7vXFQ9d2ubCUTngkU/z/92/K0NLKBT3eWIg9IBVCOhu7pibFxQVvKeJlPe
	Kghqkxh298zqC+R7DMFBMlYKSbF/0Aaoepef6y57TtWTIsnu1fiBTF57th3L7mBO977v/y2NcnVtc
	gEvcyEw0nDlYC9YPoPYbeV8otot+OP3hGbmD8kgOM0dYWR0Fkg9FGV1/eEYGs2vpg6eeSWb6KTYZQ
	xGqo332TTJQV3ySNTWfzBWcOwqMg9T1DodGD5aP4gfxEmTzlfK7CdXRRSN2WV6JKVz9TNXVpzeg/3
	GdBEgRcQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb7AT-008PYW-9F; Mon, 26 Apr 2021 19:45:17 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb7A0-008PUr-4E
 for linux-arm-kernel@desiato.infradead.org; Mon, 26 Apr 2021 19:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:List-Id:To:Date:Message-Id:
 References:In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type
 :Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wZgMreCwu6tHfNbBxe9K6eGm400qn3GHVlpbn7l+JSw=; b=jPkxuejTMxvNLbNtiGgjkJmw9j
 rnGKub2wJT4+u1nddWN5jroc5XeaJRQ+7XPe+Hs+3t542cnnUMSP2cisixFroX/ZHq4+SLrNEE43V
 svLezhzblUe/IYXXWvn8yt6rLelwl7wIcwxozvZz8A7NGLjbpCZudzUxhkddZM90TEVuoTWklo/4q
 RIO3qR83Qb+i4wwLo9tnCEaH8mwbvrOVTkaFANHyOIDqUg0iNzsiBV+NIjdi6V1Ug7imYylIIhww5
 SbYty6CWgbHaI5aUw7DFJaJKx/jDJL2WmPuv5xUOXi4XjJOmBS7uCqbyPbNgCEG8/6sMHPa3d2UJ8
 sU2/dMGg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb77q-00G9Qn-3S
 for linux-arm-kernel@lists.infradead.org; Mon, 26 Apr 2021 19:42:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id C6267610A2;
 Mon, 26 Apr 2021 19:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619466151;
 bh=W77jfaIuXlxHG2GipRst8hYgJAPLCmcaDycK53d+bFA=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=g/HpiSGpEKFCCoYm0bDWO0pb+TiiBzqRkJQjAWAdwOXkGqJuJXekn9crBLXg5Rf1F
 wrdTLkuB5yOpIyOTfW8YddBXn2aCxHudWEl6RH9H71kst+mhB5ZtINo84vFiXSDr9F
 kcxZuK+lOiddd0NYTHEOtMaQB0u/4Lr2MV4GDtj6MhSN0X+C2wYKOKGTZpqO0Mx65S
 edHBPdQarFd7BhUFetjwRGUA1wnMQB/mJ3xzj4aVuUkP4xqd5/GzleaoYYVy+ChM3Y
 uroJnqZ1sQOZ6ImNkttNKpG16ntldlyA82IksYh4N/R0dUpZXCKA8Wt7MSqDYTflXj
 ewazcXZI9r+gA==
Subject: Re: [GIT PULL 1/6] ARM: SoC changes for v5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a08ONpuYxcNOOr1Yr04SYosAPKH+i=PPp9h0hvhknn+Mg@mail.gmail.com>
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
 <CAK8P3a08ONpuYxcNOOr1Yr04SYosAPKH+i=PPp9h0hvhknn+Mg@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a08ONpuYxcNOOr1Yr04SYosAPKH+i=PPp9h0hvhknn+Mg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.13
X-PR-Tracked-Commit-Id: d92e5e32fb4fce7ae939ad322aad77955dd5dcda
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 01d7136894410a71932096e0fb9f1d301b6ccf07
Message-ID: <161946615169.4821.6059481784147393808.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 19:42:31 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_124234_188881_695CF6FC 
X-CRM114-Status: UNSURE (   4.14  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210426194231.71On5_LSJqnL8E58IIwABfP4zy5d39mVes0exkczcZs@z>

The pull request you sent on Mon, 26 Apr 2021 17:53:31 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/01d7136894410a71932096e0fb9f1d301b6ccf07

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
