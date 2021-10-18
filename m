Return-Path: <SRS0=UpmX=PG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72755C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 08:07:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3464161038
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 08:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3464161038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=k12ESFHhaM6FfHS5UGsEp+hL99ynTbaK6oo7cX1RQHQ=; b=Dwl
	iwWLEhXl8Ma/HuxVpgVzrRw784Ur0F/RnzQcDEvZzJ7xI1jxi8lMp7lzDYdvKLCCz+UAhhtu3c8l7
	7zAjpN4PBuV4qEkY+u5ujJQJ37DkOskP9zWEx5dpCuJptnufWP1+qwXKhFuEVloUPR5tZAlIsL83f
	3X6qmPDpZKM7Mjn7Lvlxsn+btSmqxYH6GiAJhF/lsWIqzNHdZ6wN+ihuU6oKrzFKd5jZowY/UVhR+
	4sO7xv3JyadGQg6W6o3Pk4MMMG+fb+0778LRP1VhFD7g93BLKiYDZoe0yuVUjDtpsSYeCdAs0y0V1
	Nzu0cUnaCCIhe6ihwTaUtLEwL3bF2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcNfF-00EZMi-Ku; Mon, 18 Oct 2021 08:06:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcNfB-00EZLm-Qi
 for linux-arm-kernel@lists.infradead.org; Mon, 18 Oct 2021 08:06:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0805A61050;
 Mon, 18 Oct 2021 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634544389;
 bh=jTUl3KwTRWwxK2lXal9peOo0jxqD71yxYfz3L7DgLHE=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=sCY/UNONO+ZQpGoe42+GaAKoYpB1nhcAKxvA9SB1v4bkNnC3upQ+MP/zC0UqyB8U5
 blCOlTy2UkLj6kQiYqa0cwsB/tYAqEBA47FUUrjxA5GlYOIOO5THrDG9YuRqx6te2u
 lTQUBQnIa7JR2MZBzIVcj85DjhSIo1kYGh5q0mHSrCXfJVdrdKVwTDOrNioQtLPPzs
 U0KMUDk6H/Y0JVt8AzLm5RaXP8zxRulIPJA0r2f2S4oZVvSsCdWWwyV7PNhcFKAB9O
 llR6ebNn5GRHpawYwyoj2sIT2QUIFiO2OCfEy4hjRG0OGiVmYbnVHrk7+SBETzJtIJ
 SqXINKG21/zDg==
Date: Mon, 18 Oct 2021 10:06:27 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Platform Changes for 5.16
Message-ID: <0ceaad3e-dc26-4be6-b98f-d25e51a41b81.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_010629_900389_B849CE88 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7852306001348972780=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211018080627.fN4A3J2Qq0NuBJX6fOat18y8Q6JJvpYZMW6T0wgRyMo@z>


--===============7852306001348972780==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kd0IKDMep6tgZnxs"
Content-Disposition: inline


--Kd0IKDMep6tgZnxs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-core-for-5.16-1

for you to fetch changes up to 5923ddaa95a7e61e827a3d9b1d9c749963d8db90:

  ARM: sunxi: Add a missing SPDX license header (2021-09-13 09:03:47 +0200)

----------------------------------------------------------------
Platform core changes for the Allwinner SoCs, this time adding SPDX
headers to our files.

----------------------------------------------------------------
Jason Wang (2):
      ARM: sunxi: Add a missing SPDX license header
      ARM: sunxi: Add a missing SPDX license header


 arch/arm/mach-sunxi/platsmp.c | 4 +---
 arch/arm/mach-sunxi/sunxi.c   | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)



--Kd0IKDMep6tgZnxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW0rAwAKCRDj7w1vZxhR
xTh0AQDKmtP1Ho6aBM3yN2W9tObqf+TTy50JQfdmYArWZY3UkQD+MPWHAomx0pDD
NA38CGAAZXW9azRK9wD4/i4Dzr3h4Ac=
=Ut1f
-----END PGP SIGNATURE-----

--Kd0IKDMep6tgZnxs--


--===============7852306001348972780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7852306001348972780==--

