Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A15C433C1
	for <soc@archiver.kernel.org>; Tue, 23 Mar 2021 17:34:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 66490619C3; Tue, 23 Mar 2021 17:34:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9819600EF;
	Tue, 23 Mar 2021 17:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616520845;
	bh=1P2fQ8kHbnS7O3gDUlqincn6nGWEB+xXUEVX945aEIU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jAimD95ph7ls+ighEMoEQS9Jm0jmch3nixsi14V1vhpdP5nKjdddwUfMvA10A24q1
	 pD9ZS5Bw2dCFS/gcIFBZfLg153UqAKzpi74GXsq4S6PR7J9JVVv6DqqN5gZU4oPhqa
	 pFOX216LaXVAOVB1hAytQ38FSoWd94fR8vywYfFvALxES9haqa4D3TIb3r2MTum63G
	 EDAdSw8dSRYUqFkY23/Pmn62BBnxOiT5xRLWHE/uaAAwEvQAh/3+zeqouCG4Wk/pqb
	 x+ebdK7aGKzyWZEw2ozQ0J5se+GqwYLLv/xEHy2mUHT+Qdw8jW5uTP/tcr7Q4hQ5Tc
	 qLlg9gu9UXAKA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <soc@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 2/3] Renesas ARM DT updates for v5.13
Date: Tue, 23 Mar 2021 18:34:00 +0100
Message-Id: <161652082999.2901149.1420849682427390367.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319085146.2709844-3-geert+renesas@glider.be>
References: <20210319085146.2709844-1-geert+renesas@glider.be> <20210319085146.2709844-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 19 Mar 2021 09:51:45 +0100, Geert Uytterhoeven wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.13-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: f38dc82b56a83be8a18e395ff5568e46621db749

       Arnd
