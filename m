Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E442E54BD
	for <soc@lists.linux.dev>; Thu,  7 May 2026 17:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778176451; cv=none; b=eHZUqpjz8VRse3Yyr9JupqaG8vLI6BTnXKr6m0/noEj9HyMm5nW+52kWFP7+zLwmHVOnFp2JMKuqCHh6oDwTX87a48mTd/xBqYNc1wfsv6y1udgCTdlnd0RIk0UlgXFCBCkt7MBX54nYSwej9iSZRdetSbrCvp3SH0nqiYhFOCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778176451; c=relaxed/simple;
	bh=xDacGMvvzPmsE/iO9k/VkS15Yv8TKnxQDlE6Ud9l47c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ks3RhgDuyDfHLZsKene8yqvRcrz7xrfDic9k7Gqu13bicQsBMqIPDUaExoIlWaP0RPq1QOkG3SLC3YknrUQLcLcz/vFd9UabVli/n5aHegtKqGtRJ64AUQo5oz1MBwTgdhq3yWkFJ5HEYU4m7/EneCqDbjw1DqlFXSwPB7Rnpdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7o5P/bF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7o5P/bF"
Received: by smtp.kernel.org (Postfix)
	id 44C01C2BCC4; Thu,  7 May 2026 17:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF07C2BCB2;
	Thu,  7 May 2026 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778176451;
	bh=xDacGMvvzPmsE/iO9k/VkS15Yv8TKnxQDlE6Ud9l47c=;
	h=Date:From:To:Cc:Subject:From;
	b=p7o5P/bFde+3X0B4/e3CnBLyHflwWlJqQvVLFUvnZvq6Hbn7eyHLsnaNHrDxpXcSW
	 92LWmHZvf1dFy4rKeDAaN9+vLHtNTadwB6HBwUUi0+dLQWSis4ry5tovfGeECATQc2
	 oKuFfzGDJnv6voPZF6kPJL4MqP6FZqatWDfWxgu6mBiwLtE3jpc5pOvA5vxXpCv36K
	 922p1Gz95B79a67bIn3yu6qQCDCdkDb2F1wXnMVVUNwL3WhXz0RUclD315eJfaOiUV
	 7w4Q0sjBcO1aVne6va75iHvKBJzRtyFmMOogTURs471mDIsStMbG9cdXj3sIMQ1/s3
	 G6wTzpR9GDKww==
Date: Thu, 7 May 2026 18:54:08 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V devicetrees fixes for v7.1-rc3
Message-ID: <20260507-blush-secluding-aae99d404f6f@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KYu/UkfaUcfJ3dJ2"
Content-Disposition: inline


--KYu/UkfaUcfJ3dJ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull two relatively minor fixes.

Cheers,
Conor.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-fixes-for-v7.1-rc3

for you to fetch changes up to 0df8aa2b9aec5cd21e8c71d9cc1227e57bea43b3:

  riscv: dts: microchip: fix icicle i2c pinctrl configuration (2026-04-27 20:12:51 +0100)

----------------------------------------------------------------
RISC-V devicetrees fixes for v7.1-rc3

Microchip:
Fix a pinctrl misconfiguration caused by a erratum fixed between
engineering sample and production silicon, that causes settings for one
to not apply to the other.

Starfive:
Remove nodes relating to the "camss" video device that has been deleted
entirely from staging.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: microchip: fix icicle i2c pinctrl configuration

Jai Luthra (1):
      riscv: dts: starfive: jh7110: Drop CAMSS node

 .../boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 10 --------
 .../boot/dts/microchip/mpfs-icicle-kit-prod.dts    | 10 ++++++++
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts  | 19 +++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 27 +--------------------
 arch/riscv/boot/dts/starfive/jh7110.dtsi           | 28 ----------------------
 5 files changed, 30 insertions(+), 64 deletions(-)

--KYu/UkfaUcfJ3dJ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzRvwAKCRB4tDGHoIJi
0m+dAP4kfTtXjWW+yv2V46nbdCJLIoIsgFfHdA2Z9DxsK1GB5gD+Npd2n1NI8aB4
gmmHReY2KXLaVmkSMdrggUHatlXo9wM=
=24Qz
-----END PGP SIGNATURE-----

--KYu/UkfaUcfJ3dJ2--
