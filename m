Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F86212D05
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644357; cv=none; b=uwfP/d+Q9XLY78bP/oBd+j1SbrczpV07xcHX7JuCQ03XBHZNBuQiVPlKnGIv+TVd44/lbS8sE5MUfho/SQd4y1U3UMsmRqOQDVz1/k2lr/LFtLN8TwS0VMTTZ/xvRS6KzyBB+jN2F/RAsr55XBVX8qd+6UHfL1eplSMzZNZKQe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644357; c=relaxed/simple;
	bh=hz6uOVxnMkkZogez5QErhD970G1ndTj/tGNtRGAQlvo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fYoBUVf372jr2gHuNtd6zBLJyy9q9+dIOmk38qE7pMHG3fWuFWyNLXOA0E6u3KgKaDL4t35uiQ74GrtISF+eKWNaVP6hj4z4GOh5Q9SPDusfWv1xDRv8paSkmljxmu06vj2BhgAgxBjNREg7qhKruA4q/FCJPgKa+5bGEQ/l5Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTMsqTOE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTMsqTOE"
Received: by smtp.kernel.org (Postfix)
	id B9B01C4CECD; Fri, 11 Oct 2024 10:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B81C4CEC3;
	Fri, 11 Oct 2024 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644357;
	bh=hz6uOVxnMkkZogez5QErhD970G1ndTj/tGNtRGAQlvo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tTMsqTOEINYUoqAbgizx1UXiUvlj1c//E+lZpuJgohpzvBM8vTfJGfYzqAq2f5xQh
	 Opmi6anIy4LYKCu8ZPKJF4gu3TtLDNy50C1L2VCgEM/DUpsSb78GU6pGG7tnfhzphJ
	 0dyBdY/8QJ9mURO0WCVkaQB8xPsvfX+qR8pBxatrVFgEYHCNw+DoDK28rz+Ge242av
	 K08lMqIO2WC0FnF/OoxI2DVNY3SkbuNG6qu5hN1idRUCOocsQS/HJkUB32UFqPL9tp
	 ll3a5IhSU3nsy0CG/UKsWXnHglV4uSGvXKBqcH80iEWsFadGxSr+n54cnSqrrW/Nz7
	 v1olNWNEGmGFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BA63822E4C;
	Fri, 11 Oct 2024 10:59:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864436198.2676212.11127559345581422880.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:21 +0000
References: <20240904215752.24465-1-andersson@kernel.org>
In-Reply-To: <20240904215752.24465-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  4 Sep 2024 16:57:49 -0500 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v6.12
    https://git.kernel.org/soc/soc/c/4f6dc10b7e4a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


