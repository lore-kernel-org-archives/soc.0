Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520C01F3D56
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944272; cv=none; b=YJl4qzBK3VZh1STAzgwk7VDKAJJWegR0MD3uyQiBTVwg5r559J29qEMwgz+LfK8+q+/vBIqkyRF+BEKazxaUa9UmtCwofEgTxV/4t2HfXbigpvuXdqsFMa4PD9dD1W9jHluTkUnCTLHrOWy2tzv9PBDqwR2hYzyjjUgg2huptIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944272; c=relaxed/simple;
	bh=Y/EGRpiHnCr5LeX07GsJAWcL/JslTqP6cLnHf8jc/dk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mYWmL2ZrqgJs70RHBU13M/cAOwTr5R5fslnAexF0KVG/9MenDAbAqDPg684wBeenPYPQvpHwiTshuX7OzNxvPyc1A3RVZc6v81XyX1q3tERSkM95EV/zt77CoiEjXpZN6q02+6OcvrmHC7VmuZ1ZLxvnKfwifO5gZ/iCqxooS+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVhpGqkd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVhpGqkd"
Received: by smtp.kernel.org (Postfix)
	id 470ABC4CEF5; Mon, 15 Sep 2025 13:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD43C4CEF1;
	Mon, 15 Sep 2025 13:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944272;
	bh=Y/EGRpiHnCr5LeX07GsJAWcL/JslTqP6cLnHf8jc/dk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uVhpGqkdaZGVJq6UamPu34NDHUtrqK63DHKu7TlhQSxsKhtOX+aJWBt0IPtN4sMAN
	 h8UxTJYRlE/UqAB8dItTab9uVVlqUKlxyhnUKXf3+PA1sYtdT22yztPMJugUUnqjhj
	 fZTdtQ7tMbbi/FW1rKsK9+N1R776P0l3jModfyefTLy+2L1h4uRP/rVI7bS7hCQijt
	 xZDn/mrAG93tfT7WNufgn0V5vAb0y+ww0I9kbZGDtuQCa51/5lF9Wxq6vyvLylITpv
	 twePnfMar6u+oVAU/DtDRe4Dcadoh0fJW2SDR5nKrG5qxTSfEGwRvHq0BcI2ZHDtk4
	 49WNwKAT8W/Sg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADF339D0C18;
	Mon, 15 Sep 2025 13:51:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: cleanups for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794427367.4179625.11622812291816293894.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:51:13 +0000
References: <20250909182256.102840-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250909182256.102840-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 Sep 2025 20:22:56 +0200 you wrote:
> Hi,
> 
> Few cleanups which were not picked up by their respective SoC maintainers.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: cleanups for v6.18
    https://git.kernel.org/soc/soc/c/b425afb34884

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


