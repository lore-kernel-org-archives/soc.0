Return-Path: <SRS0=HLeY=M5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A0CC4320A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 18:49:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB42360EE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 18:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB42360EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6lHvp9G4Y24S+9aRL4wdWAUcuSUi2a4VSRNkkHBh7lo=; b=2LKmB4TWDgi/Pk
	AegBP5X8ppazDrp8MozUB5NT1LC+dHt9Fa/QFbWDSfs9tS76le6Oftz5Uq4MKYBGoSq9LfgYcOoyg
	6EwM6iFhBWjNgYYAeMj+hwfnh1fLTLXYswb4euAHehaexoiQktq7DS/Ay3psj8TQG8upSpMzWu7IH
	1fj10HpcNM2eEPAVSqU6wrgqSR4qqVGBdWMaAuT3/UGOW2Qqt8iqRS542VwhCA1bkN0QTxxljKANV
	r5CrRWK1LY2qZqFxiLMk8s5oSGuBZfiZgdLUUI1m3TkfsfJMZrKcbrMNdHaiOp5JJv6tcJZsYXB3E
	uZfeRsayQeQZsfOPy3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC4tK-00DB8k-SW; Fri, 06 Aug 2021 18:48:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC4t9-00DB6p-46
 for linux-arm-kernel@lists.infradead.org; Fri, 06 Aug 2021 18:48:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id C54B761167;
 Fri,  6 Aug 2021 18:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628275690;
 bh=k+L6rBPh3HvvOPvgzwY0kCL3EBhyVF10Nk5JHB4zwVY=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=QW5zxP0751pJDQZdrJGzhoej0CCrIr/SbKX7CZyf4aKLOC1B8A5SO9IByYUrW62Gy
 pjGqobeCduO/TQdyhsMg4Urk2U+SZGs6W4RTZIfaLiR0PwBXvjf/WDNut41yY7luS5
 2UDG288+9XDIlLXva6DwXNh0xG9x8ot6909ruD9Wc84dJfm9/iq86exHGuX/6tZ0xA
 /LgteHHNvw+lqbTJj5HBwacRW0d33VzTOLxdKqNkpBa2G2Rz90ZI+rzLt9VBf5XVWI
 8YfGG4bC78LOOd/DkqqRJXV/xbfUry6KhBGOJLmLw0iefmoFk091wtIkoZb12Cwc4V
 1UR0+rVgZEtrA==
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.14, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1u+0tJUqnSOWmC5ixdeGGoBb+mVv30rc65Bjy7a1Wo7w@mail.gmail.com>
References: <CAK8P3a1u+0tJUqnSOWmC5ixdeGGoBb+mVv30rc65Bjy7a1Wo7w@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a1u+0tJUqnSOWmC5ixdeGGoBb+mVv30rc65Bjy7a1Wo7w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/soc-fixes-5.14-2
X-PR-Tracked-Commit-Id: 19c1eb3605a1bcd784726380f520925948b2962e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3dc064d29dfbaee66a08ff1cfbb2dff4439302fe
Message-ID: <162827569077.18689.14862501008139983565.pr-tracker-bot@kernel.org>
Date: Fri, 06 Aug 2021 18:48:10 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_114811_216769_783838F6 
X-CRM114-Status: UNSURE (   4.24  )
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
Message-ID: <20210806184810.eY2LmdYE13LgVSk-pEj3hn8tlsyEXWtYTnPL4kDr1M8@z>

The pull request you sent on Fri, 6 Aug 2021 16:26:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.14-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3dc064d29dfbaee66a08ff1cfbb2dff4439302fe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
