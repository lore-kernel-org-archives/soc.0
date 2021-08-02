Return-Path: <SRS0=DM4H=MZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E0EC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:36:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A113960F35
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A113960F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOhZyZkoLBjb5s6HdqXaCMzxrW9WXFzrkOrOSbcM4lI=; b=kS+HQ7fNKklUBR
	9U+gLSd/k0RiLaKf5TbGLehCAsz2CJueQ4VMsQpVihzGJfF/tAqayagqnNyCRiFwEZuDptmtvoO2G
	YDGhtyYnQKJxti0mWrWQ6WfkwuoiVp81th0RkqXqU4K1ryutDjouReiPasdKKqfug4/kemoH3C2+x
	3RFpafdDKd/+gVzjNjAD27hVF7TzMY/VKm/5Pia3+mnxwT/7nObWYbSoLkBD/jNKvTR8GW6QEedy6
	UzTZcZku/Y41Kj41jbv5QKi2bzOfgfOnyW79RbRfJzN2NDBGZxwRq4m/jUt4zJgb/+ifjUpZar+Ao
	JOs05RrF/XML2KQwcLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAY54-00GOMi-56; Mon, 02 Aug 2021 13:34:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAY50-00GOKx-Du
 for linux-arm-kernel@lists.infradead.org; Mon, 02 Aug 2021 13:34:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DE1460FA0;
 Mon,  2 Aug 2021 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627911246;
 bh=oasDpz27kFmZh5itB/GUvE+3lwjuX2EwLqwaOKQdZLA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lp7I86J7tQqXGrfCeoowc7Zj3u5QFHLV545VSq3oeX1aHG0gXZtXeLMBPZRC3UPmb
 Km5L4x8B+dBlt0oh6C9bEF4b25IR+Fj4Pou/jiKr/pXHJnPf6Td8/B/Ei/ouU+T7nz
 5LnWgxnpi2+BiTawG7g3LWIwDh4NKG7o2wQszOBWdQ/89Spj6rrhulIlYdDH0W5waR
 a612Ndnz9848xF0oyiUN5YqqYjXcxn6Okfk8elh1oPLpKQ4EITo9tZywY0W4iEBnFk
 TCkrDceoXS0oFLTmSSacGRZxFm7e4POsinRjEKf5Mg66WMBYzKjLcFo9WarVwHh13c
 zKpkIe3oBY0mg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc <soc@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/3] Renesas ARM DT updates for v5.15
Date: Mon,  2 Aug 2021 15:33:59 +0200
Message-ID: <162791122493.1140356.14062105755897419012.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1627650696.git.geert+renesas@glider.be>
References: <cover.1627650695.git.geert+renesas@glider.be>
 <cover.1627650696.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_063406_550159_60B153F7 
X-CRM114-Status: UNSURE (   6.99  )
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
Message-ID: <20210802133359.aI7R-i_mp4aFSBz70LN3mv-MTiLQxhycCNUJ_Plewvg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 30 Jul 2021 15:18:54 +0200, Geert Uytterhoeven wrote:
> The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:
> 
>   Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.15-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 272614ec1b6bde9ab56bf8c9a71c4ff9ccf2eff8

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
