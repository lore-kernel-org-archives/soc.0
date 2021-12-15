Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F85C433F5
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 09:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61365C34608; Wed, 15 Dec 2021 09:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98314C34600;
	Wed, 15 Dec 2021 09:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639561896;
	bh=oYwn3Bv2KBZPQ16L1QILcdHoBXp4zgaioDMmKp3I+qQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=II2Ji7t6PXUJPW6BOYD6EHHPuvCWy8gnOl0YjrOxLnjmOI65mQxbrrfvDtMB85pfg
	 QOG6MW0ULVqQMYqg1epyl9tJa9N/YjJQ743qnCu01Pe7/7DFhORBM3Ei4QT7Xie52k
	 GkgtnMoHd70of3CCHdEs3j75XEsTdfrxEz3BPDu+wjYFHl2ilzKhC43/FYMqm7Thgm
	 WueoFgLLioqUkdluYJqQzG8+BMVC+vJtPcoxWJVkkEzAB+TE/kQDlYc3OYloxdxu+I
	 ULgGl0nQH4frEH0ToA5n4eMC8QWNZiZQyDJUk5ywb1hVWurXxRLf/qWQefLNho3d7Z
	 VCTibOq/RGI3A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL 3/4] Renesas driver updates for v5.17
Date: Wed, 15 Dec 2021 10:51:32 +0100
Message-Id: <163956188210.1228007.9043186214626094436.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1638530612.git.geert+renesas@glider.be>
References: <cover.1638530605.git.geert+renesas@glider.be> <cover.1638530612.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 3 Dec 2021 12:31:20 +0100, Geert Uytterhoeven wrote:
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.17-tag1
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 0491871b63da81a42841218d951f98ad5c2a35e2

       Arnd
