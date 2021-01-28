Return-Path: <SRS0=ZyEH=G7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAE2C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 18:18:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD09664E70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 18:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD09664E70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuExjFbV38TfS6HhwtbwbRbKCWYyAT315+r3PEOyp2s=; b=gzf3cXKBnFIIkShFU0MgAQtces
	VWvatKnqx6EfQf/GOgo96jv2csOwdfQ/r4Xqo2AqfVyMelno8lF9A+xPSNORLbm8CgsSy8wflXFBI
	X50py0d7S8wyJPee7gpQ32dIiDdDhHtFd0fP/Y+l0RxWi0EXVQs6aJOhlS1hZ6d/Jk70t+xD/5vs5
	EYvKS7dPtAnOi4M2QpSErGoAF7dwGAnOfmKvQ+vI9HGIls3zE26Ap5rN+6ISo9VANlRIh/7u6Jbka
	u1CYbva2b+L8zAT6vV/McIkQWsw7CwhmS+mMXRS6E9d/aP5awps4KMNjroFxT/ZjcqBHDIqaUlQsp
	9nh5Aggg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Bqk-0000Gx-5b; Thu, 28 Jan 2021 18:16:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Bqh-0000G0-Kx
 for linux-arm-kernel@lists.infradead.org; Thu, 28 Jan 2021 18:16:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id CD44964E0E;
 Thu, 28 Jan 2021 18:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611857813;
 bh=aSAdEmxoax5vPvdLbJz+b+C7Xg7zNbyTjWEf3znnDAE=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=M+EW73sCgf/aSCm4bnyn2v5Uuq49pX4WhR1yj8W1h1QgUsY5u8tjImo0ksjGSdYLT
 r/fZTFXbunpn315hPheGqdJszOl/OzxjemJ95GX7lIhifhuiMZA9c/8jEFAXvHWXwF
 HAss6l5e4TGbnday0EVnwWzMdd9H4gKFVxlQmV7/+V5K6JotFULpehfI+AL8wCeCAw
 pwQWGwHuUTWZ4U+amT9961wEj2QrCwbb1lFk0YTFalANZHrnHg0u8+6aAKXeqjvqZb
 46DZ5uZgSBD7BijpFo75disrwPaET+agB0TL4k9g0xTm9iZ+Xt8UwNtVQ0gfoBq3l6
 SX8WektR3W9NQ==
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.11, #2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2Ku8ummmKWSZZ+kUHxVxvqGnoB4YSTLj9zo4ntkDO3UQ@mail.gmail.com>
References: <CAK8P3a2Ku8ummmKWSZZ+kUHxVxvqGnoB4YSTLj9zo4ntkDO3UQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2Ku8ummmKWSZZ+kUHxVxvqGnoB4YSTLj9zo4ntkDO3UQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-soc-fixes-v5.11-2
X-PR-Tracked-Commit-Id: e49c24c8cd00ea9d7471520fff562fb4e7e9f61a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7485e08eec4c84b2e140aed5fccc36b6846789ec
Message-ID: <161185781380.19532.3901554449864546513.pr-tracker-bot@kernel.org>
Date: Thu, 28 Jan 2021 18:16:53 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_131655_774278_BAC1D117 
X-CRM114-Status: UNSURE (   5.70  )
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
Cc: Shawn Guo <shawnguo@kernel.org>, SoC Team <soc@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210128181653.2OobF9-R95h6s4J7NTMfN6Vj6LK5C0-jZ-UNEXIa_Xg@z>

The pull request you sent on Thu, 28 Jan 2021 16:32:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-v5.11-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7485e08eec4c84b2e140aed5fccc36b6846789ec

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
