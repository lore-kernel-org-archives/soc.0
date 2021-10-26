Return-Path: <SRS0=ATq6=PO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DE9C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 22:29:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 147B260F56
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 22:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 147B260F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoWDymdDGNt/oot2JROerbFp99zVeTHyzckFK/r57UI=; b=qkjVfbs60kAwFu
	p95z4k+J3cRXiF58MXqwbDutw+UL2UVmvsD4WBqKdW/2hbKNAeXdVCpLgv3/kX+8RW3Qb8AaQLVBr
	ZkQ23V7rCtxH65VaoCWfMGe/mYGFqEhgb3oiGLwGoZQmKgu3yLHXl1HjgyU8f8EyiiNQp3zqBb31i
	e2RNLHem9L6Tdoneq5qcoqF59g6EHETXwHCszA2sV6SfNUJisTr7otQymAuuu7yXs8krztGwTKPVT
	G5M8VPPOx3uSbggjyXeXHvVF9vRCC+8dKbfEPPCW0owtP73hcVt0yxWz0cGhEA+V/1rrcMBQ/UZmS
	PGxbWmR4J3KlQDhhC/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfUve-003DZ8-KM; Tue, 26 Oct 2021 22:28:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfUvb-003DYL-4f
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Oct 2021 22:28:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 1883E60F56;
 Tue, 26 Oct 2021 22:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635287298;
 bh=YiqjPuCL7P/Yk9OoncglK79wUyifM1/49dvwin6NJF8=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=ar0WLGwCZDpByWqo1PZ/RZt/6c3mtYlHwR7DLmrhaiKhXVMVwD2lKI5+65WtyNi/u
 rZ0/KZciivoUSDWejrPEio0PgXF6Il12PSuIoU7tyxu7cnaby8OTFcdg5PXJggMuff
 qhAeNNlIAqxVsBNzVWZOOiWUAK9ag+ITtf+tp6xveqN9cyjq/FxHHq+Xhx35pjvJ58
 QXoTi76LmdVZ0vyj6NkLPCXOCQaXQ+z6t8uk39D6OysGG3U4bHEX+qXlXJ+BTmWsZI
 BcrE2YknA+QF0c6KvtTH0pQwMgpd0j1cyD2V7oR1XgqMcmpOojJRUZ5hq4FK2dtKmT
 Rjk4gyvtbKHPw==
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.15, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1VnXSFeb5EVAG4MYP7P3bTE=Tyn6uKk_2OcJ0C69suSQ@mail.gmail.com>
References: <CAK8P3a1VnXSFeb5EVAG4MYP7P3bTE=Tyn6uKk_2OcJ0C69suSQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a1VnXSFeb5EVAG4MYP7P3bTE=Tyn6uKk_2OcJ0C69suSQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-soc-fixes-5.15-3
X-PR-Tracked-Commit-Id: 05d5da3cb11c91c39e607066d3313a6ce621796a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d25f27432f80a800a3592db128254c8140bd71bf
Message-ID: <163528729795.22811.3423318567980476285.pr-tracker-bot@kernel.org>
Date: Tue, 26 Oct 2021 22:28:17 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_152819_218515_C1C56EAC 
X-CRM114-Status: UNSURE (   4.66  )
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
Message-ID: <20211026222817.mRipmDwK2EcPkb1YN7YIvEyLKh-Feq6VkMKGVozhVc4@z>

The pull request you sent on Tue, 26 Oct 2021 22:51:25 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-5.15-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d25f27432f80a800a3592db128254c8140bd71bf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
