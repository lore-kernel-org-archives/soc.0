Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B801CDFCE
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 20:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730492432; cv=none; b=bvnZpx+OQTsOP0Zanj7GjBN1U4CXSK/rA/c85QVZed3ZmAufTgIYDQhjNfKcU1MTQevEQpv9JphFRQQLTB8CXUArrr0TUchkJxqbq/Xw4m1URBp8j5QuqkB4FNZeV9a9ALPGGSKxN9c9NXe4MyfA0FKI8ig8nTA0tyNYCw3VFWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730492432; c=relaxed/simple;
	bh=aV/y4pfhv7cuNkTFpldivxl/nVI8tyr2ONvF5Z3dIT0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uTv/zcyyPHAxiuRZ5uGDWBIqp/JwJ9qZmMoONUurEGWjTLYwF4fzhj0YhkMrjDseSSIYReRJDJTkY357wpNNXtQmMugnA/aBSry9K6+sNWm64Me6Ig94cPrgp9gXNKZNC5w3rr6yKmbsXtTa3QPH4RXGrX5pmkVgrBvhfcdfw1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPo75Vfy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPo75Vfy"
Received: by smtp.kernel.org (Postfix)
	id 2F777C4CED1; Fri,  1 Nov 2024 20:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192A6C4CECD;
	Fri,  1 Nov 2024 20:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730492432;
	bh=aV/y4pfhv7cuNkTFpldivxl/nVI8tyr2ONvF5Z3dIT0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TPo75VfyD6yFsOP1ZSZhMYBHukvbhdsSg+Nupigkk+UImcJmq+MqYpueBbrgy0m6k
	 LGkrV10vRv8yGZsA24v6qUhFncGYuOGy4c7580zTykYbO44tgHm9sft3iIH0J1WwEA
	 BhFha9KXEZetZZcKuTGdPkssWH+AtW4JWk6Qn8y0R82zC84nXksy7iByUQ+SB74Ym2
	 rsRUWLZzpxaHsIhQg94Xtr1UtU2Dw65zXidDM1wuYSI+derCAJ9X9UCLPRxsZ4a99/
	 Ct1uO4QQ2vPI2rUHj9RXB7Fiv+JeWsIBW51GlnDI72EzE2K0Pyd0Yog3i0QFc6C3sd
	 c9DC9/5E9L1RQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C0E3AB8A94;
	Fri,  1 Nov 2024 20:20:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree fix for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173049244023.2836087.18249063042755138534.git-patchwork-notify@kernel.org>
Date: Fri, 01 Nov 2024 20:20:40 +0000
References: <20241101142414.737828-1-andersson@kernel.org>
In-Reply-To: <20241101142414.737828-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  1 Nov 2024 09:24:13 -0500 you wrote:
> The following changes since commit dfbe93f32c12f5628bd83303e10ba63621c259ae:
> 
>   arm64: dts: qcom: x1e80100: Fix Adreno SMMU global interrupt (2024-08-14 21:36:45 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree fix for v6.12
    https://git.kernel.org/soc/soc/c/51c4bae06685

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


