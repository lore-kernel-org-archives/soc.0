Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C92910785
	for <soc@lists.linux.dev>; Thu, 16 Apr 2026 22:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776377753; cv=none; b=FvwBRQ8QzAZL6w44QFbyuD1B8I7CjSEskNE/u6s1MlxHgsz+FnW6Io7Rf9QL1fFqgaxPoiXwr0PcbbMGrlSW25VUy7bwUS7Cm3YIh3AVp37Twl/U/EgdYkPMgVxaSYxerqmYLlIkjLEWrcK9Fh7rvHaDrSbqdNoL5ueJ8S6zsYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776377753; c=relaxed/simple;
	bh=6eUJK5oQ/VJj2yne1Xaon7DzgAC5+o7YHi/mF2Mf1PQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=QWatM4OpVC7rVcjdVUEZeUzceJ9ZzFBCWwDt5TLImAP9rhFIziUONnjOUND196Eu5LyQpamQUHA5NREVue2YDSv5IyCO2Cp2Nk+77UVblDqHgtl2bbGcf8VT27M/jjGb7bChDaFfJByC5lnEnbCsvj7m6TcFnHapY8ocGCGGbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=mzqpl7Cs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ghvdtKno; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="mzqpl7Cs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ghvdtKno"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 7210E1D000F0;
	Thu, 16 Apr 2026 18:15:51 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 16 Apr 2026 18:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1776377751; x=1776464151; bh=pi
	yZZ06NisopB4fbJpzoJpYSQ4Dnz66ZsdJFLpE4gk8=; b=mzqpl7Cseiz481dz+9
	PGC2wpQJV3ZsSaHc6hUlCjM53IBH50DGyds1o2whwd6H/NXFSNqYJ/SOSYZx17TW
	y+USGIFCLmOUOcbU304WTOYEbu4M8HlPUI4IgvvM5WbM0xvFQokPDnt0jqcX0G+l
	pe3EHVlV6FngOXKpMug908VedhdGz1ZYxOy2J7mft/4Bi7NuA1GeQiWF4SVf8IZi
	qv3E/Bi0WyipEEtMrTS9ATzuA/SdyOIV1U4qpUczdTEf+JrEqBjI38zCSRrMKXTN
	tXonoK6pUmD/bxATZmmG8vH+J5xyWgvNkx2OyFK8SIA3IIHNPQ9FjbrAFdismJQ1
	863w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1776377751; x=1776464151; bh=piyZZ06NisopB4fbJpzoJpYSQ4Dn
	z66ZsdJFLpE4gk8=; b=ghvdtKno2W7jqQJfrBfhMl/N+Njtd/FEGhOE8VtryPo8
	U00Xnjw6oV/iZBlkfN+vW5rUgAtzJUPVWj++jt+DJykEmMe9s45nT6mnxJV5qmg8
	umbAHV1kMpxFB8nfXtzo4SAT6hAYDuGrShLWxM6kXcLml/e3MlfFONZSndA4ILfI
	mCIkgowxllRVAkbFdS8xmQaiRIg3vVs/ijw1mPUy9oxf9L1gEvRIx+OerAxb/xTi
	9YoLzL7yhEZanUJudaRYrplrXhkdVEuRx5C10Nx/V6XxNzjKlT/zFhjqVUp8mU2T
	5PbwFRE2f+3hFeHkw1TreP5vF0YHuV57t+8d5EuSVg==
X-ME-Sender: <xms:ll_haeZo6Y4tMcg2rRIafWhbkMGZfEyI08t6EQogOUG6lNYW5XjuFQ>
    <xme:ll_hacMhN5EKqWP4FT1Bv0_444Twtcm5BsIVG-jcCDk6ehtczSyT6RsCPvBbFQFjz
    br3FGkBTqKZdfm0fCTUvJ5flU5bosv2EUIDjAXNeBOIXpkm1pUChQE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegkedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcuuegv
    rhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpe
    elveehkeffgfdtheekveehhfdtheefkefggeekheeuhffgheejteevgfdtuddvkeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrg
    hrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:l1_haYHuBdi1uJR1lkO1i4HTUhv4Y4kdwTvk-9dQORss55iPw0jAgQ>
    <xmx:l1_haYNZ5yY6G2103pb5qmTR_dn5iGX-6rSWSeE0wvlyVmJeJ7q58w>
    <xmx:l1_haadhwyyhkZ7ZRKK7L5a9l5f5PlYeTr3Axj-TJZqoPU4N4yanWQ>
    <xmx:l1_haVvIgfbT8TTSbewnkhdxN55j3NC5VcKXg42UgEm-A7euZFSpbA>
    <xmx:l1_hafdUv1FbhA9McM7-uoNAqG960JwbUY66z1FUt5sXXzt1jUATO2cJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DF08D700065; Thu, 16 Apr 2026 18:15:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 17 Apr 2026 00:14:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com>
Subject: [GIT PULL 0/4] soc branches for 7.1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This is another larger set of changes from the soc tree after a rather
quiet 7.0 merge window. In total, we merged 88 branches with over
1000 non-merge changesets, in large parts due to massive devicetree
updates on both Qualcomm and NXP platforms. These include a total of
12 new SoCs, all of them part of an already supported chip family.

The most active contributors by number of patches were

     43 Krzysztof Kozlowski
     27 Frank Li
     26 Dmitry Baryshkov
     25 Alexander Stein
     23 Marek Vasut
     20 Thierry Reding
     18 Josua Mayer
     17 Stefano Radaelli
     17 Sherry Sun
     17 Fabio Estevam
     17 Bartosz Golaszewski
     17 Abel Vesa
     16 Luca Weiss
     16 Barnab=C3=A1s Cz=C3=A9m=C3=A1n
     14 Konrad Dybcio
     13 Lad Prabhakar
     13 Gatien Chevallier
     12 Francesco Dolcini
     11 Svyatoslav Ryhel
     11 Rosen Penev
     11 Jon Hunter
     11 Christophe Parant

and this is the corresponding dirstat:

   0.8% Documentation/devicetree/bindings/arm/
   0.9% Documentation/devicetree/bindings/clock/
   0.3% Documentation/devicetree/bindings/soc/
   0.7% Documentation/devicetree/bindings/
   0.2% arch/arm/boot/dts/aspeed/
   0.3% arch/arm/boot/dts/broadcom/
   0.4% arch/arm/boot/dts/nvidia/
   2.7% arch/arm/boot/dts/nxp/imx/
   0.9% arch/arm/boot/dts/qcom/
   0.2% arch/arm/boot/dts/renesas/
   1.0% arch/arm/boot/dts/rockchip/
   0.4% arch/arm/boot/dts/samsung/
   2.1% arch/arm/boot/dts/st/
   1.1% arch/arm/boot/dts/ti/omap/
   0.2% arch/arm/
   0.3% arch/arm64/boot/dts/allwinner/
   0.9% arch/arm64/boot/dts/arm/
   0.2% arch/arm64/boot/dts/broadcom/
   0.3% arch/arm64/boot/dts/exynos/axis/
   0.5% arch/arm64/boot/dts/exynos/google/
   1.0% arch/arm64/boot/dts/exynos/
  17.4% arch/arm64/boot/dts/freescale/
   1.1% arch/arm64/boot/dts/microchip/
   0.6% arch/arm64/boot/dts/nvidia/
  37.2% arch/arm64/boot/dts/qcom/
   1.4% arch/arm64/boot/dts/renesas/
   2.1% arch/arm64/boot/dts/rockchip/
   0.3% arch/arm64/boot/dts/st/
   3.3% arch/arm64/boot/dts/ti/
   0.4% arch/arm64/boot/dts/
   1.5% arch/riscv/boot/dts/microchip/
   0.8% arch/riscv/boot/dts/spacemit/
   0.4% drivers/bus/
   0.3% drivers/firmware/
   1.1% drivers/memory/tegra/
   0.3% drivers/memory/
   1.8% drivers/reset/
   0.2% drivers/soc/microchip/
   0.5% drivers/soc/qcom/
   0.2% drivers/soc/tegra/cbb/
   1.3% drivers/soc/tegra/
   0.3% drivers/
   1.4% include/dt-bindings/clock/
   0.5% include/dt-bindings/reset/
   0.3% include/linux/
   7.4% include/soc/tegra/
 977 files changed, 90981 insertions(+), 15252 deletions(-)

