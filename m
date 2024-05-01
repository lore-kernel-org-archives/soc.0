Return-Path: <SRS0=oGBH=ME=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72944C4345F
	for <soc@archiver.kernel.org>; Wed,  1 May 2024 12:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45F39C4AF19; Wed,  1 May 2024 12:43:14 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6BD2C113CC;
	Wed,  1 May 2024 12:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6BD2C113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 441Ch0BJ092358;
	Wed, 1 May 2024 07:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714567380;
	bh=9zeGrx8/g53vdKI8P01kUnQCeIDP16OwD9S+bvjYXGY=;
	h=Date:From:To:CC:Subject;
	b=CZCwmCS+mH9dMvmQZnAzdlJ3iJJmsDg8gQPDJ1+yIIwvqBcWnIkYTZjWoqasBZ0F4
	 jQsM4Tlfz4wzcd1uHp04EXrHwPHjxRbY7IIyZfxfMrlVHo/ciXcByI2/b/7HHW9aaB
	 ppsQIV+42U4XKf6RtiU54kXW2KbrlpwHTKr/QLzo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 441Ch0Tg033740
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 May 2024 07:43:00 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 1
 May 2024 07:43:00 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 1 May 2024 07:43:00 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 441Ch0VL019428;
	Wed, 1 May 2024 07:43:00 -0500
Date: Wed, 1 May 2024 07:43:00 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Arnd <arnd@arndb.de>, Olof <olof@lixom.net>, SoC <soc@kernel.org>
CC: <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony
 Lindgren <tony@atomide.com>
Subject: [GIT PULL 1/3] soc: ti: Driver updates for v6.7
Message-ID: <20240501124300.i5jzeugdlrlnfg22@undrafted>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4bwlrw3hplnu7m6d"
Content-Disposition: inline
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--4bwlrw3hplnu7m6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull:

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driv=
er-soc-for-v6.10

for you to fetch changes up to ddbf3204f600a4d1f153498f618369fca352ae00:

  soc: ti: wkup_m3_ipc: Send NULL dummy message instead of pointer message =
(2024-04-09 11:11:59 -0500)

----------------------------------------------------------------
TI SoC driver updates for v6.10

Generic Cleanups/Fixes:
- wkup_m3_ipc: Minor optimization to send NULL dummy message instead of emp=
ty pointer message
- ti_sci: Register restart handler unconditionally

----------------------------------------------------------------
Andrew Davis (3):
      firmware: ti_sci: Use devm_register_restart_handler()
      firmware: ti_sci: Unconditionally register reset handler
      soc: ti: wkup_m3_ipc: Send NULL dummy message instead of pointer mess=
age

 drivers/firmware/ti_sci.c    | 24 ++++++------------------
 drivers/soc/ti/wkup_m3_ipc.c |  7 ++-----
 2 files changed, 8 insertions(+), 23 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--4bwlrw3hplnu7m6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmYyOM4ACgkQ3bWEnRc2
JJ2hLw/+MSZSJd2W4TJrESZMjQ7LFyuZ+JwQMpxpN7J6XAI9wzdlYnVb0SXSYP4+
LScuaoEx4z8k/7tYP89WIaTxHMOb4xWsYKO7J51NVOmZm+k5vCL27Pt8JiPUULSH
Xiigv7PXBO0F99JdWXM96m09YnHqRf1Xds4tdZRRgs46My5akbM9TtUnk73wnTTv
R+UaVFlcPgDjYFDfd3RwGtKhlgmY/XeT8RSZeIkNvkQC0pXyRF3OS/wl0qj5qsB8
SAVP9vuyAb4D2YomWJOSabqiCfQihp8ShrBxhJhF8Zy4cv2wACdl8+D5k42qe2hA
reabZGiNYPEVZAFrz4hFOUF1wOUWlVbrkwvNXQE2AvjZSXVI0KUETWKeHttZ1xZ2
T8/cKWXeqZKA71lBeNRoa/+DxyCEFZStG5Rfrw2LNrsWywEH2FI+gIwxWebJu60g
rchT7XhdvdwoxAIGNb7PpogM6dlN0IpmvoNdRjFlzMUMRd2TgjxykV46JfOuNmi2
2bpXjLXC1KnCC9GJcPgFjTTdRo27/Gp7b5MJKxyQSTCfVf5hKVhjFmjmsNv4TQ+L
1BuK/XiuBB92ZTST0P5iFFxqgMmsJf7F4WwbBiSCf0w+9+COhJJ1tYY+cKxGnKsV
wuGOu7kF293N9UrH8QL7yiIdCbIDj+RJvlRZhS5YDcymNFFs2Zs=
=TNtR
-----END PGP SIGNATURE-----

--4bwlrw3hplnu7m6d--
