Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035CE314D0D
	for <soc@lists.linux.dev>; Sat,  4 Apr 2026 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775316791; cv=none; b=Zi2Dw2XLVkNdRQw/7Ubc1G5TIqIe9fbsIPRizqvkt+63/UzW5awGDPnZ/Cj/20+iGgJ3eCr5JLbuzqCmHON6Rd4oE2+WiQ874FkgUwsftIgVJvYzuusFi2SUf/DxeBFbCt1sRbOGWcUQjqbyhqyey0cXBDOJagWcb4M6v2HZe2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775316791; c=relaxed/simple;
	bh=ZlzV4y4YHNwOQarGow9Y9+NJ3NB3R2lb3gtd1kS1GYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwOaI/Y+PLPl6XNCots0wWOFlK9teW8+iSoy1ZgcxHRQF/ubKpte038nm0EgeSeCjvXo4bNJCz9u0Zv5BW7ubT7VT5iCGPi9pZoWTD7AAFHSm0WsLxYrwQ9GcMCS2zFl//mxu1txXs2RrIIcaKOm7LVznA2ZZCOcA06W9+ssJYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGJ1G1db; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGJ1G1db"
Received: by smtp.kernel.org (Postfix)
	id C62FDC2BCAF; Sat,  4 Apr 2026 15:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A51C19421;
	Sat,  4 Apr 2026 15:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775316790;
	bh=ZlzV4y4YHNwOQarGow9Y9+NJ3NB3R2lb3gtd1kS1GYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGJ1G1dbHQ8YSJMkbnCewNVPp8K+F5tb/VYcQ14aSjrCJEv1HH52gd2YYgXlV8Ib3
	 oM84BZIxEeX7oHwVTYCtA0QLdf9bEOQz49KuKdnrYVCrtLs+rRHP/BKW19tHLW0PaE
	 ccvyaaLBTqJbL6t/UaOi82pWK4maeP3WZRoJuf8eKTlptNaNahXd3ZLSoaVPqcL+0l
	 5gz8kaM3/1xx9rM4cFVf+3ORaNavCSrwvmOcqPEUUn5eXFauqWS3RcTbY+dRSWFbY1
	 hQJ/MsDdvoI77roMMXUQp9RiotjlxhqK3x6TVCxGleYzHEVfnDEbh2FHKar231+aDw
	 0FmCStvs2QTVw==
Date: Sat, 4 Apr 2026 17:33:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org, arm@kernel.org, conor@kernel.org, 
	nicolas.ferre@microchip.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Microchip ARM64 device tree updates for v7.1
Message-ID: <20260404-warping-determined-caracal-cc0abb@quoll>
References: <20260403070637.2554408-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403070637.2554408-1-claudiu.beznea@tuxon.dev>

On Fri, Apr 03, 2026 at 10:06:37AM +0300, Claudiu Beznea wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-7.1
> 
> for you to fetch changes up to 711cca0f1cfef57018654b969da4041c2bab68d3:
> 
>   arm64: dts: microchip: add EV23X71A board (2026-03-20 10:56:22 +0200)
> 
> ----------------------------------------------------------------
> Microchip ARM64 device tree updates for v7.1
> 
> This update includes:
> - device tree files for the Microchip LAN9691 SoC and its evaluation
>   board (Microchip EV23X71A)
> 

Thanks, applied

Best regards,
Krzysztof

