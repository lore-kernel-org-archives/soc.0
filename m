Return-Path: <SRS0=QEH7=LN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E2EC48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jun 2021 00:04:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B570C61222
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jun 2021 00:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B570C61222
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=00JAf1j7ARtnlZ5vO3GgJaobaTa5bMsrUpV2K9GZb64=; b=OkO
	APBxRpXCxAq5SnCvO8arsVi6E2Fw1XxiX7FaQynQD0Q04PMfO2C5j6r36ewJxLiPjfIrh9+VcHNTp
	xXpf0bzNb+rm/yHHojJ7IV+/LaNklim7Aw4NU6VU/kSnHqY0QRv41Btob4SHwNnoIte9zdGTmdv51
	f5u6E/JBih3jgad0nuEEhP3Rnf0KgO+A//cZzbXd2uhbVSOLJdC9CP1SuvHneD2nt/MrS1H/occeb
	mi6pLZQPCBGJ2zWTBaxb8lr/0F4LwXecHTU4CMcy3wt1Czzab1igTbrHRwWnjlepkAq+9KOccICfz
	rvc07OQfdCNVrwTn1L52egzEAMEmoIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luOQy-00Fs9B-6S; Sat, 19 Jun 2021 00:02:00 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luOQu-00Fs8h-A2
 for linux-arm-kernel@lists.infradead.org; Sat, 19 Jun 2021 00:01:58 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15J01oDG029767;
 Fri, 18 Jun 2021 19:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1624060910;
 bh=TDDSRKT9gxOevmhRR7okVIbpJur/IpKbTR8f3/gwca8=;
 h=Date:From:To:CC:Subject;
 b=JKFSbm1oXwIsunsxGTKDm7g0gPQnkwYCIdsbFqn+xZLepa9VySGXmzdT05BnS9ZGe
 uoA/xxTqFpepcwvkmSnzecmU4bzKiNTG4Y8Ex5LgeHrB9Y+FwfFkRbKIT+ZFF2DYqR
 CUqHeIzcszPNDQiOzEwHpk8t4MNHqBC2rqQnNTVk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15J01oQr087078
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Jun 2021 19:01:50 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 18
 Jun 2021 19:01:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 18 Jun 2021 19:01:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15J01oGG041532;
 Fri, 18 Jun 2021 19:01:50 -0500
Date: Fri, 18 Jun 2021 19:01:50 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 <arm@kernel.org>, <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: arm64: dts: TI K3 updates for v5.14
Message-ID: <20210619000150.6ooqnxxsnsvncs5u@pushchair>
MIME-Version: 1.0
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_170156_529324_20AC310E 
X-CRM114-Status: GOOD (  14.33  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0167858690877584949=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210619000150.bjegyDpqaF4j31mDTsIPhqfil9hF7s5af52vydQydVE@z>

--===============0167858690877584949==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z2wkyywniqpigoxz"
Content-Disposition: inline

--z2wkyywniqpigoxz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull the following for TI K3 platforms for v5.14 merge window from
the previous tag meant for 5.13 fixes(ti-k3-dt-fixes-for-v5.13)

Headsup on dtbs_checks:
* mmio-mux bindings conversion warnings exist on my v5.13-rc1 based branch,
  but is being worked by Rob Herring[1]
* shared-dma-pool bindings conversion warnings [2] picked because of
  precedence in this merge window and reserved-memory conversion will
  appreciate a bit of help due to cross arch implications.

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210526=
184839.2937899-4-robh@kernel.org/ and series
[2] https://lore.kernel.org/linux-devicetree/162402789600.25544.13955211751=
661856760.b4-ty@ti.com/

The following changes since commit cab12badfc99f93c1dccf192dd150f94b687a27c:

  arm64: dts: ti: k3*: Introduce reg definition for interrupt routers (2021=
-05-14 12:48:11 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git tags/ti-k3=
-dt-for-v5.14

for you to fetch changes up to d71abfcc6c050b72ba735b74f3e3848ce07ddd15:

  arm64: dts: ti: k3-am642-evm/sk: Add DDR carveout memory nodes for R5Fs (=
2021-06-18 09:47:40 -0500)

----------------------------------------------------------------
Devicetree changes for TI K3 platforms for v5.14 merge window:

* New features:
  - AM64 gains PCIe and USB3 for am64-sk board, R5 remote proc (includes
    AM64 rproc bindings tag from Bjorn's  tree)
  - AM65, J721e gains ICSSG MDIO nodes
  - AM65: UHS mode speed enabled on am65
* Fixes:
  - Fixups on AM64 SRAM model thanks to a ROM bug for USB DFU mode
  - Schema related cleanups across j7*, am65, 64
  - Few misc Fixups on AM64 where MAC address could conflict; j7200 for
    USB2 Rx sensitivity etc.

----------------------------------------------------------------
Aswath Govindraju (8):
      arm64: dts: ti: k3-am64-mcu: Fix the compatible string in GPIO DT node
      arm64: dts: ti: k3-j7200: Remove "#address-cells" property from GPIO =
DT nodes
      arm64: dts: ti: k3-am65: Add support for UHS-I modes in MMCSD1 subsys=
tem
      arm64: dts: ti: am65: align ti,pindir-d0-out-d1-in property with dt-s=
hema
      arm64: dts: ti: k3-am642-evm: align ti,pindir-d0-out-d1-in property w=
ith dt-shema
      arm64: dts: ti: k3-am64-main: Update TF-A's maximum size and node name
      arm64: dts: ti: k3-am64-main: Reserve OCMRAM for DMSC-lite and secure=
 proxy communication
      arm64: dts: ti: k3-am64-main: Update TF-A load address to workaround =
USB DFU limitation

Grygorii Strashko (2):
      arm64: dts: ti: k3-am654x/j721e/j7200-common-proc-board: Fix MCU_RGMI=
I1_TXC direction
      arm64: dts: ti: k3-am642-main: fix ports mac properties

Jan Kiszka (1):
      arm64: dts: ti: iot2050: Configure r5f cluster on basic variant in sp=
lit mode

Kishon Vijay Abraham I (9):
      arm64: dts: ti: k3-j721e-main: Fix external refclk input to SERDES
      arm64: dts: ti: k3-j721e-main: Add #clock-cells property to serdes DT=
 node
      arm64: dts: ti: k3-j721e-common-proc-board: Use external clock for SE=
RDES
      arm64: dts: ti: k3-j721e-common-proc-board: Re-name "link" name as "p=
hy"
      arm64: dts: ti: k3-am64-main: Add SERDES DT node
      arm64: dts: ti: k3-am64-main: Add PCIe DT node
      arm64: dts: ti: k3-am642-evm: Enable PCIe and SERDES
      arm64: dts: ti: k3-am642-sk: Enable USB Super-Speed HOST port
      arm64: dts: ti: k3-am642-sk: Disable PCIe

Nishanth Menon (1):
      Merge tag '20210327143117.1840-2-s-anna@ti.com' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/andersson/remoteproc into ti-k3-dts-next

Roger Quadros (2):
      arm64: dts: ti: j7200-main: Enable USB2 PHY RX sensitivity workaround
      arm64: dts: ti: k3-am65-main: Add ICSSG MDIO nodes

Suman Anna (6):
      arm64: dts: ti: k3-am65-iot2050-common: Disable mailbox nodes
      dt-bindings: remoteproc: k3-r5f: Update bindings for AM64x SoCs
      arm64: dts: ti: k3-j721e-main: Add ICSSG MDIO nodes
      arm64: dts: ti: k3-am64-main: Add MAIN domain R5F cluster nodes
      arm64: dts: ti: k3-am642-evm/sk: Add mailboxes to R5Fs
      arm64: dts: ti: k3-am642-evm/sk: Add DDR carveout memory nodes for R5=
Fs

Vignesh Raghavendra (1):
      arm64: dts: ti: Drop reg-io-width/reg-shift from UART nodes

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       |  31 ++-
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           | 222 +++++++++++++++++=
++--
 arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi            |   6 +-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts            | 110 +++++++++-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts             | 121 +++++++++++
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi |  63 +++++-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |  37 +++-
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi            |   2 -
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi         |   2 -
 arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dts |   5 +
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |  49 ++++-
 .../boot/dts/ti/k3-j7200-common-proc-board.dts     |   2 +-
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          |  25 +--
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |   6 -
 .../boot/dts/ti/k3-j721e-common-proc-board.dts     |  62 +++++-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 126 ++++++------
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi    |   4 -
 17 files changed, 734 insertions(+), 139 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 8=
49D 1736 249D

--z2wkyywniqpigoxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmDNM+cACgkQ3bWEnRc2
JJ1wFhAAn6/VXao36MMqwyYR+vkYl/x+6XNQdafqf9y8fFxBWPuv3Ykxe4vFKVYl
pf8o7I3hq9AAsFlEfMb39ONg9yWGRvmqPp8CIXFnNHoIOW8+/O6D6de0DnBb8g4P
dJFeSyKQEYR6p9V38lkoTxgNtRm+LHs3YAmXv4QnZDyRmAYcW3aJ90camgFXPOcU
cw/RgqqBqOSgPlOyiEmM6wUezZ91VYHAmmhA8yNWpqgyBpLykqFWo68IAo7EZkp6
fgk46brOFLSg+g8KLE44l2XuGfohTaJdmF7ad4UU9u++GScnjv/aGUAPkUO1c6tW
Swl1mKwDBXOGYQ0g+H9kRW+RTcdelw8Uks60K3pBT98Q1TZ2tlZXZl+bciRAMtSC
RBI3mm+g/J9nKMKmNzsKTdYoCSothZrLuNhDhmPEWH5mVeeVH5pjDimSPakQd2o5
OTg3ov0DAYTf+LWADd7ohW4xhnYBfr6GVjASsHk/tXjcD64yUR5sb5A6zf+DT7dq
FZrYxY9zGbZ/L9VR+dV147cqVnZaG0P+SNcBkus931tsraxY7TsuayiDfdcg8fR7
dX0FmmeJ1nigbKIySvzO2wNTAhMwtOjzhSi6zsaXXFXAqVSDoUghMHgEsXfqM1ci
QCkcFohza9cWMMTOPFOH6rrJDMcT0Gq/1qnzUy+8yoGauzQjF9I=
=Y9sO
-----END PGP SIGNATURE-----

--z2wkyywniqpigoxz--


--===============0167858690877584949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0167858690877584949==--

