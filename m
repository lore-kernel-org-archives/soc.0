Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E78C4332F
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 11:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F971C36AE3; Fri, 13 May 2022 11:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B4FC34114;
	Fri, 13 May 2022 11:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652442321;
	bh=svibGMn03On3uJ2L5toWa9yWy3Mz0AyH1A+GU+HOlpI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qgwwIATPgpI4+0P6dfRtjvu+NQe5Bby2r1xTQH1ajqjpgjSm0QBd1PDG/RvvIrNbp
	 ljNNCqJjdd8YSTDWoYEKFiyQ4kuqYU5pG9HSARYEKmu1N/1NLuN8IH/Q1s9NcrUO+1
	 s201UM5Di8pKHvMPuT4gBQ8lZdw2eam1OFd04QSORg4F2FuHAC25nFmBeVjmC+nZUv
	 kNy8heXXqPqfFqU8kVFtY1NswhRj51aWKisl1vTyWd+JXyPpd6FRJzmsmsfntRFW+M
	 XEUrpbOJMXDWRL92vnPSLPZTGPzj1RijBjpLCuIUisr95Ba25BvHuPvWIVlaJTxXiU
	 Rj/uTqasTYZrQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC <soc@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Olof Johansson <olof@lixom.net>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
	"Menon, Nishanth" <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] TI K3 device tree updates for v5.19
Date: Fri, 13 May 2022 13:43:39 +0200
Message-Id: <165244216376.2862916.18162790170389384674.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3dc2011b-eb6d-dcd5-3921-57f6a1cf6d8e@ti.com>
References: <3dc2011b-eb6d-dcd5-3921-57f6a1cf6d8e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 7 May 2022 22:18:27 +0530, Vignesh Raghavendra wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-dt-for-v5.19
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 168b43ac21c7f6d96ebb5d801194ca63548ae006

       Arnd
