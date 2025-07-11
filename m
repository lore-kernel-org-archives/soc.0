Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284D2283141
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 11:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234589; cv=none; b=DXMCwwvzVgaCaxaw1VMfoV+8PISMvn2MzYOdt/J7TaYR2rHcj/RjQFcRWGDSEjWnSOWZxWszV5Tzaq51ilU95KZo/+xQuyik9X3n2npiGb9JP95AdVcfRPFp+EpN1xIR2RoIhgXtfCKpHJ8hF2SIT90rKxpr+54FhWUP1iMXrqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234589; c=relaxed/simple;
	bh=zg2JhaECGMAwRpvbaLNwUjgcsn0OmSgsc6+iZyLPBGc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Wkun2sg7GRgNM9Awaj2zrWrAgR5n05siIPHd+E4qjUs2YIjfWZ/PTsGw14oNj8pc0nFu+q9440PdSCURXUXDXB8eE5yegO5s5AwFB4zWGoxh6qjvjCHJMYnSB/UtH0JXajUmztpUScCV0MB2USFVshBv7UI/n0+WwTfIA6gN7R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=psysdSQR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="psysdSQR"
Received: by smtp.kernel.org (Postfix)
	id 12DFEC4CEF0; Fri, 11 Jul 2025 11:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1534C4CEED;
	Fri, 11 Jul 2025 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752234589;
	bh=zg2JhaECGMAwRpvbaLNwUjgcsn0OmSgsc6+iZyLPBGc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=psysdSQRTxilXTPIRoLHMDDDdFLYzIaJjBABc443nV4k+UirqRgBkpQixc/E1KcDn
	 l0Zxn6ymNPd/1WIbIPzfAnViH49jMOllWi5IfDokJ39R4JFOqOG08gBmk6FaPCzOpF
	 ERl/DL0NyA2tvh2T3GQy0VdToTukjgAXw3wvleXTZpw2wSdg4JL2FCYEsnW1Qe2ZUi
	 QjPAQuPPu6i5ueWPwKNtYelE4yjItTU41Sps7ZQrPka4tkhlHwLJSFjWsPoaGj5x9k
	 EYOlSLF2SLe+Ifm2XP7Y92pa2nqs+WGLXU3i3jIRyoH8M54VZyRJSZIL7xuY3L5n/6
	 6gZHZv3GdyhbQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C26383B275;
	Fri, 11 Jul 2025 11:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig fixes for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175223461074.2239616.4102914715442965062.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 11:50:10 +0000
References: <20250710175815.6504-1-andersson@kernel.org>
In-Reply-To: <20250710175815.6504-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Jul 2025 12:58:14 -0500 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-6.16
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig fixes for v6.16
    https://git.kernel.org/soc/soc/c/8f0837fdc5d8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


