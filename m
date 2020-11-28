Return-Path: <SRS0=CKL9=FC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C45EC63697
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2020 11:25:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECEDB2225B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2020 11:25:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wOWSD3+z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Go20SRzZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECEDB2225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Y1pizR9lJR2Wf8jLeSTSi5COPhCmApjmPVpgFzhxcpg=; b=wOW
	SD3+z/wQcCdj0oO/VtLnS9dpRKCoZ45WwxVFwClKIkuxsnodmf4ovTxABYFso1g8Z4lDaUkUDLiCG
	TT7q/XiTB+5vsBwy2/0SMfHhGjAfRTc24dnRXea3M27cDscC6CO9pRgBCkLpwj/TV2OMo4uwXMpR9
	UQWAsXyekOoftzLv9e0tityjZxPmcwMCsESOzsn3sjTJ6gUWpy4/442G+B07eGxUDtFlhskh6XOhh
	uogfGl/64oO2dPBea+W1nwWA69ovWwXCn3QVqT3XkxFmwqwTZiSiyqGiDkfWKvKtq744WoxawYfD2
	C0WbEeVPF3Zr7cZihOlENw36jbnFhfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiyK9-0004Gu-QD; Sat, 28 Nov 2020 11:23:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiyK4-0004GU-9u
 for linux-arm-kernel@lists.infradead.org; Sat, 28 Nov 2020 11:23:28 +0000
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F229A2225B;
 Sat, 28 Nov 2020 11:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606562602;
 bh=Fb+Os1PYtt6COcev3JawUJMpwwVO5wyoTa/v/BR+q/k=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=Go20SRzZtpDNCgX+DB4nPWvRQwnNFBcuw2N3cZenMMDkDvMZ6nMzJMKm+Okj3c7vO
 3ApPPIuoq52xvCR2MHy9mS45w2mSAYAV8NfQgvqbtTF7ZfG/USTs0A0uFcCq55+ZlB
 JIiVNq4zgmsoIKXHXuN4+GhDBHIEC4HhmA7NC7Qc=
Date: Sat, 28 Nov 2020 12:23:20 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Subject: [GIT PULL] Allwinner arm Defconfig Changes for 5.11
Message-ID: <dffb8a7e-27ea-4025-868a-caa5868eb1ef.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_062327_290391_D88A3BAC 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>
Content-Type: multipart/mixed; boundary="===============3731741564476264703=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201128112320.mgT6zl-fQTmM71Amrh4iEY3-m7eLB81yRzwHGj3CA7Q@z>


--===============3731741564476264703==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-config-for-5.11

for you to fetch changes up to 38c212c90bf172547dc7df7c11fcaacef2c78696:

  ARM: configs: sunxi: enable Realtek PHY (2020-11-16 16:52:06 +0100)

----------------------------------------------------------------
One patch to add the Realtek PHY driver to sunxi_defconfig

----------------------------------------------------------------
Corentin Labbe (1):
      ARM: configs: sunxi: enable Realtek PHY


 arch/arm/configs/sunxi_defconfig | 1 +
 1 file changed, 1 insertion(+)



--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8IzKAAKCRDj7w1vZxhR
xcIUAQDO82yvQVfOTAuPgiq/RuUy46PKcdeiXzkX7HHpXyOvgQD/V+WpyLCMxPxu
8VQ//kvm3Kcu8FzKfIH48ZDgXxT0pw4=
=I+yx
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--


--===============3731741564476264703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3731741564476264703==--

