Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6930D37CD53
	for <soc@lists.linux.dev>; Sat, 15 Aug 2026 08:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786782107; cv=pass; b=nTaYDfw5yIs8ECqnhIKxZ26x7AE41rrLxomjEdqs67t2PQy8eD7fTRsA2J49wdWtg4owzZSAQOBm0PRrJJPXsyV9GrTjSJUroNQEKhtpZEQfeoTOWfMsL8oXfYPOCwexnC4LzBQ+gOQVBQTftKV5CfgesICe48KnIBRH1OQli+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786782107; c=relaxed/simple;
	bh=3pfd9aLf+Vk6ELU6TxH5NL7FubcJXBOQNHsDXv+JQ8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DSLLBkwOhZsqy5hPP2XdU8tSpH4LPruhtxvV+zSMe1fTRzOG79WKBpBnw5I9j6O6Y9ldupQ765X6r5mkP7Ahz+v13+AdMddZ4j/ee9zyPnUV4ETtD6qTqfMP/mL/857S0qIiUbNJHCy5JV5cF+/DIumpFgs/yj1sLCaCOyG0Bm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oZlCzu7B; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oZlCzu7B"
Received: by smtp.kernel.org (Postfix)
	id 533E01F00A3D; Sat, 15 Aug 2026 08:21:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786782105;
	b=qHeV5GOxySXE04+B8PUPagE/NUIpT8j2LPmvXlXdX+dIPCvohLBvKbY/dOE4azKC8HFT
	 GK4nk4DVjVqxuoh8DK0abAdpOguDVL4kkDQ5kToXG8tFE9SsTnKuRr22hg0Rs5LwKRF+F
	 aCPmAHhPZFjL9rYGIFsCjguH2VcJx4sIRK4rFhYP6PnrXTNhW8pTZIjI4FutPU+QB0bJz
	 oUl7byJG91fmLLb/+7PhQ5Gl61YR+rCQ19vdmRljNjcm71SjoBHKgEZ6zXqyrlSZGsdCD
	 nLmDjkhqpqw1NWQ5l8Goj5EfpIhdGtjNXjZDzy7MmaUOi2BL8FmXZfMtgoystix+KuQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786782105;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=4eGC9x1zlRVQNHV1HFiP9eA02RV5+baUhRnHBOM8Efs=;
	b=VUzzKFh8Qqya69PWVDv5nWRXJ8DtXhc81miO9yMT2nl87W2B4A664KE4vWbDCcQVzwWT
	 uhxT2dAoGd44uw93uvkjWyCb7Pqd16o63S11AQpqg/GeWF/i+vKEd80JA59GD/+y1kTav
	 U4cEw94DAbiBFrFKZMxMDd+ffMDHfVwHMfaRevlEtVCsOkAAOkDwJj95J08ofCwQ+b+kc
	 OiEOCoZ79saUMrzAv1GvPkvl2DopkST8IN2EZQ7lO3wA0uhHGD/M1/EW5fUlJjxJykBX0
	 aWl4npEVjk3UF9zwVjkQI/Vl6AfTdcmbNYcbBp38MC/yP1qe3LnYNiM/mM+BS/rlCgQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oZlCzu7B;
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 163F91F000E9;
	Sat, 15 Aug 2026 08:21:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oZlCzu7B
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 163F91F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D042D1A1660;
	Sat, 15 Aug 2026 08:21:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95BA2604AA;
	Sat, 15 Aug 2026 08:21:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5D9311C4F436;
	Sat, 15 Aug 2026 10:21:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786782088; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4eGC9x1zlRVQNHV1HFiP9eA02RV5+baUhRnHBOM8Efs=;
	b=oZlCzu7BzsjAsdKlteo4OnvHrFzEEI6//eoiNjezo9wYSzqjAD0oGKf/VmKZmoqNBLb3/8
	wwlY1FiVBs4m+Hbr0Z/ipBiF1NtRXTHTbFzB5YjZB0q07tKiZuOjkWRLPKts+6iGMAJsTq
	bZXsxbBDA5XbXtR2clepAR9vqtag0dttID3kvhdsWf/6MbXQT0k6f77uzl+LEBU02Uvqkf
	OWxgwwxLjk6EdkYwEKUDw252ItGD+MyzHCyxXdtb7eC1vvl5iF4GFZ3dBB6BNDxYIZWCS+
	kfv++ChiQ1cQ266/bGcTzIqK7leX/ZnfqpmlgBwxHyFgbnmd0t3MOy9yR8xHFg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v7.3 (#1)
Date: Sat, 15 Aug 2026 10:21:24 +0200
Message-ID: <87lda7oku3.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Here is the first pull request for dt64 for mvebu for v7.3.

Sorry for the delay. I only managed to push my branches for linux-next
last Sunday, so I waited a few days for them to be merged before
creating this PR.

Gregory

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-7.3-1

for you to fetch changes up to 0c2a8eed95160e41b367a1fa605a2c1b24a9639a:

  arm64: dts: turris-mox: fix usb3 phys (2026-08-09 12:42:37 +0200)

----------------------------------------------------------------
mvebu dt64 for 7.3 (part 1)

Fix usb3 phys declaration on Turris MOX an Armada 3700 based Soc

----------------------------------------------------------------
Tom=C3=A1=C5=A1 Macholda (1):
      arm64: dts: turris-mox: fix usb3 phys

 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
