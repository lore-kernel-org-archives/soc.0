Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C617C4338F
	for <soc@archiver.kernel.org>; Wed, 18 Aug 2021 13:34:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 72075610C7; Wed, 18 Aug 2021 13:34:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAB9D610CD;
	Wed, 18 Aug 2021 13:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629293687;
	bh=kU0/0RUSkzu6GyKZwm1Fj7lQVzJR6cLnV0eZfnSWb/I=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dqLHoBbFDS+eCzFijZ08ud7Eo4fCE3GMnwuLGxHieSkEDfFpfO5w0aPnO+XdIkF//
	 IPcs5lIsQ64fjkBf0NSzi709OInMV/usJmS9P6hd+tmBOKfW7fugpjkGgB41h9xbDL
	 Jxi5lxycV3B9VUrZzwsRZeOi35G4mOv0Mw1RjgW7D46vPPAsgYy5YfJUQ3hLdZ46R4
	 wAgUsfu+lKkVZobwTZxo8TiK3cEmjsxwEQ0Ev1gtG3dCwAtQb8ngAb1YP3VUWB/NnQ
	 d7nFObBhtMcnsKqWVkLGuhph9pAL+vfd7NbLvNTqU6Th5EVhAVE+1bg0y5iXp4wnCy
	 MlRiR3khIvlnA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	soc <soc@kernel.org>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 2/2] Renesas driver updates for v5.15 (take two)
Date: Wed, 18 Aug 2021 15:34:37 +0200
Message-Id: <162929367324.377646.18237573210512732738.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1628849625.git.geert+renesas@glider.be>
References: <cover.1628849621.git.geert+renesas@glider.be> <cover.1628849625.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 12:22:36 +0200, Geert Uytterhoeven wrote:
> The following changes since commit bfe6b5590ce6cab81b3ee51b4541bd1d0b18b3b2:
> 
>   soc: renesas: Identify R-Car H3e-2G and M3e-2G (2021-07-27 09:27:19 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.15-tag2
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 63db5acb4adf3a61c42b387c9c79799b86d25e7f

       Arnd
