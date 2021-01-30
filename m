Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0D6C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 13:15:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4986364DF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 13:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4986364DF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=fPA7D4JuHlGcdv+fY4NV7f+0+3GC04PYpFFBf6ZlUKk=; b=FJo
	XbawpgMXsZr7tYFcazUS2hVlQsdgqi4awK3K+MMIRgAGqBACJ90zVrFHFPRIgqUVMt0QHW1VHooq8
	2cGxHWx9KN+5ixTjuvSu8DAI5Jw441tj4sU/qG8T6ST2K0JwbUXODfnpRHvm7B/dHSIOV01QMPUM3
	91VdGXFYEZTSMpiPUstTkaFMENU+fEdaRhl+DzQfTcp5eSgnXRnRPVRWup8TGE569e7fnCUbSqaw+
	2+rgA+w6N/8PK8IZk/1O0yDeY6zioG73/oEIT6vrZILNvC/suTEPLvDbsIP3L6hJI8JvfljELbccQ
	iVQ+HI21jqE+gMEfhLo5hiFPPEsXl7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5q59-0007cz-Vn; Sat, 30 Jan 2021 13:14:32 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5q54-0007cJ-AJ
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 13:14:29 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10UDENVi011926;
 Sat, 30 Jan 2021 07:14:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1612012463;
 bh=L/J5I2KkIPJZNSrlFwIakXVyKMxvDh3HJ0FmCiOuwPw=;
 h=Date:From:To:CC:Subject;
 b=ouyubAwo4PnPE01Q08BEqhi724AsfGMiJlWnlepFMHZFvV1ABKHVyZPo7UcpOlj0x
 AqPeoY+7W3LYXeQcdJhBbpXQWLnw6Y2KG0klguw8Y5OWX8JRWDAFwMDEj0UCevphFM
 wbgu0lRG9fdc7UwLKDEehrcWsfwplb8Kft+fvnik=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10UDENSF105895
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 30 Jan 2021 07:14:23 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 30
 Jan 2021 07:14:23 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 30 Jan 2021 07:14:23 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10UDEMWC070354;
 Sat, 30 Jan 2021 07:14:23 -0600
Date: Sat, 30 Jan 2021 07:14:22 -0600
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL 2/2] arm64: TI K3 DT updates for v5.12
Message-ID: <20210130131422.yvq2edxfongys7x5@pendant>
MIME-Version: 1.0
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_081426_518491_F9982F01 
X-CRM114-Status: GOOD (  12.30  )
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
Cc: linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============6151613779634741478=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130131422.fKJSItGg872B-uiKvLTWCMHzwst0LNNoLrDShZhKGl8@z>

--===============6151613779634741478==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gkd7b7sfbn2ezeg6"
Content-Disposition: inline

--gkd7b7sfbn2ezeg6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull the following device tree changes for v5.12 cycle.

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git tags/ti-k3=
-dt-for-v5.12

for you to fetch changes up to ae10ce938da59c19f303a91197ea7d664d1bc080:

  arm64: dts: ti: k3*: Fixup PMU compatibility to be CPU specific (2021-01-=
28 08:51:18 -0600)

----------------------------------------------------------------
Devicetree changes for TI K3 platforms for v5.12 merge window:

- Common fixups: PMU compatible, MMC dtbs_check warnings squelch

- J7200: R5F, PCIe, SERDES support

- J721E: PCIE fixups

----------------------------------------------------------------
Grygorii Strashko (1):
      arm64: dts: ti: k3: mmc: fix dtbs_check warnings

Kishon Vijay Abraham I (6):
      arm64: dts: ti: k3-j721e-main: Fix supported max outbound regions
      arm64: dts: ti: k3-j721e-main: Remove "syscon" nodes added for pcieX_=
ctrl
      arm64: dts: ti: k3-j7200-main: Add SERDES and WIZ device tree node
      arm64: dts: ti: k3-j7200-main: Add PCIe device tree node
      arm64: dts: ti: k3-j7200-common-proc-board: Enable SERDES0
      arm64: dts: ti: k3-j7200-common-proc-board: Enable PCIe

Nishanth Menon (1):
      arm64: dts: ti: k3*: Fixup PMU compatibility to be CPU specific

Suman Anna (3):
      arm64: dts: ti: k3-j7200: Add R5F cluster nodes
      arm64: dts: ti: k3-j7200-som-p0: Add mailboxes to R5Fs
      arm64: dts: ti: k3-j7200-som-p0: Add DDR carveout memory nodes for R5=
Fs

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |   4 +-
 arch/arm64/boot/dts/ti/k3-am65.dtsi                |   2 +-
 .../boot/dts/ti/k3-j7200-common-proc-board.dts     |  38 +++++
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          | 161 +++++++++++++++++=
+++-
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |  42 +++++-
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi        |  80 +++++++++-
 arch/arm64/boot/dts/ti/k3-j7200.dtsi               |   2 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          |  70 +++------
 arch/arm64/boot/dts/ti/k3-j721e.dtsi               |   2 +-
 9 files changed, 336 insertions(+), 65 deletions(-)
--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--gkd7b7sfbn2ezeg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmAVW6cACgkQ3bWEnRc2
JJ20bQ//c3SydLlkqx1GMrOPBO5n/hpPlJ+C+LddeGifiW1i4Iof+fu8Fj4GgLZF
O8Q47fGzcAXdjGv3I8jn62K2CHocWAyoKQ70WoJPtLOzLd57hQ4QooQhHHi2edV7
uJtSh5tWOG7M/mCibs8lik0XROfPRUbYG8Ax/+yNt0zopO8W5nsd15ZzeeIOnuN1
MWclPoRBlt5Eaa/Br2ettDqBmOJa2mDaYOHQDRfkNrSDBo52h7aVX27HyLOkAj35
4SwpAT3vUjGq1JH4R61+USJXii06FrCtxMB6cczuewdQkM6HEL/f1VsUzKxfHj8L
DZhfsnwW5upCyWoogvP7zIwP4qbWW5P7F/NrdyrTd0arBdgXFvyXt7c/ZRIF1i25
TSo7YkymscR0ZH4Xetr78xtU0GJVfwKmpH5Iv2sbCGuYXo2T+Y1DpdotyQ0Vp+cw
wdkowdh1jEwZ+nNuEi/sNHBRrIOs0Hn1FyihXD1KcjsuDR5n1OZweHsRKbBnoag8
RCJYnAMNadlqOg/o98SB9ur2RixSrvJi2UK4UtlPv42NqLDrHb7w5L+OFrQOcWxV
R31/agA5K3JKyjF8eEQETKHcN1jCltiEfWNzrSoYw80FYQ2K3hweVxHEoMEVg1iP
mRVvb4XjUjlUGEH+fUDgK+LJvrOkw8cBxr0JRFyhBwgpzLeQNXM=
=MaoA
-----END PGP SIGNATURE-----

--gkd7b7sfbn2ezeg6--


--===============6151613779634741478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6151613779634741478==--

