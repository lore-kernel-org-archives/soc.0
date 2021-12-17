Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A16C433FE
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 15:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96AECC36AE7; Fri, 17 Dec 2021 15:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80519C36AE8;
	Fri, 17 Dec 2021 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639754432;
	bh=VYwT1aUMND1Qvf+da7RTAUxRvNozRIQoyYrdpE7u6R4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IzrQe/Ut78Da9mLL9aL38Ehb/919lNgW2swzTEdS6cL4u555fE9seHiWQCCrOpc7Q
	 ZBZl2R0rpi62EMTJDrWlXnIbjGdnQUiQIt5Qq67E0+MIJYi55McYaNW70W3Qc4/7/a
	 zTIFRi6IUXHPIDnJLzg8+6d9CIXN8xhlIDE3uPET3uWTF7f3097MohBLYzXrKYJjSf
	 N2pYW+WLuLrjIpoXpo1VaXx7b/GuW+xZjPKvvL6rs5OMk5tXEsN1nTPLfBJK97zgrc
	 8TcGELGUzaYfzSeOig1LjKVw/k4GdT33gxqiOfqr797G1mjTyBTM9hCbCcqTNcvZQX
	 ayaI9RSM4TQhw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 69E8560A3C;
	Fri, 17 Dec 2021 15:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v5.17 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163975443242.14717.4229003526876410492.git-patchwork-notify@kernel.org>
Date: Fri, 17 Dec 2021 15:20:32 +0000
References: <cover.1639736716.git.geert+renesas@glider.be>
In-Reply-To: <cover.1639736716.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 17 Dec 2021 12:07:11 +0100 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v5.17.
> 
> It consists of 4 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM defconfig updates for v5.17
    https://git.kernel.org/soc/soc/c/a60c67fe3acf
  - [GIT,PULL,2/4] Renesas ARM DT updates for v5.17 (take two)
    https://git.kernel.org/soc/soc/c/527c71547dbf
  - [GIT,PULL,3/4] Renesas driver updates for v5.17 (take two)
    https://git.kernel.org/soc/soc/c/5a17799462f8
  - [GIT,PULL,4/4] Renesas DT binding updates for v5.17 (take two)
    https://git.kernel.org/soc/soc/c/79309f5bf43d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


