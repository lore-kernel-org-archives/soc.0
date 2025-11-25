Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D30CA5A
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078671; cv=none; b=q+7fIUfEZjEL+9EvDeQxzwiaMjhgkoU7wqKt+V4VtjWfz6ZlBur6ZyPnlk7e5QoaU0ede9uDQuQr1hXlhyPpiXMMfQs4ypSRQtBQOQKxqqisTW73/6Xz18Gq/Up3i8bfFraPUIP3bis67jQoAscMlqYDnFJjc6cXHG16bK6TODE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078671; c=relaxed/simple;
	bh=/OpOMxIndWlu8CIUOhhFVXtYhEgZMX6YrfCPgmrWSCA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NysWNNS9Gi4SJce4YgQTowQjC7b6cJrCiFRnQ0cCg0aoxcQlE9OQdfD7bC9pateKZoIeNHLeFSpZIvbPbwJLQa0nrUzm165uLViuzT/X7qKmPv8GNmAcx1axnlx4/jrEKKcF5tEGlnH2BdnQB0nq2aSG4Is3nuVPcZD0RCO/Xus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwnq1MKx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwnq1MKx"
Received: by smtp.kernel.org (Postfix)
	id 7DF40C116B1; Tue, 25 Nov 2025 13:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689A2C4CEF1;
	Tue, 25 Nov 2025 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078670;
	bh=/OpOMxIndWlu8CIUOhhFVXtYhEgZMX6YrfCPgmrWSCA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nwnq1MKxe6uuoVyg9aFl+lHC3M3k84xH5iCxiH/nnF80ti8g1i3vth4WZwQe7PQzO
	 pnhOy0IQF5/C8wr7/cywowC4Kti+ctg4oa1BeL/0tCyCe2JLyWjCnuTlPVPqSXbjSx
	 c6RN7btJe/h4Ap3NuIcQxWvCUl6sUeTMJRorDOZOY+rptsmXKfddQs9cc/6zV1FmJi
	 8dmEKcPmRd9t9nC2G6LJpbK13F850aQ14yMu1TtVx/vEgvvICo+MBt1evscCIjJmwu
	 H1qHDy7OzW3Ie/eOQdtGQqRSCOTi9tgINEzSS81xZksVkKdxl3GcWozXSHz9VrYmlR
	 Kz9Wllq9qhO5A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CA23A8D153;
	Tue, 25 Nov 2025 13:50:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip driver changes for 6.19 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407863278.736376.8585425348342567141.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:32 +0000
References: <2002416.CQOukoFCf9@phil>
In-Reply-To: <2002416.CQOukoFCf9@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 23:20:51 +0100 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.19-rockchip-drivers1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip driver changes for 6.19 #1
    https://git.kernel.org/soc/soc/c/c0401dcbcacd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


