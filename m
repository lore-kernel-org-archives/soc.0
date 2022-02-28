Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAC1C433EF
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36849C340EE; Mon, 28 Feb 2022 15:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A7EC340F4;
	Mon, 28 Feb 2022 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646061435;
	bh=ABF6dbrUaKzUlF/SwKAqqVq75hfXHE5SYlIHD/ePnBk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dazKWcmNm+EPdtIxCcxyyYn1iQK/WXwfZocMZen7GSAHgrI+JYoFByL8LtKK6TkFU
	 aNNr+8n0izxkzLuj6/uMJPT2C2XZbCKMaNfVd3LIu9/AJMJJZz1Pn01cs6hvGg/Cyj
	 JujzP3VhRPfNCfadTCsScbYe4LIth9PxwnvmLm+ScAG9957/a4b08eP5+p3235Pr4O
	 8LjjvN1Z+MZByoF57OCUxarD1dIFaK34FfyaIEdNg9PWA0qz8uQOWTfoEuAr7fX+9m
	 1Jc2NeGU1ePDLE2Sn8V61uwqgNoWiH0spypBJ597sEjTqtzMJjLVzm0yKpNJPkiaYT
	 Ca+wop4U8GTQQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-oxnas@groups.io
Subject: Re: [PULL] oxnas DT for 5.18
Date: Mon, 28 Feb 2022 16:16:39 +0100
Message-Id: <164606117042.3364867.11066543511898094615.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <530fd72c-e28a-4d5e-cb8d-8b3fbc1df89a@baylibre.com>
References: <530fd72c-e28a-4d5e-cb8d-8b3fbc1df89a@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 28 Feb 2022 10:00:24 +0100, Neil Armstrong wrote:
> Please pull this single change enabling ethernet on the OX810SE based board.
> 
> Neil
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>    Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: bb67752b505e269c3d527f8c57d1055235f58a81

       Arnd
