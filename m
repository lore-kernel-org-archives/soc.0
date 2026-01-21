Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E1C33C538
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011217; cv=none; b=pPL2gFRCdk8n/4Q6UxJ+AwrLLTeaR3ZudTcNQXmOnfwBpstbN8mc1Yp1VmXo63sLEnOiS2ShmacRj4jyT+gbNAOoy8cLogq7R9h0o5zanFLbMwNkmsCiyYCUsb0kwGZIZuyKaHxn6LjLqGjs9PGX6T1zObKtRs0Lt7dkCm/Wlw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011217; c=relaxed/simple;
	bh=7I5PQGJ0RbqFg6lecDHjkODnnt3k2gVWNZ9xi4LUa4I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XheBfDZBZjaueRmlBsG7SFt4MfVGIEQ4RdEcE9+W8sFQzex19pJxEZ0Ez0x5my/gJgDX++Nsk3/PRK8aljJi5//x1lJXWQotn6/9aLTUq7uRJKTOPVCAKqtAiGAHleFluYnStzvx33FYcBKauc7Zo9+Hg76kvFCzTohFs46cpa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ae9OshM0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ae9OshM0"
Received: by smtp.kernel.org (Postfix)
	id 1F1BAC19424; Wed, 21 Jan 2026 16:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08948C116D0;
	Wed, 21 Jan 2026 16:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011217;
	bh=7I5PQGJ0RbqFg6lecDHjkODnnt3k2gVWNZ9xi4LUa4I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ae9OshM0sIUtF5S+BmlfhMDdAye/ElMdGqUhEYntW08O1qAIEDFLJKYOPoyqRidME
	 zkpMcwo+KQABQLBknVJhOtNsgfFjbrmjOjNAARCq2aCwt4ynOS+k+MvRDFZqVRkNbE
	 8XGattQlM16uSyCcZBFtSjfw6JdQC5g6ObS4UyuIinQ9vkK0O+HgO/YxymGzKWW9di
	 tEVLoS9iJvyDZMqylLzczJ6UGDc6UuDJY7pZYGjV0YIZs8GRg4VLHsSZD2IdqH6u6U
	 7FQWMm2fuy0+XAcyQGiaMjgCZHxbnZcKsh5qOSMtDjbIZkfu9weuNvvM1mwQnG3Dtl
	 7pJ+mMswGuqow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EB5D3808200;
	Wed, 21 Jan 2026 16:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901121384.951664.16586641391280879306.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:13 +0000
References: <20260119162201.842771-1-andersson@kernel.org>
In-Reply-To: <20260119162201.842771-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Jan 2026 10:22:01 -0600 you wrote:
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.20
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v6.20
    https://git.kernel.org/soc/soc/c/733f0303c2a7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


