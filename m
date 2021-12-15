Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6374BC433EF
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 09:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 295BCC34607; Wed, 15 Dec 2021 09:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C924C34600;
	Wed, 15 Dec 2021 09:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639561762;
	bh=tpItsWb3yCPu56wHhd2hRRm6LL8pA74DZCiB4o2ZBhs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OuRA0yiqB0m0bfw3d0Atrf6A2wDqET8XrSz6Hbbt9vlAdC8AfFSIo2fol/4SbhfkH
	 GRalbCRHDnzdoYrfiCvEQaxtiDLm2gHXjxgGo3a+ojhByUfuTDC/Bz+ID4jY34R8+Q
	 KKofbIu9xEZUCgnVlV560WY/7LcDarCnWPJ5ASmI2zhe2zl/7wTZrOqWOUEVhrBJBL
	 B4fT83ySg9SiBD78EloEXf4HTl/qys3UnGTHtiaUnjM12Kq4niNkP18dZYdBCO4c/Y
	 Y1tj0WsDtg8rVYqf/z/T+4jDw6sGNhWcy+0m7k4bJUL5hZdV7QJKOHbwn9ee6WtFoM
	 NPZ2jeX552rTw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.17
Date: Wed, 15 Dec 2021 10:49:09 +0100
Message-Id: <163956174418.1227275.8750396607643099087.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <f47b9b95-6cde-d2f8-eb36-78777d449920@baylibre.com>
References: <f47b9b95-6cde-d2f8-eb36-78777d449920@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 13 Dec 2021 14:28:40 +0100, Neil Armstrong wrote:
> Here's a set of Amlogic ARM64 DT changes for v5.17, with minor fixes and additions.
> 
> Neil
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 1c8e994f16b79f08c565b11e617afc07225eecf0

       Arnd
