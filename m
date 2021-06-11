Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414E6C48BE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 14:56:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FB3760200
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 14:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FB3760200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DzY5A7hArrFvC/AK6cUc8UJcFjAMU9Lsw6e8LM1VvKw=; b=09l
	D9Cs5SZUOTMR6sEuZkip5xF765Kjhl4Q1DK1Sp/j91hgyfPNpPYHyCyPzlQ7zdI0EEk8ZOK+aHJlX
	KQ+rHx24VXHBuQRuGTEtVS//8B1IeSmK6Ui0xfnI5mL1KhWP+BVZue9zFxF9Vm37IK1Sk+93FGug0
	YFebdMJEEUv7Got2GW89CT5ekj69emn/O2tgNTm8hc5bRYMY5troBUT7mTQZYbnIJDmjv+Qc6moOu
	lcUP091gQzlfrBAQbAiY2goGdqpjXOz/rDfo95+dEvDDAnwWHKuuqxTrbL4zC2cCbko+99NRmKGSX
	usUJyp7BFV+PghZfPwQoKTiGhDifkRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lriYN-005j4I-RG; Fri, 11 Jun 2021 14:54:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lriYK-005j3j-Bk
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 14:54:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7EBF611CD;
 Fri, 11 Jun 2021 14:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623423271;
 bh=jxHTWV3FElGfy8OMvqBt7d6sjtvxkidSgk8uWrYmKb4=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=Mv0LaHDuo/Ml2376NBHv80WUUuJSHTfxJNziiPSP4DxecOzcTNHraM1UoAHvIuwD7
 IRGPR2AdYe7UfxDigTIJic1dfQ+JlmotdGk2wFnvfszRMa2gZs31SjWcZFGglVjlAZ
 zdtPEgomw9MtxZC/iN7hyAG63jm44Z9oqNDR+R45R7Gzi9bczxgmLax132kn5cnT2/
 tEjzema7CEbxidmHvpegxAtb5p9R1fZgogOgHL2CS6Dr/F03C9m/JzYmGcfTvz/KTL
 PHR/fZoVEefVq0z5LUBkJiM5giBAXIfSDjOs0IdNaHEogO0YXHn79BfQrxsIYdqoLg
 t19MW3zdtsYkQ==
Date: Fri, 11 Jun 2021 16:54:29 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Fixes for 5.13
Message-ID: <ad7ba352-315c-4201-b922-4bf914a00d98.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_075432_442620_03E54734 
X-CRM114-Status: GOOD (  11.08  )
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
Content-Type: multipart/mixed; boundary="===============6687368638778646674=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210611145429.WytLs3SfdbXHECgSKIARHzmZbGQPu9k7f8nShXNHDfI@z>


--===============6687368638778646674==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IbiEmVdNhj52aTiM"
Content-Disposition: inline


--IbiEmVdNhj52aTiM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.13-1

for you to fetch changes up to bd5431b2f9b30a70f6ed964dd5ee9a6d1c397c06:

  arm64: dts: allwinner: a64-sopine-baseboard: change RGMII mode to TXID (2021-06-10 14:51:53 +0200)

----------------------------------------------------------------
Two patches to fix the GMAC PHY mode on some boards.

----------------------------------------------------------------
Icenowy Zheng (1):
      arm64: dts: allwinner: a64-sopine-baseboard: change RGMII mode to TXID

Salvatore Bonaccorso (1):
      ARM: dts: sun8i: h3: orangepi-plus: Fix ethernet phy-mode


 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts                  | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)



--IbiEmVdNhj52aTiM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMN5JAAKCRDj7w1vZxhR
xfKdAP9DP2gxkghiwsDVwqUVay66TLRmsDbDrXkT+PPTWBp3VgD/fjADN2OSCPlR
yq33OpJqiAXAo99FRLJMDD8XPTteBQs=
=O3V/
-----END PGP SIGNATURE-----

--IbiEmVdNhj52aTiM--


--===============6687368638778646674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6687368638778646674==--

