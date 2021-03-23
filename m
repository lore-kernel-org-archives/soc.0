Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CA0C433E0
	for <soc@archiver.kernel.org>; Tue, 23 Mar 2021 17:32:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DF264619C5; Tue, 23 Mar 2021 17:32:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54005619C3;
	Tue, 23 Mar 2021 17:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616520765;
	bh=S4vPaEqsQgKupS7zDXxnfmBA92ObOfW26dwSwwld5/k=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E07ANzxZSDrDPHdP9YLe3BzrK5kxdHjFf04pi7w1dzJceB7+N8kEU0lJWMc4IW00n
	 Hg0QtGVLX42JYJhU1wLmGXbY/3GovKPHSKmSnbSxnNHTW1k3CPOEpy8Z8OiG+uAn/k
	 kl9/gDDOfexkO6xsGx7LuoCxFXCwu0GHHoM43ZLwJaSgv///h5X2cy/eOhVHhqlZjR
	 IcbJl/BUs3GGH4ag80gHbSBttMpe4Nxr9d+0ll/nunC+VWAHgN8HHA0c/RDziaT865
	 /WqMCAVud68QM0ibCVShmUtI0LrCKSiZfwR5chPWcLcEdgSTjueAgJMhIui0PMW/Gf
	 +bL+10iksCHkQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/3] Renesas driver updates for v5.13
Date: Tue, 23 Mar 2021 18:32:40 +0100
Message-Id: <161652074444.2900645.5656871088682377638.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319085146.2709844-4-geert+renesas@glider.be>
References: <20210319085146.2709844-1-geert+renesas@glider.be> <20210319085146.2709844-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 19 Mar 2021 09:51:46 +0100, Geert Uytterhoeven wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.13-tag1
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 10f765d68ba218fc0125b0193a058c82cc3b481d

       Arnd
