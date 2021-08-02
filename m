Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28D1C4338F
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 13:34:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 910E660FA0; Mon,  2 Aug 2021 13:34:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A977060FC1;
	Mon,  2 Aug 2021 13:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627911250;
	bh=O20KCBN6x5S2Th8Xcm5cHvGb3voDrJSLXnbxb44w6UI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fHxRDG8so0sdkbg9+xTddY4eSh8HWSnyS8Zr3k+GFbgqI5ZJHMJp9EYcOXI37vqw4
	 M3t72UaD8g1MlGYA74tcjtCK7wdlUqdBv3CHvMtfbiDSD7GvvUW8Pt567dl7Xszm7s
	 VTc6vLVBkN9qvboGskE6CvsLqFdx4K2mtIRq9IuTwWggtG8VviS+1xGVrV2rkgOSwB
	 A2WZJAKNO+B/QPvdZVrbVNgQwwVzSw8nCV/KQICvuD+cpyIkOr4u0f2R172YVyR4/0
	 6bFMejLzdE9pY66gSA40eqIwffQ4X0hbY+zHr5DWcCa5EcmlzTixciJTq0DjusaO+G
	 eJm0blRq9klqQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	thomas.liau@actions-semi.com,
	cristian.ciocaltea@gmail.com,
	linux-actions@lists.infradead.org,
	olof@lixom.net,
	afaerber@suse.de
Subject: Re: [PATCH 0/2] ARM: Actions updates for v5.14
Date: Mon,  2 Aug 2021 15:34:01 +0200
Message-Id: <162791122488.1140356.8055413100439530524.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210628072817.8269-1-mani@kernel.org>
References: <20210628072817.8269-1-mani@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 28 Jun 2021 12:58:15 +0530, Manivannan Sadhasivam wrote:
> Sorry for submitting this short series so late. I was waiting for the clk
> patches to be picked by Stephen.
> 
> For the Actions ARM32 platform, we have just couple of patches for v5.14 cycle
> adding Ethernet support to the S500 SoC and enabling it on the Roseapple Pi dev
> board. The EMAC controller is an in-house IP from Actions Semi capable of
> operating at 10/100Mb/s in half-duplex and full-duplex modes. The emac driver
> patches are already merged into netdev and the clk patches are just queued for
> v5.14.
> 
> [...]

Applied to arm/dt, thanks!

[1/2] ARM: dts: owl-s500: Add ethernet support
      commit: df5060dce764998800baa085fc1a31c71fa15f2f
[2/2] ARM: dts: owl-s500-roseapplepi: Add ethernet support
      commit: 062f82a0b7a760db3fb08f33c9a919c301c2ad9b

       Arnd
