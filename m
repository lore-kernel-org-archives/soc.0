Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EF71F80DD
	for <soc@lists.linux.dev>; Tue, 15 Oct 2024 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729025427; cv=none; b=pxzc7YWTLWMqeZeqeEG8808gHlsT0lQoWjEce1bQ+0HmPClpeI/AZl7K08Y1MbYZ+QuKB7A8E5HYF/L68iNMnFhGUqwHdAWrBuC43VaE4iQ/mT34j3qk5ntdjlba/rimBWRC+mr5kXOxvxLR01YA9bHJPYkGhSbYAQET8E9prrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729025427; c=relaxed/simple;
	bh=i26v31GkBbJiP3B5qEuKB8ecqrq6N1BxTZ7tJ+fHbdA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eGcpe4G4FUgCzy/ik+958VR5U6mXZ6tAujmiuMmkoi1grJhce06T8vq2oEe7GBsVDvXrjEZy5rEIW++2nFnqF3qVNL1W2HUSYqDZ7dEq64VMxFHSBVS0GZVfLPAf2wjV3pXGVNv/GfCNuiNU1kz1btfzbqVnwyEwgogtxS+SPBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXvIYD16; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXvIYD16"
Received: by smtp.kernel.org (Postfix)
	id D42E2C4CECF; Tue, 15 Oct 2024 20:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC9EC4CEC6;
	Tue, 15 Oct 2024 20:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729025426;
	bh=i26v31GkBbJiP3B5qEuKB8ecqrq6N1BxTZ7tJ+fHbdA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LXvIYD16Oca/RU4NCKsES0wIFEqpSBuj1fS3iCLT1Qp45Pa0InIpK1O7Juym6OV4c
	 8O99Ip/LwCJjChKyESQJLrSTEXdtV6lkGk5Ian3WL9XmY9jEagHik1K0acmq2ToYBI
	 kBOTSbDWBQ8AtdJteqZ31Q0+yP2pXvibM9hi6KY/xCiULKDwqBm+hPm8efEUjk6s8a
	 0FtAjqY+b4Hy30XRsXXGjBrNHSFHeybKdUIkVYc/AcNCf2mrHU8oEjgqL8tLQCViA2
	 aoXv9YvsXPwH8yj5/yfCFlfAi5CXa+3NWuuAqCPnSq4izPEHIEn6dmpaSEBwYy7kdU
	 +WQK5vfSd3NtA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E6A3809A8A;
	Tue, 15 Oct 2024 20:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172902543200.1289026.18187591304165770961.git-patchwork-notify@kernel.org>
Date: Tue, 15 Oct 2024 20:50:32 +0000
References: <20240930165733.1541936-1-p.zabel@pengutronix.de>
In-Reply-To: <20240930165733.1541936-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 Sep 2024 18:57:33 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v6.12
    https://git.kernel.org/soc/soc/c/76237ff95bf7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


