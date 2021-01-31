Return-Path: <SRS0=Fj/g=HC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E591EC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 17:51:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69DFC64E3F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 17:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69DFC64E3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=v3wTB3q7jFauo6pGgXshbugq428KabtMRqIKCpTrY6s=; b=tyU
	L1rRMuybiO6wpE2nSauLsLe0nmKI5Jk7LE3gekW7+YTt1fvNdvaFlXAXoyJcvD+8l0jC/bh6XIAZC
	4/HEvTfvnZFBeS78NyN0AxbR+cZvH3jDHlcjOKWq86midM0j7FSfoXXnUVK0cKc0BKzfpr8fQeE0h
	tFz7npGb5PZl3E37+3q2ayLC9kywAkmoegu2m8R1/fnzgISiceg+Bw7r75H8CT9KpGLlk8SsZmb8u
	RNBO5SRzzi+xOi/nAhcLhqOBd5ww/5een5CAGlLNAK+d+WT6U0yhNICIFU0DGB0U1eEQLGAFyXPEe
	4fOecIBY2UfYRpym/EVoNAzXLOld3Mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6GrM-0003lS-4M; Sun, 31 Jan 2021 17:50:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6GrJ-0003kq-1A
 for linux-arm-kernel@lists.infradead.org; Sun, 31 Jan 2021 17:50:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7739964E3F;
 Sun, 31 Jan 2021 17:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612115398;
 bh=o45F2DNylSBs42IMrTjFyOsU4MOYtEgGoumKmSvuIR8=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=mtSOmhIkDCkcpLgR2YNU+CkD//j03B/pVxJpHqPPzVit2B6Xxj0K15qvXyOQyiaNX
 Drf16/DqmxQe0LGXBq0Jn1qb3KgJ/DvQwOID8us6OcBM4tkt7V0YE1x7XOTFT5Hf+4
 BcAXrbiHBoTsxZZUnYMqV5UKNOp+3zkbWrgLs/qLP2YvkMCbbcWUT+F+m/YKIl7VCV
 poh6v1lj9IFt8WfzuI0Jg9FwKoRD97zddzblKRUu7cQJbPbQI3z1XoQnqoWYpqLFLe
 a0o6tmDxvJTDGJmKLPDkwWzbW0d0VUDUlbNU2RPx3dnXv1WBCqBDHViGWn9XV0ZUq0
 vghctXLMJG6DQ==
Date: Sun, 31 Jan 2021 18:49:56 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Subject: [GIT PULL] Allwinner Fixes for 5.11
Message-ID: <50368e09-c84f-4015-a6f8-70e75e12720d.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_125001_204173_D8B42154 
X-CRM114-Status: GOOD (  10.17  )
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
Content-Type: multipart/mixed; boundary="===============7954905161631548505=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210131174956.I3poNU-n-xDJAG6Is4UrL4--44zBaDMc_2ZDC8bQ9e0@z>


--===============7954905161631548505==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.11

for you to fetch changes up to 4e238bfd83f320b6a272a08db7b3c0fbdbc3a633:

  ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode (2021-01-28 15:58:52 +0100)

----------------------------------------------------------------
One fix for a phy-mode ethernet issue, and one to fix the display output on
SoCs with the Display Engine 2

----------------------------------------------------------------
Hermann.Lauer@uni-heidelberg.de (1):
      ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode

Paul Kocialkowski (1):
      soc: sunxi: mbus: Remove DE2 display engine compatibles


 arch/arm/boot/dts/sun7i-a20-bananapro.dts | 2 +-
 drivers/soc/sunxi/sunxi_mbus.c            | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)



--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYBbtxAAKCRDj7w1vZxhR
xW+TAQDprceyuj02kMrcyldLK/ja7Asqb0vdYm7VFWKVGdtMfAEA3U3yUfDKNEyY
fYmRFtrjGI0xmQV4Clt5nuZTicN5DAk=
=47Ia
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--


--===============7954905161631548505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7954905161631548505==--

