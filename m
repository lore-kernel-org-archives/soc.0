Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564A430C361
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662458; cv=none; b=jSwoonM5XSjLLWKGqpUqMX3RAJWP7x6ocwrHK16PFj2OlBhGdR/GiGn0dnNfgPC3MWAPr95EIQpDFR0jbo7HSDqMWAVF0KenXBru/bzt7PLuskAxh9hco7g+bOrq4lu7v5FRFw0719C/nf7fJIUuwSpmugfQY4pnBs+jwywM72E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662458; c=relaxed/simple;
	bh=x2CSpfrsmqChOdHQ9P4Zy1NnQFuSTfnHkt53A4bk3ZA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BHq/GkK1D35Ed2BvTW2nzSwZ7dQ1HmJct0E0JRxvU90PUd6BSuQ5XD/mdXHm/gucnr9b6tUNjCxDK8n5gD+ODGNhxW7dAqalpRmI8vVnYetKUAaSzJNcnODpDARLzaF5zXMO+qI+QZ1YACmFs1uhSXgcvazmR7W13Av6nePmU9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8JRxT+3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8JRxT+3"
Received: by smtp.kernel.org (Postfix)
	id 4CB33C4CEF7; Tue, 23 Sep 2025 21:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37029C4CEF5;
	Tue, 23 Sep 2025 21:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662458;
	bh=x2CSpfrsmqChOdHQ9P4Zy1NnQFuSTfnHkt53A4bk3ZA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=K8JRxT+3QIbiSvucPcDgHdgSI6v+TZUUZGBq8LW+i7qH2zZquQYEsTdlExRFLodiN
	 Q6lg69dqFtmspRbT7jXr/9wNUTSPYacSJzunij9GvNtPOtEQX3mNOqhoqxDnI3N2dt
	 y/czLZOzsLtVWwL2BsSI0KpJwdjrWr63bMwANT0ZhPR3QC07xG+SZ70NJTgvLfBGI6
	 1V4Jxs8a5tLXbdoP5JZG5JTpAHg+g9KGWyAUP7+KICnekS0eMQ2dDtixMeoGajawcw
	 21VYVf2duZljgugfvbAhTEF7zGLntSh/rplr3t3EsuGTaUx5vH1yVbICw3YyiHTTC8
	 zO0N5x9sURFFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BA539D0C20;
	Tue, 23 Sep 2025 21:20:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner Device Tree changes for 6.18 part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866245524.1926563.1299099811997940103.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:20:55 +0000
References: <aNFg7iuBtyWkCZg6@wens.tw>
In-Reply-To: <aNFg7iuBtyWkCZg6@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 22 Sep 2025 22:45:02 +0800 you wrote:
> Hi,
> 
> Here's a very late pull request, adding support for another board.
> This is already included in linux-next, and doesn't show any issues.
> 
> The following changes since commit cca07ac2b5f7838b8ff612b53b9f82ac8cb58312:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner Device Tree changes for 6.18 part 2
    https://git.kernel.org/soc/soc/c/a08be517c450

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


