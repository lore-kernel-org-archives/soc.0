Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019416;
	b=i3bdCLkQQhLSfLbKrKkuZg12bVGEc4hWoA3N/YfUDrRZD94Wk32BoaYfYyDBwsmL/cOB
	 vMb0+y+FBmiq/1MTefVDo+G8eZ+Fo/SWH+mFm8k2izdjXdJxLW1mnofG9CfLzXnL7XF8L
	 q+McsPbdapultVOEeIwl9GHxV8B4z4mNERzgEkYOJ6SYVHP3Oh8Zcrn0ddVkUE1/iGG4j
	 vk4/0a3njhkrJpn2IUuLZSOS7EV1BHIpRhx2gH32hr3+2hV2wJ9BBXFvInLb5tQ4Elzub
	 x/BG5HWjR+BViXxXr0uZKM77TpJ34ZDdSQfZcIBp+9Kl3jx7Be0MSSLMU4sm1AmDTPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019416;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=WPCUlfTLuAbSx7F3/KRUufV8/4c7ubgwCzc0mHExrI4=;
	b=M54TezbCtyzjUIPducrY7BOCYQqU6xAdCE7o1NoiLoB08mTKskjFU4Xud5TjGggArj+o
	 OqD68WxDw8xguk16Rx3xmi+8owa4imsnRPxo94eWbICRh6pPPnEG7kaKILhSfiSHr/9v3
	 p74SZ00j2NWHn/wBEE7YDLrBZos41sRL6FpRmJvcZqzttxMQzv5LvNL2Fk9bmYQABAGFk
	 0bbzCp+kqTL6H6wTLAbiur4ITzxEpmBS+ybwDf/xDUt4IeTFeh0nGS1oTG44Jdstj9AAp
	 vDhExMpMG8i+mfncSHbrX27+6Rgqle6sBJmYyuQ22qpJZV/gHyCymO2aNBhmDUdMDYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZIBGYJrG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0582E60A5BFE
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZIBGYJrG
Received: by smtp.kernel.org (Postfix)
	id D86741F000D3; Wed, 18 Nov 2026 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C187A1F0181A;
	Wed, 18 Nov 2026 16:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019415;
	bh=WPCUlfTLuAbSx7F3/KRUufV8/4c7ubgwCzc0mHExrI4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZIBGYJrG4BnF2XLkEKc84dFdRv3cboMWGh6re//FYNImeTlSmPAYcgZ//qp+dE8GO
	 BtDPSDIVnpGQWbbROP3mQzFJTMUFNyUoWXhN9DVzgpdFGrl+5jIYa8L6CnJnA13cxy
	 tQlHU7fKSM03xXo4nV0dbfHkORt6bKLRc8aajsZfR2WPXCCmB97qXhCXh3DywAtEXB
	 CsFIJ7WjAab5+KBtywh5MSv+AHQAeQseal45vxyZbSRpVtrmg8+ZAkqbmDrlV5lAin
	 Ww/h0B3NoIVtzmNOouC1ERGHIcxN/vW6fbHc57VMTSWuDdVQKltj4ZWKXeVJdvMIKd
	 g//w0Chxmw0Bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43383808210;
	Wed, 18 Nov 2026 16:30:15 +0000 (UTC)
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
Subject: Re: [GIT PULL] configs: TEO cpuidle governor defconfig for ARM64
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501941427.1837438.10077973676612728591.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:30:14 +0000
References: 
 <CAD++jL=Jiy8tRd9KjMQHAd==HkfdofeU5NPoRRejvWQgexKdAw@mail.gmail.com>
In-Reply-To: 
 <CAD++jL=Jiy8tRd9KjMQHAd==HkfdofeU5NPoRRejvWQgexKdAw@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 8 Nov 2026 16:21:34 +0100 you wrote:
> Hi SoC maintainers,
> 
> this selects the TEO cpuidle governor as the default for the
> ARM64 defconfig.
> 
> Please pull it in!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] configs: TEO cpuidle governor defconfig for ARM64
    https://git.kernel.org/soc/soc/c/a644f82d4637

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


