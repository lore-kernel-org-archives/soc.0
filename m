Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BC7C2BA18
	for <soc@archiver.kernel.org>; Thu, 20 Jun 2024 21:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2FB73C4AF11; Thu, 20 Jun 2024 21:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E258C4AF09;
	Thu, 20 Jun 2024 21:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718919259;
	bh=hae5ifCNYUXWcOFRINVBdf5nPkcnb7QZC9Zr6x3ed0U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=uGhMEoTrCJV2iEhAaFfGS2l7xpPztH9sGRW8y5tSoaXDlW+Usndval0Q9X96JpzyR
	 7Mt/TmCBkWa3nPivw29Fa+cdwg7JbW7GzihqKI0eM0+IlZ1BBvLhU4URdKmaOK92dv
	 /K7VVXYnQRiM0X3IU7epCb/Sz6AI6I1jCuI9Y338nVb/osGBErjgmSU32ozZqqzyfy
	 RALDm7AhPPnIAaHfJ+ZJliOOXvcZ2vkrckiOKJZBtgza7fUl9SvnQCRjmT2DGn3scW
	 ytyZ3D0HZT1VxmctKsl5UjKcPN3d/4NZW6PUnJ6vufRZOndRFPFph5eg5MRD/xSZkI
	 jG8Q2r7hqhgkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DDC0DE7C4CA;
	Thu, 20 Jun 2024 21:34:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees fixes for v6.10-rc4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171891925890.21354.3025534679255593975.git-patchwork-notify@kernel.org>
Date: Thu, 20 Jun 2024 21:34:18 +0000
References: <MA0P287MB28226E34D9390B311201B7C4FECF2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB28226E34D9390B311201B7C4FECF2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 19 Jun 2024 09:09:27 +0800 you wrote:
> Hey Arnd,
> 
> Please pull dt fixes for RISC-V/Sophgo.
> 
> Thanks,
> Chen.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees fixes for v6.10-rc4
    https://git.kernel.org/soc/soc/c/8de8165693d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


