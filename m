Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449034FF6C
	for <soc@lists.linux.dev>; Thu, 26 Mar 2026 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524103; cv=none; b=i5SkDFzJHnWZ+0TgZf7CiOQ0JnFBvYLmFmGBt53muHjCmoAs5zLIdkO77z9eAxdRwH8LDzxh1AvQ9QWk0K+DffJD1WzloFUYY3wcvpaUigkayZgT+9HHVhGQlfJtAqyhC6ZPQdNIVQsd2W26yYNQouvD7wTIbn50E6mb6Czqez4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524103; c=relaxed/simple;
	bh=fI3zTkRfJyu9iUjRRxGqt4eJvukvwwoupPnLtdRJbn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PMfFxO+gxFbYcbXamLUUsLtdMAG7HnqRTW3uRbrTq2Iwy8rLYPO2Be6q6/geoxmB6Qct/xCt/9GRfFbox3RaOvEVovTHg1ZJo9zgqRnluyd0IKTl0EblNaoyu5moLuXTqeAMgKKKqdyprrcjapJJzbVXFfCL9IQCzly+3r8FNgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNR7wnCL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNR7wnCL"
Received: by smtp.kernel.org (Postfix)
	id D4238C2BC87; Thu, 26 Mar 2026 11:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C1DC116C6;
	Thu, 26 Mar 2026 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774524102;
	bh=fI3zTkRfJyu9iUjRRxGqt4eJvukvwwoupPnLtdRJbn0=;
	h=Date:From:To:Cc:Subject:From;
	b=tNR7wnCLjznjormCld4fxdNzMAvGF//DekN/ubCk4baLlKjAyOxPUR5euqWXowkD3
	 Kfh/7+LG+oxpPe9dpnkQg1jtMZv4c7X/TWC5PeH39SaRKk6l5iHt4n/FN/St2No3GB
	 0jW9COhCrC/LU1zxhhyshxb1VhpQLhe6w9FcEAc6MMiOyc7hYWnhLNi43kndu+RDzd
	 PEF+kVTBoXvn8B22YP1Bk+kk8d9y2a88P8Fr4YGHDtnRRZy5Fb3dOhrcg2E5cCLj+i
	 8G5gPzWUwB/JexrnQfwU0ZNb2DieOyJ2JyR5HQrYTy0HySwQY3WA3fJ8LgNwXSEJGX
	 ltUyPdXDtw04g==
Date: Thu, 26 Mar 2026 11:21:39 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] ~RISC-V~Microchip soc fixes for v7.0-rc6
Message-ID: <20260326-vertebrae-relatable-adfa3baabfd6@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zbUJx0RWubwazLAx"
Content-Disposition: inline


--zbUJx0RWubwazLAx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Another small PR here, worth pointing out that the exact contents has
been in linux-next but not as these commit hashes yet, I squashed a
fixup patch just now that I hadn't realised got pushed without being
squashed. Might be worth letting it marinate for a few days if that's
a concern.

Cheers,
Conor.

The following changes since commit 0528a348b04b327a4611e29589beb4c9ae81304a:

  cache: ax45mp: Fix device node reference leak in ax45mp_cache_init() (2026-02-06 19:54:40 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v7.0-rc6

for you to fetch changes up to c7596f9001e2b83293e3658e4e1addde69bb335d:

  firmware: microchip: fail auto-update probe if no flash found (2026-03-26 11:14:11 +0000)

----------------------------------------------------------------
RISC-V soc fixes for v7.0-rc6

Microchip:
More resource leak fixes for unlikely scenarios, and a change to the
auto-update "firmware" driver to prevent it probing on systems with
engineering silicon where it cannot be used.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      firmware: microchip: fail auto-update probe if no flash found

Felix Gu (2):
      soc: microchip: mpfs-control-scb: Fix resource leak on driver unbind
      soc: microchip: mpfs-mss-top-sysreg: Fix resource leak on driver unbind

 drivers/firmware/microchip/mpfs-auto-update.c | 10 ++++++----
 drivers/soc/microchip/mpfs-control-scb.c      |  6 ++++--
 drivers/soc/microchip/mpfs-mss-top-sysreg.c   |  6 ++++--
 3 files changed, 14 insertions(+), 8 deletions(-)

--zbUJx0RWubwazLAx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacUWwwAKCRB4tDGHoIJi
0kcNAP0bX0T7NpKnIi48ujNlv4IW/mPjopUf2sRIkqzeS/qoDwD8DlqUFU+ctFHF
ih8iC06d93AvfnqUHIQC3lztuXiTwQM=
=l9Xw
-----END PGP SIGNATURE-----

--zbUJx0RWubwazLAx--
