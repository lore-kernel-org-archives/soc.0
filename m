Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798631F4C83
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944241; cv=none; b=ab4GIfI2i5H/YaV/WnyakSP9bxmverAUuO/MTmVaasfJQ9UgEpJR0sBZycSR7RKaxs2Wcpiw2amzOxi8vUyp23Ud3yDxu6DLFBvBo56Mr1BJgn8lbJhQtG1VqZxsD2E0dyHGsCtruwxwOvh9OXdGiL1andUiIGKzOHk3sqsN6Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944241; c=relaxed/simple;
	bh=CWd9xNza2vIEoOXZD5HoNmGTSM8LIPUYsJnn6xs6qbY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=edDIQQm2si+DFPGI3+1BO67eLismpYa7jDbE06sH339SCpNGoH8I0J3d10f1UInaBuKudr+fRJnTIMqZF3oIdnZZs7ZuxlrS5tl/StRZKZVq69sXGUEml0HK0yGOgTMfTpC/dOpLL+8he9UGXaXAxxz05gYopROf5iD/UA8oLb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAr9frgH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAr9frgH"
Received: by smtp.kernel.org (Postfix)
	id 20AF6C4CEF9; Mon, 15 Sep 2025 13:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072DDC4CEF1;
	Mon, 15 Sep 2025 13:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944241;
	bh=CWd9xNza2vIEoOXZD5HoNmGTSM8LIPUYsJnn6xs6qbY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GAr9frgHQJOxjF/MeNAFK5HoMgUVu6fS+MZNBgdXepApN6REMbiIIRNTvW35g+qa3
	 5/bBRMw7o5V2y5dACVjKH/mDTnjIjp9RwHu2IaAD3XTKZWLheDBLZLNI99debrCQ3h
	 EC9I2E7g6ogcS4DIO4AazbC7AhnWMDq0LuMyvqnQx6nUye9LsA7ih3si4Cnt0gRaD7
	 WpOyIpGS+XcLwAdPeyjfCf0DzL9PIq6CHSK4LkdotcFQvNsoSXaaT1oMKsfBr//x4m
	 8VBGgjBsQmX7uuYGA+0iRcFFJM5gOvGyhIutGFsYZyH9PcVZeryEHZl/rPa2R23tc9
	 CzCdBJfHe0cXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF3D39D0C19;
	Mon, 15 Sep 2025 13:50:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Broadcom defconfig-arm64 changes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794424250.4179625.12284555588564912705.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:50:42 +0000
References: <20250910171910.666401-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250910171910.666401-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 10 Sep 2025 10:19:07 -0700 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/defconfig-arm64
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 6.18
    (no matching commit)
  - [GIT,PULL,2/4] Broadcom devicetree changes for 6.18
    (no matching commit)
  - [GIT,PULL,3/4] Broadcom devicetree-arm64 changes for 6.18
    https://git.kernel.org/soc/soc/c/41d773149b88
  - [GIT,PULL,4/4] Broadcom drivers changes for 6.18
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


