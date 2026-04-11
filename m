Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0EE230264
	for <soc@lists.linux.dev>; Sat, 11 Apr 2026 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775897534; cv=none; b=jaO0zOLZP9wDUG8G/TBvoPgomnVmM8U7Onl0aK2AAlVhAFQaGGRlkbUwN26LS4JjiPlcn2ooYfoxftpV3EhspQtdIe3SA5YnL9f92w+A7EGaf6aUs+KcC5fpK1F/MJf+sqvg8ztiQxW2GcUyJDpD5ICJ+HOxTxYg2jDJpPUj8Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775897534; c=relaxed/simple;
	bh=5KvS779vPydsYy9Y4qIf9xIxZNC8Qkf5w3VMNiJ8lcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsICx+/JO3yRgE3q2A9fLqabRHswC1PPe+CEP7VfH3y7/nUp08ZOtBYgTtAW14jMkDmJhPWNvS3j0ds+vfaLtQFCVzerk9khzRu0Oryj2XmsPCOCLzZe6xrnURk+gqlQB87rW0LHDhnSPyyroDvVhHf0pm/iILF7b0a6002GR68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVeEI+Cm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVeEI+Cm"
Received: by smtp.kernel.org (Postfix)
	id 3F072C2BCAF; Sat, 11 Apr 2026 08:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DA7C2BC87;
	Sat, 11 Apr 2026 08:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775897534;
	bh=5KvS779vPydsYy9Y4qIf9xIxZNC8Qkf5w3VMNiJ8lcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVeEI+CmVhFJDoKSwXrbqztULsQtS49tiDPoXCvh1hTye3zEQRrPxq3BU0Qi6pijA
	 Y7UqCjQaahYL+cqDaKMxmZdbpvGTk4CXwt4nKH+xUxtbudCuB46iAjcRYnNMo+mREv
	 2ZiRZAPeXi11XlOCPj6tkcKK+ep+5I97Rhhq9e1k2nhuiSo8l2qlqgSwHAs7fdVCYZ
	 RHL67PcH83D4GWhdUC9/yPatiHfVmZ9ublNHsNWmlRJcVLTdRcBB9TmWzWQpt2yB46
	 n5vOofOlWlHJUNCg1pGNqP+nM9t5KhK9i8yPpaqsZ2QjDXyWt8WAdE5O78Irtsd01s
	 zLQEQy4Wwp5cw==
Date: Sat, 11 Apr 2026 10:52:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de
Subject: Re: [GIT PULL] Reset controller fixes for v7.0, part 3
Message-ID: <20260411-upbeat-unselfish-aardwark-39d04c@quoll>
References: <20260408094152.1698594-1-p.zabel@pengutronix.de>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408094152.1698594-1-p.zabel@pengutronix.de>

On Wed, Apr 08, 2026 at 11:41:52AM +0200, Philipp Zabel wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit a0e0c2f8c5f32b675f58e25a9338283cedb5ad2b:
> 
>   reset: spacemit: k3: Decouple composite reset lines (2026-03-23 12:25:47 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v7.0-3
> 
> for you to fetch changes up to 9797524ef2b69c6b187b55bd844eb72a8c1cbd99:
> 
>   reset: amlogic: t7: Fix null reset ops (2026-03-31 17:19:18 +0200)
> 
> ----------------------------------------------------------------
> Reset controller fixes for v7.0, part 3
> 
> * Add missing reset ops for amlogic,t7-reset to the reset-meson driver.
>   The resets are unused as of now, but as soon as they are, the driver
>   would otherwise run into a NULL pointer dereference.
> 

Thanks, applied

Best regards,
Krzysztof

