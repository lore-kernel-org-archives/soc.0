Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB249348C7C
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006213; cv=none; b=pCxtRkQTIeb7zDLUmRiBsRNUzTnVjQxWmbEhGISm+ntGm477uRTwGH+oAn1HJovRyebdQiLB2ezd0XKEfjfcecvx2fMN4XGsTRfpjypQ1gprDUGlc2UcfVyUaYo2m/CsU6r+r8BN+yxC4uuhvga5GZT9nEVqRSa8EOBwYlR0Js0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006213; c=relaxed/simple;
	bh=g5gSydRkAeEnQBACn/cy+OIGK/OxCF5+RUcmzg9zwU0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Tao3vIUe3TBmbFNjsSJgP54A67uqSqVAsf+AKeshNomEVovcHVfHXwRXq64AoGqLdg7BtqUNpv32zjwj/tP2muEllwBbM8qJvX75t7eigNZnkBD8VS2WEu7ieINIzr2fJ3+19uFCyaEyhZZH9G/GqLzSyi1SkpSjRn7HvdIfF+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGNt1g+v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGNt1g+v"
Received: by smtp.kernel.org (Postfix)
	id B9B0C1F00A3C; Thu, 28 May 2026 22:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A340D1F00A3A;
	Thu, 28 May 2026 22:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006212;
	bh=bpIFov5hfEarlhSyJk6UFGbpp2P20hXxQqA7/dAUqoc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dGNt1g+vuzmNmusX51mL20V9i6dCX8KW+bLvDWF9N4uGBoQ8OVsVTMF64MKMjIrVG
	 7+3u1F7gpkWtbIHi9TGKkdMtA9EMqof6o5rdrFg8jOJ+yoJSYnVZ2GUhxufQJcON9r
	 9rQS58+FrDSX6zKuxHOcKL0xTOAIUwvb+KJc1K12O1TeYsb61VzY4o5YQmvI9AI+zg
	 Ov5a6TqZIJc1AB1C5R8gBjdAAYwOmSf7a9gi6BlycGoktmYW8lUUZTypu8hKQs1Afb
	 DrxOsWWkxMc6yeOlQy/2h9a3k/Wd5JhzGhBRlOYwl1jRkeHDYfQUVmnoCxuzEcUrU1
	 xgkjym7DU/Z2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1993D3811977;
	Thu, 28 May 2026 22:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000621664.1533055.16343174653774167643.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:16 +0000
References: <20260526144748.2776-1-andersson@kernel.org>
In-Reply-To: <20260526144748.2776-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 May 2026 09:47:48 -0500 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fixes for v7.1
    https://git.kernel.org/soc/soc/c/a3a7c052725b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


