Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529AC30BF60
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946625; cv=none; b=CsX96k1WKPnY1K2s5NVpUKWhKTKGdR3TpfCH+mCMbYjrkhTHt2mDeG/i8kOkhtZxVifyZKuO0JLXhFSZ4WOmbZHtKlNUkn4l8f5sO69nLbCgVQ9B4zQPJgoFKuSKl8Mx7C34ySMx3U7zYiTbH4Zyn5vXnAvSZazOu+8flpeq9zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946625; c=relaxed/simple;
	bh=rm+bQF++3Z/zsENc9EK4lYGmJUPcJPdau973XUMM2tg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OrOPVQQTz8yIhPGzVbMcXG+F38l0GQBJS0oq+XPX8hGh1YVrJbTCtR8wsaELF3NpnzhfKJ5QPOjyNWFQfNWCaxMY2kKIayAGIrj5C8qMoKnwrZOqnpP065hy9TB/H4jAuYbPTjjf8SjJmKdbAk0Mz3hJPlVo0CqUWx15XJ/dSo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxeSNO8H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxeSNO8H"
Received: by smtp.kernel.org (Postfix)
	id 49BFBC4CEF5; Mon, 15 Sep 2025 14:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344D5C4CEF1;
	Mon, 15 Sep 2025 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946624;
	bh=rm+bQF++3Z/zsENc9EK4lYGmJUPcJPdau973XUMM2tg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oxeSNO8HeWQDM885pZO/5Jk46/PpoC5BIBWCLAeRqVyIZFoUfXEbKDINbsdNGkJVq
	 GMbANLPOeB5KHsD53KvQBAWIa1G8/Jw8ugjrIgG45sb5a7rFGdYkuyy09llGPYs2gr
	 KxwMHnbzYOOKkc4olycnA/IpqEv9xyAHgCA5Q83qrvUxu8Q5bydcKsvxGZE/oEeVOs
	 3eza59RiXtafmEdt3svUtmDyMktdTdM4xuWsU7OR3MefImXndaYVshXYS7RQswqC8t
	 bWF2XOToEKhP13W2PY2j1Hjvd2QjgbBf2dmup/v/Nmn9I3+BZcNEPuSYb7jNbXF8c+
	 a2DorHnDoRl3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF1039D0C18;
	Mon, 15 Sep 2025 14:30:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] hisilicon: driver updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794662548.4799.10254235293637428628.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 14:30:25 +0000
References: <68C376C4.2030808@hisilicon.com>
In-Reply-To: <68C376C4.2030808@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 09:26:28 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] hisilicon: driver updates for v6.18
    https://git.kernel.org/soc/soc/c/d88449249152

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


