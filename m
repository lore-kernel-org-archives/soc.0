Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150943;
	b=S6KTmTCRbvycsXYh1mIB8ZY+7JidFJUmFcsnPYx2mggHy6AB5rM+7Pg8mHRtF1XA3Lw1
	 b7BYjBpfjEzZRHJGmmYYF3Lz/kPAIqpHWk6AcuUp2jS7MUGX/I6sBpBv+oNbgWJH1V39u
	 mn43GWJ659OFD+QoavAFu91ZZ/EPMd7NGIxusoP8kRaXCXbkMgdjUNO+M3jwepyvXA3Ur
	 FQGzpfY4lbQVTu3NW0LuMnzDblpVKiBpc0S/S6H168BMlelUAMZZIdYmTgJ4PdR+dxcSN
	 11bvVlFKwuUueXUvjxszhxEBg27zDaGXi/hp6vxPIE2lWT5wjv09Q+awU/XT5MK4Luw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150943;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=K1wv4P9LkVe//Bk8oo2Vt8BpwtAtk9Cmoa2L4e+Ln+k=;
	b=STjXdJRyZ+CqYsww3ydDxpWKLbVbNWgqmJvedmII50MCd5J/hTkY4BKI+GWqlOVDwhNY
	 0oehyBuD61RcnFAzV2ZU0RaruJ3iAAEC6UXz8/BaNQpRtvD8jnFbveHbnub42AgKnSpJg
	 TbJ/uxYk3Tzl/ez1xotPxVhz0N+XsytQNWZVUOVFrbOkMNOjr+eApUVPsA8pVIpUYX3PT
	 839KpJxY8ci01/2Hsl52ETABEiOGEULqy6Fbn5YowADAo4DSIhIabhomB7x6Zn9Kk3A+Q
	 O/BOHxv/q9R/JZn13pmLR3CKBNuv2Pd+F82zysvEtxPipQXN7hELj6b7p/WIT0jjMIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPsKDDVq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE7C606A31C
	for <soc@lists.linux.dev>; Sun,  8 Nov 2026 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPsKDDVq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7368B1F0089F
	for <soc@lists.linux.dev>; Sun,  8 Nov 2026 15:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794150942;
	bh=K1wv4P9LkVe//Bk8oo2Vt8BpwtAtk9Cmoa2L4e+Ln+k=;
	h=From:Date:Subject:To:Cc;
	b=SPsKDDVqSGn6EV8y2o/iPxzkQBr/S/OtpUuk4lJ2GIlAjBBUrxRZl/MLjbeKwX/DY
	 I8Rw92/qWH9iZHFPh5XSRguFVkcmAqVwLCSKDt5Qv842bDtESd4qRQkL+CgbQy8cRS
	 ldqMRW3lqOWa1k5zau88wI+r1ZNSu7QjBZRPC8Iz4hSJtqwRD1Z8AKSASkQ2lBH4PQ
	 47/TsdOmdKfsyLcqpDykBq0IoEBFhPs0TPdNIA3qVnPKaA7S2rVjqvHJz7BUqxs4vJ
	 3LHM4J7CSS5uQqt2IiHOJcVV61cER+cd5HkmaFGgqA0mKWDXSEoXDG9bdW3EQNf9cF
	 IO7F/DwrlSxvA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso113607e87.0
        for <soc@lists.linux.dev>; Sun, 08 Nov 2026 07:15:42 -0800 (PST)
X-Gm-Message-State: APuU4Z/3qrv7dFBEZI8yCtpKWF9TVP88QJnmea4YAbIKCG/9yiadIyWb
	PDWKwn2ugCK+oerFmr96NLiAtxFO9ws+bodz8lOqLVOH7sRRY7I62LndOrnF6jJjAYeOYvQfxtY
	T86Nmltb0Bj1VR7qFxWXNuU6taMJAqdU=
X-Received: by 2002:a05:6512:3986:b0:5be:58c0:c674 with SMTP id
 2adb3069b0e04-5c14bf7beb1mr473407e87.5.1794150941244; Sun, 08 Nov 2026
 07:15:41 -0800 (PST)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 8 Nov 2026 16:15:29 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Ap8G6E0pzBEuufRstvSCZ=Owo=n50pnHHODb3swLqOw@mail.gmail.com>
X-Gm-Features: AclHuK-G56ovpD2VqIImn6Zr3zGs43aGmBuAyqZR9JxoVjNzUz56CLaNqp2LDIo
Message-ID: <CAD++jL=Ap8G6E0pzBEuufRstvSCZ=Owo=n50pnHHODb3swLqOw@mail.gmail.com>
Subject: [GIT PULL] configs: TEO cpuidle governor defconfig for ARM32 multi_v5/7
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

this selecte the TEO cpuidle governor in the defconfigs for multi_v5 and
multi_v7.

In this pull request I have squashed the two individual patches to not create
too many individual changes.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/soc-v7.5-teo-arm-cpuidle

for you to fetch changes up to c351cb712444b5a31158570271d953546f6f5e3b:

  ARM: configs: multi_v5/7: Enable the TEO cpuidle governor
(2026-11-08 16:08:38 +0100)

----------------------------------------------------------------
This selects the TEO cpuidle governor as default for
multi_v5 and multi_v7 ARM32 systems.

----------------------------------------------------------------
Linus Walleij (1):
      ARM: configs: multi_v5/7: Enable the TEO cpuidle governor

 arch/arm/configs/multi_v5_defconfig | 1 +
 arch/arm/configs/multi_v7_defconfig | 1 +
 2 files changed, 2 insertions(+)
