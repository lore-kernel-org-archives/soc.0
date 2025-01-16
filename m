Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D49D22B8DF
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043304; cv=none; b=WyKUzwhfawaOra9QnCV6FEGTOPrgTMpF3AHXGZfEmlIRqh3nn7QLudmP2hHIc6Tb13wlTJ1J4r6kCDj4aT74Rzb7WHHnchA9PTnM/4r0PgHLquJu7xmwcQakZ9j04N83fhPYSRV8oHJqDYf7iHOfEhB26tTl7AK/LF3wuA23sxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043304; c=relaxed/simple;
	bh=SzJrfMsamoxH05MCM/PHEcOEhxVYqb8f95vho7lbN1U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QNqlMP19m5KCLkF/XITLV2x1AFZML4I9IlCycL/e7Ukv6hWFHFAGDaWqKypHjgcHAtZVFzszakkJarrsymhIeqgAaDTvhvUn0lNA7fPeF5owU3TGRqJjJD5bF0+izYzJzdsNoMlVJQeAioHyKWCSZ/p21pMCt8sYsma3tM+7oRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwOdo2JK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwOdo2JK"
Received: by smtp.kernel.org (Postfix)
	id E583EC4CEE1; Thu, 16 Jan 2025 16:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF870C4CED6;
	Thu, 16 Jan 2025 16:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043303;
	bh=SzJrfMsamoxH05MCM/PHEcOEhxVYqb8f95vho7lbN1U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FwOdo2JKyW1f37RoCymt3bbLtIgHR/c1IPSc+0G5pChYiVDuPWcnKY/dWvozdMjM4
	 Xb5d9Zmg2gsLcEYEC4rSjdvlupVheizCVPvwi7S9egAw/pGvNc+2csO0KOTtLui/g4
	 T9mkUoWgozk01gbzpmkjOwVSDFejUbmsv8wS3YXU842EEfyMPE+i9k9QO5eJcXjhDR
	 BTOkon3oSudgZ2SwBZvcX+Z0tv1V+ozPArZ0Vr+TGR7og148B5opgrvbjXeBkvTfhL
	 ZHtixfPfit10jS2vgx/WaoiRTZeGIR2ipxDT5rFDllszfqsuI2dpl0Bl969WboFL3b
	 HnHsSUFP1y83A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33ECC380AA63;
	Thu, 16 Jan 2025 16:02:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom devicetree changes for 6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173704332674.1501791.7446658966496077065.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:02:06 +0000
References: <20250109224756.3632025-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250109224756.3632025-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  9 Jan 2025 14:47:55 -0800 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom devicetree changes for 6.14
    https://git.kernel.org/soc/soc/c/14d773bb96e2
  - [GIT,PULL,2/2] Broadcom devicetree-arm64 changes for 6.14
    https://git.kernel.org/soc/soc/c/ab6efed7ec87

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


