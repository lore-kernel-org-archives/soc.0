Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A45242B757
	for <soc@lists.linux.dev>; Thu, 22 Jan 2026 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079010; cv=none; b=hToc6eYwvAjmm7YSgHyKYdN3RKLeIoEISOaZwTBNZWkqVYT3ynlGU/4dfzn2KnLMOrliSZwDfZWOR1DdDymsVNh22BOoZ2QAJBrK721JRBSJY9AzDfygGAWe8WmH+vqBkc7LtOMKL0E0KeH/9V6vX2wfDLs6HzCem2m/piSyNa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079010; c=relaxed/simple;
	bh=8Eyh7nnIrbvZb5Pt10B1mETd9wjNMQYitpmFWHBJiho=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mxCZUgSFxBgKwsPl+A2QbAv0WHk3o9RxMTjDXPR/pkxVgaZDHAOrIOhW2Z0ZFSsgjLeBxVzS7k+7X8Sts8FGtr1blODYH+jP0JfTLHXk0ya5Wpcx9ZIrFQcyBuiR8UIPP+RP8RLy7c0rqOwuaFVU73JRw1Pqr7db+W1NjEFx2Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9rID0TT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9rID0TT"
Received: by smtp.kernel.org (Postfix)
	id CC26BC2BC87; Thu, 22 Jan 2026 10:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61A7C19423;
	Thu, 22 Jan 2026 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769079009;
	bh=8Eyh7nnIrbvZb5Pt10B1mETd9wjNMQYitpmFWHBJiho=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=n9rID0TTtw6vIUzKM5QeVvG3l3tjxstI9P6icJkeddbcZuuIEMxpf+a0LrBMj2jaC
	 Whq5F+9BWPNVyjfW7k/Zwn7l5nJIGM1RoUXIPMT6tm+h56iKeEFdmBjFGrd1J9l+WC
	 jwon6R9/39u7vZoHpMVj00m8ggrOPm8Ugt+L7+7zXD+uETai4uVkMiutyZDHJuEuDU
	 nrKUInZUsmOonY02J2v4RiyRYNf87/eOts+6hcn5c4diqtiDxfZfkg9m80XFY0gEHG
	 QW3wsCzEh3RrWReKTI/xBtrse2l6wdSt0YuThh91RtJdXOB7hYqn6K5aN1UuI5vmaI
	 0PpHr3nupteHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BBBE3808200;
	Thu, 22 Jan 2026 10:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] nuvoton: arm64 devicetree changes for 6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176907900635.1663980.9486566577842178899.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 10:50:06 +0000
References: 
 <0dddb418ec4d81b30e48a079ecad8a388284cb9f.camel@codeconstruct.com.au>
In-Reply-To: 
 <0dddb418ec4d81b30e48a079ecad8a388284cb9f.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzk@kernel.org>:

On Fri, 16 Jan 2026 11:59:01 +1030 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] nuvoton: arm64 devicetree changes for 6.20
    https://git.kernel.org/soc/soc/c/332bd42e2f80

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


