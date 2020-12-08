Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66942C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3D72D221E5; Tue,  8 Dec 2020 23:10:48 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.11, round 2
Date: Wed,  9 Dec 2020 00:09:46 +0100
Message-Id: <160746884950.2839681.16253662527276648372.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <7ho8j4gkxo.fsf@baylibre.com>
References: <7ho8j4gkxo.fsf@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 08 Dec 2020 11:24:51 -0800, Kevin Hilman wrote:
> Here's a final round of DT updates for Amlogic for v5.11.  Based on top
> of the first round.
> 
> Kevin
> 
> 
> 
> The following changes since commit b6a1c8a1eaa73b1e2ae251399308e9445d74cef7:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4f9f1415bb1386da26111d2d419e8a73075431c2

       Arnd
