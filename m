Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE8DC64E7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 17:44:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 983942074A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 17:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O//yB/QH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EiABBD0j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 983942074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=F7Y3QR3lGunjaXrevorCpe6Sk28wu9ustkiiXwdWEGI=; b=O//
	yB/QHsvDObzigUU4ywRVhP4gdUXxXMkhoBmIGriEJ3HspuofmfDGWpDJu5tzvk55mzXgr6oC9alhW
	cGMw1RymUEUOPPl6+5icg2IyED0QZ8J2W3lu5vTpXV6P6JF+0LET5xod1ojVAQKpeounJ+xL5Eosf
	MHcJrrv47TVYmGs89kdZWJP627NdcYmnG1TcR1rIOGN9YbBnCJ7NEtIgAKNV0/CTM0cFBPG5h7pEP
	XZnHdNRDTfQzI7skI44P6pW4JP3lDJIfkA4tq4FRpSqZkJRG64Wx2ChmV+nmRmA1iuxaLsAFp2bW5
	IkAd+ionNO2RN3M4xfKUeGQPCOlYABA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjnCf-0004Lj-Eq; Mon, 30 Nov 2020 17:43:09 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjnCc-0004Kc-BK
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 17:43:07 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AUHgwKd087139;
 Mon, 30 Nov 2020 11:42:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606758178;
 bh=ebyvGHgxYnsMErdJ7gl06ypcszQPPlEmdBFZ0QPGf0U=;
 h=Date:From:To:CC:Subject;
 b=EiABBD0jP87tzD9BLjSF7xJCPEH8/OQhsIvpGRcGijW0P53GLquyehIXvuRdeUEZl
 SGrDBPNixvZFUew7UJWoMLX14BLmsQhx3V4kP2hSd4+iig7jHTYcAtOka/LHIUnOhH
 wSUVkgnjudvmRn2H9BMEFDB93OlCQEXHdVA+UHMA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AUHgwmu084893
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Nov 2020 11:42:58 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 30
 Nov 2020 11:42:58 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 30 Nov 2020 11:42:58 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AUHgwIn011091;
 Mon, 30 Nov 2020 11:42:58 -0600
Date: Mon, 30 Nov 2020 11:42:58 -0600
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] arm64: TI K3 DT updates for v5.11
Message-ID: <20201130174258.ljsiokkyr7x7tsbd@covenant>
MIME-Version: 1.0
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_124306_539795_3668CD6D 
X-CRM114-Status: GOOD (  13.89  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: t-kristo@ti.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7223729663434796873=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201130174258.tRtZWge_0a9c0o1BsWzfWJ5db1-vwJnEvIVvNXXabMc@z>

--===============7223729663434796873==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lc77dsi6dcg2y3ab"
Content-Disposition: inline

--lc77dsi6dcg2y3ab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull the following for TI K3 dts changes for v5.11 window.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git tags/ti-k3=
-dt-for-v5.11

for you to fetch changes up to cd48ce86a4d0c1ffec86aa46a26da993c9af5f53:

  arm64: dts: ti: k3-j721e-common-proc-board: Add support for SD card UHS m=
odes (2020-11-30 07:12:54 -0600)

----------------------------------------------------------------
Devicetree changes for TI K3 platforms for v5.11 merge window:

- Standardized usage of "disabled" only in board.dts files, #interrupt-cell=
s warning fixups, node format error fixes

- J721E: R5F support, MMC/SD UHS mode added

- AM654: R5F support, dss marked coherent, drop unused dma-ring-reset-quirk=
 property

- J7200: ADC support, Mailbox, hwspinlock

----------------------------------------------------------------
Faiz Abbas (2):
      arm64: dts: ti: k3-j721e-main: Add output tap delay values
      arm64: dts: ti: k3-j721e-common-proc-board: Add support for SD card U=
HS modes

Grygorii Strashko (1):
      arm64: dts: ti: k3-am65: ringacc: drop ti, dma-ring-reset-quirk

Nishanth Menon (6):
      arm64: dts: ti: k3-am65*/j721e*: Fix unit address format error for ds=
s node
      arm64: dts: ti: k3-am65*: Cleanup disabled nodes at SoC dtsi level
      arm64: dts: ti: k3-j721e*: Cleanup disabled nodes at SoC dtsi level
      arm64: dts: ti: am65/j721e: Fix up un-necessary status set to "okay" =
for crypto
      arm64: dts: ti: k3-am654-base-board: Fix up un-necessary status set t=
o "okay" for USB
      arm64: dts: ti: am65/j721e/j7200: Mark firmware used uart as "reserve=
d"

Peter Ujfalusi (2):
      arm64: dts: ti: k3-j7200-som-p0: main_i2c0 have an ioexpander on the =
SOM
      arm64: dts: ti: k3-j7200-common-proc-board: Correct the name of io ex=
pander on main_i2c1

Sekhar Nori (1):
      arm64: dts: ti: k3: squelch warning about lack of #interrupt-cells

Suman Anna (11):
      arm64: dts: ti: k3-am65-mcu: Add MCU domain R5F cluster node
      arm64: dts: ti: k3-am654-base-board: Add mailboxes to R5Fs
      arm64: dts: ti: k3-am654-base-board: Add DDR carveout memory nodes fo=
r R5Fs
      arm64: dts: ti: k3-am654-base-board: Reserve memory for IPC between R=
5F cores
      arm64: dts: ti: k3-j721e-mcu: Add MCU domain R5F cluster node
      arm64: dts: ti: k3-j721e-main: Add MAIN domain R5F cluster nodes
      arm64: dts: ti: k3-j721e-som-p0: Add mailboxes to R5Fs
      arm64: dts: ti: k3-j721e-som-p0: Add DDR carveout memory nodes for R5=
Fs
      arm64: dts: ti: k3-j7200-main: Add hwspinlock node
      arm64: dts: ti: k3-j7200-main: Add mailbox cluster nodes
      arm64: dts: ti: k3-j7200-som-p0: Add IPC sub-mailbox nodes

Tomi Valkeinen (1):
      arm64: dts: ti: k3-am65: mark dss as dma-coherent

Vignesh Raghavendra (1):
      arm64: dts: ti: k3-j7200-mcu-wakeup: Enable ADC support

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |  13 +-
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi            |  43 ++++++-
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |  71 +++++++++--
 .../boot/dts/ti/k3-j7200-common-proc-board.dts     |  33 ++---
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          | 114 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |  19 +++
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi        |  94 ++++++++++++++
 .../boot/dts/ti/k3-j721e-common-proc-board.dts     |  83 ++++++++++++-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 135 +++++++++++++++--=
----
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi    |  42 ++++++-
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi        | 110 ++++++++++++++++-
 11 files changed, 682 insertions(+), 75 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--lc77dsi6dcg2y3ab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAl/FLxoACgkQ3bWEnRc2
JJ0dwQ/9E6A8kNv/FLxk0bcnYo56UgXVIdmiJu2H2jz0XnbfBMPUoZAYRsCTwqpQ
6qRAzv3lePH0hm0741TnocgPliPm9tAKcuJaw3y3poc7LKR77B8vL1H6tKnHXqxh
6/ZB6Pk+IN390PukCvoE1yfpevTmPRxn5FqKYKgVWPTSHdkEKSeRj1Ea2YVDRzL1
jH4UOVLaJ7OtQyTjWbRP1u/FxhZhKZ5eSb/pW36zx5dJXkybhJlzyb+yCDWylwrN
p8iRaZTnKswqVhu1b8VO/tknzNnUFGfM0n1ShMnKASpkIIpgKTfLEPIVz/VMvYLA
wXW+XrMUGLq/vj3fvl9uUV5yWA2tMeEUDSbxHsH1s3ArZt0HdCr6f2s9cTaPGv4M
QAN38Geh5xfzjWJupEeg9kGeB1ZG2y/spkx0Za/ZE2BnIAuKyEZpyNd24OiE86mc
Td414CUSdPOFpL/HcZ4udneo1qYT50Xx+5wxH4TOFyiJwsmWgZsa3mjhxgyDxB3D
p1DDymBJy1qT9+/jtH49ko0gw3ype7GivYUm8o8tk2F/qCgQAqMxY1/uoMrL69BE
qp9lOzhYXJK4A+tr2yDWb5L6usU3DVyQiw+8hfH84ljjxoPqvXuejNrpNKvZg/SW
zoeaStQs+10EUsk4A3IJVenS/u12oDQrs16QOOmJfiFZ1qN4xiE=
=hR4o
-----END PGP SIGNATURE-----

--lc77dsi6dcg2y3ab--


--===============7223729663434796873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7223729663434796873==--

