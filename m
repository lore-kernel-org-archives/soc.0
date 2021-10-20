Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129FBC433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 16:00:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E9D9D61373; Wed, 20 Oct 2021 16:00:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82FF8611F2;
	Wed, 20 Oct 2021 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634745638;
	bh=yZQGqcixn3akt3DO+10qEkc/glUASyUfxkV9M8n6qCc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rjt9JHUW7MQXkOkcU+8UEdlOyGBRl7yVL+E94b+xSJ5dQHIrlLkVTRtf29Wd/VLB2
	 A7/QP51NKa47c1EymIrdVwvzHHMu6d7lDcxXEJNAGJmOc6mbLCCk5k0YnjP9L2hfQe
	 UzBRl8dXLtF6i6mbyT8dltAzy0mTIaD3d8a/bhEHltOds57SjD1ElmX0KCtWA36KLX
	 h3mgWwwuOJjzrDL/4ffEb6woupTaTuceG+8MvBQ5T9YRuJjGeVSJA7cVRiVX+2hZoT
	 SBAotHk0MO2QxQaGcu3F+JlKDk6DdBODZ8+UPno5XJrAtMWWbjswQeoo/oMfZizaLF
	 ChYR4Px6Hb4Fg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	alsa-devel@alsa-project.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] arm: ep93xx: CCF conversion
Date: Wed, 20 Oct 2021 18:00:30 +0200
Message-Id: <163474562303.2274953.3990592094326359852.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211018103105.146380-1-alexander.sverdlin@gmail.com>
References: <20211018103105.146380-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 18 Oct 2021 12:31:03 +0200, Alexander Sverdlin wrote:
> This series series of patches converts ep93xx to Common Clock Framework.
> 
> It consists of preparation patches to use clk_prepare_enable where it is
> needed, instead of clk_enable used in ep93xx drivers prior to CCF and
> a patch converting mach-ep93xx/clock.c to CCF.
> 
> Link: https://lore.kernel.org/patchwork/cover/1445563/
> Link: https://lore.kernel.org/patchwork/patch/1435884/
> 
> [...]

Applied to arm/drivers, thanks!

[1/2] ASoC: cirrus: i2s: Prepare clock before using it
      commit: f4ff6b56bc8ab2fcad6885813cd28ccc81224981
[2/2] ep93xx: clock: convert in-place to COMMON_CLK
      commit: 9645ccc7bd7a16cd73c3be9dee70cd702b03be37

       Arnd
