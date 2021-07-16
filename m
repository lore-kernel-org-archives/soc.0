Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A18C12002
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:25:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EFDF5613EB; Fri, 16 Jul 2021 21:25:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF6E5613F3;
	Fri, 16 Jul 2021 21:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470704;
	bh=aHbucaiSMF8StJxx1ehxiToz6asaBZjGiho9M4PUeRM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ft1iy5hZg35D0gHDlMq6yrp9R7aOJpZeJsXQM+oRL7zfWpXNA7VafjeJUZaOTgIM9
	 uGZf0NOVh3VW+4kam/PdYNRf5YYfJ7H9mVU+zfTTHEJ/0LMSm4mXCt/h779vVebvZd
	 8HVQFIhg19ibpaT9JDZkb250AXD0jYjtCrztO9mla9N4/rM6hk6Ju1A5KHN3tPawoL
	 HUsZxBb3wQpVNfupmL3LJZeoiyLnOG522uOvwQg03Txi6shhz63ZPkzNeuoB/krxs2
	 78+Imq0o44MlLMAJIyrz3ANvRB01Cmk7H9asfmmKDzLezHyCrcZt7eCNqrGvCQM9K+
	 cU6EL/T9G0mRA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: Typo s/PCI_IXP4XX_LEGACY/IXP4XX_PCI_LEGACY/
Date: Fri, 16 Jul 2021 23:24:43 +0200
Message-Id: <162647049938.3478428.2181950475782235435.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <82ce37c617293521f095a945a255456b9512769c.1626255077.git.geert+renesas@glider.be>
References: <82ce37c617293521f095a945a255456b9512769c.1626255077.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 14 Jul 2021 11:33:43 +0200, Geert Uytterhoeven wrote:
> Kconfig symbol PCI_IXP4XX_LEGACY does not exist, but IXP4XX_PCI_LEGACY
> does.

Applied to arm/fixes, thanks!

[1/1] arm: Typo s/PCI_IXP4XX_LEGACY/IXP4XX_PCI_LEGACY/
      commit: 5f291bfd33c8995c69f5a50f21445a4a93584ed2

       Arnd
