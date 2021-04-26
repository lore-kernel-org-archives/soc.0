Return-Path: <SRS0=6ihi=JX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA374C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 19:47:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A47A61185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 19:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A47A61185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaEBdjLJSCvSWQGXr0ftsC60ktONeCBinEpG9fvuwBI=; b=Mm1soHSWx0HWs3oHqwZ7TldiC+
	DxxKZ0E8xifURFlBMEQxI8ig97EWu/2VY1APvwKbXi1fgjlnSCED8DaisnkIBpDWAATu3XJ5MT4d2
	p6WtB0bTzHmxQhEa+aIl5xAMqycXW1XV4Za/X+b8CQ7KjOCUEWPvKi3SjcDd5uBR9XnilywggejLd
	Q+SnClzQMbtx3L5MQJJFHFMLA+2XnopUV9e5P8V7kKKJRMa8POzoXx7pZpUGEFvKz9E0RxWoz6Zeq
	DJXeDzaFkF7rsJZRzOg+d/GZQThFnxUC3C4pE2gGfQIfyUKJZkHZrkAFg2R4wffX9GdM+LmlsYLir
	z/+OlIbQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb7Aj-008PbZ-AS; Mon, 26 Apr 2021 19:45:33 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb7A0-008PUq-4H
 for linux-arm-kernel@desiato.infradead.org; Mon, 26 Apr 2021 19:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:List-Id:To:Date:Message-Id:
 References:In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type
 :Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1yGCQUYmMBSkVY0iI7uubG6EQT2d/0vDSY2Exqfr/1g=; b=v33tyUKixzFndlFrAmsU2oEAMK
 v0C5IsmMIm34JB/INat5ylbyVTnQKe0Vw9OEIxy+WAYu8cFiR3mUDaDJHXfk5+LgB10zFXvB/xTEq
 MQNU4c/VH8HDr0fnJrWWMQxdmDUXMOI/og4cBAIg6LW8n4o48nEO9Vy3gJ79N4dEzHgalpFh/Y3ED
 mifx5SyBVceXyxRuwmFE3apetAP6/wVZ7SyV7bgcKs1mgoothhHBo5ytH2YkxvwOrm1HLfCr2Voqz
 nLYTk+C7dm37AfGT14nb73EQ7lTc7QO6oWb8LrMvC57l5VgDiWn6DSiW/Rv+at1V9Is3ns3FoXk/M
 Lge/SBVA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb77q-00G9Qp-4D
 for linux-arm-kernel@lists.infradead.org; Mon, 26 Apr 2021 19:42:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 48F506135D;
 Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619466152;
 bh=cW1REbNcJTMmgBj3Aav6ZXR4VfJ1AxjSxHw5h8iKwGw=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=Gdrwxa/KwGtblx33drXCiN0HJ7btLnv8ywqPJzZ2gEYeZA7KqUniOToqPYgxX73lZ
 KiPEu2bJv21BlWxMBvqPXEUDxsXFIh0XFhQKMaJEqpbUflFVnvtUXjONJLjWeM+QUc
 WmQ/mLtPC7CffqfdQ0n4cI+JVKWg0Yg6vCEqlpL++udSSC4XJSCCZb3w4tLYTIOPHI
 uTr6BFcm7HslgzKhYwx3TlCiC1N2SqbSywVRNXn64hoVUKSzw/kKCul/nshmy3pD0I
 9ygYIzPeyQZzEs+CAklE7rHQF1fncGgqOUNVdj3DgKgt92t7wqiCavINTwz1SfJ60y
 4SQ+AKi6PTAqw==
Subject: Re: [GIT PULL 3/6] ARM: SoC drivers for v5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3uSjSyrRAq2BjR2fo6S7kCfOo+3szQ2cvBt8-D2KybwQ@mail.gmail.com>
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
 <CAK8P3a3uSjSyrRAq2BjR2fo6S7kCfOo+3szQ2cvBt8-D2KybwQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a3uSjSyrRAq2BjR2fo6S7kCfOo+3szQ2cvBt8-D2KybwQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-drivers-5.13
X-PR-Tracked-Commit-Id: 5ffa828534036348fa90fb3079ccc0972d202c4a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 37f00ab4a003f371f81e0eae76cf372f06dec780
Message-ID: <161946615226.4821.9858108754030458185.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 19:42:32 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_124234_241879_6C3EA97A 
X-CRM114-Status: UNSURE (   4.26  )
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
Message-ID: <20210426194232.98_MJCCqoNZFokEOSnRd5uaT7c5Bi3L38fL5vJ-s0dc@z>

The pull request you sent on Mon, 26 Apr 2021 17:55:47 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/37f00ab4a003f371f81e0eae76cf372f06dec780

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
