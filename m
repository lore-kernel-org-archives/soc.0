Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C4F40F742
	for <soc@lists.linux.dev>; Mon, 12 Oct 2026 10:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802665; cv=pass; b=aqsK0cHDYCdBA3T2G0Y33ZNS9Q4SHBKM+bY5Ci2wPrHf7java24dEY2w25k9tSUporS8Gs4yM1slkNysxdceV9EZ7HGoHPuUr9gUtsSNiCABhJS7yak6qVOYTvlq+t+AFnlN7S9RkRfje/aMU+QBzeFfPNLYUKth35iAqemBg7M=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802665; c=relaxed/simple;
	bh=DEjfN1YSoTzhQ6oHO8rgUtrjWBtvsh1zdPdlwmBWQEY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=bqiTNm7/6NIEyxT6IFI12EQB+2ULdoGCrhflyNSzaERUt6wBLsw3h7kb6OXGVDFEnwGMcA4ZMUfWxBzCtCOSR8i6r/K6q8eyJjYlJnSdvZMGFtu6a7zwCuUMkp4X0DzdV3VVsh//ANQFQTfQCxS/b9OIfipVeXb9ym0Ga0CoITI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=Y8D4vMVt; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="Y8D4vMVt"
Received: by smtp.kernel.org (Postfix)
	id DF4E11F0089E; Mon, 12 Oct 2026 10:57:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1791802659;
	b=LNMQxhvnfNMDgZXncwTd/xFLU2Ebv+OA1NA23cWZ7XfwbzEroNUN3AIuNY8HnwfKQasA
	 dXqe59RpE2xMcztgYWcT0bLiW7X4v1grU5K8W86VQkgY1+R8Bw+i3iyuPvCeNQWhHQDkH
	 PsR0194qSLb8YgsEAvrDcsl6x+e7wrfjVV5ZYhsU84js5bv1PJD/L0nz3ER7aEEpWqWfY
	 3MdOznRdH4ArRFutkXz6WK4pLc+r+p1AyA6Vr8WKwmq0XNisk0ePRGmOSbsmZxa+dcneg
	 dZdJZmHLS/3Ibe6sbiExHPAAxnt7lqgwqB5gnbdBsv+9vx6qIoTHA9SsPlkPRsjotmg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791802659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=Fscg4JINZL7Vzeywayyz5wQLf/idjMk2AC90hL5b11o=;
	b=iap51VwiqWqCE/H3rUyzC+E5cqnmH2l8ckXovs198z2IRmZWh2mZGSxyIW7IHBcuas9T
	 SZNrvttMvK5gOAHwb7CfNxCnlqKadImmnB8mG7Eo1h71z8WKKkBauHUw/A6FAlFnZdU2w
	 TA+0Gu7pHYijmNbpBZTJHpMRyXf9nbV5Ne6n3QOxRzTSiW0nHzWpWvyby48GWpyWvyEme
	 Yrb/3dWHTBuuBWpEvJJXi4Ar5gpv9bTVwrPA+5Fsegr/lWn1r0ge6aCD1C62sbS3nBdk6
	 30ySnhHNRO0uHtCy54PUIghlflwo0TYF2oZnu6IJzBiWIivDQiyrB1e1QGOR/4Ldr8A==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Y8D4vMVt;
	dmarc=none header.from=monstr.eu;
	spf=none smtp.mailfrom=monstr.eu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 152711F0089B
	for <soc@kernel.org>; Mon, 12 Oct 2026 10:57:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Y8D4vMVt
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 152711F0089B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ae9bc9a2fcso29108757b3.1
        for <soc@kernel.org>; Mon, 12 Oct 2026 03:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791802656; cv=none;
        d=google.com; s=arc-20260327;
        b=WTT8jv7Sp8Scs2flXzzStdkbOq4SXMv3PaS24kr10V/VH7qxLhlEzmzdCpfk8IgJfe
         IbJ1FOG60/iQGKo1c6eQMXxtsuYuK3tDwzTq3Dope93aFm95/WWO+e1t05TgxnqWZzbC
         dp8a5/cMyZq0v5oYebfXiJlO/8yzo+tTsR86b5GYthD6toTKsoMolq2pMjkZ5ZnZQDUZ
         DXsfDM7w//ceWZQfQ4gEUdOKg8AqVJIvK1ZbC1RBQVgaCsJJXrr4K/j/B2DOF3i0vbWe
         rhJugDIhjtftuVk6EEsiM+qH0T/7VNy+2abm7oOeRcjWIQhtXgkG3Das7RqTcZ+ffZCl
         NblA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Fscg4JINZL7Vzeywayyz5wQLf/idjMk2AC90hL5b11o=;
        fh=USfxQ7v9YbbgbzUCK5rgK5xnF5L0usnYcuhWnAGI6mY=;
        b=dla1Ur3gipZdtkaZiLqVHXpbXZllNYLRL5udI1glesMB7DV0KNOfyt3YS5qjSwOY08
         1FVEiFCNB3jSw4eDiNPH8TLp8kpa8lIYEhxed8AUgEUuqJ/0QyzhDmXpYvGZiArtYUPM
         jTy49EWy4Wy4jj7gVQUYM58X6/T1U7QrfTSmplOjXJoZyJHR+6S01usb5A0F5GMpUf+x
         0T5pxuzggiwqnDb1e9eSAQBE7LzbDZcCOVfsAh0H3sLmYHVbL4UtOztY+WCoqEO242yg
         jYrPfr37N2RhIAhp7TUGOlV0/3ZX5Ebn/bGOUdO266lvuQ2oh8ZB01qHtF1YYIFkDBz5
         LNjg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1791802656; x=1792407456; darn=kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Fscg4JINZL7Vzeywayyz5wQLf/idjMk2AC90hL5b11o=;
        b=Y8D4vMVtniXYhA/QYfUO98SW2Rb35dwrQYRMHCq6bSGr0rm3Yd6fv6qyntWG/fe9HC
         ZOEtK6ZTteMt8YhNzg2xvRpQoosDoCHqWHEXMwGRLM2zNuGv4f3zmIiOO+ZKbed1GuKO
         PZSnCixlXoC8B1ZJtBHHRgX3J8c10nLGs9Bx6BAJRZmaok1xW+vGdiiP98feabPMP/Kp
         aBPx0ykFimIn6St8Tqpk4/bpUfYBNkSBJZWJZE/jJg6KM/jm+gl14CGJzCSMMbwUhUjH
         SmJ0Zl1fY7arEK0IVYXHj4O3Ny/3uWr1MqvWatTeFnAwE4bIm42kqT2nfrAl/yAHk/Yi
         s67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802656; x=1792407456;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fscg4JINZL7Vzeywayyz5wQLf/idjMk2AC90hL5b11o=;
        b=EDyU0MeOGbD/5nG02drHoPlHW/YLw6h0ci7ZlYnm7IZ/A+vPMtvXHFCyLBDeEuOb0h
         26N2yPIsRaVbXkLMwjjJE/T0eQxxr4R1CahvZAw566WsY1lMgk4s6cyEa0TugaMZzqw6
         gTmQIWUbCm8u36c9ytbP5/eDmCB2Fy2Pdme8+GAR/2trx0tkv0bvplmuxRGuqa9K2dPr
         EvhrcVqILIA2fqhRsx9sbDO3D7RZHzxhj7XBuw6FMEcHFYeh+BwT9atZK44RwcQ2jWZD
         TPc987UytrbrRNwvIqM1DzGA1qH9PCG4+CCcD6wkXC4LAvcn7q4zLeJ2c0FIeFdGyQDV
         tUvA==
X-Gm-Message-State: AFq9FYKXTrXuvXbUc73Cik0jlE8O5t8UTDR0XclNKWcBKm+5VybQ3yhO
	/9JL+5sx2DRvCQU1bnZYaFAiR0j5MFghytwlVjkDlGUh2xbW/q4X9T31Kr2U870UCp+6aFcJgtG
	WXzrZXe4UrUPbXTvGC1Vd6rwvDVauZ6eTvbsJWgnfeqRgGhBrH9BoH7yGxBE=
X-Gm-Gg: AYBFou3cH8zmh1JeQE+R2StcjH/C7Aw5DtBUoSdxpoyWldxGsKiw2Rsumw9CtXjm5WZ
	ksgLmB+AC7Wzu5vAWvCdbeBNM4jPsaKRhbp0Zzf1MSrYtbVj7ZUaq2gxJCDtIAPLlt8MO61arm2
	dAmSWuKKI2OvNytagagUvN0AfrNO3imieWyHCTLfhfHA7Wl9f6jYP9AJMagBq1gGWPTy+4Hi1XW
	Q7tBgzJbN/ak4Xfaal4Kj8rFDqYi2ZuVd2dA7O6e27By2UJTOrVAocPjhIX5TWAljThI3m2YhoY
	aixgujJRpYxlbiIoZStiwGcx3mcT36jeGYr32czPk6vr4vkr6OO91KLKcGDSk/iPt0QVtAi03j6
	PkwLg2ZBTyvMq
X-Received: by 2002:a05:690e:dc2:b0:675:5b6b:64f2 with SMTP id
 956f58d0204a3-6793693562cmr2851523d50.31.1791802656620; Mon, 12 Oct 2026
 03:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 12 Oct 2026 12:57:25 +0200
X-Gm-Features: AclHuK8n4GCiKTJKoIe_GD4HnQ9qVHRTmopzfVjqxwULnllVJTlGBzQoSjMWJk4
Message-ID: <CAHTX3dJ4Hi0sHT9acVE+4r1pBU91Ryew9f-2D2vfDYcF98P7kg@mail.gmail.com>
Subject: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.4
To: SoC Team <soc@kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these 2 SOC patches to your tree.

Thanks,
Michal

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-7.4

for you to fetch changes up to 118be086595e8f98b19e8fa8e24276466a8e9483:

  firmware: xilinx: support RPU boot from DDR (2026-09-25 15:42:55 +0200)

----------------------------------------------------------------
arm64: Xilinx SOC changes for 7.4

firmware:
- Update UFS and remoteproc firmware interfaces

----------------------------------------------------------------
Michal Simek (1):
      firmware: xilinx: ufs: move PHY/SRAM ready polling into the
firmware backend

Tanmay Shah (1):
      firmware: xilinx: support RPU boot from DDR

 drivers/firmware/xilinx/zynqmp-ufs.c     | 70 ++++++++++++++++++--
 drivers/firmware/xilinx/zynqmp.c         | 44 ++++++++++--
 drivers/ufs/host/ufs-amd-versal2.c       | 46 ++++---------
 include/linux/firmware/xlnx-zynqmp-ufs.h |  8 +--
 include/linux/firmware/xlnx-zynqmp.h     |  5 --
 5 files changed, 120 insertions(+), 53 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
