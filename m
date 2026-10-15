Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C373DDDDB
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 23:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106423; cv=none; b=tjDwRUOnAc+Or4pg1mULEU3vK72b3Yij94cGf3G+PGZXfD5TueS/KbZZ5iEZcq9nUYG3bjuZFWegx5CiVRUv4t0n8MopXz2HUk/DmGhxN8HaKsbw3MfQHBSuGw42Y624TSNUM86zMD4/Y4+PwWkGCZ94KlPhAm/FjsosAQmSLgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106423; c=relaxed/simple;
	bh=dSSggQqPPphwFIYRGyKiUMGJHjvvZ7zSCoqodjfvcVk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=miUbvFe4vLSMqDYbV57ZonwvxbS382zI7BkfxT9OirWQjM2tdyzpR3VBGGDssHTAdbuYDuTpieWPCdMybBadsw2mzArevX8heSa0fTh0Jo8GbH3gGjzXT3P0MSKXJXzJMP+wCRBflbVY43R/++acGrmW6QKFceKCrv5psdWeUIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0EBcgM7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0EBcgM7"
Received: by smtp.kernel.org (Postfix)
	id 1BC021F000C5; Thu, 15 Oct 2026 23:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A471F000C4;
	Thu, 15 Oct 2026 23:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792106422;
	bh=sQTRphpdn73RRB37OM8R3B8R/jDuxoKnkSGDsZa56Mo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=d0EBcgM7xFCVfGha7niWrvEzqrXXA8qwQ4UXP/XFKNljaMHSwSkyx/C03aHB9kh7y
	 +l0Ra54JoKHFxlllOSfzAOSFS/sKTVN1hH7iunGVdTOmp3bPVxqHUdGrMXntOU/A17
	 xQtJP3la7/MbOyVbUQdRPCC1a/mNXmID9V12vSm1z2AbHNbstxSrGCFsmHxkV3Gnes
	 8lrNbCX6RIkKs662HrzfC8wK/4Sh5zaeQPDWgKONNFdS7kYVP19visoa5eRa9BTMjB
	 is4ftMeoEMw/jsulXcbb42lA6bt5R0xI+ZNqgP/Nw8WQb3JNwFZPg+Byt4iPP7GKN7
	 ckYhMiNZUuA3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F163F3808209;
	Thu, 15 Oct 2026 23:20:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/7] Device tree bindings changes for v7.4-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179210642051.4150336.13774067186878858530.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 23:20:20 +0000
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
In-Reply-To: <20261003095924.1370238-1-thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Sat,  3 Oct 2026 11:59:16 +0200 you wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/7] Device tree bindings changes for v7.4-rc1
    https://git.kernel.org/soc/soc/c/6469eaeaf14c
  - [GIT,PULL,2/7] ARM: Core changes for v7.4-rc1
    (no matching commit)
  - [GIT,PULL,3/7] soc/tegra: Changes for v7.4-rc1
    (no matching commit)
  - [GIT,PULL,4/7] firmware/tegra: Changes for v7.4-rc1
    (no matching commit)
  - [GIT,PULL,5/7] ARM: tegra: Changes for v7.4-rc1
    (no matching commit)
  - [GIT,PULL,6/7] arm64: tegra: Changes for v7.4-rc1
    (no matching commit)
  - [GIT,PULL,7/7] arm64: tegra: Default configuration changes for v7.4-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


