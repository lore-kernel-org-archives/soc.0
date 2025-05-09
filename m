Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56136235C14
	for <soc@lists.linux.dev>; Fri,  9 May 2025 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746807004; cv=none; b=sLUSLxGVCoQj6LFm/QAJaT6sGiQ77MUJyr+eV4Et2PZsuqcDLPJk89ioqsxEOzlXShT5p9/oa7gthaLZH4Zai/fty2kONguxVzaC0zbeTNWbydnveaUuZ7Rdll1RJRVMQzmEFXQTVS35cQRC9fk84XQG0On5oaJsMhYNnf0T+MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746807004; c=relaxed/simple;
	bh=zed9e5a37aC43u4u2xfmZyjadzyqVtCYTAW3nShbBh8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hqEXBODFvGtw92D1Ddtm+Fpg9y/A074+zZ2oYLBkJenSACngjbv6MHuOQtSg6i/YlsGsEjFcsW8m0nKP7ccNihrppwLOquvrQ0DjCb0zGIxRFf0vvQAZRWZQ/bQY/oE2zoaM8YK0Cctnr5O+qMzr7wQIOVpzQ/J7YqmigWaTgwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwD2byDG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwD2byDG"
Received: by smtp.kernel.org (Postfix)
	id D7997C4CEEE; Fri,  9 May 2025 16:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F7BC4CEED;
	Fri,  9 May 2025 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746807003;
	bh=zed9e5a37aC43u4u2xfmZyjadzyqVtCYTAW3nShbBh8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LwD2byDGFi2ptsRDrwdRGAr2Ze0iOwwc5w/OVQ5k+Ld6LxkedqiSPX+VOBRI8ITX4
	 g81bwf9lPhJELXQIUIRGgRXpJjCUJU/MY0wzBaAKrgG8CoBOvY41p6KIMNiIQiLppL
	 IZ0onax1PFHq1owAJls5U+xoFaH/sHejXA4YyFLwMo9Mz1sR0gpmrt4HB0pHEufLgp
	 yl/H5yQ6Jj2CE0ISayGmr1DPp5e1fRJVtuSKm3QQbqof8Aw1zSdiEVHQ2SXrVZpbt3
	 VUwn0LPzOsJTBUaFkgGe9rvqO4b7afI7fhYFoIzgDf6LgCnqS23UuHefjyAEsg2Ejp
	 KZWUrZKtgOL7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D2E380CFFB;
	Fri,  9 May 2025 16:10:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC fixes for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174680704199.3673480.5573519143419633721.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 16:10:41 +0000
References: <20250423145047.3098-1-sven@svenpeter.dev>
In-Reply-To: <20250423145047.3098-1-sven@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Apr 2025 16:50:47 +0200 you wrote:
> Hi Arnd,
> 
> Here are two small fixes which should go into v6.15 from our side,
> see the tag description for details. They've already been added to -next.
> 
> 
> Thanks,
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC fixes for v6.15
    https://git.kernel.org/soc/soc/c/33e79299f921

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


