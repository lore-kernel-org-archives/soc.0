Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081DAC43214
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 13:32:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E338361029; Mon,  2 Aug 2021 13:32:55 +0000 (UTC)
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
To: soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v5.14 (#1)
Date: Mon,  2 Aug 2021 15:32:40 +0200
Message-Id: <162791113549.1139989.15144544679312934599.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87k0l7zx4v.fsf@BL-laptop>
References: <87k0l7zx4v.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

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
