Return-Path: <SRS0=soWq=NK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482CFC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 22:47:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0437F60C41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 22:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0437F60C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1SS2/eehZIgW0Kc8Q8VLnd7coB0Wb2FggzlTpHh2HA=; b=wboboVQ+Wmuo/v
	LbKc8Kj1gXQRKnen/6lNqpNKAb1bf/je7ynUBOHNajgdDaXxXI+jdfWF0CdxgqeRFGkGeLAcAp/kP
	qfx5V9cEO462j8H1ZN+3CQBurvFwenUjPd9hRMofZn2vJOCxb04Nmn7UG7s1GXYjECXvuhEc8Q87+
	cG/TYOleFDwUJVPCAJjb1RRUu7PmNbOlHFvNn9T2tvWBJ5PSh3BRPai8kjRcy4m1IWjGtDEcWA3Cj
	kVRZGI74NmxSt6YX+cJg54R5FIidd/cZD4Xh2oSD0kZrheB82PBLGbYb3RRhlEabOz58fmQMTFLXg
	MI/9MdchtlS4+C7ns/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGqmW-009fsk-Ca; Thu, 19 Aug 2021 22:45:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGqmT-009fs5-0q
 for linux-arm-kernel@lists.infradead.org; Thu, 19 Aug 2021 22:45:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id ED0CC610A5;
 Thu, 19 Aug 2021 22:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629413100;
 bh=sTP+3YYUW5Fq/Au+ajlFUA0Kn+cpkMAhnUJ9aRe354Y=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=AJAkZysgYdSc+6LeJiGf11xiGI+Oszhs7oE2Zt/xvoJypagigMvqz9pHXY3W2dq+2
 6Q/QJpsqwJh2pM1NfTgHGtGTfrkL3+sAbsrQMYqHqsQ9WpYvaerEK3ycZCU5H3pZet
 B9Pc9ldgDG7Pjka7tjlcdzDazIySWZCU/b59i71fkufdCF3vl0hFKyLNKFLutdCQjG
 Y+m5MGBJjg6y1fumEhZZaKPx0aoInS9Jw7OJp5xNvu/++RBBZn+4xNWQ08dWVx6Icx
 ittP7J+DTra1+bHzHYm5F0Vc9kFkyz5jYYobWbLYhiVmivb+z6/YN09tAKcZfVkwqm
 98ToDGIiaXUNg==
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.14, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a12+R4qpANkd4MWHa8YNNhXf0wNnN+GaWk4DqW3NJ+DQQ@mail.gmail.com>
References: <CAK8P3a12+R4qpANkd4MWHa8YNNhXf0wNnN+GaWk4DqW3NJ+DQQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a12+R4qpANkd4MWHa8YNNhXf0wNnN+GaWk4DqW3NJ+DQQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/soc-fixes-5.14-3
X-PR-Tracked-Commit-Id: 1e16a40211208d2d6e217e5013607219f4272dff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d992fe5318d8d7af9510b879439a3c7f283da442
Message-ID: <162941309981.30040.17491472610869566678.pr-tracker-bot@kernel.org>
Date: Thu, 19 Aug 2021 22:44:59 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_154501_116854_1AE05331 
X-CRM114-Status: UNSURE (   4.83  )
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
Message-ID: <20210819224459.EwwDll02vjPef7SeOgy_Aq1aUd0-Wef31jEv5T_gtvU@z>

The pull request you sent on Thu, 19 Aug 2021 23:47:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.14-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d992fe5318d8d7af9510b879439a3c7f283da442

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
