Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A42C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 13:15:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE46A64D9F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 13:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE46A64D9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=BdUvQW5CQZReTjSLR2DcCmen3jIdPhgBtLpqkbDiTqY=; b=ToQ
	NOLeN0JK2Fep6bDWacygvahBHniAasDr5LrhY6B/Y1mbNxQGAHdCDU+hIVjC7PbQYYid4kmubDBNn
	bvieCk3fOXLS1Iu8cGJW7KUHIURAVy6HnMm68ms5JSyi12tY+rdDHYTTOwXD93YE+Sz67fZmIxXaj
	YCMl45LXxWn0RjKQEem5o1lvW/laN/ldPobcRTA+htPQkSmxDlwQ3J9Fi9iv0ATj0aMd2Tls+ZcpX
	B47EqWQnUWi8DZhNHOEAz8heaTdp87n4WxnnLJWuiAbadtyr88cKZXlek9Qr2gNIy9F9Jyz9tDqw/
	Cflxhe1FftvvXKst1DjE3ZRMmi0YIew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5q53-0007cD-QP; Sat, 30 Jan 2021 13:14:25 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5q4y-0007bq-Lc
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 13:14:24 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10UDECvx011905;
 Sat, 30 Jan 2021 07:14:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1612012452;
 bh=XFymvdCm4O53NxcLqDM99zA8H+6HJ83huZq37r3iRCk=;
 h=Date:From:To:CC:Subject;
 b=u/WjIbL9/5cK3i+lfz3CS2fB0bmK1+VQ7tj23FMJu22LWTE4e1rlHKHE8tAZ6DGvP
 oGPdQfv7lJgENzW4oL15yhpI86pmzPenBg8MTh/LvhOMK8Ov3vGv0IHTtGwsu+CmFh
 VUK+CehysLzKu9OVf+RxLZKkqSwXl5Y7XgfRNGfU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10UDEC1k105703
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 30 Jan 2021 07:14:12 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 30
 Jan 2021 07:14:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 30 Jan 2021 07:14:11 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10UDEB3Q020590;
 Sat, 30 Jan 2021 07:14:11 -0600
Date: Sat, 30 Jan 2021 07:14:11 -0600
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL 1/2] MAINTAINERS: Update to TI maintainer for v5.12
Message-ID: <20210130131411.afna4wj72r7xscqn@skinny>
MIME-Version: 1.0
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_081420_832479_5C2813DB 
X-CRM114-Status: GOOD (  11.18  )
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
Content-Type: multipart/mixed; boundary="===============7268091315775590414=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130131411.k7N7LOlUEc9EEllM7uQ9FQ3EA-p-LB_6NbZoPvMMFvI@z>

--===============7268091315775590414==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gicpp6a64sa3muot"
Content-Disposition: inline

--gicpp6a64sa3muot
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull the following MAINTAINERS file update for v5.12 cycle. Made
sense to send via ARM path since the main PR path was for TI platforms.

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git tags/ti-k3=
-maintainer-for-v5.12

for you to fetch changes up to 2672b94d730c4b69a17ce297dc3fa60b980e72dc:

  MAINTAINERS: Update my email address and maintainer level status (2021-01=
-12 07:47:13 -0600)

----------------------------------------------------------------
Maintainer changes for TI for v5.12 merge window:

- Tero switches to kernel.org address

----------------------------------------------------------------
Tero Kristo (1):
      MAINTAINERS: Update my email address and maintainer level status

 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--gicpp6a64sa3muot
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmAVW5wACgkQ3bWEnRc2
JJ3W5Q/+LP/xOm51phhdMlrCBpXa4epd3z2NZRUt//bp/ObWcF6VtSliPxLOHfUI
7ro89eDzNj0ZtBIXEbipnOjlCvBSMsABs/d6jb3IxjiSdxrllj+IOfM+s4m7+50Y
7qgYBNIRLCOctY42QWaffkCuYAS/IFaFKgZv4HmZSoACdwoRVPSPkeDu9+vPAMtb
RRzvcQo19WwtkYEgvHUMSg4WU8YLd4XQES9tXxHuc9CG5P+THkXk/JDkpMIC9Ky8
sSo0k54JFgcJ+T9Cg1/bePMLP5cs9E/vkdf3bcsYAufjjTQh/MThQk6pBeH5h/ic
xrvlrRPteUjSyuzzhUIfUflnungio5+Q4oWIbUrxOpCaKt/6aaBOEmbvG3x3lzd5
rZUWP2LIkOjO4NYdMWGsLkIo0x9OmaiJRIDws8NqXN+XXLZQrw4eUQa9XBA8Mx1f
S7w6FXoGurGFRibMmMJ0N6HqmFyWoEus8YytSfx+1LGDZ4/CricNvXmzpVAGtZ7S
SHAWzK82SyFB00Fv6G87bBqFhSwaJHN5CnlzPLic13lrp2EWcCfgLuUvpQJv92Xk
+rgF6itAHf7uKUFmJ8JRG/uXpN7yTA0NIIkvwx7yagBBh6ITdlYjA0LtKtL3Qzyr
TZGoCaIdEe8Qg9fjgxfdnJ40tlLXTSYTOwMAwzmTsizg0j2Q/hk=
=bgUI
-----END PGP SIGNATURE-----

--gicpp6a64sa3muot--


--===============7268091315775590414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7268091315775590414==--

