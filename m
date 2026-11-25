Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609286;
	b=N+AN+8Gyvg5PbSAYr5NVO9qFbEUEQgiYTmiobaNICbDTYksgeHC+d3xKBvMCmh5/K/us
	 4Tro4vSKoUU8aA48OBXjF+n48xCBUfxg8Ti1tsgyEAqE1D025hgtguNn1YLFwS0shkXl4
	 km47+uJ0YNS+ppQb9oH1aunFIYSvSC0AIBLwEJOeoFYY2Rw58V0TxB0R7RNHIxjKul1Xn
	 Y6nGySkxWp4KKASyUFEs2ZUQRJh/rlsaAY2ozLah6PwqeXjJFctAGCViiFjdCWpOpPYdX
	 BZ6PsRn00Nucq829ypYqHxP1RJGPwv0oYkmfCGOnfsP/qFENTnVZUaLcNjvXD9x6jqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609286;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eHsoi+0RuIsOwYDrm4lJh1qS5ZzfodjXVxY1o2URryM=;
	b=kbRh/eRI70zJ1dI0JXB3NrkyjKIeI33pFHR2/6naMKN/KHYZ8WhqVBfJA+H+n+2OE09C
	 aFBHYEroija4JpokqF85v41zb9ynuWsCv0D2nJZ5CWj+LIx6UR93mVRb27F+hTtS1Uf0M
	 P/uIyh1b3TNbvsWIhI7pRFtkOKEbO6FoNZT+ea89cBJMbh4EDaI5Bv+k+SUmcZCPKCSQ6
	 K8+OsZloaqMN2Fqx7T247QAafa8clAtxFTkrRnUB/N98vnOrKNVaI946lrpT1Acu5rhnu
	 ucLpMwNbCUBDTxVE44Ivu/NpRf6KMyB93vOOsHxKzODxDoduJiywCgvjNLPYjlTGPCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="B/A7/pdu";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82440606A31E
	for <soc@lists.linux.dev>; Wed, 25 Nov 2026 12:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B/A7/pdu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F76A1F000C6;
	Wed, 25 Nov 2026 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609286;
	bh=eHsoi+0RuIsOwYDrm4lJh1qS5ZzfodjXVxY1o2URryM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B/A7/pduFevS+EDAXTfLd0ryOsu0GdCM/9NTpqcUJrMCsIH2M46VAG6evrahYf3pJ
	 94o/yZI1VnTqFJjgY7UMiueCu8sgfm02lcnvjXv+LFMgymzGLgo2IMWSBzIA+hHB0V
	 ciu1PosgwPh9Fez9YTcKEUD0amsraY7WhrU40yzNrZhrwiMWWBVA4k+anTKjkC6C4R
	 +FcyRRCLdYWTXMd0IupLQC/VSFf9iUrETAKOSMV3JvdhLWhRcnSC9DGli36sbQnB/D
	 yvul1n3Rrk+89Ll7fPZ/mBeX742BE8SkYOHGh+eAhPUpWIs6jR9SNXuwY6cFEyWrN1
	 EaAgELpMWDqIg==
Date: Wed, 25 Nov 2026 13:21:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Ux500 Powerdomain DTS changes for v7.5
Message-ID: <20261125-smooth-miraculous-eagle-ae81f4@quoll>
References: <CAD++jLkAjWe12teziGE3-81R0tpO47USD6_pLMMrJ4_DXSOa9g@mail.gmail.com>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jLkAjWe12teziGE3-81R0tpO47USD6_pLMMrJ4_DXSOa9g@mail.gmail.com>

On Tue, Nov 24, 2026 at 07:18:55PM +0100, Linus Walleij wrote:
> Hi SoC maintainers,
> 
> these are the power domain changes for Ux500 for this kernel cycle.
> 
> I'm especially happy about this one because it pays of a huge piece
> of technical debt as we started doing things wrong in ~2010-2011
> and then have tried to back out of it for 15 years. Related changes
> to powerdomains, mfd, regulators, clocks, (also bindings) etc etc
> are merged into each respective subtree.
> 
> I also have a large set of DT fixes that I might send for this kernel
> as well, on top of these.
> 
> Please pull it in!
> 
> Yours,
> Linus Walleij
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
> tags/ux500-pd-v7.5

I think I commented last time. Please, please fix your mailer. You keep
stopping me from simple line selection and pasting.

I applied this one.

Best regards,
Krzysztof

