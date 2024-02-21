Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F00C48BC3
	for <soc@archiver.kernel.org>; Wed, 21 Feb 2024 16:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54499C43390; Wed, 21 Feb 2024 16:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6634BC433C7;
	Wed, 21 Feb 2024 16:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708533438;
	bh=y0tXgKv8Ex0oI90KbUs01wU66MlfYVPoFjEe+4fjibw=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=rCyrnD7eHHlLJPtr/ZT1dY4pO0CW8MmpypY35r0Zjr3oN+KJWmruiu8Hy4mT7H29o
	 0GEjhK9geNWDWg8POBZAQqTHJKYA8GFIt7anoCu3YNJicWrKlbpri+Ocl/pZVeq1b+
	 BgFJLz6ohAEAQLPJA11OsEcQkAjWy2naIwcYV7aj9rK0qqENc8r25qjXf4YW9yYay2
	 1lIJwzWa9MXX2J3DcdimYPUbOStHMyELvjJ8Ibh4o+X95yE5NB9ybieosQ2IKt9boH
	 fjO48LQ5cp7CHtTJq8YZjFu0DSmDfnnMPcgPcYQl2jI5DmZuqq1UVtQGMlEETei/Mo
	 JFylb54kcW12g==
Date: Wed, 21 Feb 2024 16:37:15 +0000
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] Microchip firmware driver fixes for v6.8-rc6
Message-ID: <20240221-recognize-dust-4bb575f4e67b@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9CMBAJGOQIvoS3N9"
Content-Disposition: inline


--9CMBAJGOQIvoS3N9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull a single fix for the single Microchip firmware driver.

Cheers,
Conor.

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-firmware-fixes-for-v6.8-rc6

for you to fetch changes up to 0abcac4fe3ca3aeaef40ad53c0b295b2d5f8cbf1:

  firmware: microchip: fix wrong sizeof argument (2024-01-29 18:52:11 +0000)

----------------------------------------------------------------
Microchip firmware driver fixes for v6.8-rc6

A single fix for me incorrectly using sizeof().

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Samasth Norway Ananda (1):
      firmware: microchip: fix wrong sizeof argument

 drivers/firmware/microchip/mpfs-auto-update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--9CMBAJGOQIvoS3N9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdYmuwAKCRB4tDGHoIJi
0lnhAP4neAieR2pNCsFa4FvA2kuK7nIuv5BKqKnaEYOUuXezKwD8CAT7TaTlBoD5
DUMGmHbu6tQgS2bWwmVzrI/deTBevw8=
=3RiX
-----END PGP SIGNATURE-----

--9CMBAJGOQIvoS3N9--
