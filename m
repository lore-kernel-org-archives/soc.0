Return-Path: <SRS0=laJX=3W=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C26C4332F
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 19:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4810EC43141; Tue, 22 Nov 2022 19:01:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF61DC433D7;
	Tue, 22 Nov 2022 19:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF61DC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AMJ1aJb116038;
	Tue, 22 Nov 2022 13:01:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669143696;
	bh=pKXhdm63IbbLRUukYdddKdNazXjFUljBmoE9q//OQ5U=;
	h=Date:From:To:CC:Subject;
	b=ALt3VBZtbVml5jcMlYYK82PSMrlxzkZuMnX77oRHHDYGA4daOors0Cxk8iIpIHu5v
	 rqsAjbKVsjQTcf6ZFReOHlJclrwYVdRanJS+jT1ssv0UrHdJXeDMzaL1k7DW1Wly9J
	 wN21ryFTJcty0us24zJteqLHvsdLtD0QJMqXFtVY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AMJ1axj088671
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Nov 2022 13:01:36 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 22
 Nov 2022 13:01:36 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 22 Nov 2022 13:01:36 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AMJ1aQE031362;
	Tue, 22 Nov 2022 13:01:36 -0600
Date: Tue, 22 Nov 2022 13:01:36 -0600
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 2/4] soc: ti: TI updates for v6.2
Message-ID: <20221122190136.avoej5i6zccbcds3@ammonia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4jvkqqm5wczfxiol"
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--4jvkqqm5wczfxiol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please find the TI SoC driver changes for v6.2-rc1 below.

---
The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driver=
-soc-for-v6.2

for you to fetch changes up to 14c7137ac750d034580a38edbaf807064ae64699:

  soc: ti: k3-socinfo: Add AM62Ax JTAG ID (2022-11-21 10:29:28 -0600)

----------------------------------------------------------------
TI SoC driver updates for v6.2

* Minor bugfixes for knav_qmss_queue, smartreflex drivers
* API optimizations including using devm, bitmap apis to
  ti-sci, soc-info drivers
* k3-ringacc and k3-socinfo can now be built as modules for
  certain distros that mandate such usage.
* k3-socinfo can now detect AM62A SoCs.

----------------------------------------------------------------
Chen Jiahao (1):
      drivers: soc: ti: knav_qmss_queue: Mark knav_acc_firmwares as static

Christophe JAILLET (3):
      firmware: ti_sci: Use the bitmap API to allocate bitmaps
      firmware: ti_sci: Use the non-atomic bitmap API when applicable
      firmware: ti_sci: Use devm_bitmap_zalloc when applicable

Georgi Vlaev (1):
      firmware: ti_sci: Fix polled mode during system suspend

Nicolas Frayer (2):
      soc: ti: k3-socinfo: Convert allocations to devm
      soc: ti: k3-socinfo: Add module build support

Peter Ujfalusi (1):
      soc: ti: k3-ringacc: Allow the driver to be built as module

Vignesh Raghavendra (1):
      soc: ti: k3-socinfo: Add AM62Ax JTAG ID

Zhang Qilong (2):
      soc: ti: knav_qmss_queue: Fix PM disable depth imbalance in knav_queu=
e_probe
      soc: ti: smartreflex: Fix PM disable depth imbalance in omap_sr_probe

 arch/arm64/Kconfig.platforms     |  1 -
 drivers/firmware/ti_sci.c        | 24 +++++++++-----------
 drivers/soc/ti/Kconfig           |  5 +++--
 drivers/soc/ti/k3-ringacc.c      | 28 +++++++++++++++++++++--
 drivers/soc/ti/k3-socinfo.c      | 48 ++++++++++++++++++++++++++----------=
----
 drivers/soc/ti/knav_qmss_queue.c |  3 ++-
 drivers/soc/ti/smartreflex.c     |  1 +
 7 files changed, 73 insertions(+), 37 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--4jvkqqm5wczfxiol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmN9HIgACgkQ3bWEnRc2
JJ3iahAAjsTd/PTo/ru2TVndAEEMCnE3Tp6H4iNjfwZlk0ZmeZQhh0knI+9+4P/d
NuKQyPgoCqRnX+XDOedkMPgu1pcAIZjv1QwJdMQP9FnfSnw3BNL6fMsgSrVKUMuL
G1bdkOBj1V1GUbvkoOMZrY0glTioXGFars/bY2KW7AWqSwDjj6DqMGuudHBkDfvU
6y30o8KMMwkm5+CMe1HA3e0LwIN66H58o2po4YWbSoF8FwtteurAePqZEgHXdFEt
Nwt3G1ay9nt69FTRHzhNDeKeBp0CBamsS2YLjX1rBkzHyrT6jN9RrtSK/RsS45vI
I+d8zEAufgHXeqRlZPH2tH+J0T5I6AjhHcOMKBS/Ecwq3TttkwZ763ZcYZG3Aboz
VAXFeADTGUcCI2pZZc1oB5DL88g7umjW0rtAJW7Q02U+o8incyup4z9dsZNAnXHM
S2CIRHmve4VfcPM+hXAmj9l7HfS79ZQzpryB1vk65c4WnIFMkm1MZ7GjVczQY8bI
x7Ey/V08AkMVSXGFgd7cVNHzEQFzlMImEWMPMdWU7heYylxjY1BThpoeirdpEfOW
c2uPiHgg68L+6t7b+gndUUDzccqbPJDb0mx7xhlWXzRyQlMFGxta/011wsnzadSh
gA3vrQ3E0d1VHJZ1xtPy6ysYwGniC1Bzx95SQN6xPjf+/2VvpyQ=
=i7Fq
-----END PGP SIGNATURE-----

--4jvkqqm5wczfxiol--
