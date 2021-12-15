Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9822AC433F5
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 09:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E5E4C3460B; Wed, 15 Dec 2021 09:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AB6C34605;
	Wed, 15 Dec 2021 09:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639561759;
	bh=k2zES6U9vJ83RAFmGeiYSg4VrcCEuu8W8SRD7ORYaQ4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d4/uPSDvf/bYWtftmmNpZ6OGoIeNLvQcVfGuljeO2OF/6EZO/8ldMhHnMpY5wFkT5
	 W90YD7QxmKnQ5VOiAf9d8RCgHhyDM+G3LSNOtBJ9PL1ZIPuqu2DovTLyb04/0zDZeK
	 w/CNHv73beSC1j++WgrchPEAAUfXG7PvJIKNhm65Kgh1IWwZEJHm+6aO++lx9o4Nwr
	 NHjYcN1vWB7kiWaE9c7SqpW8eaabCTbMC50dEj667dti+ThUYgoyovSuvGTy4y1ZlP
	 BQ5Z7rsIRGUFRKIvjkuCHf48oHH1dGpsKRPKjJaZ2dvrb3jNW4Mvzz+Z5W0wQjRWUx
	 r69XhuiSU737A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/4] Renesas DT binding updates for v5.17
Date: Wed, 15 Dec 2021 10:49:08 +0100
Message-Id: <163956174400.1227275.15880351389085127054.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1638530614.git.geert+renesas@glider.be>
References: <cover.1638530605.git.geert+renesas@glider.be> <cover.1638530614.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 3 Dec 2021 12:31:21 +0100, Geert Uytterhoeven wrote:
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.17-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 541b107cccf46e1281fe9d34f9ac6794c87ce87d

       Arnd
