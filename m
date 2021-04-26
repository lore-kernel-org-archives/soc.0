Return-Path: <SRS0=6ihi=JX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF5EC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 19:46:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBE58601FD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 19:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBE58601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGDAXS3d02yRt/Bl1Y+r6EePX4diiPwifdUgcR5g/Q8=; b=O4maO8XA9/+Am6fABz74zoY+f2
	JdJfZfH6OKB2AkIEhZP+Z3CjtFQ9K6SRoHhTglRjmbl79ak+2lVRLplm88qcRp01/mAaP+CnBPILT
	cScU8gWYSJkRAkP9wCFsdWUIFrbBrO1J65uEiwugY/Z8VsqvPAeEcWLh3BfnSrNg+vrJCKYt766x9
	DNqLrKIRj1XgPjmWFTQtnDOgcmY8P9aiYp+tjc/VrJt/Wktw+9Jkh1jLdabxv37F8hS0fL5Hoij72
	IAxIBEwL/erVwJSd9zGclqI0IL/8OAgp9ui9Pm2c1X8t4E1EEMtndYR/kIaT33LGZAWh6eDw/Yf6w
	njHT1Zlg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb7AH-008PXS-H7; Mon, 26 Apr 2021 19:45:05 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb7A0-008PUm-4E
 for linux-arm-kernel@desiato.infradead.org; Mon, 26 Apr 2021 19:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:List-Id:To:Date:Message-Id:
 References:In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type
 :Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+WIaHUe5KQM3q3IMkkd2FuKihupNL8tu/zpsHbt9WPQ=; b=d0WNwaDcBo311xD+oidoPDKFhu
 Y5liQo7yh2DztXuuPdPBjQaUFLchx2EAWvenK0Ql2+sgetLtLjUVP06u/iClUg2Kyr1+/arBb8YLZ
 W3P80jEYb+wZ9a0VIBbw3EMr/c+PMQW5q+6qqTzcXkkx+TGLcdblnkJfdapFgKohOQLSZnezUmmV1
 VCkqEhEPdqbMnSDlUuuFm9e5CKl8nPMMaCx7VBEcVZpe+MM8ic0iJ33TF4yxREsQrsMhqGGhJUvUE
 iF+HBxaGYOivCSuQ/MTXshM3sgmNLCm7TZZ13TGssvqnjmBzrjvr1ByQFZYEwHBj9NH8jx2sDPeVz
 uENrrsdQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb77q-00G9Qo-2k
 for linux-arm-kernel@lists.infradead.org; Mon, 26 Apr 2021 19:42:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 0BEFD6135B;
 Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619466152;
 bh=gHCYNiCfzHD8sg8Dbm/7qW03yMeRb+NmlRqfrTSNipk=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=pACCfsUJKP98duPeh358Q8WXaw73UST1h78HQ6o7rxcMqIXrG5bc0n3D6AArN+Y84
 RRUGHxb2vQf2sQcALRAM1lrzZov2joGEL/S79WBcDKH/ju2eNh4uD5sbKpmr2/ubTY
 IVgBYch3PJTzg8rF71sy6qUk52cskYeEN3Et3qt0cEDqWUBxpH3l3CIZFAQ8wpJJ1O
 t1pftBm5sX3JM1JOpLkvIbFgB5IF77O25+SxxS1Q4xyehSB+l2nNQ/dBXb+riOXm1U
 Yete3M9fqxwXk2P6iqop5CMgQfmrzM/IP1thRMXni3VjvWm7j5y1PNoSXTjMb+b1xP
 Ngm4sF8V6Rn1A==
Subject: Re: [GIT PULL 2/6] ARM: defconfigs for v5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0WbrYBeR_VMBDfgC9R7aVXna26_LQjdHrd2xnN9e6_Cg@mail.gmail.com>
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
 <CAK8P3a0WbrYBeR_VMBDfgC9R7aVXna26_LQjdHrd2xnN9e6_Cg@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0WbrYBeR_VMBDfgC9R7aVXna26_LQjdHrd2xnN9e6_Cg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-defconfig-5.13
X-PR-Tracked-Commit-Id: 028a1e968435383c9555fc9386d116688f31dfce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2b90506a8186df5f7c81ad1ebd250103d8469e27
Message-ID: <161946615201.4821.6020771080190512041.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 19:42:32 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_124234_166951_670D0034 
X-CRM114-Status: UNSURE (   4.15  )
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
Message-ID: <20210426194232.U_hr9N9qnf4iI2gGc755e7UN6Z7T53Wh4oNRySoxpQc@z>

The pull request you sent on Mon, 26 Apr 2021 17:54:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2b90506a8186df5f7c81ad1ebd250103d8469e27

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
