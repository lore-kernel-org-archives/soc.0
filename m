Return-Path: <SRS0=0pa8=VP=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFA3C433F5
	for <soc@archiver.kernel.org>; Sat,  7 May 2022 16:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 990E9C385AF; Sat,  7 May 2022 16:34:36 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 931D0C385A5;
	Sat,  7 May 2022 16:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 931D0C385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 247GYOsO100792;
	Sat, 7 May 2022 11:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651941264;
	bh=KsRZNDmgoelvf0kK1dKKAXpofC9r2Cv6+TG6t7Sk8Ig=;
	h=Date:From:To:CC:Subject;
	b=PzEMVlVv+k9vtdDMyWpDi/Pc3sgbzPh0iWSfOOUZ695O8rJ7sFDh0LVKkfrA2mTkY
	 EUdA9zgyx2PplLFN4mYiErfUGgGBqKZ8rSCskVbCmMxEZcB6I4hdw/YGkARdfQWD7N
	 qFjYM+XuEU/I0BF4DMrmB7ttA2XFvT/enLrfBouE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 247GYO9u028525
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 7 May 2022 11:34:24 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 7
 May 2022 11:34:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 7 May 2022 11:34:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 247GYOkD059361;
	Sat, 7 May 2022 11:34:24 -0500
Date: Sat, 7 May 2022 11:34:24 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Subject: [GIT PULL 1/2] TI SoC driver updates for v5.19
Message-ID: <20220507163424.pvqnwrxpoo73lmp2@debtless>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iwayok4dasbo5xos"
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--iwayok4dasbo5xos
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ARM SoC maintainers,

   Please pull:

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driver=
-soc-for-v5.19

for you to fetch changes up to 2a21f9e6d9a408dbd09a01caf5fff42c2f70fa82:

  soc: ti: wkup_m3_ipc: Add debug option to halt m3 in suspend (2022-05-03 =
08:02:09 -0500)

----------------------------------------------------------------
TI Driver updates for v5.19

* wkup_m3: io isolation, voltage scaling, vtt regulator and a debug option =
to stop m3 in suspend.
* tisci: support for polled mode for system suspend, reset driver is now en=
abled for COMPILE_TEST
* knav, dma.. misc cleanups for IS_ERR, pm_run_time*, and various other fix=
ups.

----------------------------------------------------------------
Dave Gerlach (5):
      soc: ti: wkup_m3_ipc: Add support for toggling VTT regulator
      firmware: ti_sci: Switch transport to polled mode during system suspe=
nd
      soc: ti: wkup_m3_ipc: Add support for IO Isolation
      soc: ti: wkup_m3_ipc: Add support for i2c voltage scaling
      soc: ti: wkup_m3_ipc: Add debug option to halt m3 in suspend

Haowen Bai (1):
      soc: ti: knav_qmss_queue: Use IS_ERR instead of IS_ERR_OR_NULL when c=
hecking knav_queue_open() result

Jakob Koschel (1):
      soc: ti: replace usage of found with dedicated list iterator variable

Minghao Chi (4):
      soc: ti: pruss: using pm_runtime_resume_and_get instead of pm_runtime=
_get_sync
      soc: ti: knav_dma: Use pm_runtime_resume_and_get instead of pm_runtim=
e_get_sync
      soc: ti: knav_qmss_queue: Use pm_runtime_resume_and_get instead of pm=
_runtime_get_sync
      soc: ti: pm33xx: using pm_runtime_resume_and_get instead of pm_runtim=
e_get_sync

Minghao Chi (CGEL ZTE) (1):
      soc: ti: omap_prm: Use of_device_get_match_data()

Philipp Zabel (1):
      reset: ti-sci: Allow building under COMPILE_TEST

QintaoShen (1):
      soc: ti: ti_sci_pm_domains: Check for null return of devm_kcalloc

Yihao Han (1):
      soc: ti: wkup_m3_ipc: fix platform_get_irq.cocci warning

 drivers/firmware/ti_sci.c          |  61 +++++++++--
 drivers/reset/Kconfig              |   2 +-
 drivers/soc/ti/knav_dma.c          |  29 +++--
 drivers/soc/ti/knav_qmss_queue.c   |  21 ++--
 drivers/soc/ti/omap_prm.c          |   7 +-
 drivers/soc/ti/pm33xx.c            |   6 +-
 drivers/soc/ti/pruss.c             |   3 +-
 drivers/soc/ti/ti_sci_pm_domains.c |   2 +
 drivers/soc/ti/wkup_m3_ipc.c       | 210 +++++++++++++++++++++++++++++++++=
++--
 include/linux/wkup_m3_ipc.h        |  13 +++
 10 files changed, 302 insertions(+), 52 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--iwayok4dasbo5xos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmJ2n4kACgkQ3bWEnRc2
JJ1qFxAAgEp/raJcdD10+8dfSB7nDWKTFeg3l6KFlC8qTNYL6Yss+A51oJisH6Qd
wGmrV18LKus6jCsGVbc8P+ZjqvFNxzZL+nLI0POdDPKaHendF2uJljFHYmpBt0Sd
MU9kqDVsY59A9/Msm2fILcv9+vJ0KMRn6uZzaDX3/noWn7VpJgI4e4GYa2hDksTA
+fUzOMUm3zFknma3vgpV7KUUs6f2dSuPXSn4UKFYvwhXxeWBPZTD3nRagy46l+zK
wvVJKHfqoCXDbABmukCBlkSxZ9K6XFHLcIgYdBPz6NrBVAM+x8CyM3PBnnz44p5Y
eISkgNv0bn8eDPuZeeBlM3AMY4yUfQJNb486tNtyA+FzrUam6bFR78Txgtonx9nz
cxrbw4RMYc+aO34szhuFyzLopwqaQJuBU+Bao3seFxAhqKFkGxG/duRae3OaEH4M
+f8V544SEYw3cPUE48HN1Rm1ckL+pbEGMwGRK4pvSqeES4qTCbiKuIY8/Kf/yFhu
2TwbTXc6timJ3WAHobg4IbJc6kJRxcRRnnITVr2n0NJNCHGujdhBSpZgO7aima7Z
xIjqx18TBUnpMj+DdIi62tfhFYg583/NwZyBafW9Am8EmQM2ZTt24Nsp15wEZhyB
tzNH+0kZoFh59j7qFfzJDKKJWAEJrolw1KzUTPRkR1pkGQ5hiDw=
=IF0E
-----END PGP SIGNATURE-----

--iwayok4dasbo5xos--
