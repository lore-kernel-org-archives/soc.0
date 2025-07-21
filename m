Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D8BDDBC
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111905; cv=none; b=EOtptzsLR8vyIsnBN1emERBilYJBQwSurMinw6X8hj/1+M92EabCL8Sp090z+JA+uY5LQK7m9tNOAV78c6HhIgkLpmH1eT+9S4SIBjMClxCxkj+cfVYNhxCkZ9r7s0ItAC4x+MFaH3ztqhgh7nSKjjWs0elYa4dfks6lxEKLLa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111905; c=relaxed/simple;
	bh=NtJPhRbNhnk7nYcjQ+wp7ibmBQ2F373jVwcHDCtZLhc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZvQ6AOIju1ENdvU4XTRi+tTiP1eXtnA5QZLPuGJ6Mj4sac/tSbbwjzGoXnIvS9zcKuEuIFqFVGdyQrkG2B8uHTcHNRApj+EUSTPYY23Fs6r3JvG1fOsYhbtYqnpkSPNAcWu1ONw8Ng93kbSrC2LWUuBcSFzpJp0m647OVbWPzCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIR1daCH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIR1daCH"
Received: by smtp.kernel.org (Postfix)
	id 73A53C4CEF6; Mon, 21 Jul 2025 15:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E29FC4CEED;
	Mon, 21 Jul 2025 15:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111905;
	bh=NtJPhRbNhnk7nYcjQ+wp7ibmBQ2F373jVwcHDCtZLhc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LIR1daCH5kq5N/QyO0uoJNL4vzxFx6+RdaDO+8NAX8SIoRhVqHC6qw5LVRvh5V52G
	 OFpX2RJfF+kuwFpy01HgItO8kXj3844RAFyuySGjGs3JybjN0ZgwABTl1wm8jrhQlG
	 i0EnHS1L7mf7SoYLgRdDlkNiwRs0U7GYL5DxdJmGV6F1JcLdrHRzSMFOdWJo64c4xL
	 v8bchdiJSEEnt/2ubZJ5Ld2ein1XMWZGdHKkmht6dDJtNeu9sevvb1OUkYEtJiVlpP
	 s5NdJJpCkiEIU5lyL8vDs1HU963b/eRKcJEZyOUuCUC/Va9l6YGs9mzhcDYOOe+WEn
	 s4U0Qhj2B+bUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 69486383B266;
	Mon, 21 Jul 2025 15:32:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SOC FSL for 6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175311192400.94241.8046337745344453454.git-patchwork-notify@kernel.org>
Date: Mon, 21 Jul 2025 15:32:04 +0000
References: <c947d537-cae5-44f0-abd8-0c558bac46d2@csgroup.eu>
In-Reply-To: <c947d537-cae5-44f0-abd8-0c558bac46d2@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Jul 2025 08:44:23 +0200 you wrote:
> Hi Arnd,
> 
> Please pull the following Freescale Soc Drivers changes for 6.17
> 
> The tegra change is outside soc/fsl tree but it is acked by maintainer
> of DRM DRIVERS FOR NVIDIA TEGRA.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SOC FSL for 6.17
    https://git.kernel.org/soc/soc/c/d60b1224b905

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


