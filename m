Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A98C12002
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:25:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 98D1B61374; Fri, 16 Jul 2021 21:25:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCD36613C0;
	Fri, 16 Jul 2021 21:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470702;
	bh=DbCcNeBD7TVXg9zVM+PpP0kyut3rqP3VmrWfa4jQD4w=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BO1Y/tMEYvkVL3ZLdipsjfwh46m4+DfnUCn02kQzXaSiUkI+FMC81QF6qFk7Uue0H
	 MfYPxgXCNzwJkPlG88xDqsf5f3TY9bOhtNsC+rWeCfS3pYM0t3o9g35B05kCdPhYWa
	 g1sH38fhvbcY64/ry+LOocv6p+z9GxPzzMprcfvF3tcSnTtXJsz09UhudeiFFggj/w
	 kZ/1QdMLy0gun6ErTW2RMLt2sdobznCsjuCmvQty+rnxTzyKJPvfivfLYWXepDVMYL
	 8nrjD7DBrcf5OgR8Ch8fvCvQCNaMeU+Ce3RVmA4kxe3xTrxr0DBQtzoxpPir0NhfCW
	 b+sbrM/wWqIog==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL] Renesas fixes for v5.14
Date: Fri, 16 Jul 2021 23:24:42 +0200
Message-Id: <162647049869.3478428.8962503020877326112.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1626253929.git.geert+renesas@glider.be>
References: <cover.1626253929.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 14 Jul 2021 11:23:50 +0200, Geert Uytterhoeven wrote:
> 	Hi soc folks,
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: e0129a0e826eda3b61f094afe52fd742bbc1923a

       Arnd
