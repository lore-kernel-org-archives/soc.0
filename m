Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C4C28EA4B
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 11:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234598; cv=none; b=e5WRkB18XwqeF5Id3Vg1q30YgRs4+cCyiBCiBoUpRM4aa551CctFEkv9HF5ZP5qEPQqxcZ5rPrgiRgAqVjUXbDZqtinryfO2h4WMsyFEj5Of00WI5W69h558HIWqjW8elGW7O4B5h0VQHB2hWhcGELvMf8K1X6+ucgNEWxfFCD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234598; c=relaxed/simple;
	bh=wtnr4oByKPzmLZwiXJGPMR6PwyH09DabbJCqgZCPVpE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qFgiE6s4PurS7wClDWrSkq8q23oVPmTRXZrd51V7o7gKsbdrzpnVQtS4yWxMySD+JXUHudw6s+xFNkQ9r00RAsgYDrxngIjToPOHJeQyEtBwUF3gzohacxLNs9puBSh2hh5WcLKZ/oSkefFsDTlje1Lq5QpWMcIwJyTI9IegMBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VgqqvE9a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VgqqvE9a"
Received: by smtp.kernel.org (Postfix)
	id 85495C4CEF0; Fri, 11 Jul 2025 11:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBA6C4CEED;
	Fri, 11 Jul 2025 11:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752234598;
	bh=wtnr4oByKPzmLZwiXJGPMR6PwyH09DabbJCqgZCPVpE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VgqqvE9aV94XG5vZ7CAPF8NuBzW9qoQZll+I3VirYqfj/F1dbfXi1q6H7aJXCmjs4
	 uFkjxxJr+Yz6XEWMAAs5JOafesLCNTdNdSVTEr+/5nG5XpY21SPbU2WBz7ToAPadAl
	 EkgjNtUlvEHd6wAj9GxseXBpLKbymMnrdK5AOG5wIol5eKC3v52PNTtXUV1K9l0Xm1
	 NBp9MotPv8NoAf1D20zFrAZbaLzB5MynTZRLSEO6dMvoQ1BmgNjjgvNpzMl979S86i
	 jvnmK+jyPFUojd4p3/wIKjQsGRq7+jVz3E+4uDginUhQtXXnywq1nKii7WCdiwYSe5
	 vCrpCHitTqMAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADAF2383B275;
	Fri, 11 Jul 2025 11:50:21 +0000 (UTC)
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
 <175223462013.2239616.8529157517485257932.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 11:50:20 +0000
References: <20250710175815.6504-1-andersson@kernel.org>
In-Reply-To: <20250710175815.6504-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
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


