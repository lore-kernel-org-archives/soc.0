Return-Path: <SRS0=X6Z7=HX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B73DC4332D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Feb 2021 02:59:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D4A65137
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Feb 2021 02:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8D4A65137
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++MF3MYxhD+EOfpjKwRSGNzdyCLbB2KMvmrNt9WqOPs=; b=wGUXpROymZGae7dhnVe5p2uplk
	3bUrfHUspimkXb+2YXFG8C4hEixq2uqmpSjft1laCYEhTFz/62WIZOi9Bu5Ldjz/Ws93rGtGr5Skh
	cS96j0YcACu1Bs5hS5qm12bJIi/10EFcaqnXy/juxg/f9jQWyPGC2675khZY7GBaHppw9+sHKBxNk
	G1Ngg+HoWVzqFTkNBG5q27RUQZjRlzCTLHa2ai0mdjYZXCLPoO0Sw//hKKW0JsrGH0UZIM8CPdQYO
	OQNAGCSysn/OvpHaNW0k2CLqPTCYmPrPL0db2jO0OBh73KKYlPkfU+APnOOyOilr+3xB5aK0yUhJK
	HrKcEa+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDewF-0004NI-1g; Sun, 21 Feb 2021 02:57:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDew9-0004LH-Ma
 for linux-arm-kernel@lists.infradead.org; Sun, 21 Feb 2021 02:57:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id E32AD64EF3;
 Sun, 21 Feb 2021 02:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613876250;
 bh=Hwcj8LZbyiz0grrU4mcpvl9yU3r3TOk6MqPlh6I3nSA=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=l/5wdsLjONT945eXi33ZH9P50DHPq+DnrJurybqW1xHRArqY4JT7tf9ifwQ26tRmC
 pV1cdpaEwrmIhUNZjb+MbMQ9pF1JFmlbheVUrRah2+jFl235I3aBuXm9PgOjUzhQ07
 jsnYLwx0Pu8JyhdpX8t89rYcteUO+WltObehjpYzfFASesIhVuvpiovI0B5s1aJJ6K
 FQCe/d8O1OhvrokZl7LBLL8xWMqTjV6d4L6xkYSPMEDiOOijrEiFpfnvtZsBmiOb+2
 uRRlqu4JG70iLNk9+9Y0UfHkprsXudifm6dniC+i/yJZ4+821HElUSjJKIZh6CWGsB
 AzQLX3kWLXgcQ==
Subject: Re: [GIT PULL 1/6] ARM SoC bugfixes for v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3sKFzGMZhX_PLSFTVDk9bXgvOhKb98cBAqC33+49n7TQ@mail.gmail.com>
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
 <CAK8P3a3sKFzGMZhX_PLSFTVDk9bXgvOhKb98cBAqC33+49n7TQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a3sKFzGMZhX_PLSFTVDk9bXgvOhKb98cBAqC33+49n7TQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-fixes-v5.12
X-PR-Tracked-Commit-Id: 090e502e4e63c608ef8497d295feeb9743ef67b7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7ddfe9a6a3b323c96ceddbdbb92debb9611e32c0
Message-ID: <161387625089.20427.14712302245933297030.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 02:57:30 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210220_215734_324880_50B0F4AF 
X-CRM114-Status: UNSURE (   5.30  )
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
Message-ID: <20210221025730.7lQtHGwbjeKQCLpQckPk8XaLS27xTcNO_50KvHEww2I@z>

The pull request you sent on Sun, 14 Feb 2021 23:41:20 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7ddfe9a6a3b323c96ceddbdbb92debb9611e32c0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
