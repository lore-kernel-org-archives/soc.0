Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2311EC01B
	for <soc@lists.linux.dev>; Sat, 14 Mar 2026 11:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773487029; cv=none; b=QJvvWJWYRxCW8Qh5DMgl3tR97+kKvy77odLzgCLU6rjJApAkBgKqCbTDpKJ8y00HY37Qo+1v5tSXsyzm6iwtQQIMtWlXjEiykreyVUKYR6pwW6fnjbQgKcUxSEIWwdriS78rGdsfrWquYmiSxTpl1ydDiN6/BzrgpHUF8lsuTos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773487029; c=relaxed/simple;
	bh=H/7h0gPFrDlitXMFs1sPT5rW+JyCN0I7ORuwPhfuYpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogjoTp9Cvp13dGr78tQ5dpAcpStZKM+LgDc9AH+GQlCaaLxdn4PWbFEIIZ7xLgvwszwPIb/Pck7zOFTKOTAKUyM5XjG0Q9fuhMjyk+42WWvIMnWTUnsPf8ROt3ImkTZaOTduFO7aTENZPM2qvE7gZOJjC7X9gc1d1vdzxJj6ZVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHIr2U4f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHIr2U4f"
Received: by smtp.kernel.org (Postfix)
	id 84DE6C2BC87; Sat, 14 Mar 2026 11:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D991FC116C6;
	Sat, 14 Mar 2026 11:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773487029;
	bh=H/7h0gPFrDlitXMFs1sPT5rW+JyCN0I7ORuwPhfuYpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHIr2U4fGsapnSXWsvQ/rnm+Xbsyk3/g+u7XWWSOxjtRVrFjFX/Rtto/iExGOMDSE
	 UNFTcN92EMWlGlMo2oERUDQgxMk2hFWr65TukadtBpLttTb7O1P5lNBLuV6Qm84Ijj
	 QLgqYojh+1eXerw/2NbbXCBnrxNufsVEqfXd5+6rHWZ4JTlscae1x720bJYyuHk1Uj
	 1ESOf3i9DwwEqOBP5S69LFfsOEWc6IM5singAeA2IT2cXeXoQwYuYgVpQQtBbqIHZ5
	 sp8hia/H2hJceajfOzyycP3d9mj4Q6gcKq/bkkwIw2XL84/6QXcollIqE8OM9CoN23
	 uSxEVVcVPyW7A==
Date: Sat, 14 Mar 2026 12:17:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v7.0 (#1)
Message-ID: <20260314-illustrious-origami-pronghorn-964508@quoll>
References: <87sea3680w.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87sea3680w.fsf@BLaptop.bootlin.com>

On Fri, Mar 13, 2026 at 04:53:03PM +0100, Gregory CLEMENT wrote:
> Hi,
> 
> Here is the first pull request for fixes for mvebu for v7.0.
> 
> Gregory
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-fixes-7.0-1
> 
> for you to fetch changes up to edb7efa767da8bb82d724b85178be251ec4e060e:
> 
>   dt-bindings: arm64: add Marvell 7k COMe boards (2026-03-13 16:41:11 +0100)
> 
> ----------------------------------------------------------------
> mvebu fixes for 7.0 (part 1)
> 
> - Add bindings to validate the device tree that has already been merged.

Merged when? Why is this a fix not a development (e.g. documenting
something 10 years old)?

Please write informative pull requests. You want to here provide the
context WHY maintainer should take this as fixes.

Best regards,
Krzysztof

