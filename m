Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEA935E1CB
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006222; cv=none; b=W5VBRzyTYaKDGfJQLYr3IU/vEQEVp6p7LF4FpP7FDtzui8FTcIanFdLWRg9sjTKjDwftH5u49jypKQlMV1HBzvefIGxH3uPd41c92Ma53u7zadYBLAIC061bqhDM7qWU8twQTDqbQx5bWnjgujOROvuzv2Jo5w5DWjYNdqLgNII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006222; c=relaxed/simple;
	bh=XhO4io2Aju7MsGLBRIw8Ajg+lUUzja5tNn6Qa3latcY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VJmaQweUKN0C7Tij1AyqeVz9mQ1YmBtpQe2+6L+RbFIYTQ/2p+wVn+2YMVQeVb6O5j9Y3oSKBA49npvaKQ7iT/CRTVHNF2AWasmU5u2PplMjLT6TepTs0iXoW/3kLAu0CcHI/7GC6gOFtYOwAmVbTOqwYFNtGEa2+iDYtvlNRrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njpORgL7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njpORgL7"
Received: by smtp.kernel.org (Postfix)
	id 435A91F00A3C; Thu, 28 May 2026 22:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8DF1F000E9;
	Thu, 28 May 2026 22:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006221;
	bh=FtU0qT39dqI1shFwDJys2/PaxfhW40LZ8PpMZ3DAAVE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=njpORgL7iETAV4/PqhFEloYo0+t3e4Vgo2xXnmlxFbJ7TiRcy22+0gbPJOT4VK4yi
	 A/BQRyI+/n+vP58SfcQcSEPjwfZsOf+tP+tw+CzoTI1NEeX7jeTMoURYfoj4jqoDU9
	 nNx+uf75j1x/OSNqPInWissOIaVhHy0ydiDJtb23yqXPgxLmzw9i5Ema8NnCbRDqup
	 SKQ4yavFoSLT4pRQd5289gkNff8IFFFetUec6ZWMZq0lO56aSPQfBWuuN5mDcGnDgs
	 4vNHgG/BAOFT1bEAdB8m6PTeN79ViCyluVOnLqf+tBQgBUzl5yKJmdJyK3izGt3Eqb
	 H/ck8HE2Z1LvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938E03811977;
	Thu, 28 May 2026 22:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000622513.1533055.2640992885440710331.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:25 +0000
References: <20260526145326.3243-1-andersson@kernel.org>
In-Reply-To: <20260526145326.3243-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 May 2026 09:53:26 -0500 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v7.1
    https://git.kernel.org/soc/soc/c/d1b903651393

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


