Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6512B2D8379
	for <soc@lists.linux.dev>; Sat,  4 Apr 2026 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775316504; cv=none; b=rlH3Qph1O/nSHeJYxa0pVLFJ6CEgBP8uHchfLytCSyrRJbc0grIJvracFinQlGkI6Mjl0OqAMeW8vuvRUXq3xWCkY6tgYF0Ic/i+CYj281tD4Lkt5QJnU3zXMFR5BrXqYMbTKFluoElefEDyCd0w/Ldv2VaxCHWHH0kAaW2zwNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775316504; c=relaxed/simple;
	bh=UA6bly+AQF5v+iWuK0z14Apl21P8Edj1tf0r96yuACA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=je8hPxW9+faNdCixXcvzlAgYCZyBsdYE37SRAzkW4pTB31aBw1pbSQMHfjQjvQpz1y710PAYZiBBfBCX8mSv41j6Or5nUNr8/fH98EnfJRZNBfDKjvZkv4ONDQZcNIqsu94/XPnTCc36O8R1prG+wOZsRQGTMIWX+79XCYZ/gcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tk4LRGy+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tk4LRGy+"
Received: by smtp.kernel.org (Postfix)
	id 1F3F1C19425; Sat,  4 Apr 2026 15:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D96C19421;
	Sat,  4 Apr 2026 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775316504;
	bh=UA6bly+AQF5v+iWuK0z14Apl21P8Edj1tf0r96yuACA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tk4LRGy+4yKS+P21boxRJtOVZDeIw5q8LnMR5HJ72EPi3vUx2F2G4qxLS+7XSNzz6
	 N3CyMnXwIaRX4uxpp3avk9Xc9N583TsDJ/ioW4noyUjeO3eoU6ApOz3UiBwC43Juph
	 c3Sz/uuVarwZ1vVimrfzXgfbVYIZ9V7u6UsGr7+sJBN2dmU8THDgP3g9i7WNJn6l95
	 PCs1MN5dfaWHxCF1ox9gHIvFqyOdiCIS8MwgJzHr1d2GCcJp7yx0Dx8OOk8R98UKap
	 IvMdLqpAnyThNal+0iOqn8ot/AfoO54+6BysOyI4cqgxxz9cMUSXu0pjtn4CE5HEUq
	 c+To3jbqRbJbA==
Date: Sat, 4 Apr 2026 17:28:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org, arm@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Microchip AT91 device tree updates for v7.1
Message-ID: <20260404-tricky-seagull-of-vastness-de462d@quoll>
References: <20260403070327.2552867-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403070327.2552867-1-claudiu.beznea@tuxon.dev>

On Fri, Apr 03, 2026 at 10:03:27AM +0300, Claudiu Beznea wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-7.1
> 
> for you to fetch changes up to 7d7a9fc1310a0ade8ea61c5eb4d8b29456f8d604:
> 
>   ARM: dts: microchip: sama7d65: add Cortex-A7 PMU node (2026-03-24 15:35:37 +0200)
> 

Thanks, applied

Best regards,
Krzysztof

