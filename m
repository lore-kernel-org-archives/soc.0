Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BC642AF90
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874885; cv=none; b=kkzkElrL4n92LGHFu+9/57HUvyv7ZFdhFOhF0FwjNX39ujRL/pqZewutdpSWcEoOURKltk+83COxReOZ6LTmGgV4jjwjnO5/63Vluq78lcHlMbQsj3yvF66/y/iBXd/UsuXzJ8+5FtQBx7Zcl35VtcM4wWXQ0fs+eYtxB0RMl2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874885; c=relaxed/simple;
	bh=6aG2TKlIRyKFATJ6b5jL+Rx5wkhcM+U2IBmN+OkvRbU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YyUtiCiDwHC+owL9pAC52SY8G3O5quXHlNAPPsS8PM/0v8NA0pA7pthkNaTS2az+UvT0DTq8QXFGcjJxYpK3HdOR+mVwQjxHB+tDxH/OesrCzOjNG9ANHzFhvMK5qBja8GZTPo+JWP37Kf/Vb+X7AaSa0e4Cz9UGZwFP4D5YdH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ic1I70lS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ic1I70lS"
Received: by smtp.kernel.org (Postfix)
	id BD8F51F00A3D; Tue,  4 Aug 2026 20:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79331F000E9;
	Tue,  4 Aug 2026 20:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874875;
	bh=sMd7DkC0uTs/hBMnD1vlPiILNs9xb/8CLNNZMkcOU4E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ic1I70lSdohXqDP6O167GO/3PQ41NL9+od2TahsFNxg2pLhN4o9n1UxjSZz0TJCNG
	 1QW/jiAg/B9Iw4yA2U2K4RIthbimThlLDfruSRny8JhFAKYKHg/95M+oQlkrMpUyaw
	 dlt3c1cZPr3tK9bM7t/DjowVu71OdH+H+dxL8NDAMwd9CHuouO6ish9+7tBfcgLqpk
	 tbSCvjjDoDpvVsIjootYqkGiIo27uRxzPd+rAAKSIGzPEvQYSGFiN3brqQ0RPmQBLG
	 i/zLR9gUlXteRF+tyZ067lcmadOkmO6wzou56qHHhCg+A0yYxWLnSPXr8JFPRriC6e
	 zJyVDAJct8eWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 567E139263B9;
	Tue,  4 Aug 2026 20:20:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: Update MAINTAINERS for 7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587483588.3769923.15694964156962922177.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:35 +0000
References: 
 <cc2b296319ac4b52602c891ab04807bd18a32bd1.camel@codeconstruct.com.au>
In-Reply-To: 
 <cc2b296319ac4b52602c891ab04807bd18a32bd1.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 04 Aug 2026 16:00:54 +0930 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: Update MAINTAINERS for 7.3
    https://git.kernel.org/soc/soc/c/c7a127371ce5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


