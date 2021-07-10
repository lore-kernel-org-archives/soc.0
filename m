Return-Path: <SRS0=Yq3b=MC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB9EC07E95
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jul 2021 17:37:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B755461283
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jul 2021 17:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B755461283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1c3e6DGmXFg4wPa7Xfod00GiM4NSQmWVmSl7+odARU=; b=ETGRVp4jr+uAOB
	0CYlDr19YTpjKtuaNgC49KSVfIbqLMaecNNviHXp3OhZajLauNiVG01GPecIMoy2zcLOH6rQOF584
	/+iPSn8qGptIe+2USdtcdLmIOFo12IdewV/UHN0RUYNe1g38BvSjqd3LinVkTxv83MAKhzcogY6MT
	Xfp/RbCbmo1yjNvdam9x8uTZrjNvJVTZRnYuFFWOWAT3QjlzonjrdoKMfQrUC1fW0xtQlQm2YbUTZ
	tysTkbdtiL+LbAiwsUWJ+AE93+6tcSxbENq/gYF3la3/MVFmvkDcvNcwqJKpYT1KJ61RKFdhoYoyd
	9WtbycT3tN8BeP5hU3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2Gtw-003xsK-Be; Sat, 10 Jul 2021 17:36:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2GtA-003xeW-L6
 for linux-arm-kernel@lists.infradead.org; Sat, 10 Jul 2021 17:35:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 5B31061363;
 Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625938540;
 bh=jYNV9+faOXMnCz0Xcrwh99/HJ6mt7FGBZp+fczbBGII=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=t+K7nyCPQqfhEfcckIkMyjDfSarXUMJPEszDRQ+fAULiUYDVSYL2m11v68xzCRqyu
 bMhKaikaBdUn94q/+CW1u0kJrTG+r/CB0mgCeUrjWE6sYSaDWYv2odmPdARLgYpVbb
 IvBi4t8GHXzsmw5yAltblZtYL7NaCN43pdCUqm9w44e2OUjl3BxlHLw5tmpD3kNXGs
 VXcMm+ja7JiBRxSwNy9YOYkqHC4pL7FHP8UkRNvtmUI0BfoIrZ0U2FXqZRVsUD1vnQ
 BXz2K7R/Ws5Dstn3hdY2fkxiO+TB7a0A1v6YcAqrp3aeJD9G6WzxkLIr/a5tUCyGLE
 df1wi9SPuPICA==
Subject: Re: [GIT PULL 2/4] ARM: Devicetree material for 5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210709234054.10288-2-olof@lixom.net>
References: <20210709234054.10288-1-olof@lixom.net>
 <20210709234054.10288-2-olof@lixom.net>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <20210709234054.10288-2-olof@lixom.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.14
X-PR-Tracked-Commit-Id: b62b189f7e2cfd1089b37be57b2e6672d5c3ae14
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e083bbd6040f4efa5c13633fb4e460b919d69dae
Message-ID: <162593854033.16773.7983280203668592224.pr-tracker-bot@kernel.org>
Date: Sat, 10 Jul 2021 17:35:40 +0000
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: torvalds@linux-foundation.org, arm@kernel.org, soc@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Olof Johansson <olof@lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_103540_744190_F0B3EF67 
X-CRM114-Status: UNSURE (   3.28  )
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
Message-ID: <20210710173540.f5sljBXUQdyEzc9zTWeKzfi3XmzD6wEGvJxmk-IgLG8@z>

The pull request you sent on Fri,  9 Jul 2021 16:40:52 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e083bbd6040f4efa5c13633fb4e460b919d69dae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
