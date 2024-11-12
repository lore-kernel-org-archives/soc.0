Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC39481AF
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450700; cv=none; b=AfIjOzGYv3cPDNZqsyJVOdL3wYxQRvZaqErQIfL+H1KL8Rsd7mC3v8pVqeSq3MkMHAgezMz02mBRYAeRS87d9MRLOh0hKpNXmGM1sJNxRfnrLHrv2iw9FvzX1T4nFWNAwVaveQNOjJ54mWpS3eZKCvrkcM0rEBsYFtsApp2PFvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450700; c=relaxed/simple;
	bh=KHzztTk6xwIoRfdaQh5cTd7P2YYfwnHIJpDBscIIUno=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FcW6K/8+07dSAZeBryNtyjofM9S2uSmcIoX1hrb5XzlUxeFOSPW7TcRjQQFxnkAZ7FoVQrgcXMAPf7tBINcPxPPw8jzAG07zRP1/ql9eyBVIkcq55p2A1FvlqEWa91nMCti2m97EXc+EWyYr2p+l6CAh4Z5FTnMpwj+zAjrI54I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haAm3amy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haAm3amy"
Received: by smtp.kernel.org (Postfix)
	id CD9E3C4CED5; Tue, 12 Nov 2024 22:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7867C4CECD;
	Tue, 12 Nov 2024 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450698;
	bh=KHzztTk6xwIoRfdaQh5cTd7P2YYfwnHIJpDBscIIUno=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=haAm3amyUau+sZZkSGx67QrD1aLg7XJU6FFG79Xcr3q4F5HyRgMTZ0vl2fvAuXhbY
	 KLdw7fmLx1hA65c0eaIUh0YhOG85E8psk5wYgZlYFTyY1zNB/Lqgp9kTV3LXnQFU22
	 GzvdYgxetG9vLwId3bAfq+ydM9aFMHDhUoZNU9NQqXVqI0Oz+UmJcLs2Jwx/+CBbBN
	 WK1EUAv7oGlf+RAeZ0lkmpZE4FJD0+2yFeyWng8Gn8TAxSA3j+qsiDr+nAn2iAU4Nn
	 Lp5Dvf5WsYq2AsSJsfEHIngK5Q8Q0LPZ/o/SPJ3M9zo0m8o3OX6rw7Nn+rrWF+V7Ic
	 E1bEvk9SKqD4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DC33809A80;
	Tue, 12 Nov 2024 22:31:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: ti: K3 devicetree updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145070874.694695.9801185800124731412.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:31:48 +0000
References: <3ded4795-2186-4e06-bda6-9c9a65a3fdb9@ti.com>
In-Reply-To: <3ded4795-2186-4e06-bda6-9c9a65a3fdb9@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Nov 2024 19:25:19 +0530 you wrote:
> Hi ARM SoC Maintainers,
> 
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.13
    https://git.kernel.org/soc/soc/c/d745bdcb7ad0
  - [GIT,PULL,2/2] arm64: defconfig: Updates for v6.13 for TI K3 platforms
    https://git.kernel.org/soc/soc/c/3fba54700b53

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


