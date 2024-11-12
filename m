Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2972D481AF
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450702; cv=none; b=Jrh6pVFl9PWjWLPl/pcozRkBYzxTqDXpfwqqXWfUtgrj2gqQi/Ti+yVjoaJIlHyyOLs+ylGsg9+XMhQEMHdTL7XmvP0YNDqGjstP3HUZgyGVW4/opQhJhA4HyKp7RuC7aq1evoTZ5Z4Se0lFN/9LqgktqGEKaCY/sLwu/EK8DR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450702; c=relaxed/simple;
	bh=caIFQfYwaESkj72Rt+PWV++24sspy3K6nyiB8jAPmYo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eyP48A+kbespWb8XpzS8akDJTu4SwxXUBQkpelVQAoMPfX1GcKR9maYvHxsCgdim1A5Q0NWmN9kl+RlzWgtiSsgjya5CljN20WdCf9IBD+c7vZlE9cq19uel+rLwpWJnQu3qr3QrXOnj6vhyBIzFP7YVECnYdWmr3ehhF9A5Jfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckJpAoSw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckJpAoSw"
Received: by smtp.kernel.org (Postfix)
	id C7AB3C4CED6; Tue, 12 Nov 2024 22:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B32C4CECD;
	Tue, 12 Nov 2024 22:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450701;
	bh=caIFQfYwaESkj72Rt+PWV++24sspy3K6nyiB8jAPmYo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ckJpAoSwy84bNUKyh8391qjyKuFXcaF+bgz0ZiIxc7IXAU+RjfsOsGQHZp5tWZKZa
	 +FGfL37ryrO0f88/H8rVTmaX4YnLBl2al06AxjzoiXMCUyRIQJej47zYERUq/BoLp7
	 YPnGhkurrRLWR52WCyiuM5LE4/ROpAe0eNCtxYUfcuWj1nB8LuloRrc/Sod+OWqZQ5
	 CdEUdfonezpNdooeDXfqJgwAs98d22Ed3YtluS0bbPTHzLZndGp50RTSj7nq/AK30s
	 9uek9WCx3JGwiSB/1pJxDnXw9MSol1cJnyPK9Q/wwqm0jYFkZSwTHQy2gWWVJX6jOO
	 /e9sPI5RkvCHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C533809A80;
	Tue, 12 Nov 2024 22:31:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom defconfig changes for 6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145071173.694695.11762950287505541905.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:31:51 +0000
References: <20241028035449.734504-1-florian.fainelli@broadcom.com>
In-Reply-To: <20241028035449.734504-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 27 Oct 2024 20:54:48 -0700 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.13/defconfig
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom defconfig changes for 6.13
    https://git.kernel.org/soc/soc/c/7d33d08f3c0d
  - [GIT,PULL,2/2] Broadcom soc changes for 6.13
    https://git.kernel.org/soc/soc/c/1c8f196da9fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


