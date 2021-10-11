Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133F7C433F5
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 22:12:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E6EBF60F3A; Mon, 11 Oct 2021 22:12:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AB3D60551;
	Mon, 11 Oct 2021 22:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633990326;
	bh=cSGHVKdyEqklV0ZSJ/pIwrBPsHrrW2nmdjxBRw0oBcA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CtnYiZMcxJXd5BRE+SpZX2neC9glw0fdwSs61P0zHdkEGgASLJHofi5ajQQyfY2iU
	 y6kVGKPt3GKpRWnX22Mon6GGJe1kXe46wTrfViONniBkP05bPaWKeRwoJcbGZGXp/V
	 9+aSGjh3K24gtDT4mzuxGiWdexW30Nn5+H/nOZpxJhT03LpLOo+gUqT77amQomgh9B
	 Gbq2zsFEwnbKEupt5QIQQTJRfqqC58Fs00EOy+wzNpnYgoYCz6jk2BPoQOEke5WCnz
	 DaY7r/p3e01L56TN9njtI22aHVwAccE+WgasP5BzoV1pDCd6Q75y++bNFH94SUSIU+
	 QhwQv2gNeEurw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.16
Date: Tue, 12 Oct 2021 00:11:44 +0200
Message-Id: <163399027725.3049179.3177059890960667529.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cc0a3af0-b1b1-dbe1-f553-cf58a1c63d0b@baylibre.com>
References: <cc0a3af0-b1b1-dbe1-f553-cf58a1c63d0b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 7 Oct 2021 11:46:33 +0200, Neil Armstrong wrote:
> Here's a set of Amlogic ARM64 DT changes for v5.16, adding three new Boards:
> - Radxa Zero
> - Jethub D1 & H1 home automation controllers
> with the corresponding bindings and some misc DT fixes & additions.
> 
> Neil
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 1649069312dc08fe19573cdfb194a22c6693b816

       Arnd
