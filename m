Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6A8DDBC
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 15:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111907; cv=none; b=Xlyjy7zQYeYWsCTrkhezPlIFvDL2eZtbxZUnapSneRJjCUQx6Xj1O3POVbhpX7wsNgm9hHOKgHJXJS8gfLaXdrVJijszCHpHBBkA0i+xx3vzedhbtIN5BLFn2Cb+p0Abj9PKExhyho9eCbbYMbfJqYN2DxVrXpgN9EgZf1uYaLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111907; c=relaxed/simple;
	bh=g0UG6Xck7/RIqnfdz0eVdpvX/zsvjV+fg3xsDiZhYqQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=j3MUDXhsTRhAvc9i0hLyrCtrVXFdA/fIVfT532f09L69oIrnNDJicHsltcEaUn7i1XYWJ5+NYt36ekn1pIB8emDgc0Q8YZ+Gmudik7ErrMi2C16uDHzRdUWnfzBtiBUd9tq3Agw9CxeCSqmA6UlzpKvvq/eftmHwnQ+6F7KkSdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=En/VgrpI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="En/VgrpI"
Received: by smtp.kernel.org (Postfix)
	id 04D73C4CEF6; Mon, 21 Jul 2025 15:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3726C4CEED;
	Mon, 21 Jul 2025 15:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111906;
	bh=g0UG6Xck7/RIqnfdz0eVdpvX/zsvjV+fg3xsDiZhYqQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=En/VgrpIJ1+G8o+4dUg3VDppUTX04n231NX2Dj4DpM30MaTw+Ol+a+mGYFhcVJafF
	 dOCgyrLGITbRSryPsuMFPhJLfuB/pUQDKL5Oa9/zdLhBs7G+DByaw8+J6haZ9WWSMt
	 KDDbTqUjxLSOpcbSkgn39S5odJT+O9HzDclU4BAGqwjE9nBrleACMAF2sH1nQQELqm
	 SJ7vPwc/2mmAF6wisrovJG8WHCwmyeoFuvni5R+LF0DqILiabU2Yh8eY+Mrwgkt/QJ
	 qZkzesSHQLqPXvTkXQn/X1GIDxxPeYvPujtX1svEeXbtjfz8Qs6DfgVlTZXXS0eoVg
	 TEISt8T8XjWfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACD3383B266;
	Mon, 21 Jul 2025 15:32:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] arm64: defconfig: for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175311192546.94241.11691724763064058302.git-patchwork-notify@kernel.org>
Date: Mon, 21 Jul 2025 15:32:05 +0000
References: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  9 Jul 2025 21:15:20 +0200 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] arm64: defconfig: for v6.17
    (no matching commit)
  - [GIT,PULL,2/3] ARM: dts: samsung: dts for v6.17
    https://git.kernel.org/soc/soc/c/ad6d5af8bb01
  - [GIT,PULL,3/3] arm64: dts: samsung: dts for v6.17
    https://git.kernel.org/soc/soc/c/e65761ff6b79

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


