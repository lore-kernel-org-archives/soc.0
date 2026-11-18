Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017626;
	b=wr/6g8AxLgJ3RA2kOoLH2B3hlqhp//gx0ECOyC0Nfrr05E0aTO5YDTsra3udTaBkYRgQ
	 FHNLQs+BOH0I9pGJkjavRUgp7WM8Js7uuLPHSLX6OtwO17bWQk26BFXam+bDyBfKXaoLj
	 6jDvamlbE9FdWP+kMLxzbBRpUSLNjDxKUOBGgSahK9SaAJXoQm6nDQ60K7jgrtq5oJ8zZ
	 rB7trmQl4k+TS5RwFJmUKVpoGcjs99u9eZ1yJ0yxzT4TJabheb3fH8Aybku3vhS0PjNxo
	 RxySy5TnihR33jrWcLInnnwBVNiIU1EqZnNkYFFnLQ50Dzbee4n2ASAmxfQzhJJwQUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017626;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=nv8JFKGNbWjFwO8TlrhLjUBuSEetSdBSTsKiHPzhzcg=;
	b=pT32m9ol/+htrvlXbD2TQTHr46qDSmytYNiN0Kmq9yw8B/8a5v8g9xzO8iNEoWaH4TD7
	 WwTkJqkJ2VqDXRH/ozF293wYoxq/77gF/KD4TXY3bFFp6b+XH2Jj6hUzocRB3M7/vCQ23
	 SkY33UBwFUayiVK+dE3rJgWDLsJ4NxoVhy/qPx9lWaKBSAXL8V9exPPmorKjhN66xybj2
	 IyU8OxKxXCOqQ+5AG0wQ+t4ixmrk4Af+EOGgaThBrH0GnIN3b/JOcUu0UYPcQt0IUyjg2
	 GFVpSyeEGDlCjUz9ZEZb1XWYUKbG35Z+9SW9nzgZHJ9pWjk/8WAh/lNVBkIdOL+lpyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VWVAoqgK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB09606A333
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VWVAoqgK
Received: by smtp.kernel.org (Postfix)
	id 5B2831F000C4; Wed, 18 Nov 2026 16:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F401F000C6;
	Wed, 18 Nov 2026 16:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017626;
	bh=nv8JFKGNbWjFwO8TlrhLjUBuSEetSdBSTsKiHPzhzcg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VWVAoqgKlUo5/DnpPx0/JzjN45bxBZdElVZcLWJ/yFaxfPOHsjzmG7eUDvW/M28Yj
	 fiEEzMjCo9Y0AfYRrU7ID3pSLJz04iUj04+U68U6it1Sz/XR01c3F2QsxDmnc7ivJh
	 DaN0Kx8b+mI7er2RYYWf6zLHeKzK+eelLnJlhjgd8HAg8UgO9TGNCb03FfEUnV0NCA
	 fzkrWDado2QzJWzL/4/zUtUsay6LeqQ27x5Eaf9IipkVrVtKKPFqgcatY3zu32mfTW
	 IYqzzqb9XcjFvNCMiA19CpJ7fxOJec9Gj+7nzvFU7NSQ1pPNmHxQDbwURRwYAJhlJg
	 jWXg/tqz5bbLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A1EE3808210;
	Wed, 18 Nov 2026 16:00:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL fixes] ARM: dts: samsung: fixes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501762477.1802028.11647026623222786834.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:00:24 +0000
References: <20261113071751.14775-2-krzk@kernel.org>
In-Reply-To: <20261113071751.14775-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Nov 2026 08:17:51 +0100 you wrote:
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-7.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,fixes] ARM: dts: samsung: fixes for v7.4
    https://git.kernel.org/soc/soc/c/523d92e96d41

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


