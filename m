Return-Path: <SRS0=EhE/=KN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CADC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 May 2021 11:58:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC85461042
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 May 2021 11:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC85461042
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=MtkLZqTUu+yeA5uk3VQmHagdqgcamAkKGZ10qyBhxUw=; b=gwH
	7xbAO13XjIEDpAjPtyFH+e00EhaFkGFI8dMsdvi3dn13gRz4oUW2haUfN9r6f7siOwvyS6StukSVp
	k240WkK27pGZm9Uet7jvd7ucCZ0mIdhTJThZ1E7NUJ9v26vW3G0m4OdOBUBg784YPUCF9DcBtVIbh
	tZngfBc1H/R9XguFZNeAHmeWBjUBOzTobALCvjn2MsooPRUB42FUM7BOn166iqmwSsaaRSkkHowFg
	O0vrZjPQ9h6QXk0Q/gVIg+7CZexUJrDeqUBIJUsiBHo0xSwltdx3gIWwmCBXeGE0X01j+C2y6DmO7
	SzNDYJAUCdvgEJd5v7WoN+xkXv0GIGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liyLE-000gL1-C9; Tue, 18 May 2021 11:56:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liyL6-000gJd-MJ
 for linux-arm-kernel@desiato.infradead.org; Tue, 18 May 2021 11:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:CC:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=3a8XgCUkDM0gwvT+vx6EOynoKwpvMs8jnRG6dXTrM78=; b=LjGzwcvl1LajtNF6AOLD4AVEtk
 H66gr91Lc9JRFvyZk34YnB6rJPSDokMIRUMM8V67fEOacYQBtaLO7C4lKZWRoTHAg+il6OgxEw0l8
 JnU1Vd4kjnKG4gn+ym6HOUgmqO2OUgjT9v2q5yrFkT+YgkVYW3P31rynHC6hnt/bzzhe/DnDIYn8g
 rrm3ebYSkXaWb+5CzdulDPean+yfQMpyaDNUzMY5561AvO+AQjLqzVSEPxRv9eXXKpTtG9kcLVj0S
 PITTCx3OUb9FxC25hEQ8jJsKe0ly/AXv9JlFw+qg/3GW7RPU13AN2JYLYK+6fiuj0WLNL68D6iMDc
 lIz6S/Vw==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liyL2-00EcpU-Ve
 for linux-arm-kernel@lists.infradead.org; Tue, 18 May 2021 11:56:43 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14IBuYGT020544;
 Tue, 18 May 2021 06:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1621338994;
 bh=3a8XgCUkDM0gwvT+vx6EOynoKwpvMs8jnRG6dXTrM78=;
 h=Date:From:To:CC:Subject;
 b=jnRgrF+ULiqLFkIgLeqy8jl40GA5xMgiLBMxoKa5T7zYAxzIWMVWXsrIhbU4lY4an
 hOeBMT3hp3zUBrIG+8c/IaTJqG/mKK/I0ny9L8wSBPmvWJXKH82dEOQCfJw4IXelOL
 aH4dctKcqc9URMG2WjSOB1sJthSAylut0A0P6ik8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14IBuYOq056851
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 May 2021 06:56:34 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 18
 May 2021 06:56:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 18 May 2021 06:56:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14IBuYdG013864;
 Tue, 18 May 2021 06:56:34 -0500
Date: Tue, 18 May 2021 06:56:34 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 <arm@kernel.org>, <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] arm64: dts: TI K3 fixups for v5.13 rc
Message-ID: <20210518115634.467vgpbzplal5kou@obituary>
MIME-Version: 1.0
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_045641_964095_EFE2CBA0 
X-CRM114-Status: GOOD (  12.22  )
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
Content-Type: multipart/mixed; boundary="===============1249149053100402407=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210518115634.E6v_ZPMhbAsZatygWbssDU4f2n1u5KpTJxqPi9Fo-8k@z>

--===============1249149053100402407==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yhtujcuvugprpbgc"
Content-Disposition: inline

--yhtujcuvugprpbgc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

These are minor fixups for the 5.13-rc towards making the yaml
conversion of various txt files in 5.14-rc1.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git tags/ti-k3=
-dt-fixes-for-v5.13

for you to fetch changes up to cab12badfc99f93c1dccf192dd150f94b687a27c:

  arm64: dts: ti: k3*: Introduce reg definition for interrupt routers (2021=
-05-14 12:48:11 -0500)

----------------------------------------------------------------
Devicetree fixes for TI K3 platforms for v5.13 merge window:

These minor fixes include:
* Fixups for device tree discovered during yaml conversion
* Fixups for missing dma-coherent property in j7200
* Removal of camera sensor node from am65 evm dts to overlay
  as camera sensor boards are variable.

----------------------------------------------------------------
Nishanth Menon (6):
      arm64: dts: ti: k3-*: Rename the TI-SCI clocks node name
      arm64: dts: ti: k3-am65-wakeup: Add debug region to TI-SCI node
      arm64: dts: ti: k3-am65-wakeup: Drop un-necessary properties from dms=
c node
      arm64: dts: ti: k3-*: Rename the TI-SCI node
      arm64: dts: ti: k3-am65|j721e|am64: Map the dma / navigator subsystem=
 via explicit ranges
      arm64: dts: ti: k3*: Introduce reg definition for interrupt routers

Tomi Valkeinen (1):
      arm64: dts: ti: k3-am654-base-board: remove ov5640

Vignesh Raghavendra (1):
      arm64: dts: ti: j7200-main: Mark Main NAVSS as dma-coherent

 arch/arm64/boot/dts/ti/k3-am64-main.dtsi        | 11 +++++----
 arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi         |  3 ++-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi        | 10 ++++----
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi         |  4 ++--
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi      | 13 ++++++-----
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts  | 31 ---------------------=
----
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi       |  8 +++++--
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi |  7 +++---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi       | 10 ++++----
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi | 11 +++++----
 10 files changed, 45 insertions(+), 63 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 8=
49D 1736 249D

--yhtujcuvugprpbgc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmCjq2sACgkQ3bWEnRc2
JJ26fBAAqDSOfEQwwvN8isory0jYTqqQ9Qi6P2Oq+LbP8U2XxuTA8K8eamBAzfOc
4jpoplbyx0Fde3b0s6H7ChEbxE/GqaXlPLw6RrneAfUKAFaf1OBlupfzhJ1/4f+e
FiqT4BJnQXAMmQsygfvnItIQKu4wbSW3OsMnUIZFWFbpIyGqc5OkcoL30AIGmnxR
e6FdfwNCD+o8FZ8ggsbGPrsaa6M4TRnMeyTIp8JXPA/JQGyNnIlC+hgkxs5qrAG+
2++EelRGKOGBgzSgo+zBqIfajGy58ra4Ts+aQo6c/iCX0HduQVQeuAOvLRR9bQov
UBGgw02kq8hA35LslLOkooFFfizrcqhFFUJexbR4hDC4/1IKZ+Npgi+gy+9SeS0i
/aTJbtZrF7P13EeShpe6GbgzlgNyibito0CuQT/HoMBTDV/b0HMHiJSxSxQKz/C/
7NfYGBOi6wYqnGlrY1SVqq5nxZUN8+ehhklKKYvIlbKxTpRbyYSEXYTgaRTULdMW
+axRpOkNZUziKY/rHOlGqbMNGEysw3AH2eaWMStvhdOM5MT+c6GRuV0D6OxdvVyE
artE0EYV9ZUaDenVwDfEwd3FCBq9SHgfenZkKUcQiIMZLD+C4UntxniFs15Gbqo0
Vi2f6fYTjjZg8ri92Vrn8WSqQeoHVWXy6JJNZsK9N0AzLGaSTx8=
=ud9O
-----END PGP SIGNATURE-----

--yhtujcuvugprpbgc--


--===============1249149053100402407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1249149053100402407==--

