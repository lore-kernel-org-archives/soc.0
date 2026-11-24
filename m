Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544349;
	b=E88whg7u363Von9LSZmleN9Fl7P1ljg4ioa61b1Ooy0Y6AtL8SpxEbnKnAHPOcU54rAa
	 YHSMM9pDP4Hg/7SAFrzsZ2fNKrQNGy+QeutFQTLE1nMWtbn99AugVmH07wWGaEVVfL8z3
	 TfIydMgxCJfd4MoPtXvVNUImclC2oWalTXR0wDa9lhkFXWt7LoUTHKP2UsrqOxY08BbLm
	 uASek/D1dBmpO6lVEaEZdRqV06BdYUkTv4BdET352Kl+gDgHoQklcLV1zxYIUrhodcMtd
	 bZKWnW3o35yviDkHaIMSU/IUQyMqqftV/j8KrVHEejfFi5cRNo+RA7T2FFNLlrqrOqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544349;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bJMzVzbCZ/eXll3kanPweMPP8+MueKszbQ0YDiOQAlU=;
	b=aIb5tDZf05yJxxQxKb9z+zvKdcqV5H5bbvsjd6u9Qnwm+TiokQMnLrCSvI4bGbm7KtD2
	 rht6W1R/daGur/+JXHd6aV/jgJ+W0kfKm0RyNYxrLxGIgneE+dN5PAXnnSJq9vSzY+3nM
	 4RKIl/iUspx7ESRnNcWYpyvGE64W2ylTf6XVYmj564A1te21J2DrSoFKn0QSbfYhTbBae
	 6AKgnqzbx0rmJHf9SBXiunAQqMycJDrzsC9i3q43EUx1htjtPnVmoT5DZqnRrIPgG7CoC
	 fqTpZrf5bazb4RRsVweqLbg8pPcn4XeCmIh61VDTHMM321q4eqPBBD5rmc29yny+i5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=genQOJjw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B117A606A33D
	for <soc@lists.linux.dev>; Tue, 24 Nov 2026 18:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=genQOJjw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C3B1F000CA
	for <soc@lists.linux.dev>; Tue, 24 Nov 2026 18:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795544349;
	bh=bJMzVzbCZ/eXll3kanPweMPP8+MueKszbQ0YDiOQAlU=;
	h=From:Date:Subject:To:Cc;
	b=genQOJjwG62bqWdH29OiuvPTf9cF4IqLi+YPa8EnEf6hBIxUBsbclOl+2BOv7APlw
	 Az0ruV1e1d1mogOug1I+38yiZLcXQXfLft+jtDsNZB+RcHW73Io6mzm2QjzZaPrC0u
	 l5miwqJ66D4c241D0dDLIvcoomgnDCCZVtcmmZx3sB4aSLt5mgPNKLtfOG3ypAMdUp
	 kdqOznHHcyuxijSWHNYPzTcczb/aqjYccUmjrEKQMs4AhEXznN1m6U2lNO/0f8lkEJ
	 mb6cjY0tkT2aLXosgfZNeJ08yOZAbNPTP0QA58ij0G++WoBSp/RLiK6RYEjbDMnFw2
	 vA7/B8fFSb60A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bccecba199so4697268e87.1
        for <soc@lists.linux.dev>; Tue, 24 Nov 2026 10:19:09 -0800 (PST)
X-Gm-Message-State: APuU4Z8OAzncMuftcuUuegq8Afa53gtfADSZXu5r1DLgfhWs3NspyN18
	jneMtPc+YysLrEzgkOjdrgh5S9O7KRkG6HyQI60siFFTz32Iz8Y/AHnJI04Qa5b+ZI/e5kUcKAo
	CRWdaLGe4Lgq84FfEiPZ9mx99f09ynuI=
X-Received: by 2002:a05:6512:3ca5:b0:5bf:c239:71ad with SMTP id
 2adb3069b0e04-5c1bc802154mr5508244e87.38.1795544348044; Tue, 24 Nov 2026
 10:19:08 -0800 (PST)
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
Date: Tue, 24 Nov 2026 19:18:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLkAjWe12teziGE3-81R0tpO47USD6_pLMMrJ4_DXSOa9g@mail.gmail.com>
X-Gm-Features: Aa3M54pIgl57JFg90kutrTDazmVajLRDQYbXRH0F1nZdWP8ta1PJg9pzX_V5wZA
Message-ID: <CAD++jLkAjWe12teziGE3-81R0tpO47USD6_pLMMrJ4_DXSOa9g@mail.gmail.com>
Subject: [GIT PULL] Ux500 Powerdomain DTS changes for v7.5
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

these are the power domain changes for Ux500 for this kernel cycle.

I'm especially happy about this one because it pays of a huge piece
of technical debt as we started doing things wrong in ~2010-2011
and then have tried to back out of it for 15 years. Related changes
to powerdomains, mfd, regulators, clocks, (also bindings) etc etc
are merged into each respective subtree.

I also have a large set of DT fixes that I might send for this kernel
as well, on top of these.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-pd-v7.5

for you to fetch changes up to ce2efbd2e360243deaf4b2a7502714da1a50d06d:

  ARM: dts: ux500: Remove DB8500 EPOD regulators (2026-11-22 10:23:53 +0100)

----------------------------------------------------------------
Ux500 Power Domain changes for kernel cycle v7.5:

- Required bindings changes have been merged to respective
  subtree.

- Rename the powerdomain node according to standard.

- Add the actual power domains to each applicable peripheral.

- Remove the DB8500 EPOD (electronic power domain) regulators.
  This is an old technical debt due to power domains being
  implemented as "some sort of regulators" in 2010 or so.

----------------------------------------------------------------
Linus Walleij (3):
      ARM: dts: ux500: Rename power domains node
      ARM: dts: ux500: Add power domains
      ARM: dts: ux500: Remove DB8500 EPOD regulators

 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 156 ++++++++++++-----------------------
 1 file changed, 53 insertions(+), 103 deletions(-)
