Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940A030DEA0
	for <soc@lists.linux.dev>; Mon,  1 Sep 2025 09:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720700; cv=none; b=A9L1zkfLtuQJfGGgDlWmVGR4AuWBjZ/hR6udYRY6p9B8Eu11cfhCI09qeQ1xun52cioSPvxgo5XpmwZyJbkyndg2hFTz4glUDf5cw7gA+9wFyrSN9zKJG3gG1HC6sNqK7eXzGMlsYnDabG7jRAUFXTJU2j6Eq2mKOdskx79Y6ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720700; c=relaxed/simple;
	bh=HHgzlI3vchSOsqbjjEL679NzlPW5KsucRs02XOy8upg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=c0mQ+Nqnsha8mRfADV3AdmIt/4LwisIA8HRl9CAli9nwIF+u1LeVXV5n2Wfg8SbioVwr+G0sd64NCbcQl+djCn+goR547SdIdKu7ecLVJEv5adwXZJAy+m+zhmtUPTHmCkwQhIvvEjOHLVM0ssFecut6doBPKnCxsgiVvcTT61g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0EUfkKJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0EUfkKJ"
Received: by smtp.kernel.org (Postfix)
	id 2EEDAC4CEF7; Mon,  1 Sep 2025 09:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193C1C4CEF0;
	Mon,  1 Sep 2025 09:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756720700;
	bh=HHgzlI3vchSOsqbjjEL679NzlPW5KsucRs02XOy8upg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=V0EUfkKJ1L0SKlAciGyU287wov7mlzTXgNC8M4oXdz6y5sWAs5IJskOFepKDDoZBd
	 Y1ay0mpfPQI5M5wMimHsSN61XqH/vTtdUKKNy+4bIZu6oEsW8oK5oyaGiX9ZJbwpVM
	 0v6yxo/fom5eo/VjRqR8H88nQ6MjWvA2boWPqCgDOb8TKDbkJAbJ4iE5w8OVRogWZK
	 oyOu++k6Yb0OySiZVp4K1jyxw8uZS4o9LfFMRf04C9husZVY2cgp0arE2tSsZbKdNT
	 yHWkkrGNKX6hyuabALtgVt4oKO/4UGabUV1eZ20qjnHr8nsjtn/FYitNxvQ1nRK0dr
	 CMnqmX+jGfbYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B66383BF4E;
	Mon,  1 Sep 2025 09:58:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fixes for v6.17-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175672070574.3637164.11726520782816492262.git-patchwork-notify@kernel.org>
Date: Mon, 01 Sep 2025 09:58:25 +0000
References: <20250811145613.120917-1-andersson@kernel.org>
In-Reply-To: <20250811145613.120917-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Aug 2025 09:56:11 -0500 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fixes for v6.17-rc1
    https://git.kernel.org/soc/soc/c/e6e709901c33

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


