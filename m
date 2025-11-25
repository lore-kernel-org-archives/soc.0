Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF7933EC
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764085847; cv=none; b=U3+jHZlH2tLBelmb/VaE/EbBYSsCXCJF6B/neiwvrvpS2RK5TvdbmW85T3GVqm5fhaxBUFd+GSNvicJP0c/C2LCBdvHipMsbpG/RVv/YzDD/+EzkQjyu2jE0QH8wsgepFIV6mJqRgW3GM8SlCp6d36izulOiRRpv4S9E44X+UgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764085847; c=relaxed/simple;
	bh=QP5/W0b38K5QFtbI7jZVR9wQWfyYcFdDXxzW9M75T58=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dgbkNvznw80FbRZYadGjA7626lUdsBGQNLAYJs+Ho4fevV1zGd4qN+b81UIh2OikeMi+4hq+nThA+gNLuoLG1SoWzMSuigpU4KfBHhfbvJN6ij1ZIF15l6geK63FZUflE9yl10UV/+jWoKS3mzpVSgBBGXuFqp/dDeSI2pw7j7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duDv+L0F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duDv+L0F"
Received: by smtp.kernel.org (Postfix)
	id 138E0C19421; Tue, 25 Nov 2025 15:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21E1C4CEF1;
	Tue, 25 Nov 2025 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764085847;
	bh=QP5/W0b38K5QFtbI7jZVR9wQWfyYcFdDXxzW9M75T58=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=duDv+L0Fbx0p8GVDvM8oprrsy3sXNzUgAdF35q/JONMGVbFFu90dJ+fwf1tElWqg6
	 VtU5p1iAqVdv8pp3eRW2Nup7llK0nqameTp/Hmp+wWt40FBkOombxSGJ3KEE+Ynlwx
	 b6cmZ3k4thRw1tQOVtopbCs3p2RAU9d64T6Q5BL5Sg+uLk8tZfehsYcZBw78XXzvnU
	 fiGazpIaZ+OS9X465ul6sj7A5FaVt3DTKPgzImxi2h1TidRlAaPEWLfWhAvc1B4xF0
	 XY0y1qEdtgu+Y96vyGQQIWEfWFgzku7dEx5WIdHaI0TijbPwHPTAj0Yq7NQByht6ZB
	 ZTX2bSU+VQViw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD66380A944;
	Tue, 25 Nov 2025 15:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner fixes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176408580949.815192.2181258264451880510.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 15:50:09 +0000
References: <aSW6QyCvqM_DChbG@wens.tw>
In-Reply-To: <aSW6QyCvqM_DChbG@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 25 Nov 2025 22:16:35 +0800 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-fixes-for-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner fixes for 6.18
    https://git.kernel.org/soc/soc/c/e9191383d28d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


