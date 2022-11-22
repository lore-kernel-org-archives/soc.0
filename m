Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A720C4332F
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 08:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C043C433C1; Tue, 22 Nov 2022 08:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40FF6C433D6;
	Tue, 22 Nov 2022 08:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669106415;
	bh=hFVCS1zLXgKsqIiW/fGlNWqfv60b6TST6xOsGJG2Gy8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=obKQqUxjZHDZMV92gCbxm1DKOB7tIZSYF6rQfR6hKzsysD0yLeoFehmMlpo4aaYkV
	 W6M6+EYBHx0Qw1zfvao1btgeoWWp/LXm2MMxdu9mmnAsNWbHKSfdFBjO5V82SC/8OZ
	 2tx2XvH/pi1pRS4uVboOG9U6L5IVXzpIkWrgDi6t/93zkiyeDqNd6mqHg4F9Y5TPiB
	 vKNfEDRAwBS/gGlaRVLX7ifTppcTtR5cz7ItLXWMPACwtK95ldqh3oZh7jNkIcsQXX
	 vTHOCeG54IYZcEUXPqBmZL5bJ48zwO0vVFXi5kNPG8+H3LaHqdphYS09lpqP+X9iMf
	 v3J/X/cz+H0yQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 293BDE4D038;
	Tue, 22 Nov 2022 08:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Regulator changes for am335x-pcm-953
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166910641516.28730.7858544092504336072.git-patchwork-notify@kernel.org>
Date: Tue, 22 Nov 2022 08:40:15 +0000
References: <pull-1669036672-530717@atomide.com>
In-Reply-To: <pull-1669036672-530717@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 21 Nov 2022 15:18:17 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Regulator changes for am335x-pcm-953
    https://git.kernel.org/soc/soc/c/abd6e3d6d897

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


