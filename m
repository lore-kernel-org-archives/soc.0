Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53283C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:11:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2BC7723B04; Tue,  8 Dec 2020 16:11:26 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [GIT PULL] Allwinner Fixes for 5.10
Date: Tue,  8 Dec 2020 17:11:12 +0100
Message-Id: <160744385108.3969289.6851147249292904391.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1280f1de-1b6d-4cc2-8448-e5a9096a41e8.lettre@localhost>
References: <1280f1de-1b6d-4cc2-8448-e5a9096a41e8.lettre@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 28 Nov 2020 11:57:09 +0100, Maxime Ripard wrote:
> Please pull the following changes for the current release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 107954afc5df667da438644aa4982606663f9b17:
> 
>   arm64: dts: allwinner: h5: OrangePi Prime: Fix ethernet node (2020-10-29 10:29:49 +0100)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: b11ddaac893ada234895bcfc3be3358957e80717

       Arnd
