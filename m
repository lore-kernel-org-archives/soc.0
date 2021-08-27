Return-Path: <SRS0=KoPa=NS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0D2C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Aug 2021 23:29:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF4C60F14
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Aug 2021 23:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FF4C60F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=luufeG6zdDOHh0yBVazMaI+Axw007LpgPF+x2BU3B7E=; b=np11LYuczsjj23
	b8rD4fjdkBfjC2G6MvwyutgLXrcfzfRbAuL1GyhSXC861uVDrIYCqDvpBIEKhmniKoVA4J4yfr4lK
	Ijp+DisM7uJSgoZtOh/emVk5w1qYYSXc7SuqaWsC9+E78iZuM2TxGJMg6R33gRCk1zEKMb3O3t3OX
	3h0imDz7paR3+y+7Om4JVbdxwv/fAj7TSMtM8gw6QQ3hPFfh9FpQtbb4D7/FEMPzTV7EyV1H4+UbJ
	OXZiY0O1S/CKJTr8jejJazA2PLZKTUB7KdL5cuEPJyQJd3E3C2KdmY5p34RyZ5UX0PeIrmqlTaSFE
	yF4ecjs5GAnjw6t8fMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJlFV-00DN4c-OY; Fri, 27 Aug 2021 23:27:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJlFS-00DN49-JB
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Aug 2021 23:26:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 0AC5160EE4;
 Fri, 27 Aug 2021 23:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630106818;
 bh=NeH8OAy+WhE7UlUcuHY0/tAELduYYmdkIOV+B3ED5tk=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=BHSspsLL1a6dgO8H19tlhLRu/RBdkQNVRnGgqSAK4c6lAVECIK3o9gqaEvmyIfyEJ
 UthTH6CQgtvZIwUME1xGtpLWOvutCMCysxOf3MgqWSZimY4G3ygEBd9HUv94GVSeYG
 kuoUKtGSJn7p8GI5g19I2aVfjgkHIuPzJLtIMcRHNJmbt6ukcS3aHMc4liQ0OYaDpB
 Y7S1QL/NyOqf2JpGWXuBP0Q9Bmwb1xxukiItbnCR2oIWHPXMVM/Kp0mZcZ5PSbW2Zd
 /AeBDIAMnW7iVFjNx+A8aveKMg4OHPCTXuUTR1Mz+/dAumqP9m3QkjS7XDsxnrwH25
 H6oPPdyVfhiPw==
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.14, part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3wuNeoxDucwTPQvganekRSt4H708AX5pUfj=aYzo_Yog@mail.gmail.com>
References: <CAK8P3a3wuNeoxDucwTPQvganekRSt4H708AX5pUfj=aYzo_Yog@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a3wuNeoxDucwTPQvganekRSt4H708AX5pUfj=aYzo_Yog@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/soc-fixes-5.14-4
X-PR-Tracked-Commit-Id: 6c35ca06974105d929f25f487c6ae7a47fffa128
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6f18b82b41147ee15b0b5bf7c9ae0464dda287f9
Message-ID: <163010681790.22639.14568450580407515339.pr-tracker-bot@kernel.org>
Date: Fri, 27 Aug 2021 23:26:57 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_162658_684365_4A3BCFCE 
X-CRM114-Status: UNSURE (   4.12  )
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
Message-ID: <20210827232657.fra3NWShM6VNARHhd-cNdC5JEaiiONWLU6L7gBXNzMw@z>

The pull request you sent on Sat, 28 Aug 2021 00:11:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.14-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6f18b82b41147ee15b0b5bf7c9ae0464dda287f9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
