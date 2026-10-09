Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D748542AFBB
	for <soc@lists.linux.dev>; Fri,  9 Oct 2026 06:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526242; cv=pass; b=BSwfEjh7+J+ahYUCBzGRtCq2qTQUGi2Np6MJIk3Y9nY0IlCdq76y3kcRYks5Z8HgZhdnijYv7BIjaldi51GxAEU0B/6DL2/sgSYf2DiAF1py4D0czwvlYECjL8JLC25A7/9TztRqfdXmfImwyiXjiO7cErsr0I3LzQe1lbkVKmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526242; c=relaxed/simple;
	bh=wSoSTy9cQ20md/2wENe+ZbYpjr9JxgQF9HlddJklHyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eiDcbCYLA4lo3JWJ+JKySCT6EUlOTCQmCTVWLCU/kTsFhtQeOE2Rp4nmWGaNmBcOYzO0qZ3BkX5CnQuXjPiZkunoJhVDMnqUKzQDk9LDAKEyNida0vHvxSHjIkXCmhKYJrVH3ymbSn42/85KVKpbSFEY39MSVVBEDdJIF/Mu3/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WsjTTbdo; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WsjTTbdo"
Received: by smtp.kernel.org (Postfix)
	id CFAA11F000FF; Fri,  9 Oct 2026 06:10:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791526240;
	b=ajEeikm1fkPlVb7tDOTeWJ4ZFyz25mknMc4/bVaENfHY2IRaS57C0GGbqXRbL1Qr0X8t
	 W0OCcon4muo2/gz/I/rJ2LBzveEQ4W6+ZHH9doVEBTv4GTZVFpXRWZLw3ouOJ1NYwWOtK
	 VznftuMG1HTo+3hDdy1GJlJlZJ3DFoInn1K36WJ6nS4tUJHtGCAzHaU3jbRm8ELxwHrUJ
	 syXz81Qaj7Ly1jw40Zf81yfh3a8J81CWf8jjjDT7Q4I/5zoJedW4GiDx/njTBkdI8JRhm
	 PZNwY4MA/JCy7QE1FIdp7HFWH1XjumLUYVV1YnHhDeLXXAs5MfgTTKfnPXIAFvjl1Ig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791526240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Ax4ioHhBTibMhrV/ZkvgxvrIeWrtpbyT/2pgDBLqygs=;
	b=SO4SI4pYkhTVcYgqPyWs//FrcWaFmCisTpdKvh2d23PSScRYrbpuqMztt+R7LeW8Pl5K
	 qmlIo/3QJcmDnooAr92bK5/rneLeQmeL32AK+P7k9qC1oM5744YpJwWwmNOIPzgFQaM2s
	 2l4/0IbsxX97FRdVv3DAVWZLHLEL7+fsWw0Q/cwi6Z+e8Iu0hmnaCfcKCHIsmxHFb1tea
	 NLZqBKguwv8C0StY0tViBWURRoeBRzwUNCmzbLy2UX4i0Qe0WaZy1LCK5R7vSu9NjEDIZ
	 8vdZDk4Ar66N4XxcGAk7aymEfsQ7kPDePg2MVHsp+1CNWHOVS7sjZHiYpPTGUxuvOGg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=WsjTTbdo;
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91DA11F00893
	for <soc@kernel.org>; Fri,  9 Oct 2026 06:10:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=WsjTTbdo
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 91DA11F00893
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso1030166f8f.1
        for <soc@kernel.org>; Thu, 08 Oct 2026 23:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1791526238; x=1792131038; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ax4ioHhBTibMhrV/ZkvgxvrIeWrtpbyT/2pgDBLqygs=;
        b=WsjTTbdoMh9JqtmwN1Wz1N+5LV1/yfHw3YTvzXtHh5pcdwOqpHPB2Keat79ue09QVB
         eGydM7D9CLl/4ukMgxg3GvYizCeOBBjGMyh37qbI4V6tn/3f8VpbNKbwbshjdj4oRCXb
         SHNpVf00+ZQGiEIodlmu3VMDYG4uJ4df6RvRvsa7IjnvcrM8pGzPgh89jNhFI2Ld8SWc
         GD6NlDnq7idoIaEto29QZOQMwSERXt3IKlJICimlAq/g7eYPSI6BwgDujTcmhMUs9rG2
         N/0S6KffvJydl6tM3BlMbHXfO8LUEs33Bc8bVZ0HwoO4J7ubSLsgPQBlc9BBaoWGahl8
         xFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526238; x=1792131038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ax4ioHhBTibMhrV/ZkvgxvrIeWrtpbyT/2pgDBLqygs=;
        b=EKcL1JoSmqMw5DEOZQ9csgxwJ3CIPSEyL39VwRlH2Aw1rvLkMbN5UM6eff5iJZafFn
         138Ch3ouyEBqIZ2/xwgPdCN3bze5sQYCMLQc9bevoqMCxCR3kKkRRzQ2rSejP8iF1XT4
         K+9LtVhzACdZZa9gwq2sMjT6fxTjilppoY6IlPM3w+z+mlN0a5MWfpo65EPtS9KSmLcL
         htWGKI5k1pHCtPTx4XNkJIS4BhT2m020dFSDNkBv6027AY1cR2bolz0GAJgCC4JaeigH
         Zen78os8XC9/u4C1Uvcb9cX6MjtOJbaQIZvbPMKPzN8emRRz4tPHgLrHM1mU4HIyPg3f
         oaZg==
X-Gm-Message-State: AFuF++kwSV5lsGYVg7K1Nx07hZuzjmq3nIUgiDpw/CabeIPDDkXRqmEP
	Il0JLVC29QFG5B8UCAaXNre3U3fb9LPVcseSdXrME01so5D6sMJLZeTOrrCAN1jNOYGEEPX4auH
	igpcK
X-Gm-Gg: AYBFou055lnJRQMCUFo1a685Im4E+Q5GgdMm18WTsaNPmuP/JlgagE70lCY3v9INT5t
	t0cRPCzz6ZM2m7b7ilxPDHe0trhZiA3t20RV5EJhcV9mMz/k/HC6LzFyaHbg/5AovfD4qbKc0hG
	arbnokp6T+pMgSJgRr+7aV8yPHnxUkcezc9n9gxzcCxyHUvX3e+/2WBYiZ34qlgVTTSUmlGTVEk
	ixK+HAbHu2GieNEFKYS7fermbtWyZYBnBhKQz7zbsM9FdIGFnp82byuKn6ZPKgnM4BHljmtg3FG
	MVUq4M9+IC+RK3MBg4NtrqcIGfkxpUzclBfV9nrO+LVS/jc1gCGPpiZdpUpjtid0zW/QSviqiac
	i6blJYSdX+QVrgi6hllegmRZKjxkjT69BcHDJeofO7Ci6Bvx8/d2ynlJLnbEDzw57nPq3Zop1wR
	Z/0LGpIKcQuUCTXd8xOmv7lQw8rt+PbqmoxnSwi3cJRyhUc2DX4jFATeEVoKJifuc2Gk/FQRoj7
	nBDZJfE/rhTYkObe3m+WGhKst/WqIKxr76dteQ5t7c=
X-Received: by 2002:a05:600d:82c5:b0:4a1:6282:1cf3 with SMTP id 5b1f17b1804b1-4a18e497a94mr15845945e9.9.1791526237748;
        Thu, 08 Oct 2026 23:10:37 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([82.208.30.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm56616715e9.8.2026.10.08.23.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:10:35 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 fixes for v7.3
Date: Fri,  9 Oct 2026 09:10:34 +0300
Message-ID: <20261009061034.29475-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-7.3

for you to fetch changes up to afb1ecfeda3fc31d6300a176f4854cc62e289bf3:

  ARM: configs: sama5: enable current Microchip KSZ DSA symbols (2026-09-20 16:22:20 +0300)

----------------------------------------------------------------
Microchip AT91 fixes for v7.3

This update includes:
- use the correct Kconfig flags for the Microchip KSZ switch

----------------------------------------------------------------
Pengpeng Hou (1):
      ARM: configs: sama5: enable current Microchip KSZ DSA symbols

 arch/arm/configs/sama5_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
