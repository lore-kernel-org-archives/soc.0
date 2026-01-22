Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2780A42EEC0
	for <soc@lists.linux.dev>; Thu, 22 Jan 2026 10:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079014; cv=none; b=t0l1lh/248UxC5BDzTXfX/dymJUlJxow7MdR/qzdJ4DfFt3zOLTw7RYvXWQjGgDRLbEcMyAWawB5DBzIlQgoOZcsOb6WbqkngIbt5SzdVcERhO33EQSdkKmhC4LwiyQoIjdMX5pLUKf0+w8RdIGs3L0xP6N9BclbFn4xxHGe9KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079014; c=relaxed/simple;
	bh=76zWeTIvA6OU1H49D++hkgaiT/YFrnH5RW7WoKUMJhk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=r1/aZzTsa8glVr5nbPIyWhuIFVNUqgfwsmfOLjjjXIbx/t6CKUnWXbcARoQsQu8p3A4VP4nqT0vdENDJcMnoF2btVWd68osS2q8uep6EN0yEcXf0IMlDo0wej9YSLJ4EmXc9/T2+xB2PVIuNzT6p0EOFwxb97KBQCaMYFkcnVEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oi2Kb5Hf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oi2Kb5Hf"
Received: by smtp.kernel.org (Postfix)
	id 8844BC2BC87; Thu, 22 Jan 2026 10:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F53C16AAE;
	Thu, 22 Jan 2026 10:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769079012;
	bh=76zWeTIvA6OU1H49D++hkgaiT/YFrnH5RW7WoKUMJhk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oi2Kb5HfvJldrheDKvCRrIugL5dpK//7v/i1rPgwXGh4FbfzPm07+C0klKkD4JL4s
	 8FNdJxIvp8YiFuvBZFh2D7Vgy54/2fl3zmmnGwF6jrKh3M1u4YM9VN68eWtU/pN3ME
	 u+ZYipvnBRVzYCXdMyotLGXsiJbbnvuIFG0xynjk8z1HYkY3VysftN4NW7kgOdbd0R
	 3wd94HkGJ8ZbzzTYz6nP+Mwww78xbdh75p4FMPDtgb1VtB6OEVUwIqSkbhjRI6qqSV
	 H/tG7+n4OhuHPimXgNYVnT+4miYqV8IGcVeY7bCpmMMx5sS/GKRVMB2tdpPWTa4qsq
	 9KCsY+aecy2yw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4E92C3808200;
	Thu, 22 Jan 2026 10:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: second batch of arm devicetree changes for
 6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176907900909.1663980.15857196270959925177.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 10:50:09 +0000
References: 
 <c7002883dbeadf44069ef5e8cf573d9f2aefc899.camel@codeconstruct.com.au>
In-Reply-To: 
 <c7002883dbeadf44069ef5e8cf573d9f2aefc899.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzk@kernel.org>:

On Fri, 16 Jan 2026 12:29:18 +1030 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit 459a5aa171c0f13fcd78faa9594dc4aa5a95770b:
> 
>   ARM: dts: aspeed: bletchley: Fix ADC vref property names (2025-12-17 15:53:31 +1030)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: second batch of arm devicetree changes for 6.20
    https://git.kernel.org/soc/soc/c/0a976e907a15

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


