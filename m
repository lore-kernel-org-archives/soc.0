Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA4EC433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 14:54:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5A19960E98; Mon, 11 Oct 2021 14:54:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0472860EE5;
	Mon, 11 Oct 2021 14:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633964084;
	bh=C+r4dLx6Ys+xr9OG/lS4p3ctbdi36eShMGEjAuZymw0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rLQ4Oros8AgSX4MQNsGHNoi8T0zrIlCSMBBA/wYGbakokMdfYJDhIEwuUaLy1GbiA
	 iu3zQ5UYdDsRY0IPeG670Q6eFXdcKzL6dFf2G+lwoX4rJIsdviGxG2EgVllT3wDq8I
	 ugZXMMOtwfUdGSOLpXkPo7DBcp6Hu3p7ztpaBe4/ClowKOF2XRbD8GMDmhbng752Wo
	 ufoMirfIsY3UHz5fT3DXuKTOw2fHYZhPpd7/vBluSP/+6cKEsmnJ/p52u8l13J3mWx
	 i9d6R1lGQGExK/MRjtGx1cfkvhCvjYa0dkKa1efceWBgxAuiiO1g4oYjGoJuqJyedw
	 SZVpQAFcnLmlg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "arm@kernel.org" <arm@kernel.org>,
	soc@kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-amlogic@lists.infradead.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] soc: amlogic: driver updates for v5.16
Date: Mon, 11 Oct 2021 16:54:28 +0200
Message-Id: <163396399096.3170841.5782337655825464618.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <f8e020d3-29f7-0745-3864-01975edd20f7@baylibre.com>
References: <f8e020d3-29f7-0745-3864-01975edd20f7@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 7 Oct 2021 11:43:57 +0200, Neil Armstrong wrote:
> Please find for v5.16 two devm_platform_ioremap_resource() updates and a change adding a new SOC ID used in the new Radxa Zero board.
> 
> Neil
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 88557618909a70460a3c1a898cdcc10c43a2aad1

       Arnd
