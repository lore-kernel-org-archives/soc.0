Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E833C2248AF
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 21:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977815; cv=none; b=e1eGf9vgSVcVu6kZtZfy9Vey6YKofsCp66rEdy0Vj1/0rSy1j3DqvMa425foOG3HZ9cD8CjNJ7jEL8hZ+7SpJN6VMJ7I7gWvN9mPRX8LXVgkHPhFuEvD0KlMur1khbJEtm7pyQZFNs/EL5VvuOI38v1P9U3kMGZqfoW8xA9eNhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977815; c=relaxed/simple;
	bh=uU2R/sZy3v7+TsbpLQjlGJYerpl6JpqO13OYPusziAE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BNkRez37aQ/pkr2Og/P/ZMl/dyWdf6NLYBS/xx4tvDeJJxPglX9WY3+Xusz+e+cd4eWkKhvmvigUycJIHYSyGl3Jx3FuwaqMlOwnw6jKaS6ph4qMmzaXrAN7pCfEXjY19xqVOcD9AwJiBL0YM4bYAJQkxwomm8+EUfGEnuNbT34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXGuQZfR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXGuQZfR"
Received: by smtp.kernel.org (Postfix)
	id 992881F00898; Fri,  2 Oct 2026 21:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826251F00893;
	Fri,  2 Oct 2026 21:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977813;
	bh=KcnHcRE0nmTbOGBJiPJ+IOMaRknyJNqDLRlKoxfr264=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LXGuQZfRbrVPxLkM18BrzU5Wcd1qJMhg/dAJKFBcKUWgu7Q1KCHtjXwrft6geIWI2
	 OhnjSKH3VF20dc83r6juBc/FELbqCJzAcZydaGpSPz6E3tnRlFbNzHt6YwJjdhWQFo
	 tM5fJlnSOEyLlWTzRygceXgtB82N9WCWGKaBe6pH1zfLtgMtWm7H6PE+Nq/EPxcRcT
	 jCKH6p4CDoKggg6tXGfsKrgzVdoZ4atez0JQOqCpeH6cs6Oqi6c0OZjOKhklvHy7a7
	 CW/BGc46oEU+a0xau3dCx+2YvRutX4LLd1JDdvdPf9AOWfazHow8WfkNAywbEtP3Sq
	 /nNIpkKG8khLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773113811A72;
	Fri,  2 Oct 2026 21:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm clock fixes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179097781202.3602058.17258329163381598516.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 21:50:12 +0000
References: <20260922131156.358224-1-andersson@kernel.org>
In-Reply-To: <20260922131156.358224-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Sep 2026 08:11:55 -0500 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm clock fixes for v7.3
    https://git.kernel.org/soc/soc/c/1d0f326d2d5b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


