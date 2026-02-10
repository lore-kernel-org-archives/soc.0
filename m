Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E3E3246F0
	for <soc@lists.linux.dev>; Tue, 10 Feb 2026 17:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743073; cv=none; b=ff5o88HzWHmhmu2C2rwkGRCxL20Wsc4pzUJ5Aww0OSV6QJ0XBSNQeq6QmD2PiStMcDuY+E49ZNBnO01oM7jcdsn9AFmOTJ34fzEuHEgmWdNh/I411WbH3OmCj6D8n/mrTujRk1AAxbkaOLCgSRZEoMEr/4r7CEaAK5Ha9IqcTqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743073; c=relaxed/simple;
	bh=sOq/fwWDxXIkbcoMBADfytwiXHo9XwMtE9L0RjJ6ezg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=dIi+01hFNE+hLdLYJfvNlilAso+B1la0OmWcND9Dn0jz30vpm1mXprRu/v2mBKmkjpTa9otWlgJaOpW1icvoFZcVRx7nmUeG+9UQBunXSlevLTad78QE0WFe0c9xIG9idxbkxdJBiIo5DyGonuTkLlC1r+x2EzB12qNH05JA6ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=L0+6dQfZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E0udqLk9; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="L0+6dQfZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E0udqLk9"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id ECF487A00EA;
	Tue, 10 Feb 2026 12:04:26 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 10 Feb 2026 12:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1770743066; x=1770829466; bh=uS
	5dkroWDYoVr9gb0lK7EVf1IOyETk+czez2T6E0mRc=; b=L0+6dQfZW6kp7ZdOSr
	zIQW+8Hoy9igWFIk+Zq9DYFsxLR5M6wyCVa27Zv0IwZt6mdFnYINNDG/Vuyo94lj
	5D0hQ9boMFTElasP0En+24Cqe4Yuih+W6g5F4AEO49d7jKWLqW3fFr5q4csXZJ03
	kyU993fOAElorchwhPD+2P5gMMWFvOkeM1klo+SkDIN6h/bdguVTGmM/Z3uCa0da
	0C7uV9hyiYom2Bx+GVzLc6WFaN+6pVUN6rMZTLUn3qGdNvvThhzrwHbNqJv4+Cyi
	9I10AFpMFKt8Y2qQ4RZSKrpC/JrC33iHlnta35WDFhHXEzjI1MMMADppkgnwXjCS
	XdQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1770743066; x=1770829466; bh=uS5dkroWDYoVr9gb0lK7EVf1IOyE
	Tk+czez2T6E0mRc=; b=E0udqLk9kuMXBOmsns4AW6z4dowYBs3os/+QDf29xJxX
	NtcCgZoLkC86r7WLGJxWEhlpGDi7qlk8w9yNm8x5cP3mqHC1CX0u/xCQOHPAS5UH
	pV9FJLdyUtjkuVh+axw+0Bd1LV2vkrnb6PhFH1DUOv4ePEXRTGT2JsmPAOxMdYs4
	G04dX/jCGC+jzlB484b4Qv8anMyDz6b5jOTISoNhLTPYafr/rtDs1me5bBUBrijp
	xsNZxaWIn6gQ1zjGbJ7tIYf2vpoIXCwlKFT4Ozrxqn/5ByOrJit/CGbygRfWSrm4
	lEKruVncwx1a7VcXZ5YqAxqs+ATeFyFmW19jdbJ7Rg==
X-ME-Sender: <xms:GmWLac2Vc5EU1a-OxWmhmduqF825zRzPM7xHVtEJ6HxlunMsXkcf-Q>
    <xme:GmWLaR7KV4G37VC6ZN8MESSdxSkFtLvWzHorGvquuUM6GU6hW5g55S4rdkaUS4MCG
    qDIIt2WpdC7xxFVnPi25-ZBmK5TFCYGMP0Eu4oC3DDWSvvM1mCBN3Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddtvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkffutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epffffffehuefgfefhudevgfelieejkedtffefieejtdfhvefgieeiveejueetfedvnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhr
    rgguvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvg
    hvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:GmWLaeiaA8O-Posj8_LG7AcD3NTOcakKFdShayuWFI-Ao2amcZzm6A>
    <xmx:GmWLaV5Lwl4zKpIXg4MJQHnDh4KwM7IqLtTk5UPsXx9nxmqj8OaitA>
    <xmx:GmWLaeYdK4rpngCRdVfonh28W28Zw8O6l2x77LfuPufNoIoiuN5BcQ>
    <xmx:GmWLaS6J4Roj04gNQ0cQ-B6FAvxwH52NuWHqaASxS4ZmCxTfXnzoaw>
    <xmx:GmWLaUKlxR3PxrCo4t-e-AhNtFauJW1FZ6GLENq-CZkL3apoyaYmzYGR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 470E7700065; Tue, 10 Feb 2026 12:04:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AYfK9ZjhzOaF
Date: Tue, 10 Feb 2026 18:03:15 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com>
Subject: [GIT PULL 0/4] soc updates for 7.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Linus,

The 7.0 merge window seems fairly quiet for the soc tree, with
only 757 non-merge changesets throughout the tree, and three
quarters of those being arm64 devicetree updates. A few new
SoC models got merged, but fewer new machines normal.

The most active developers this time by number of patches are

     37 Rob Herring (Arm)
     35 Krzysztof Kozlowski
     26 Lad Prabhakar
     25 AngeloGioacchino Del Regno
     18 Luca Weiss
     15 Vladimir Zapolskiy
     15 Heiko Stuebner
     15 Guodong Xu
     15 Cosmin Tanislav
     15 Alexander Stein
     14 Peng Fan
     14 Alain Volmat
     12 Frank Li
     11 Patrice Chotard
     11 Francesco Dolcini
     11 Dmitry Baryshkov
     10 Stefano Radaelli

and this is the overall dirstat:

   0.5% Documentation/devicetree/bindings/arm/
   0.3% Documentation/devicetree/bindings/mtd/
   0.5% Documentation/devicetree/bindings/riscv/
   0.5% Documentation/devicetree/bindings/
   3.2% arch/arm/boot/dts/aspeed/
   0.8% arch/arm/boot/dts/microchip/
   0.6% arch/arm/boot/dts/nxp/imx/
   0.2% arch/arm/boot/dts/nxp/lpc/
   0.5% arch/arm/boot/dts/qcom/
   0.5% arch/arm/boot/dts/renesas/
   0.4% arch/arm/boot/dts/st/
   0.6% arch/arm/boot/dts/ti/omap/
   0.2% arch/arm/boot/dts/
   0.2% arch/arm64/boot/dts/allwinner/
   1.3% arch/arm64/boot/dts/amlogic/
   3.2% arch/arm64/boot/dts/apple/
   0.4% arch/arm64/boot/dts/broadcom/northstar2/
   0.8% arch/arm64/boot/dts/broadcom/stingray/
   0.3% arch/arm64/boot/dts/cavium/
  22.5% arch/arm64/boot/dts/freescale/
   0.5% arch/arm64/boot/dts/intel/
   0.4% arch/arm64/boot/dts/marvell/
   4.3% arch/arm64/boot/dts/mediatek/
   0.2% arch/arm64/boot/dts/nvidia/
  31.6% arch/arm64/boot/dts/qcom/
   0.8% arch/arm64/boot/dts/realtek/
   9.5% arch/arm64/boot/dts/renesas/
   7.1% arch/arm64/boot/dts/rockchip/
   0.3% arch/arm64/boot/dts/st/
   1.0% arch/arm64/boot/dts/ti/
   0.4% arch/arm64/boot/dts/
   2.0% arch/riscv/boot/dts/sophgo/
   2.4% arch/riscv/boot/dts/spacemit/
   0.2% arch/riscv/boot/dts/
 775 files changed, 52313 insertions(+), 5630 deletions(-)
