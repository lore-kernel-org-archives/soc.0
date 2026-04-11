Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EA6334C1F
	for <soc@lists.linux.dev>; Sat, 11 Apr 2026 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775899779; cv=none; b=Wb7IJjOr8hwh94gcfbIgvO8W9srZuZLnViOn4//5hGkskZXcQ/rzj22m/oWHAWeD8lm4Nmoch54SXVBArSIvVYxpVJAwzSjVo081Cr20DHH1+8Es0ZwqGndVN6VtBAU1j0vk24kO4j9mQhJr8nl3OCNlJPk3/UJ/3SyAvNQlPAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775899779; c=relaxed/simple;
	bh=waa66iiXwVjYMPwroTuW2sKA1unznzskqc+15JbWTVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLtngVryQg3U0tAvkBDi24IWHFVXwvkcie6lBH8zOt4SFNdruVRFSQt6LBUIuB0CChSlyj8EmO6+vc0rLHY1KZHYO9RQtkpCfVP67ChOL3vlXFVMv6hh2rK34OvMCeDqVgkBw5yMazGc2Hbguss2w+26deyjijWfP4NdKD49P/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSKMF89b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSKMF89b"
Received: by smtp.kernel.org (Postfix)
	id E0E1FC2BC87; Sat, 11 Apr 2026 09:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4808CC4CEF7;
	Sat, 11 Apr 2026 09:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775899778;
	bh=waa66iiXwVjYMPwroTuW2sKA1unznzskqc+15JbWTVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSKMF89bhbsJ/Sv4SzKBFapQ/3P5mpm7jjE6WXT4uuYXjX67uFLWQ6ZX2rUsWSh4G
	 9vk3RNql4bBrTeEuX/iLHMWrT8V1um7/4DSuMBJ/6IcrzRytGxEzKX/KkpI/PjhnHg
	 +OCvY3BWJy/c/MG83ad2LK/a+Y4yDOHhSwJ82FaaBUuyA2cyB+4B3h2dQeTAkqI5Ts
	 KE6Dt0s+i/cBJlBS9Ob7fo/2jsstYjMCz4NGB6gTQLp/UzeiIbkrNrf9TnqcucZHQj
	 cMaYifbLJ+BXRyY0+MNzC8PwR7UCxkPmjOFgvUOPMfBpRdxdI/i+Z+HMS5G5FcNRID
	 ruL6/hESiJNIw==
Date: Sat, 11 Apr 2026 11:29:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: dt for v7.1 (#1)
Message-ID: <20260411-icy-inescapable-cougar-ece4c5@quoll>
References: <87qzoo3412.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87qzoo3412.fsf@BLaptop.bootlin.com>

On Thu, Apr 09, 2026 at 10:56:57AM +0200, Gregory CLEMENT wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v7.1.
> 
> Gregory
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt-7.1-1
> 
> for you to fetch changes up to 29d8a380643521422a9907f3e982e142fe22d19e:
> 
>   MAINTAINERS: drop file entry in Marvell Kirkwood and Armada SOC support (2026-03-02 16:24:43 +0100)
> 
> ----------------------------------------------------------------

Thanks, applied

Best regards,
Krzysztof

