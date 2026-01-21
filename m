Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634C23A564
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011225; cv=none; b=I6V2MYcy+LgiwSwpSWnd3N1nlu9mSfvbL9tL79rxw6ZidurTDI8EhRhSaaXlZU4veMJ8dSTv+U7bRfWlRA6mmca1ECrNMQQAOrbIuFMwJ+mMtrKPKhiBOpusM1Sp61ZHzg63/4v6BN3MiQ71E8um1KQEZUcjhKIN51vR8fY4kn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011225; c=relaxed/simple;
	bh=QDgzJkH71oVOp675DkAH+ibguqhbxN/qLC5uHqR/VGM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=apna4K147H0c1h1KP7ui5GvDVhxRS/vPfm42KYeQ8xRYgeTASZ9TzwPmLA9xzF35H3Mmqrm/MTATjj34hSknGXFd+71ROjKzeedZ8lCQwHiackgt0gkParlQHVLb/PiyMwR6l4Xz2d4k9NUsZxQmWUSYQufpoT+Iu8KPXH/iQu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgznHIAe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgznHIAe"
Received: by smtp.kernel.org (Postfix)
	id 5E715C19421; Wed, 21 Jan 2026 16:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490E6C4CEF1;
	Wed, 21 Jan 2026 16:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011225;
	bh=QDgzJkH71oVOp675DkAH+ibguqhbxN/qLC5uHqR/VGM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JgznHIAe7DEczoslpqZkDCYUzsCgjI+vefqUXoPbWb7jJY533YCH1VNCDH82Qzk0X
	 WRaXzrsvz/c432IfvV6rdFSFohbgQwUOu4MCe1nEwcPqFG8Y/F8zh/f9Kv3x+7qZR0
	 1e9zjJ5UL6sHp2ETtYbVUWZY6owZrX7baEaMHVrcbeHl4fqLTd6iB2bmcMQdopZV89
	 zAkb5ID5pa2FxhfXxJdQ/gAT0pwLBaAWJp7uB08hx7ArncosUnRBFx+kEuwma3G6U6
	 FybdCBPL5tFsEhjPd5IJpcAs00AAPo3NluoiyPUxaln9fAbiikYZg7q+wQcw/f3j4d
	 SoHRdw1gBKOuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BAA23808200;
	Wed, 21 Jan 2026 16:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE bus callbacks for 6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901122234.951664.164676271958640217.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:22 +0000
References: <20260117123008.GC255115@rayden>
In-Reply-To: <20260117123008.GC255115@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 17 Jan 2026 13:30:08 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these updates adding TEE bus callbacks to let the users of
> the bus get rid of the struct device_driver callbacks .probe(),
> .remove() and .shutdown().
> 
> The maintainers for the updated drivers using the TEE bus have agreed to
> take these changes via my tree, with the exception of the maintainer for
> drivers/firmware/broadcom/tee_bnxt_fw.c, who has remained silent during
> the review. However, the changes in the drivers are straight forward so
> it's better to take these patches too rather than excluding them.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE bus callbacks for 6.20
    https://git.kernel.org/soc/soc/c/e6bea2f5534d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


