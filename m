Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2893C0018C
	for <soc@archiver.kernel.org>; Thu, 17 Dec 2020 00:57:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C10EB2389A; Thu, 17 Dec 2020 00:57:17 +0000 (UTC)
Subject: Re: [GIT PULL 4/5] ARM: SoC drivers for 5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608166637;
	bh=CvQcHJ71fBlQ67GW1Ar9v4d06iWQftQ90tzVLEoNLSg=;
	h=From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=PsvNd6gsg5ta2HoSboT4BAjjyPdhA8GzFwf/wOpjfWDsrlwO0/R2MRsDMlWus5ggf
	 +ZPCidfZDhLXIEw/Tz8O9AhedPl+2ZeqBvvhZ4k4AcmcReJ5BGSsc3//Wx+jJGu9yb
	 m79uL5ZNgbyotSxYj3IA1Ixnygzep8Gm4RviEFM6CXJN6ITGB5iVrzUB3EyWsT+c4y
	 95WUowh+isMOffmta01WiQa/c2JCj0imbObTLdXabzX4ggg9ZcMrXqZ7IhMupg+smQ
	 OMrHzlGdqKDrNzg/0RzlVIvmKzpr9Qx0wk5u4YVpiOURD0JTwCubyY/u2H6MjDTNaj
	 7n25PZrR9Cqaw==
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1MeLg_awR9BkRB77XhEEFQU0JKrmESbEsST6E5ZW_Ctg@mail.gmail.com>
References: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com> <CAK8P3a1MeLg_awR9BkRB77XhEEFQU0JKrmESbEsST6E5ZW_Ctg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a1MeLg_awR9BkRB77XhEEFQU0JKrmESbEsST6E5ZW_Ctg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-drivers-5.11
X-PR-Tracked-Commit-Id: 1dcdee6ee8f8fdfef5932699129d442d2f1a064d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 48c1c40ab40cb087b992e7b77518c3a2926743cc
Message-Id: <160816663766.8160.10811667640759224540.pr-tracker-bot@kernel.org>
Date: Thu, 17 Dec 2020 00:57:17 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 17 Dec 2020 00:27:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-drivers-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/48c1c40ab40cb087b992e7b77518c3a2926743cc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
