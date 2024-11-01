Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93D71E0DE9
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 20:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730492426; cv=none; b=k1xCbbAY0u3C5MzICnOg3HI0nOOklGlu2dFU8taKB+TQk8U7bxW8ZKax5v615z1wUZB6idQYUuskgQpoxJ63heuYZEPNCrg66gUrk8bm3BtrcTcnamlUK071XNqN5IjgLvDX4vsKrky9LthgMXIVNu7M375Q1A7zBUY6tK2Sm0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730492426; c=relaxed/simple;
	bh=yHXuU/AcWOOaOURNdTVHJexGsq3S8Sd2NE4b25qre2g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MNE7DUC1ScEhKmbE35IPzFgv405ATom0R+JaYWl1RAx1aAo5qqFFkTkIJALADQmlVSqrMhGj6bCYj1l8aifBPEtbjuXqpTxS85b4FbiHEYWRJ7lZcWc6pVS6Rbvz+ow4DrlMdjNcFSD7vOeVatGCfLW7/3X8r19zeN3I2t3S/Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdmx/Ivz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdmx/Ivz"
Received: by smtp.kernel.org (Postfix)
	id 789C7C4CED1; Fri,  1 Nov 2024 20:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E23C4CECD;
	Fri,  1 Nov 2024 20:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730492426;
	bh=yHXuU/AcWOOaOURNdTVHJexGsq3S8Sd2NE4b25qre2g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hdmx/IvzYine1et7Pj9SJFV4UBTrWU/los3643eT1QOynbGOqn/IrIhwE0U1bZCKY
	 A3f/UxCy95SAj0cox9th6EU0o+DQcSaSdXO9ca8FjP2T4xMEAVlbXG5iUhCHIRt644
	 HZJChYb6ND2DKFVwgNa2oWmZsyp7+J/8rjgy+5s4jDuxqkCVoECQBelOaNGVHc4RG1
	 AXgbT0cs+Jzzmf4onoPvZp/qmi1Ofv7mE2cuw8Q8pILOvgiyHEfa5HJylCUmSz9J88
	 CRIdDo8gcpZ+hq0HEHTmgzhy6Huh7zn/5JksrTrsUi8uuRGyZ7HzbQnXgsCYi4M4p4
	 lYMTnfVjdzCuQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE19B3AB8A94;
	Fri,  1 Nov 2024 20:20:35 +0000 (UTC)
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
 <173049243452.2836087.5729124939405120538.git-patchwork-notify@kernel.org>
Date: Fri, 01 Nov 2024 20:20:34 +0000
References: <20241101142414.737828-1-andersson@kernel.org>
In-Reply-To: <20241101142414.737828-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
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


