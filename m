Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A2FC433ED
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 07:17:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7F65861177; Fri,  9 Apr 2021 07:17:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D83661178;
	Fri,  9 Apr 2021 07:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617952660;
	bh=uygj9zBfptFX92rchP4Ynh/JGD0wJp90BR8NgN0XWbU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o2f38BEsEIKhiqiWk/PsQpFwVE2m4pitqyKjdNGWESG2Zf4lxm8hj4ZO+Fq7Wm956
	 cMlZD+r7hciqVFG3Ug6Xw1WpzrKy9VbcEFKlYJwBSuI+8XLMCyoLeJDJCoU3BgvnqH
	 +4LoJyWCJK/A4iD8pHN7DkPDkp8yV7TXJSbixo6f8YV4koda0w/I4oikDfm82oh7Ut
	 +4n2M06bZyshzLt5dI7La7Di3hWHgwKS/uk1NDeev0Ox58a/5geWBbJVvEjXcXI74F
	 Av7PPV734QUEYnJkWoZMw/bJ+6FKyovVnFjNI0QzseRrcxw7KBwQQWZR8byrwklcTf
	 lPessPAZ4Zgqw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-aspeed <linux-aspeed@lists.ozlabs.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] ARM: bmc: devicetree changes for 5.13
Date: Fri,  9 Apr 2021 09:17:35 +0200
Message-Id: <161795265048.1749935.15830124997910239772.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8Xe-KV5BeQwOH6NKC1++FCVqwwNCGBh7hEbBORfrmxfTtQ@mail.gmail.com>
References: <CACPK8Xe-KV5BeQwOH6NKC1++FCVqwwNCGBh7hEbBORfrmxfTtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 06:14:27 +0000, Joel Stanley wrote:
> Here's a pull request from me for the ASPEED and Nuvoton changes
> targeting the v5.13 merge window. As you can see I've chosen to
> arrange the pull request as one single "BMC-related" set of changes.
> If we choose to continue with this, in the future I will cover the
> ASPEED, NPCM and soon to be merged WPCM (legacy Nuvoton) systems.
> 
> The following changes since commit ee33e2fb3d70267de00f7c0b09e7e3b309a686df:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: e3bbc53ac8827babb5001037883e4edd2068168d

       Arnd
