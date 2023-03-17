Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7175CC77B60
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5213EC4339B; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35D0DC433D2;
	Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679068354;
	bh=sWgHqUjZJPEoXS3GTVPlBl+to5M3iBFTj3xE6Ztb1Zg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SSqDvkjMXs2GdKh/mjT+k2ul59axKINzvFqBE2FamdcPQ9CaHzRe4+OEa9+R689iM
	 DzoYuMZn/uHlnnjda5qkYx+tkEkbL9UAdpA0moU8P9qwXn7q+nuXlS16ttkrSow4tx
	 hZniHvt0dBIIpbmhOCCmmXKF51i6P15unoLDunsaCXAXmPEdMlIBsin9d9F9cp9zNc
	 lYnNjaKylTB401+7kRtyOrtURv5PxboVyVR1fIZUg8pOZDDs5+UVPNIaalsmTH7Hr6
	 1PRUQnudSIACslbxhHa3PcNMcgsL6pLWUOpBMiMHhPIE0jWWczJPR4ibrdEIXML3T8
	 7ujLDgwDAnkAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0C7E1E2A03B;
	Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V4] arm64: dts: sprd: Add support for Unisoc's UMS512
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167906835404.32307.7509405393693528090.git-patchwork-notify@kernel.org>
Date: Fri, 17 Mar 2023 15:52:34 +0000
References: <20230306085717.420353-1-chunyan.zhang@unisoc.com>
In-Reply-To: <20230306085717.420353-1-chunyan.zhang@unisoc.com>
To: Chunyan Zhang <chunyan.zhang@unisoc.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 6 Mar 2023 16:57:17 +0800 you wrote:
> Add basic support for Unisoc's UMS512, with this patch,
> the board ums512-1h10 can run into console.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> ---
> Since V3:
> * Changed the node name of sd host controller to "mmc";
> 
> [...]

Here is the summary with links:
  - [V4] arm64: dts: sprd: Add support for Unisoc's UMS512
    https://git.kernel.org/soc/soc/c/2b4881839a39

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


