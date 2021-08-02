Return-Path: <SRS0=DM4H=MZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25801C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:35:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC26E60FC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC26E60FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mkH5O5YGd1FPRW+6RCejFQzD3z4bBm7Aony0nY7sA5g=; b=sG42U5bUHghdok
	JpUn5Zq3r9AZ/xaQHGhaLMccZCwBEXeB11Aj/PWIwvdfh2Rvps7ggdLAsc8C4JSKFqERT5NzxXTVj
	VhUr3WTGaWY+8dV/wicx7Szt6Bm5+fy8XCYjRTVJ+m24+C16Bb1I67Ps2jIfvK9d9bKb8Aq4y386u
	rEXZJVv1oXBFg2jOP5IGBoMLXzlCpr2j7txR8ip6TS8C6+vQnLvRNlz6JTP70GWesus931hAIJOlI
	9MiGGNdh0jBt0e2J2glgMiGw5pekj74TH14REyupCoF2vZRbU42/W7yE+MmJYFMjCLvb4XjfbB06t
	1cQq02qIyyLRa5ElD97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAY49-00GO5t-W1; Mon, 02 Aug 2021 13:33:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAY3s-00GO43-3y
 for linux-arm-kernel@lists.infradead.org; Mon, 02 Aug 2021 13:32:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC5E260FC4;
 Mon,  2 Aug 2021 13:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627911175;
 bh=unRRbhCk2BelKbyecUH1fgze+n6H59+umvsvHd2WUkk=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eeFiaGVYMnErcMR8SUm4KwsFW8nC/Jw2CZVGk5QfwJn/zQtJah2PHhzaJdaVxxC7V
 7N9NGPgEPva6SpCSHZdZw6n6NwIG7HUuI0aPn4C2JXyDmioik/sqHooq206zov017W
 HvVQngeeENw2nZZ79gZSKCbAFyMhNzGfV2JS+N/91L0ERFKNPGcCalpw4Z17tEhVmu
 t2jU6BHbhVKYdLJ7lj8FXQRPHq10iUXBMH8oMF5hnlzFo8JzzDir7yTeiqn6eJfI+X
 lxPKMyVQfvNdiVUJjkvwvT/SYAjrsF3y/vWwNUbOwXcLG4E2RI6jcBOXzf3PHg7zqI
 9mnBosS0sxs/w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
 Olof Johansson <olof@lixom.net>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v5.14 (#1)
Date: Mon,  2 Aug 2021 15:32:40 +0200
Message-ID: <162791113549.1139989.15144544679312934599.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87k0l7zx4v.fsf@BL-laptop>
References: <87k0l7zx4v.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_063256_245753_D9C6CB77 
X-CRM114-Status: UNSURE (   7.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210802133240.JzO6iOXYeBKx4vnHIe1BsLMVdY__eOEpZtI4dp78e7A@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 30 Jul 2021 16:36:48 +0200, Gregory CLEMENT wrote:
> Here is the first pull request for fixes for mvebu for v5.14.
> 
> Gregory
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 6ebeca342f96a7c371ed5fe53189dd56fe0c0330

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
