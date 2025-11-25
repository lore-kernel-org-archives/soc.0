Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C5F1F12E0
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078663; cv=none; b=PVeDLTtSNhNydcs4ZTxgDAieRg9FuEhvf8FJ9mnxQSjHOvsKTNNWGMNCeBZ4ezRI/XA0jyvqgCPUpLFt3XEXSUXtId93+WUNMkSj0Nm9xpDZrVN0aUaSM5u4Rqbc2p9Kr1cuB2+8c+4fAGk0q9lq7vHMdSNLcWCU3f4CPsg0jKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078663; c=relaxed/simple;
	bh=gWgia0TxUxlPtpgZtadKivre+B2tFj5BV6OHhQZTHgo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=R9LkIOrC4fDVpGABpkQ/j9Tl70tHy6xvVQnJ4OaZc2vAeea7DSsl5e9WDWwAlXoytBEAJORLlIbKH+knpaTIzq2XA9aWWwTJ/wWOKZqJMf8j5PhS6zEukShDKCejHN+WFDG8FT36BNEKoGtGanMqRaHMoc0TLkjmFm3k1AxO7P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2oZp/iP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2oZp/iP"
Received: by smtp.kernel.org (Postfix)
	id 09EBFC116C6; Tue, 25 Nov 2025 13:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FDAC116B1;
	Tue, 25 Nov 2025 13:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078662;
	bh=gWgia0TxUxlPtpgZtadKivre+B2tFj5BV6OHhQZTHgo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=F2oZp/iPR8QI/I7WI0pmg0CRgJ7ptMpVFbGDJaiqgLm4MjplSpYw4bBzMyv+KHjau
	 6nxzt7yPfHB7BqAVbCf2nr8d45dnmE0nbFwUqV6eYFsvKNzlyJw56Jw0LJztPfNLtL
	 jkZ6qjNZl0G4UxuLBLHJVEXDhR4cXVA6Qk5yIhKXvmxaUJp6mVixLljvgpqOozK1aA
	 RyNeIWKojK7MZONj1DfMBAdmkNO1i5fJXKRbxumV2WJo8oc3kd1aqN285M6iMwvxtr
	 1XTjAG00aLlD+vIe7QZ5eRIL5nqUkEs4ljwZ7zI27EeCJvqVVUFPx8vWMvCVjwZyVu
	 i8MZybnKLxi4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD9C3A8D153;
	Tue, 25 Nov 2025 13:50:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc/drivers: OMAP updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407862544.736376.6927539326527081394.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:25 +0000
References: <7hzf8kk1pz.fsf@baylibre.com>
In-Reply-To: <7hzf8kk1pz.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 09:28:40 -0800 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/drivers-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc/drivers: OMAP updates for v6.19
    https://git.kernel.org/soc/soc/c/a677d87689e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


