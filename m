Return-Path: <SRS0=Ovpt=NA=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EC8C4338F
	for <soc@archiver.kernel.org>; Mon,  9 Aug 2021 13:06:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0DCD96101E; Mon,  9 Aug 2021 13:06:35 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF14460EC0;
	Mon,  9 Aug 2021 13:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF14460EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 179D6WQ3000482;
	Mon, 9 Aug 2021 08:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1628514392;
	bh=Dmzn28ceeZNMrQ8BgJ7PL0F6bEl8WRq1RqedliSDbNM=;
	h=Date:From:To:CC:Subject;
	b=GyrKkJepUgEOwCSCM7gItzqiI2CZJlejCy9crBSEppdb0Yi/1VbRIjm0UMA5G0T4k
	 4D8HeAfzEs74YjZNAWo37ab/aGPF67CVdLGOU1pkg7yvAEH0rTiJIzsCxzCeh8uOXI
	 HsKAabNNXaWOIMjZ+AUSL17yOBr1upMTJYDDQSMo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 179D6Wpf018478
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Aug 2021 08:06:32 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 9 Aug
 2021 08:06:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 9 Aug 2021 08:06:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 179D6V2a113330;
	Mon, 9 Aug 2021 08:06:31 -0500
Date: Mon, 9 Aug 2021 08:06:31 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: arm64: dts: TI K3 updates for v5.15
Message-ID: <20210809130631.pfvntcichsyeekbo@festive>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tv6tlzcqd4ve3k6t"
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--tv6tlzcqd4ve3k6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd and Olof,

Here is the DT updates for 5.15. Just minor additions this time around.

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git tags/ti-k3=
-dt-for-v5.15

for you to fetch changes up to c1fa5ac6c2f475b5140e6323801ed93c24e7e5cf:

  arm64: dts: ti: k3-am642-sk: Add pwm nodes (2021-07-30 10:44:42 -0500)

----------------------------------------------------------------
Devicetree changes for TI K3 platforms for v5.15 merge window:

* New features:
  - AM64 adds pwm and ecap capability

----------------------------------------------------------------
Lokesh Vutla (4):
      arm64: dts: ti: k3-am64-main: Add epwm nodes
      arm64: dts: ti: k3-am64-main: Add ecap pwm nodes
      arm64: dts: ti: k3-am642-evm: Add pwm nodes
      arm64: dts: ti: k3-am642-sk: Add pwm nodes

 arch/arm64/boot/dts/ti/k3-am64-main.dtsi | 114 +++++++++++++++++++++++++++=
++++
 arch/arm64/boot/dts/ti/k3-am642-evm.dts  |  56 +++++++++++++++
 arch/arm64/boot/dts/ti/k3-am642-sk.dts   |  64 +++++++++++++++++
 3 files changed, 234 insertions(+)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--tv6tlzcqd4ve3k6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmERKFEACgkQ3bWEnRc2
JJ3ZCA/2PyVk/BhEQH6OnvxKgRCHW1hOUyXwQvZM6lfHfkEqyBCH+Yso9LAKmW3Q
iLnyWXUlIX8ckPRIEcDbS4Zo7kF3eOEU7XTj8hNt+GDN3MrtvkcR2dgIar82rAKX
SCFHZ+DLM53J+w11MSgvyj3Z64DTPAgiaZx4y+iWXE6rgK/ukQjfzwwzihOPZtYE
xZB2dr277Oc8uMwbHETy56ElIpjW1Mn1dOv08oASqO7MR10QXOzkuDZMuH6xvtS6
T6FEzsxEtiOYXuRCLm2lcvQO0Ytqnph3KL5QCEJBfmMd8z0MgEUKr5itP7wTdYl7
pG35C/EiNGEaewaZH0X/l7qqAu/pC3XxfVKpKabDQqz7JNO5skeMfPt/KUcoQodB
XsQfY4P/X4O3IBl3kNgsoDoDtqQGjiE9aZY2yrM+xOjTtrUhr/TU3VAeqnNdkt1l
4MczYqGy5hm7EQFhE9w0N8o2NGnC2F3sPDidI+5TI+p8phfsQVaBpcYug5LwOWAe
xYetsutAxdiYUqnxRC7Yv6MyqqyOlAWgq0JFjaQ+XUwjvScOiyt0SrCxDbHisq56
/AqBnWOCtOekzhbqAEhXDxOoriMoUWCP4ucBuGszPkUXAwhAVfpgRRQont968F0m
ED0O7DPSDYY/fVu57ICZzwRetLQDcJdK+Ol8/aeWOp7rMoZkXg==
=H/px
-----END PGP SIGNATURE-----

--tv6tlzcqd4ve3k6t--
