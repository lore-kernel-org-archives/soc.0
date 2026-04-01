Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D953218B3
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080225; cv=none; b=Kayz4ogay7Tvz3VWgZ8LfIZtnqj3jOoETP5dDh+6SCv+8/YxDMUru6hjJrAh9psuiMDV/81Xd5glxDBT0xu/B0pm76trTFudjNrtOwEP0RS9lfcUmzvYgk3rUYqVEk1hGXyiCCjErAaLhiEHMAiVo7grfpsTwwk/XkIr7K45g3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080225; c=relaxed/simple;
	bh=1jN4INJSMeVHN/JWY2x9ago6VPzwh/Q2zs7VWegBzXs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KwQH26b0ww7hpUa9lBsiUlK2Gobvnyd2tKIlwer0Vw4/yTPoaYgeeIB9K96CMoYOAHR1PUNACL2JbN6wn2bM7jctrynCczKrXS7RlZo2wRYN5kKXLuDhPVxjOKkflEdrCxedPmZ0mnjXasGBXQLSPqTvnmlTD+kB6Vx5hyG7q1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOgFzYDl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOgFzYDl"
Received: by smtp.kernel.org (Postfix)
	id 93339C116C6; Wed,  1 Apr 2026 21:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D80CC4CEF7;
	Wed,  1 Apr 2026 21:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080225;
	bh=1jN4INJSMeVHN/JWY2x9ago6VPzwh/Q2zs7VWegBzXs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WOgFzYDl5O9DpX7DhWlYuIinM/U2i3Rc/gFwviFa7ycdRORPxDa7gU6GLeTpIy8zV
	 vOBYJpUHEsb5PoBvzpStKkZ0Cvraoct7z85e9BMAG/cRAGr52LE3mUP8DOxzUKzY4b
	 Kvv502qYgdZulIvObqqTOtnN3ylG1DoXNp9aymGn+smUnvGAKoM0yYqfz2rqR1SrlI
	 UxQf2frmUBIrpK5SvohN690RMf3ON0qDBb7288fFKeZXHsnLOsAo/SaNimqY2fDAb9
	 OY80FNpMNT/KetL/VKMZpkKJ3r3UcE1PPPOAPlWuKiOvB6MtzJ2Hob73Ar1LCu8LlI
	 D5BkqitOmCEdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D0133808203;
	Wed,  1 Apr 2026 21:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner Fixes for 7.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508020829.3876275.6035752353851389986.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:08 +0000
References: <acktHkKlWDUbsE_a@home.wens.tw>
In-Reply-To: <acktHkKlWDUbsE_a@home.wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 29 Mar 2026 21:46:06 +0800 you wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-7.0
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner Fixes for 7.0
    https://git.kernel.org/soc/soc/c/14edf33d1b21

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


