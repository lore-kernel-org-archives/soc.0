Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E632A3A1E67
	for <soc@lists.linux.dev>; Wed,  5 Aug 2026 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785940970; cv=none; b=M+vRmcxdNVLxqzjwR+z/QPRHQRoPTghZIOOUfv1uQOrkRuhZHNHRHr6ORgopnZkcetQTZ9/uvJsQWxyZlKDYShl4xGRbzwpzSyoJrTIsEmtiw96+31Aa8wKxTxO8DJ4lNtIo4WDuSxHp/vSBgP5HJ3NOoAXfeYxhvXaRZm6oTp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785940970; c=relaxed/simple;
	bh=wsZo+ZMiN/bwtJFhcGz4OAPLnsyPz482KG/riiywTSQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uIBdBgFL7l7GcJbUI6FMTmhL1PF6/WPdB+2Hbd6C1IG+OP+Pd/McgAx2Ch2ndHXCBZ1yzsie5283Vv04+NxSSwHbE0ktHwCBTjnEIuyY0rtjsY8Nj+o4bUDfa5reOYDueK0K+D6JO33Sa+TnnmCKCvJeDvkBk5O58R68mH/cyV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UeVV5QWC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UeVV5QWC"
Received: by smtp.kernel.org (Postfix)
	id 7F9B01F00A3D; Wed,  5 Aug 2026 14:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82981F000E9;
	Wed,  5 Aug 2026 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785940963;
	bh=PPxR34jY6D9VQ7CMGLhqEjpb1OBmeanD7WDc/7omm54=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=UeVV5QWClFvjWxB5PxrHgdGKCQJoVNalA99EYF79GCsfnLKaTa8AxKiXaypJsCBor
	 UrZx64ETpgDXvmGae4rr6mX54oEH4JnNbCPQXFLB2bkrohG4Qimeez54hgEo4bFL1a
	 duq3ktIjuwNbXXJHid+a6HZw8v7EzmUTwgJls9HfIRDjE2iA9VgB+mv6YMFUJxcZFD
	 saHyei6AhqT1+T1Vgfe7cHSDGY/LsGZEZwSwf2ELUaTWMzO5VoVFWnU8ua+CcGPQbM
	 cp+csBFESQotDQnQEA34dIDq6u47p90jLqukmAlhQB52/ToMCyDcpZ9s+dReWfyVad
	 zAvb9nQdfNF1Q==
Date: Wed, 5 Aug 2026 08:42:39 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Drew Fustini <fustini@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, soc@kernel.org, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
    Conor Dooley <conor@kernel.org>, 
    Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V defconfig changes for v7.3
In-Reply-To: <anKwl/5re7CMFTXF@x1>
Message-ID: <42f428e2-8bb8-b14d-7ed3-e618bb467356@kernel.org>
References: <al+cTw/+z7xoJXxp@x1> <55196187-178b-1f88-0947-1612410372e0@kernel.org> <anKwl/5re7CMFTXF@x1>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Aug 2026, Drew Fustini wrote:

> Thank you for checking but this was already pulled by Arnd:
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=6495ae297ceb
> 
> It seems the patchwork reply had a narrow scope compared to my post:
> https://lore.kernel.org/all/178491121788.3229915.9040423834090729571.git-patchwork-notify@kernel.org/

Oh, okay, thanks.


- Paul
