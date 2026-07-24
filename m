Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6809D3CAE9B
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880669; cv=none; b=OexGWLp2W2gxJ7wm3tf+ux78i+QaXKBZM3yk1r0vOMRG9OZlJRXXHs+Z8ztFAnbKcTV7siuv/Rs/MYt+7GecqGGSbUGh/IuOqWNQPmNgCHfrFb/HujPLHw3p5ALt4sC1WOcZXRGEEu15OJ6EEugW0b1n10SZJlLHmPoHQoIjklI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880669; c=relaxed/simple;
	bh=dZw9DUfOKULDNZwRU8PNCol6iJBQLTI2y9SwLQzu4kI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DmUmt5oJi0jK8p8EQEqDWQ2M+PHs14fIXPUGHGK6WA2/PGmKOOzb90dMs7wRAcwnpubq+euIKPDS2OxGBNMVVwXX70TgCzlfmVJs21jVYQZDqH/TyvjyrIoHQ3JQyAYwYmR0SaI/QdiYzRLxhOul8uEm/hrC5dAniaYLpxRIlSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8kNZXqN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8kNZXqN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4201F00A3E
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784880665;
	bh=A9k2GiWAU4a33+EzJ6hCarjcE5xLYndFdiv3B5hwrBA=;
	h=From:Date:Subject:To:Cc;
	b=T8kNZXqN3OzXF+xPH9+xgYjpnGhcgs4M1hCsF//4cvEI8Op1m2SRgUI8qhb04NQAR
	 PgJbXg8sVLi0oLcUX5bHgsOzJDnB6dVojiPGtLaUUil8hdWlGCt1hOshcExOln0qDj
	 Ncr/0xmVC4H/eF+F8dO8iufdgMgI4xOfxM4rUUcQ8MJ3cCeDZlidN6zP3tB+BXfoWV
	 PUr63BA0nu15sG5AcBgpicb+31jjl6hfDfQg1OAEonwwsDPaRYqxloY/wqCCTcs05Q
	 8/l3B/74tGKrLslPu77bMvdGE25SljjVk/BYgwpW2OFl31StBDDT/Ei5MI5zmtV9Or
	 nBCHS7//fJojA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b0148201fbso143522e87.3
        for <soc@lists.linux.dev>; Fri, 24 Jul 2026 01:11:05 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzeng7ZBXU7OJNgLpgQUlN3VmaY9L1NwDJymnUy3612Ik2Awl05
	T/2vOxTA2mgS279fyzm0cS3cCGh2Elqfj7EpDXbj5WwcTcq0N2FvxFLbPxXqQtSTWbEY60S9ANZ
	xxIAZd3Tj4uQdNn0dZO7f72jkE6lfhkU=
X-Received: by 2002:a05:6512:838b:b0:5b1:5d7f:84d8 with SMTP id
 2adb3069b0e04-5b2b2f8db28mr842076e87.46.1784880664049; Fri, 24 Jul 2026
 01:11:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 10:10:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLn3UOROn4oK9D306WaJFx+8TQHehSugtLq7zhO0DwhHzQ@mail.gmail.com>
X-Gm-Features: AUfX_mz-C4N8UzKZ7Tyc8d-wftrIc7dtdIzb8jJ265dnROboevalR6jsrMvtWJQ
Message-ID: <CAD++jLn3UOROn4oK9D306WaJFx+8TQHehSugtLq7zhO0DwhHzQ@mail.gmail.com>
Subject: [GIT PULL] IXP4xx SoC driver updates for v7.3
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Drew Fustini <fustini@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/ixp4xx-soc-v7.3

for you to fetch changes up to 48e54749c1b6446f53f7419c50ebe7c84f81cb0b:

  soc: ixp4xx: Remove redundant dev_err() (2026-07-24 10:08:05 +0200)

----------------------------------------------------------------
IXP4xx SoC changes for v7.3:

- Add some MODULE_DEVICE_TABLE():s to the ixp4xx SoC drivers.

- Drop redundant dev_err() calls in the ixp4xx SoC drivers.

----------------------------------------------------------------
Pan Chuang (1):
      soc: ixp4xx: Remove redundant dev_err()

Pengpeng Hou (2):
      soc: ixp4xx: qmgr: add missing MODULE_DEVICE_TABLE()
      soc: ixp4xx: npe: add missing MODULE_DEVICE_TABLE()

 drivers/soc/ixp4xx/ixp4xx-npe.c  |  1 +
 drivers/soc/ixp4xx/ixp4xx-qmgr.c | 11 +++--------
 2 files changed, 4 insertions(+), 8 deletions(-)
