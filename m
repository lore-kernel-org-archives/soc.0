Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA9335E1CB
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006220; cv=none; b=kE52xdMtSYeN+/Mjo+rwTC+S4rddHBIAe81Z9TQhTbs+x/L00ljkhYWggCVnRgTZoRPOxwyYvLz7vUVVBUvC7vKQBGAmXP55zEKuzrqDG2VhcH0bIoMC6AWcHEAiGj4sEE+YQgMxYLA9yuJu0ka3L7yKY9cElN+DFzjlPZrXrxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006220; c=relaxed/simple;
	bh=01wiLI454QMA/w2o3PzpREiIbOxSUmLCAUhn8l2ZW0A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UUFn31pNwYs0fNL3KJiwyKLjoWHNa1IXXeUYokJ9vEHluNc+X9jG9GyRG48rFCBjdd7L1/t8m+YKyBMMUETqOtZtTpDmrGvaD4IrFULRTlyJGCOKxP2hxZ3jrfWebLWcQqX0FT6Kgvbgljq8xJZjEADgZ3biRZ2xCeodKA8yKfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWKlsj0A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWKlsj0A"
Received: by smtp.kernel.org (Postfix)
	id B8BE41F00A3A; Thu, 28 May 2026 22:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B471F000E9;
	Thu, 28 May 2026 22:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006219;
	bh=u2WWJvTCGTwNE1obQhqbzzvvBI2WXa57fnw9GSx14tY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RWKlsj0AaSZ9uzBrpkbjj8E7tZZ49e23i2L9rRNGy8FqJ2q68Ecrvg5sWT6jQcMYN
	 1TssvZ7zxMZERusk1VtvG6wzVBiJRjuZUwz2wz+M7Bg+wAN9nBeaLTBe9T+BTrvlZR
	 kabEtl3ZmTt3sFGZoxMgBtsmwltrj+KYlFWNtKAe6Vn6J/1CHHIh5tT7Klg8MB2x1B
	 OBTC1W+0kxqgEz87paDVW4LaBU4FjeZ80eX/RbMrhBOP9rNOLnLoV92mWIX8qfAlwV
	 S7+17aL/7iRqC880sNkxHFhKXYmgmdCw8pRcY8B+KAgkzOu80o9VhcXuH/xy9Ysgl1
	 eSn7k5u63NVTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1987E3811977;
	Thu, 28 May 2026 22:10:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000622363.1533055.13807699476878586197.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:23 +0000
References: <20260521141410.GA1708231@rayden>
In-Reply-To: <20260521141410.GA1708231@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 May 2026 16:14:10 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull this patch fixing a use-after-free race in the OP-TEE driver
> where a client exiting prematurely could free a request still being
> processed by the supplicant.
> 
> This is basically a resend of
> https://lore.kernel.org/op-tee/20260316071210.GA2470832@rayden/
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for v7.1
    https://git.kernel.org/soc/soc/c/56d582972068

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


