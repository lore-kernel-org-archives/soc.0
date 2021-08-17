Return-Path: <SRS0=cSn/=NI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207F1C19F3B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Aug 2021 08:37:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFE9660FD7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Aug 2021 08:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFE9660FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=e2cK48i4Kff7M2dd0uTQcbqDyTOhBQI3XwrRHddiFTg=; b=bBb
	OtnrNHGwdGqDLPU+Rv0D3foHwjmYHRqMBP9JtO4Jfx2QlBV0fdkePq8B6cQqfjh/hdArKVQYy9wTh
	GI3XFIXG7XwyKT8mudu8oEdqmPp3muopcap/SFh/YoLmFsXa/gru5+AkqhWmrMLAxd45gf5dZhysu
	GCaw58R8fyTm62XitwspCTO4vTA+sxvLEYtbrMt0TgiUeY2/C18uE/LSj+vvVu0rXiJ3rIKYi+K3n
	6M0Crg3leN8uOpztUjzUks2XS6fDHQLd132a7fawnUUQTU4ztn0P3D/uHpv2d8t6lYHZcYPggxJen
	KbnsR7RPG4rBK+Jjh2QMMRsUohp0brQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFuYx-001dHa-TO; Tue, 17 Aug 2021 08:35:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFuYt-001dGk-Gk
 for linux-arm-kernel@lists.infradead.org; Tue, 17 Aug 2021 08:35:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6345660FBF;
 Tue, 17 Aug 2021 08:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629189306;
 bh=NKFYA+fa7Qcc2Xyvdm0W96T36wN+FrI2t8d2lzA69Zs=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=JeVg16b0nWJ4KzqBX/6+h1gUo7H7fj1kD7I9eqdgNq0c6i6DTLI2Fq9nbRY8DmU9c
 gCEY186RDOUMORRJjBpmkHijDBga8rV+N+2OfbJhxuK98P7jrKUHl1TyS1S9hly3N7
 ALhcp8lyZxv2YkLjQBXf8OtV4nTZ0n/0UgjihPGxENevZ/gqWPMaAPa50Dv1J2kzTe
 DEzZyDcZkWckAIzKQUV5tEQi4W1hqZheRy3xna8mLyp0TKHIF+nsBSjkDvJZZIGUr1
 AOlQCbQMRfPYz4lcaJl1H+FlQfEoOIHR5Mk8uLNSwN+5R0+gxbLqAZSm5LHz5uvETw
 v+IaW9hTCg0LQ==
Date: Tue, 17 Aug 2021 10:35:04 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Device Tree Changes for 5.15
Message-ID: <39cd7be5-a9a7-42b6-bc29-f895b9a3448a.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_013507_639757_9DC81AA1 
X-CRM114-Status: GOOD (  10.06  )
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
Content-Type: multipart/mixed; boundary="===============6398748959237582267=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210817083504.CWqynZtdPKHpxbTvYCVUgj2XaNYhZIC7bdeLBpIHPgs@z>


--===============6398748959237582267==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aA5SJjhAhrKtAKL4"
Content-Disposition: inline


--aA5SJjhAhrKtAKL4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

It's been a fairly quiet merge window for us, but please pull the
following changes for the next release.

Thanks!
Maxime

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-dt-for-5.15-1

for you to fetch changes up to 9d3ef21dca2c80fd9567869e28fa2a992a5e2c4b:

  arm64: dts: allwinner: h6: tanix-tx6: enable emmc (2021-07-26 09:11:49 +0200)

----------------------------------------------------------------
Our usual round of DT patches for the 5.15 merge window, with some
Tanix TX6 improvements this time.

----------------------------------------------------------------
Jernej Skrabec (3):
      arm64: dts: allwinner: h6: tanix-tx6: Fix regulator node names
      arm64: dts: allwinner: h6: tanix-tx6: Add PIO power supplies
      arm64: dts: allwinner: h6: tanix-tx6: enable emmc


 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts | 27 ++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)



--aA5SJjhAhrKtAKL4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYRt0uAAKCRDj7w1vZxhR
xeIdAPsGVzRlj8kV1L70ZM0mRTJXPOhhiGiKCYjvbT8emWvY1QD9EjuKu0PihFN/
dnV0GmbcbmHt/WGJCjNbSjnKt1dHWAg=
=qsSS
-----END PGP SIGNATURE-----

--aA5SJjhAhrKtAKL4--


--===============6398748959237582267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6398748959237582267==--

