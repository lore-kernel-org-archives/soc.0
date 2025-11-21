Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA061283683
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756564; cv=none; b=Schy2W1vnCtF9XqNuyfbSos3MFwex5qRrUJ9GcSZXeHSXFcIza8gOPXlvLcQL2Kqt2KCxoMTHw/+mI/RHZzWkAwfs0hmtNChF7IKammD8111d2HUzxcay2qN1DD+a/MeqHLULAqp7sgzQQw/qy9twyck/nq3CI30+96AHwtJEfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756564; c=relaxed/simple;
	bh=Ed75VkQ8s/yF3uqRi19oJ1BJDzlsVBLE5yC7LSfuO3E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=f7B1RcSHXGKDLhtuCpAGpPg9CeVFX9FA0PPWtTplqc+8sDoks4yy0izsXovkEsHn/+0DN3PiDHVeQmLwun9b6zczAXl058DzzVqgfg6IrfG7xSLuLN3Sq9ckbP0BEkcETPPKoWTGMSXwR5RfI8V14bqiMVa2p4+fSX13IAC4w28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTV9HfcN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTV9HfcN"
Received: by smtp.kernel.org (Postfix)
	id A4CACC113D0; Fri, 21 Nov 2025 20:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F814C4CEF1;
	Fri, 21 Nov 2025 20:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756563;
	bh=Ed75VkQ8s/yF3uqRi19oJ1BJDzlsVBLE5yC7LSfuO3E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cTV9HfcN1OhbMiXlCPCcyvZCEC/4PPcbyz7zUMWRzntFyBN9jHUJCftMF4QhEkWWo
	 uJ2Dcqr0oc7pdfxr8pQgsdKFQOJeTz8uwlvWOpNksBUo23yHpvfcVwkeLf+4KsL2Mq
	 AVTfpyRd7TgJIPzX9dACfjWL7ZzXL3ZXX6vr8+v5w+tKGVefXTLdCG86qGoi88pxAA
	 0HFzUrg2CJ7gZR4QXT5enNlcr+E3IciYZJfHgDy5WyR4PdbsARZgv8TMMEOcAcoz5i
	 EP4tiO9T7XVySFSU4txrmlrFL9tJn27+N5jdqf05w9Ed4rlQLwaky1GEMbGwx1Ua88
	 sFXfsr5NfaqrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C823A78A68;
	Fri, 21 Nov 2025 20:22:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: First batch of devicetree changes for 6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375652799.2571237.16413645923366843407.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:22:07 +0000
References: 
 <d2bd7e3e6045ac68875fd220e528c76f4fb2faac.camel@codeconstruct.com.au>
In-Reply-To: 
 <d2bd7e3e6045ac68875fd220e528c76f4fb2faac.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 31 Oct 2025 09:40:25 +1030 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: First batch of devicetree changes for 6.19
    https://git.kernel.org/soc/soc/c/7ab4745858cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


