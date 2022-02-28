Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1CCC433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37E27C340E7; Mon, 28 Feb 2022 15:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9031EC340F3;
	Mon, 28 Feb 2022 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646061433;
	bh=P8hImRLDB7ZfS50bo83+vbX36f99DmRmsmlB+TiGQu4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YkoaP/gIaoNZTjE1CHdD8HwxrXqsifuZJDxcwcdeo7FnpIyBr69BrkOaKvpiBvQcE
	 X0u/T2JZvUxt9iHSsdrQlv9jPY9P1rIXbJOem6V0Gb58MKs0Spyg/HM/eauAcAMHfu
	 ZaLl+AlpHFNfI7PBg9UIlZ/rdnkeM1JSgjE4iXo/8oAT1ddFVw/jcQKKxPzN5KdxJ2
	 cJmdJA1DPXRoDswsqxuGc2qQeQeMMbFYjuz5JEXX3Uzg1VK3EgPp29j+liapZVBKJc
	 rs7/F+XVfXRByPeStrQNt7NB4mCTF0qflqNavEMr95bV0TrJiKQ9jV0oVGOuc9sZSl
	 DkvnC8O7b41Mg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.18
Date: Mon, 28 Feb 2022 16:16:38 +0100
Message-Id: <164606116967.3364867.17248022329754081693.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <a7cd9937-d441-3e1f-9709-8e80cc8814f1@baylibre.com>
References: <a7cd9937-d441-3e1f-9709-8e80cc8814f1@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 21 Feb 2022 12:38:47 +0100, Neil Armstrong wrote:
> Here's a set of Amlogic ARM64 DT changes for v5.18.
> 
> Notably, this adds 5 new board and a new SoC family from Amlogic, and minor additions.
> 
> Neil
> 
> The following changes since commit 0a62b3cc0af9322e650fe89bea0bacdedf01960a:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 3b364358cb9e46ec4a3c9d75f1b4ec8ec863f6e7

       Arnd
