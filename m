Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD83C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:11:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D014B23AFC; Tue,  8 Dec 2020 16:11:18 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: keystone: remove SECTION_SIZE_BITS/MAX_PHYSMEM_BITS
Date: Tue,  8 Dec 2020 17:11:10 +0100
Message-Id: <160744385141.3969289.3072466462786407841.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203231847.1484900-1-arnd@kernel.org>
References: <20201203231847.1484900-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 4 Dec 2020 00:18:40 +0100, Arnd Bergmann wrote:
> These definitions are evidently left over from the days when
> sparsemem settings were platform specific. This was no longer
> the case when the platform got merged.
> 
> There was no warning in the past, but now the asm/sparsemem.h
> header ends up being included indirectly, causing this warning:
> 
> [...]

Applied to arm/fixes, thanks!

[1/1] ARM: keystone: remove SECTION_SIZE_BITS/MAX_PHYSMEM_BITS
      commit: 9280f726097b436c8c907825131cd346d7eb0c0f

       Arnd
