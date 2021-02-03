Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489D8C433E6
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 12:31:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2004964FA4; Wed,  3 Feb 2021 12:31:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8086964F9F;
	Wed,  3 Feb 2021 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612355506;
	bh=6ADiZNTlHAF2RHz64S8FjGDXiXXKIWA5HGc+MA1Ir0U=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f5hy/zH2mwbHm8MZiKBc8KjNyfBJ1BXkfogsEImnRyVjJbiJl3RXe2wPAHglpDzJJ
	 gHuUy4dJTrJWwMbZenSHEei0Eb5PzXpzWjgcGxd8E6uE1rDTyz1I0VYLuYNWGuEAfL
	 M3d16YB/sYCr3vaPsBfBUZ4n5Ds8QieWy7BgFoXC87/7O0KRq2kv/G+ED2gx0E16Lc
	 L/Q6G0cZDiXXtkus0Vi9wWcwi0FCITpxk+tDTXHo/BVkF91iIe1j2X49Q3Kq6LnUm4
	 yBAsoSxXDAT1DQXyt0f3dN5fo484ZJ0uSlGdipBjKY1mITTp6kRJ5qp6KrVr+xbZPT
	 gvUFHF7g0IwNA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [GIT PULL] Allwinner Fixes for 5.11, Take 2
Date: Wed,  3 Feb 2021 13:31:35 +0100
Message-Id: <161235548539.2002750.2693038279702469216.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <f8298059-f9ca-43b4-9e29-35bc0e0c9b15.lettre@localhost>
References: <f8298059-f9ca-43b4-9e29-35bc0e0c9b15.lettre@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 11:12:11 +0100, Maxime Ripard wrote:
> Please pull the following changes for the current release. It supersedes
> the one you reverted that was missing my Sob.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 459630a3ebb4110c571f103fbc2d8120be001e39

       Arnd
