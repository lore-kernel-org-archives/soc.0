Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3466C433FE
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 21:19:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9408461372; Wed, 20 Oct 2021 21:19:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CAFA60F9F;
	Wed, 20 Oct 2021 21:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634764794;
	bh=2Jimqf62uqwLSWFpV7vLK0iL7jLLoW97SEoCDR+thas=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kNh69Wjpu0+M19ggaEmGVqkZl0lYLIGTE8UEbECLgFRzJTYn357RRCwRPpku8Q/vs
	 SHkVN0ko+VcvHhDTUQoC7DPCdciOl3HKVRT3QqSg3VVnqipxusJO+Xz3wdCt3Pkbh8
	 gSZx6Lti1p9d+etoG/K1ABk5pq4f8aoJajwzqk9ZXn1BK+ydEs/labgssDjNAbBnRP
	 wikBGJN+ntx40fFmWSJn7Ag+iWqo2SGow860SeJlv8G/8dRJ9mf7zqO2Y+fMKFR2Mp
	 LIAizoeZBM2bv9tjf+QZZ20n0NkWMjyPblVx0bIZZCJPFbbHhFWdRRvww/Q4GxlXb8
	 L1Ad9JwWvvnww==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [GIT PULL] GPMC changes for omaps for v5.16
Date: Wed, 20 Oct 2021 23:19:48 +0200
Message-Id: <163476478090.3883860.7844960707837350375.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1634280279-284035@atomide.com>
References: <pull-1634280279-284035@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 15 Oct 2021 09:45:14 +0300, Tony Lindgren wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/gpmc-signed
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 9f2feb32c2b6a39fdf8c872486341ffa84b2eff5

       Arnd
