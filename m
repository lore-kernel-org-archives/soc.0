Return-Path: <SRS0=Yq3b=MC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E22C07E95
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jul 2021 17:37:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CA8061380
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jul 2021 17:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CA8061380
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdG5pQsrsNKU90XMBbLCL2YFPW/tbyAHEgep4hcVqkY=; b=oSIElcasU3wHUV
	1eIG/lYdhf2DBAAsTxUib2xS6BtROMsbrvWa/GKMEfNKEHySvOPNVDRQugM5IWh34+HI15k6M6Icd
	OSJupJ04yjrgamiPESKBZMSsEGQC/M3T/AmdP/aBZhtkTTFAtLUkgQ7Wrd73UFfc6//3SRmSgrnn/
	x6822F7/tKGNSTKoND0zsHJwYgK6g9Py/KtBPFMLJY5hu5+z1/obDtffyq58sTczwbFzyE0eFpjlq
	LXsG4yMcNcqQRk8FEIUxYPZbKitxLuAj6sbDp/NyYJdX21EXHU6UfvUWrlxUJgd8y47NBMIEXz3R6
	xYOCnpTgyB2lyWmjH8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2GtO-003xhX-Bi; Sat, 10 Jul 2021 17:35:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2GtA-003xe7-49
 for linux-arm-kernel@lists.infradead.org; Sat, 10 Jul 2021 17:35:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id D35036135F;
 Sat, 10 Jul 2021 17:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625938539;
 bh=ZVHVD50NwCgTgYhQ6RmVzcCCJ0xk/pCWrqeM6XJE8Zw=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=KpTvuqVimB+V4c3dqN4FBxN0koeTpQvsCRB8CaXobQiXov/OJ71RXinUtBEZPMuyU
 FONjxvz2nvHRcijgWfUJYiywJtVHeQnpG3EZmHiOrHGu7l3MnBvsE16QOiNYWdknh3
 /6S4jSxolbpoFaHb1Uhgl6q0ODvnXDzKUmraM4kSBDHJUZ7Ji0dZj2p6b6vOQifJ2U
 714Wogu97F2tifC25t7nYQyhwcFimlTq5VqdtDjCA20Ag5rOyeLyOdRnYyoJ/5HnDI
 PJW7lrCjRXIFpngH7pp9y87r+sj1Z4FnKQgSJ2dUk7iI7sqEF4/tb+rvI7ke/9vbVt
 HlN40kMx9RY2g==
Subject: Re: [GIT PULL 1/4] ARM: SoC changes for 5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210709234054.10288-1-olof@lixom.net>
References: <20210709234054.10288-1-olof@lixom.net>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <20210709234054.10288-1-olof@lixom.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.14
X-PR-Tracked-Commit-Id: 42accadb3265f4569620cde217ff448b568b2822
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6e207b882159ed3e35a4cd4ff0fc155cce5e3cbc
Message-ID: <162593853983.16773.7411502781117228695.pr-tracker-bot@kernel.org>
Date: Sat, 10 Jul 2021 17:35:39 +0000
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: torvalds@linux-foundation.org, arm@kernel.org, soc@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Olof Johansson <olof@lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_103540_217797_273B42DD 
X-CRM114-Status: UNSURE (   3.47  )
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
Message-ID: <20210710173539.fdOAF21EuGT2cDdC9-daigFy2HQPADdJMp37c1tQiJQ@z>

The pull request you sent on Fri,  9 Jul 2021 16:40:51 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6e207b882159ed3e35a4cd4ff0fc155cce5e3cbc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
