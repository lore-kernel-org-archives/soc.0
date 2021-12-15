Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33391C433EF
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 09:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05792C34606; Wed, 15 Dec 2021 09:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E834C34605;
	Wed, 15 Dec 2021 09:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639561847;
	bh=EPUVEsJmSoHUspTlEkaCzu7Sui/w9jm9BW7vMbd3K/0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dh31Psdqxs6QF66rm4HGLxLNs8jGB4NVTilttdqKNzJhyCHWSFjdtTYou+qzo4tPd
	 ipuWo33oEitSMWQ6DPXnO/EuJ7j+m4YvZnsj8n5wWZ9tZ5neY6uQfRg8GUi+nYkLZd
	 ysNVcgaHdZGqTc6HFkU5pN9bEr3onLGYp7RT1CNa6DRtRAYKRKgPtSZJ0E+w+LMXNc
	 NXXI+Hu+EizVDh1vr4ZOxBcmdXezKww4ECyEXJNPTSAgXNwWnHACjSzUDwAfZHsJNv
	 798IDL1NrCr0Zm/cspJzb+EeJq8BYgmjV9t0kQhzU8X75ZD5Cw7gwTYl++6/MRc1OB
	 PuQnG4rJIIhsw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc <soc@kernel.org>,
	arm-soc <arm@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL 2/4] Renesas ARM SoC updates for v5.17
Date: Wed, 15 Dec 2021 10:50:42 +0100
Message-Id: <163956181236.1227602.1850185839035622551.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1638530611.git.geert+renesas@glider.be>
References: <cover.1638530605.git.geert+renesas@glider.be> <cover.1638530611.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 3 Dec 2021 12:31:19 +0100, Geert Uytterhoeven wrote:
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v5.17-tag1
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 6eecfd592d5e0535dbb0bd936aa69688f1ebe97e

       Arnd
