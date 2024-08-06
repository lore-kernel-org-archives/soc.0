Return-Path: <SRS0=ZZk/=PF=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39ED7C52D6F
	for <soc@archiver.kernel.org>; Tue,  6 Aug 2024 12:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12512C4AF10; Tue,  6 Aug 2024 12:27:05 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4566BC32786;
	Tue,  6 Aug 2024 12:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4566BC32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 476CR0uZ066664;
	Tue, 6 Aug 2024 07:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722947220;
	bh=SwRpsKfZDOITr5gGoBXGDIDeMkgZxnTSu5h+jX/4kL4=;
	h=Date:From:To:CC:Subject;
	b=LTvj6AZLIeA21tukIbZWPMG2SNckBu+cMqhr1iMAp1CQR6tch9UJnJwcG7bQWqw+1
	 /y1QB5BxpC5DOERj5aXaZUg3ZIPxdJqKSeAI7Dh+Fm4rsOdRdorQw7qO4uqChs6nZI
	 +hFgs7jIcQrd8OKuwLPrBjUGEhELmVoNqhgBWP1I=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 476CR0mw040119
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Aug 2024 07:27:00 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Aug 2024 07:26:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Aug 2024 07:27:00 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 476CQxrR102229;
	Tue, 6 Aug 2024 07:26:59 -0500
Date: Tue, 6 Aug 2024 07:26:59 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [GIT PULL] arm64: dts: TI K3 fixes for v6.11
Message-ID: <20240806122659.vmasq2qjy6457bbs@peroxide>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vwawzq3tw7tz25jq"
Content-Disposition: inline
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--vwawzq3tw7tz25jq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi SoC maintainers,

Please find DT fixups for the v6.11 rc cycle - This tag includes the
previous late PR
https://patchwork.kernel.org/project/linux-soc/patch/aacd1e96-9ff4-4222-9f4=
d-29e63041f7fb@ti.com/

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-d=
t-fixes-for-v6.11

for you to fetch changes up to 402d336053a5d827c70ec11109e079811e86e0e8:

  arm64: dts: ti: k3-j784s4-main: Correct McASP DMAs (2024-08-06 06:39:23 -=
0500)

----------------------------------------------------------------
Devicetree fixes for TI K3 platforms for v6.11

Critical fixes for the following:
* j784s4: Fix for McASP DMA map
* J722s/AM62p: GPIO ranges fixes
* k3-am62-verdin-dahlia: sleep-moci fixes for deep-sleep (revert)

----------------------------------------------------------------
Andrew Halaney (2):
      arm64: dts: ti: k3-j784s4-evm: Assign only lanes 0 and 1 to PCIe1
      arm64: dts: ti: k3-j784s4-evm: Consolidate serdes0 references

Francesco Dolcini (1):
      arm64: dts: ti: k3-am62-verdin-dahlia: Keep CTRL_SLEEP_MOCI# regulato=
r on

Jared McArthur (3):
      arm64: dts: ti: k3-am62p: Add gpio-ranges for mcu_gpio0
      arm64: dts: ti: k3-am62p: Fix gpio-range for main_pmx0
      arm64: dts: ti: k3-j722s: Fix gpio-range for main_pmx0

Nishanth Menon (1):
      Merge tag 'ti-k3-dt-for-v6.11-part2' into ti-k3-dts-next

Parth Pancholi (1):
      arm64: dts: ti: k3-j784s4-main: Correct McASP DMAs

 arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi  | 22 -------------------
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi         |  6 ------
 .../boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi     |  2 ++
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi          |  3 ++-
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi          |  3 ++-
 arch/arm64/boot/dts/ti/k3-j784s4-evm.dts           | 25 +++++++-----------=
----
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi         |  4 ++--
 7 files changed, 16 insertions(+), 49 deletions(-)
--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--vwawzq3tw7tz25jq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmayFo0ACgkQ3bWEnRc2
JJ1oKg/9EAHR8Cr6XyueByC0qUGUvjv4gHQMRRx22PRE5uyMvWjIkTfN9I4q8Sfa
HtG3o6J5TBeGm4DytawgYf++CqQsAE08jfednrkeUwV/NF1jkbtWIJTe3e2OI/n1
agWFDlJtKHLJwM8QqqtagczKypM8mbl50OU7Pdqgh2Nf06fUFe7/Q98SH8H62/S+
YCNEp0XZW5rfh167lc0yp9M0RZiFCna/IlM5MbFr7UMkOuzSd91G2cKq3IKqaR8g
HHIoXacueiOIeqB4vjweTKAFP23Lwp4Yx4gzyMXyvmtSTl8l37JyCjskx941v4XR
QeGPtLJJ4osPom3yNgy9LgerVPpv4+9ayFJBImmm9EKCVTCIZMfLDOnEZXoZveFx
u8XMegLIXRNtbBtzdWjjsKm12hC4DIonqPiVriPdoxc3L0cTLEnuW4zx7hyHtlfR
f+hgVcO+MuJ6UUWEZgsXkVkCeS5sSkwtJT+ssHUOV4e16/ttt60PCdjCNDVNbJ+c
j3WS/49CZ2A9+gKOYhFVne0yOhjQvRkIu2e0nc9qqea/YB1tMXDI8qPfjbZPeeeq
VPCKmhJ3XF1eeN4D6QmSHi10Fe4OxHTwGnJC9opxYR+xbspumxfI0Hp6YMo8XYbP
Pk+SCtMczevJKc8E5ihVKBo5YUqYr8jpYMSkLE+MVVf11c8Pbj4=
=XSOH
-----END PGP SIGNATURE-----

--vwawzq3tw7tz25jq--
