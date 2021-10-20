Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EEFC433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 16:07:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CB58061373; Wed, 20 Oct 2021 16:07:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28B3B611C7;
	Wed, 20 Oct 2021 16:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634746079;
	bh=tNulBRUdC5B9CP1uFp5fS64nI5hkWpCslJ7K6H2oGnk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mRfhCu4LLWqnhPofUuE7y+muQoQ64wIq++mcG2MP6q4/we3Ry1jH6rpmAZuuSqY7Y
	 uWMBEEyJW9lR5kB8F8TDb0IE2Mj292VXMU1iMETlyPrTqN0n4kDTqU5vqoe4Y+MWf9
	 L2LWcxmpqaMPQbPpeCD/9zWg8/q0D/fZqkbhusQUf8wN+vX9Xawqbw8gnJIWnMSgZI
	 RpzHI3NcLhgN/RbyfJzCrgblFHP/OJQJ62h06ShThueAEvwyn9C1Nmsm9V8zsbPdgf
	 5N+K/wSY7Wq1vmcoym1FqT/T3nCyzKcqNWUCkzKQOhfhOsG+VoEA7667VSoNc4Ee39
	 +/R9FZg6+42oA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	khilman@kernel.org,
	olof@lixom.net
Subject: Re: [GIT PULL 2/3] Broadcom devicetree-arm64 changes for 5.16
Date: Wed, 20 Oct 2021 18:07:47 +0200
Message-Id: <163474606232.2486492.10960872772973488386.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211013174016.831348-2-f.fainelli@gmail.com>
References: <20211013174016.831348-1-f.fainelli@gmail.com> <20211013174016.831348-2-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 13 Oct 2021 10:40:15 -0700, Florian Fainelli wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.16/devicetree-arm64
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4f0c2be3d1f998f97e3a473eab23e4885ac6f872

       Arnd
