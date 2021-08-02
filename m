Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4232BC4320A
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 13:34:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2084E60FC4; Mon,  2 Aug 2021 13:34:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 505AF60F6D;
	Mon,  2 Aug 2021 13:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627911273;
	bh=e2bbYXORQPuzMFKTOysoUZFYTfU3/cbf+2ezOoN/iRU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r/cWQcIJGCEuGAoRRfOlMNr47FVk6epyW2VAmHDdSXz9JGOndcvmmsWvvKyeBCEGB
	 CLa1+ICsoiQc7oCwixPyHNmhae51V+ndeViYxSbh/HVKe+5uuAa/GCrThB2m9LlRRL
	 c8dOVpYvbP4PP6MXMqggbiTy/T665BU25ghi1ogEnBs+tgZHV2go6A/2NFELGMIF67
	 opaZnCovocFWX5bJKq5pKDho5DEYREa5Kkn+DW5TWiNUc9813nxM42g+e7JxkfE8S6
	 vzXaM6SSFYYKnbn6gmtgljIBD0IJjHr9+hBG0iJaQFbjO5U4WGacla15CMYLeUkmh/
	 pFmw9jMuzY9rg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc <soc@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 2/3] Renesas driver updates for v5.15
Date: Mon,  2 Aug 2021 15:34:27 +0200
Message-Id: <162791126361.1140492.15958129543143485091.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1627650704.git.geert+renesas@glider.be>
References: <cover.1627650695.git.geert+renesas@glider.be> <cover.1627650704.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 30 Jul 2021 15:18:55 +0200, Geert Uytterhoeven wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.15-tag1
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: b6e952c35267b8da9a402f2f0c9ea23d5d929774

       Arnd
