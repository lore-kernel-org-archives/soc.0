Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DFE2045B0
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 17:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741973403; cv=none; b=AfIEi7ZfbQZKNxYqapNbkuuOG1q4XG5eFH69qXagn5S1ffeYT95HDthe8rmgz3SRGN4GxVf+q9b6+J4aW/5E3zTBjM4NA6zttQbo8b0FyGbwb8D7iuJELI5CM5Ytx24je4HlPuG7g2wKhNOxFuttV88Cf+f8E8qhTHploZra9u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741973403; c=relaxed/simple;
	bh=kc8g1buQ/UxHCUr1Qx2jvGejwTD+BTJh8mBezg+hOmM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=s86cc25FODegojehtG8wsfP+5zbqXQc8Mwf/p2oGT9jfGJF4uvll9FqDOtTXyKrc/K4oSctnguqOFpwJ9PYpPx3SY7Y9TF4blYDvlT8i6RsvCr5eKyubvhdxC5Yv0qWV42xJLu6U0J4VgD1Pf2U+qtzptwffv2aoeDaRzfFTQTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkIXDcQF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkIXDcQF"
Received: by smtp.kernel.org (Postfix)
	id CD354C4CEE5; Fri, 14 Mar 2025 17:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50A9C4CEE3;
	Fri, 14 Mar 2025 17:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741973402;
	bh=kc8g1buQ/UxHCUr1Qx2jvGejwTD+BTJh8mBezg+hOmM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XkIXDcQFBTPGqlZJqnCMyeacf/KoLxabAp7UER7sn44fAAI2BrD89S55DWCZbYy6x
	 HJaR9J+Q7nCVVdn9iX0+WxsuctjkJd/1m9YdTzrk0jRzkqulQNNDTleI2/VYvri/fb
	 O/O7tl1PGDtvvxpQ/9u8fRCfTEzlKCgaRxl23M45orxOreb3+6j7+Vz1S9w8Tl4lYV
	 M8qTgkNGn0P6RjG+46EXuEoHs6xOm1gSLoMIVdy7pU8N8JJfGwc89C53dCKBIRsWLI
	 GR0aT6XhmuXFIoeuymIOmt92fB0zEO1e/m4TLFAdoYEbFQZHio9XWrZhkGmBbXNjyV
	 yiFeyLhWCjqLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE6B380CEE2;
	Fri, 14 Mar 2025 17:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fixes for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174197343723.2324103.9068306767523521430.git-patchwork-notify@kernel.org>
Date: Fri, 14 Mar 2025 17:30:37 +0000
References: <20250311022509.1232678-1-andersson@kernel.org>
In-Reply-To: <20250311022509.1232678-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Mar 2025 21:25:08 -0500 you wrote:
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fixes for v6.14
    https://git.kernel.org/soc/soc/c/c221dcc769b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


