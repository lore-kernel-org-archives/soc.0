Return-Path: <SRS0=Uajl=HF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC3BC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 10:13:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A106F64F59
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 10:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A106F64F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gvw6zK9TsQBIAg+uizqyMuIyMVWcTK6EsBaYsW5UeLw=; b=bSW
	mgqkMKNQJX+c2UDxCfN/TrRdx/iaCIuqcNO/L7lfRIfUQTUNvcEwK54EuUsMP5P4ZJGjWrvQR5G4i
	bHjBL6bvis9y4pcXRLiEsfpGmwxas6MV+5X0qCldLpBXtNs+nU7OCzsJmP0wJ22XI22gAo9n2iP2J
	UJiZTKoiZO6/Tmrmnit5AzEhKFvbEm01wBEI4ZultPr+wHHDoFTN93XUyKpjAez2/FETKVtsCljIS
	8WhrTVF18aa9qd3i/YXra9MNNF20HTdXIe6ukWtKHmuQHu+sAjXIJDjH4BUnMEry0n5CNLI1/W82M
	8Hes3NDWHqZsi5f38IRfafr4XB/HYXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7F91-0001F8-7e; Wed, 03 Feb 2021 10:12:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7F8y-0001EC-3h
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Feb 2021 10:12:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91C8264F59;
 Wed,  3 Feb 2021 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612347134;
 bh=lYZV+iTt8iwzbM/OGTI6+G2prOyqKi7zswaG66UM5Zw=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=HEnTTH61qzLPofWT4a32iv0uUQM4TlTbrdVUduKHy6rItL48B7d4YunAXXVTLUzdZ
 LxtWN2JoDZnRRDXZwmNDMIfmsrGNUbwavk0xrDOIEu/DZaZ7xQnTAA98N6WL7vC6ZS
 uI+VLzyFYMntLq1mR5an1KWBxQqlA2F+VH0FX2Q4RRM++MD3EP9IpjKyBtNJBSOQXf
 9g9O+tQCugx6Kux6kj21D+4sXrXoIIlleiQRsxT0IhZPxfZf9vay7O07hNuGBtZI7U
 MPhep2FixIoSX3OPpoH3kXyY4d30J+0/rB27bCyztgjs5DI3WD1aks78GJNYOhl5MW
 Jf8AGZL6IDjOQ==
Date: Wed, 3 Feb 2021 11:12:11 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Subject: [GIT PULL] Allwinner Fixes for 5.11, Take 2
Message-ID: <f8298059-f9ca-43b4-9e29-35bc0e0c9b15.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_051216_283910_45352C54 
X-CRM114-Status: GOOD (  10.53  )
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
Content-Type: multipart/mixed; boundary="===============0081404271097051036=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210203101211.326c4uyLjags9UH34GuUm7gLlQnJ0vgXgcUu-J2mJhM@z>


--===============0081404271097051036==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the current release. It supersedes
the one you reverted that was missing my Sob.

Thanks!
Maxime

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.11-2

for you to fetch changes up to a900cac3750b9f0b8f5ed0503d9c6359532f644d:

  ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode (2021-02-03 11:09:05 +0100)

----------------------------------------------------------------
One fix for a phy-mode ethernet issue, and one to fix the display output on
SoCs with the Display Engine 2

----------------------------------------------------------------
Hermann Lauer (1):
      ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode

Paul Kocialkowski (1):
      soc: sunxi: mbus: Remove DE2 display engine compatibles


 arch/arm/boot/dts/sun7i-a20-bananapro.dts | 2 +-
 drivers/soc/sunxi/sunxi_mbus.c            | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)



--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYBp2+wAKCRDj7w1vZxhR
xUP5AP43pAg3hZ/nZkLO0e81/ViMks02nezv/o7am6vQX8AShgD/dsWe5hj1JFIO
xOUMRPY8zyqVi+tHEeFk+YRKkoz+HwQ=
=xjkk
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--


--===============0081404271097051036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0081404271097051036==--

