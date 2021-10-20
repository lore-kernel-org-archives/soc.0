Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91948C433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 21:30:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5F0B661215; Wed, 20 Oct 2021 21:30:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0FB1610E7;
	Wed, 20 Oct 2021 21:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634765441;
	bh=oxBxWZ7IXZjLdZvVIvjDqrsvZFGaxwm86AhEiLf1h4o=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lWRnqmizho83dALiowQUCezkHw4VVCgnGBuo4W8GscjkAcgdU2BfMN7szWkxYt4sg
	 RIxlG5DtvJWRVUOGBW4VmbP0jLyVwZebTKgX8JkgcAOSjakqLfkNhn/baCAhDKxNYJ
	 3loNhUZBmpV3Mw1/2c7Z+EGykQoP+AWng4Tn9tb6aLQms+K30hK2euV34hp+S1FVbZ
	 cbXAoJXZS6SWJl4hEZmCNBS/dutGpqrLibefxY1BvnhwyhmTB5tcgaoDl22cEDEhhH
	 0+n49ApSlgOf/fqlJFqqpaoa1UaC95eN3SiYrzCC7vItrYSrEy5eXxXRKGOS1vUZyl
	 iVy7u4Fnw1YnA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [GIT PULL] ARM: mvebu: defconfig for v5.16 (#1)
Date: Wed, 20 Oct 2021 23:30:35 +0200
Message-Id: <163476542773.4156336.15519125893349486430.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <871r4mmecw.fsf@BL-laptop>
References: <871r4mmecw.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 15 Oct 2021 18:39:43 +0200, Gregory CLEMENT wrote:
> Here is the first pull request for defconfig for mvebu for v5.16.
> 
> Gregory
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Merged into arm/defconfigs, thanks!

merge commit: a307ca926028bc79d12eb2f686f4a557f064f598

       Arnd
