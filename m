Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACFE34678E
	for <soc@lists.linux.dev>; Wed, 20 May 2026 20:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779308996; cv=none; b=RUFbEZGt5HeEdDW33JxFKOMsBcYclZ5/or9qslA6sAxW01eRiWB9ahjnDWypbUaOsoXhCAM7rWV4JKkkmmh0E7YfhPBsLxH9iiQKXe5EetOjKWLVxX1+G+nkytN77+6MlTdb/Y34LdDCXxPJMrxDZESvHelcCuJVkNJVxF/+kkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779308996; c=relaxed/simple;
	bh=klAY2VaIl9zlQX24Yb19YTMhL2W7Q3IJI0tgLDKmEg8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=K7qChjYkxIKzike0vYYXoOHPi1utYeuFi2FcLDYE3t5KhuloxjJ9roBxFNm+E3+LJn7KH0+jxIaa2ARkJYup6BfGrKk6y+cNW03wmmLH/19YmQG5cn+hIjPI3kWh7w/fYOQ/tMeMf1CDRCgx7p2f2pWxIUME7hls40Xd7Q+jfaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxKh8gI8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxKh8gI8"
Received: by smtp.kernel.org (Postfix)
	id 5FA7D1F00A3A; Wed, 20 May 2026 20:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B7D1F000E9;
	Wed, 20 May 2026 20:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779308995;
	bh=8H+FSv4C3zvPKIyqZJaEcyPtEHNkTlxgJwtUQjdINQo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PxKh8gI81jxh1UF7/7NrGELx8dpTymvl+NsaLN6wR2+dYmyTiO905eTPo5xlLRdwo
	 8b/wrXBWXBIycbcnaz0Dg8Y7fhVD4j7sSYWCk9dh32ZqSdjXuHLVO+G7dnfecF/eG/
	 mO+8yHSoTua+bS0CM7Fn8FE0EORjcYD6/o6BG5LdSp6gj6W8QScZDyguL5UNtBAW5f
	 wM/gh4pXTXbrPOkVsfQHSNQ1mNjwRUCA9z066vLGFtQ6DWIYhA0lPuEwo+Bo89kWi3
	 4e3j9IYPbtW6n4rcMX7+uzCCsvsUKf2U20VO2mflxcntMTQk/6ovkDj+OYe7jn2OlR
	 ZdKRKds2XEtlw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AE53930BB7;
	Wed, 20 May 2026 20:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: pxa: software node oriented GPIO rework for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177930900568.3744642.11368071398362009874.git-patchwork-notify@kernel.org>
Date: Wed, 20 May 2026 20:30:05 +0000
References: <20260512121805.26023-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260512121805.26023-1-bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 12 May 2026 14:18:05 +0200 you wrote:
> Hi SoC maintainers!
> 
> As suggested by Linus[1] I'm sending this as a PR for inclusion in the
> SoC tree for v7.2. This is a rework attaching software nodes to their
> target GPIO controllers on PXA platforms that will allow us to remove the
> unwanted behavior of GPIOLIB where software node lookup can work on
> matching of software node names against GPIO controllers' labels.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: pxa: software node oriented GPIO rework for v7.2
    https://git.kernel.org/soc/soc/c/e02914dafe56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


