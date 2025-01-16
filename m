Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBE022B8DA
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043297; cv=none; b=udpMe7n/lWtaiOWmOQ3dIMB1NpG6jJC/nWd86HYYeaaSH9i16ma9AdmnjpAo5L9c1RSWgyc39jviwDqG1i1MfbcjZjPbPno7RIZ/dp1FqSoyOHhbEb3qXz+AMLExURb8om6S02Yzy6ZngNVuQO3K7rNr2lQ5cNnE6MCZrzGHfaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043297; c=relaxed/simple;
	bh=nNDBtrYJ5hIkJ+iLp2tfqicgF7yGS3d2OQgx5PBPLfA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PmRMqX03hiUj3OoLAxIzPTLYDP8ZpGo4bjM08A8tvmKHNkSSe2pJOuV0xasFmyIEcmsRo8qKsq7uN70EtrBlhh/kqmtlwYl4mDtYyESn+NMf1ObfqtsyvKN552JsyUe8ccJ5/I7Fk+Qc/OMgHN8O1dQ+IgNSO0FOiGcbWyqrhbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=px38Jaun; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="px38Jaun"
Received: by smtp.kernel.org (Postfix)
	id 3F72FC4CEE4; Thu, 16 Jan 2025 16:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285A0C4CEE1;
	Thu, 16 Jan 2025 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043297;
	bh=nNDBtrYJ5hIkJ+iLp2tfqicgF7yGS3d2OQgx5PBPLfA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=px38JaunL2+e0jX4/lqeF1xvXVXqrdeoOw7MemZ1mNDcVOFOVmGy2uB33894+pHJ3
	 spPZev7K+DVZ9bKLt7mIXa987JZCiJMgC4Rs63W7Aq3StNRsMAtsuOb0n54/cOsv2v
	 BtlzNfQANPs7qdFc8oIl1ai996RbCfuXTJRrP8EZMhtphHEC5vpIeHWF0hQT1SXjqz
	 brQdZyo/fL55o+aj23euNgf6C+dD/n9v4zLBQXa9KssVXKBKF7tvNpKYPSg2RI4hXa
	 Sa7C4PKBy8fCcqRQY4Lbrl8gLS//8lUJ7vuxrL1dERAFUuG6R35GrPSNFc5ebPNd8v
	 39nKOdQPyayDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E71380AA63;
	Thu, 16 Jan 2025 16:02:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 DT updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173704332023.1501791.12817837589678771323.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:02:00 +0000
References: <20250107081424.758980-2-claudiu.beznea@tuxon.dev>
In-Reply-To: <20250107081424.758980-2-claudiu.beznea@tuxon.dev>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  7 Jan 2025 10:14:23 +0200 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 DT updates for v6.14
    https://git.kernel.org/soc/soc/c/6253c6357a49

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


