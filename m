Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D719BC41513
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6144C3277B; Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90576C4AF0C;
	Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720560633;
	bh=Y925csDwA7SSU6zc3cJENcg45FOZOpysVRQC59ZXKck=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XTkea2+Ged9ax/9aE+DuxOmxQ6GSqUwwst8tL1gshi7Uf1YkDHpMS2VIu+hmeDxub
	 ZqBZeLB6uV8T9SGGwCzFPPlgXf/QdHu095kCam8HnwwfQJ9l6sSoac3YuSA4p/1ngi
	 dSUZwHM7XrQwJF0apjjowFCYMtSxAWcR0iC3hSt8jglYp5LkAThF+HDFFcF5M+v3b+
	 SXj5BvwgVnD9tnugK6g6W1ns6SXIhvLcnaNYdONqFZQk353CcZqwmBGCWLQcmQb+V5
	 RGhu/obe3W3Tf50J4IL+1EfmhMFzAF3j4ItKmxN9QRkszesBBwFjQNQAiFN6Nq/oU0
	 rlnWpyWFbiteQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 79F1EC4333C;
	Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] A few more Arm64 DeviceTree updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172056063349.16885.6431128545767399808.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 21:30:33 +0000
References: <20240709193406.3966-1-andersson@kernel.org>
In-Reply-To: <20240709193406.3966-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 Jul 2024 14:34:05 -0500 you wrote:
> The following changes since commit 968178e35e78e566f75dbb7fbfc4dd1436ce8309:
> 
>   dt-bindings: arm: qcom: Document samsung,ms013g (2024-07-02 22:15:29 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.11-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] A few more Arm64 DeviceTree updates for v6.11
    https://git.kernel.org/soc/soc/c/28323a756166

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


