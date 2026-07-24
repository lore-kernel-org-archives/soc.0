Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507183446DE
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 08:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880437; cv=none; b=ReQLITAi4VOaVIYMJJ/C8yulrC+UuQLLXawMSV/jy2BbuuKg0TLn5JRWZyTQRBorjxyPoV3H5TcOOI6pjoM3+jn87G2K6UrhAfy0+oe/FH6FfqL8RicOYqkf4e+x9CQWsshxUzvSGcjPf+EPiLqKqkFAMm9A2HXKmpUe/Pqvwts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880437; c=relaxed/simple;
	bh=AFzvJt9mwZQNdYlf/8Tj9+sk/Wv6dgaLh4lukFDbdwA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sGBBN+ULUWorl0OG+Yk/68jG7yRkchf0IsVxdHydafC/7ZXEboYMc9fLE5ataGosDORv6Z6F40Vea1lzaa5URDO48yHNDodSwT9vdzVdssIRLSoZ24MrgSYsZQ7uvW37QOR/52P8+1JexFn24F7dKpC8Tb5vVh9LAjRf43AsxKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERvVDYEZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERvVDYEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DBA1F00A3D
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 08:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784880435;
	bh=HZuc3S8NKvEFqAPnoOjRFSMEIzvtAOjkPfseQxs6Dh0=;
	h=From:Date:Subject:To:Cc;
	b=ERvVDYEZtsO54xTTMW1oT6IpCqsd2AQvAQv0v2ETUtP3vKbRP6JJsK7/r4lWg3qEK
	 KaPJHd9GW8P0ESZD0gYIOjeCU/rPb6hiNHvNenTa9cKM5RAkAWWrGjtAjihisrABYH
	 qvEd31E3wyu04kNhjd0JiUh1Nvy/tJELw90fxdUKo/G8pYlzjxMosY8OkFpd52yQjp
	 yCPT3f5EOoL5oYYjEllplNMU009CrvAoVD15wpS1/sQdRMDvif5uTEQIOhxl0R68LR
	 7c+v9+Tux1kBmuNFRfEm8ADTartbpVlVh+2GM8LWm9tP+jds9wVDRegZU/JLZrqP6L
	 1tYQxOvHXL8Cg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c62764c7cso10650071fa.0
        for <soc@lists.linux.dev>; Fri, 24 Jul 2026 01:07:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YyAS3vRgFTSQQbqAiNVJcNlxmIjKeMjAamDKbshdpzdOoVa9NHU
	Iw01xnPsqfpL+wMhxcf9XlmjciXyX/uYyZfs0APFqIaM+WnvT3OlgAgniDBgiVQiN/OHaZrjvj/
	wAP7Aqj8mgN/+QgPM2xglW+94LRJs9Aw=
X-Received: by 2002:a05:6512:6193:b0:5ae:bf5d:5c54 with SMTP id
 2adb3069b0e04-5b2b339da76mr1250712e87.27.1784880434621; Fri, 24 Jul 2026
 01:07:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 10:07:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLkXOA=u4UxwEDa3WJbFEyTeMPj_U5BiqYsrahxdoKM+2w@mail.gmail.com>
X-Gm-Features: AUfX_mwopg3eEdaNe52uAWb7vkzYQ2MfkVezpYU8xidl14VByB6teDIoClUL0ak
Message-ID: <CAD++jLkXOA=u4UxwEDa3WJbFEyTeMPj_U5BiqYsrahxdoKM+2w@mail.gmail.com>
Subject: [GIT PULL] IXP4xx ARM changes for v7.3
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Drew Fustini <fustini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/ixp4xx-arm-v7.3

for you to fetch changes up to 2262f02ac2aa545560a7f182c8e6b5c98e72763c:

  ARM: ixp4xx: Relax endianness (2026-07-24 09:52:10 +0200)

----------------------------------------------------------------
IXP4xx ARM changes for v7.3:

Make it possible to boot IXP4xx in little endian mode. This is
dependent on the patch for the xscale decompress header
submitted through Russell's patch tracker.

----------------------------------------------------------------
Linus Walleij (1):
      ARM: ixp4xx: Relax endianness

 arch/arm/mach-ixp4xx/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
