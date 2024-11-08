Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1B61E7C29
	for <soc@lists.linux.dev>; Fri,  8 Nov 2024 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058535; cv=none; b=PdqYg2sJNpCfBjJNfLcjdNigwHL3f9JTdGYY1vVXeDjFUB8+6kAjdPOlo3yuMZDmCd5M7/jk384bD71ZAcTSp7V3oT+DEsYvcY0Xxu5NpKJ6FjUl/CWT00//IXAtg4jfehDOdOLDS7eE6DRn2beZBkX3Ev/UMvXk8AEdHSaatFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058535; c=relaxed/simple;
	bh=GDxzj0QKXUQur7gQweWOfogC613d1mCeHx4hdFJR13s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b4GSPjtE6LYrs3JArAMxAjIenQgZ5PR7dhHHAI0JdRr1H/fkUF+9Hbfq/B4HNfwtBaieAcaPZyxTtq0FRUnoMrsH/pTC87jqCngMfvnRHYPyW2xFPcr3VAgH8fAlCGhs9DcWB6RfGh+gp86rAl9vHhhxEbLV9BeyjsD0rUJgn48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RrOHBp+N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RrOHBp+N"
Received: by smtp.kernel.org (Postfix)
	id 2F6C6C4CED4; Fri,  8 Nov 2024 09:35:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41D73C4CECE;
	Fri,  8 Nov 2024 09:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41D73C4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44ED460002;
	Fri,  8 Nov 2024 09:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731058531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gNP71UrXuvynxgrvdBRMLqCWlumcTTVVhYh5Lzrpocc=;
	b=RrOHBp+NB1piwCJpl++yMngy104p79U8ApZrPNilufrCF2mTng+4vQZmu6teAZZ0td1p9G
	HablM257ErUbPC19ABEHPr6a322nYfWU4KSWtQB8H0xcJ9Nu/GmkA7CLz5JpfVxnJ6rlpI
	+DyC7Exb8z/g8AjEFPxqI5LEtlyBFBKXbohPjYRN0g2HA0NfPbh0sUIwDgsdnpDM0zRwVx
	kEtoJppcP+UMN3hVapw/DoicAZJGaXrL28JVrabVGeOkMfpfTlABS0OkImy+fuGIkxMWE0
	eRXtiZ9Z1TwlM1OVb7MaLrUPMP7e+ujfRnfgPLwUf6ga3r/Dx/K0fZpUjr7EUw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.13 (#1)
Date: Fri, 08 Nov 2024 10:35:30 +0100
Message-ID: <878qtu83vh.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt64 for mvebu for v6.13.

Gregory

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-6.13-1

for you to fetch changes up to facbe7092f8a92dd991ef8c1162136f7767ee3c4:

  arm64: dts: marvell: Drop undocumented SATA phy names (2024-11-05 17:28:0=
3 +0100)

----------------------------------------------------------------
mvebu dt64 for 6.13 (part 1)

armada-*: Drop undocumented SATA phy names

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: marvell: Drop undocumented SATA phy names

 arch/arm64/boot/dts/marvell/armada-7040-db.dts             | 1 -
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts       | 2 --
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-db.dts             | 2 --
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 2 --
 6 files changed, 9 deletions(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
