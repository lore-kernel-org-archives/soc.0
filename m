Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259899;
	b=Kt7tjLiylfvoFXe4HbgyuwLs6nWJf08hTEpzxTpaQC4EqX8daZWoQuhp3c+wdhgOcxQA
	 Hx1Wq5BNiG5DFagLtP1AKIV2vBFgDMeOisD5F42v8xeglfIumlJ+tm4IUDeb6W6dVcAyr
	 NnM6aAAXFp0SthMShhV/U0/KY/LzMNFkE2fj84C+2GrOiEbV77UCPfjDMGiwtudynaR+j
	 QcQC0Jg9bslOQFdxwTbJb3giRKEQxqN8BjLyyHrvnaf+e7GqFZ0wcrklzLAULKiZ2HkRK
	 jhfYgML22gNQDeerg9zou2AD6r3Our+O7gKJWXp93wF3jLmvOSzS3srGasqArJmKhBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259899;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=mnoJ1uPuSyLJ/Ny/IcG7GYB2Y5vaO86wV++XdzCaAzI=;
	b=SBOVXR361D6sc/Bta5OqjAKAQQ8lEv6U4Ri+hJH0LOqktQGfvSWn5XW1wsqAL4dZ/TCG
	 bTUS/841m4ebTWa3efkvxf7gQZsBcf+Cq6xWhKpuVpP4uwkLE5xOID/KSeTu5Ou1QF0uN
	 Zd77j4Le08KzIaokXfcGE0jcfGxs0fnk3eq4YEbXXQVfWHBIdnSjoWN9zjKDs6qEwMVNO
	 SL/IOIM2EBmwUaMVyFXx99nJ6Ol9ikkv6FVJYleXAQG7gEa9EMrktvfoOO05Q600hg2LL
	 XBC6T8rZ50Nmt4/5skBuwehK/s9reEy7OOzVRhXT2VHxr7mi7/YdZmrA51z2jVIxHZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dOwRYM+I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409C0606A332
	for <soc@lists.linux.dev>; Mon,  9 Nov 2026 21:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dOwRYM+I
Received: by smtp.kernel.org (Postfix)
	id 06F3E1F008A3; Mon,  9 Nov 2026 21:31:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794259898;
	b=1oMPt73SKXDSG5jWYIzbsXlMwC4P4q60j2lBUq7pH8bwqnfp47CEJB0XSyM3NXtCsKBB
	 EoOGMh5lm8jyM60a67tAZ/Rgp0bMsLYK1/+1dC+x6q86tqsiWSHnqIJl6AR0Tmssdwzhd
	 2Pl0zRiqMzJVDnHi3y5GiL88IjUbBdSJyItaL5dhERe/nGtdVurD83dgkSzZ+/+MBymK7
	 GD7B8+I6I5fXsRtlXiAJK86Nx403BCiaZj45O9Iu4uJgEMWo+AYdPIyEUmXZyljP5X/6v
	 a2smqSw+1JG7IgwcbQivNkI3dJARXRNTmWopNqN7Z/BN6m95YKmwOWT2qEfq3TfCUzw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794259898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=mnoJ1uPuSyLJ/Ny/IcG7GYB2Y5vaO86wV++XdzCaAzI=;
	b=eqemzAxyjFKGfGN1eGQEUkV0UnFLignAqqg5/TghKpkJ/71IYDButUANNG+5Os6QRmMZ
	 IAeWjpoQZmHwiv33oQHE419N0/8+/fRs1oO4YVrwRpg1Vw7nVEzkgF/vlHKt+xBDgUbUx
	 gYIGYXuQ+BGMXTQZgcJ8gKUU7IWv1XW7QCh+IJMAhQZFpD3M1LrC1tvbfXc/n2er/cgyn
	 j18tUlSAOm1gqqCfjqOQacKieXn39nKqREg5XfJOlb1SLEQ29+3Yk7aWVzbKIhesddvNQ
	 m+Q0NmLQMbm56gDirGv1aJwVKT8hqVuBz/y0PAbGAMsAtyWcNjyERwoS7xQpMSk1UKg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dOwRYM+I;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5383A1F008A1
	for <soc@kernel.org>; Mon,  9 Nov 2026 21:31:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dOwRYM+I
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5383A1F008A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so9329035e9.3
        for <soc@kernel.org>; Mon, 09 Nov 2026 13:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794259897; x=1794864697; darn=kernel.org;
        h=content-type:mime-version:message-id:date:subject:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mnoJ1uPuSyLJ/Ny/IcG7GYB2Y5vaO86wV++XdzCaAzI=;
        b=dOwRYM+I85R84uNHpn2+e9XUV9dzmo29SXLsDhRrfLG4UVTwPdF+AoN6udhVHOmfDH
         1Wi8JbT8JXSfnH2m/BJQA4XASiuGZPSecZPjHCx3W5ua3nJHKozU4NBMDNmSaLxRQYDJ
         2pdHG/IbjiVmQFSX8Dxo5Zl86vRvPtzk5jJ2bykmJblPMt0MXkEVt+lhDSQEmUpMvzhl
         u85HH8e6DQZb7xpzWgkecLfyXTXCp9NuKzde1rzPugJ6kZkH8XKUhi/y8oFQoml1Dcy1
         ew4JdMM/Cg8Gm3V1c703j5OCD9pJ0hHI8TXxbCvodI80HcutIQBS9eWZCKQ+hMduzRBa
         X1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794259897; x=1794864697;
        h=content-type:mime-version:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mnoJ1uPuSyLJ/Ny/IcG7GYB2Y5vaO86wV++XdzCaAzI=;
        b=qrTWMdKcJ31D5cqa3NB2IlRKAA61m403ehEjSsH3cRYgMQzCDn8n9TN7BOu5FQmsI/
         KDbVZi2JUmvJuGJjYYb5G3OAsSW/Cf8aSVFhJ29sjcWq8LXhjAvNviQvBg/u+E8ur4LE
         jfZ0dPaBuDfbH/fIBnj05ryLkFpsD3GSdJol5adVlpgvZ9IQuMQsRI/rzMXLtELdt4jC
         U+OqSKzbhM8jEbfP6zTWL1+gDHY57KfpqGoAGyCwCGfp2aDKjVoeth0dJ6Qou+IUkSw2
         jf/sjkBVweIsXNQl/dePSjMezb92bBMLpAtfrK29dvxgIbylH1YulS3VbVoi7twfynYN
         zB1w==
X-Gm-Message-State: APuU4Z/vj9nv+HmptaZl/30fLZXoVOxuf3FOjGfsf7dLx+JQSOQm1cbB
	1GgaqFU8iaisImQFvqHT8GZNulanJf2ETxGqxvJ+0VoAR3IfyLnzaozuIa8r6pyRocs=
X-Gm-Gg: AYBFou1QVsmsLqXYOWhePjNiPMeqYs8gEWaYnx/evOfNW71LqyH2eSw9ARlp+T3jHb9
	bT3ZiwbC2bh5fcW2+cntqlllZ2pv1hi2eFwJex6jM9jD2rCvik59MMuJySrDtjdFbmiSsql6vzW
	askWrSMx4SvK8bVPPb1CNRAUse4eaL+igQgDlajPZVlIU2LzvWjek3lGzJcClQl/8zUu81aD+m4
	hWicMXjdYfMg30rxmCQdLFv83YuaXG6Rz/QpsTTTfW5Pxcj+vQpzqRTWemxL1wABnCOgaglfWxR
	9LojzBOVAgCiyX0ZIhQbAT/XOs60PRCufL18rPSx6xH5A0fTlYCAddlxQfWrZyO3V5s71/s7Ikx
	Q026ryVowH9o93aNxptWb+4bP7+sAUX8/4uD2p0D5+9BrQck3PMFCNsLQv0JtuuwzKxoSM1MfrQ
	fTumoDYhnqUAk5z91Um4YwBMBpmKdcyrtUxjWevBo7DTkCKKZVvbYpm9mN7ocLJuofKm66Kc0/I
	Wf/y8yFh9cHNIAVXBzmAwLhwqjpFSb3HHiJOBoHYpePd8eIUExZ4pL2a8evduuk+QyhYF949nzH
	XCZaFoujZsQKfMh2GW7+2rwpnA4Nct1PamzAgCYEYw==
X-Received: by 2002:a05:600c:1d08:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4ba0234a85bmr7703455e9.25.1794259896601;
        Mon, 09 Nov 2026 13:31:36 -0800 (PST)
Received: from strix.localnet ([197.250.160.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm16746095e9.6.2026.11.09.13.31.35
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:31:35 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@kernel.org
Subject: [GIT PULL] ARM: dts: zte: Declare zx297520v3 CRM device nodes
Date: Tue, 10 Nov 2026 00:31:28 +0300
Message-ID: <DkHOTiB7TW6tXJRTDczLjA@gmail.com>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextParty1QuGRz9RF21jI8u5DrUTA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextParty1QuGRz9RF21jI8u5DrUTA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@kernel.org
Subject: [GIT PULL] ARM: dts: zte: Declare zx297520v3 CRM device nodes
Date: Tue, 10 Nov 2026 00:31:28 +0300
Message-ID: <DkHOTiB7TW6tXJRTDczLjA@gmail.com>
MIME-Version: 1.0

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/zx29-dts-7.5

for you to fetch changes up to 52f4b7e0eaee66023a9db3c2c4683b35c8e61fe3:

  ARM: dts: zte: Declare zx297520v3 CRM device nodes (2026-11-10 00:15:11=20
+0300)

=2D---------------------------------------------------------------
ARM: dts: zte: Declare zx297520v3 CRM device nodes

This pull request contains the DTS part of my ZTE zx297520v3 clock and
reset manager (CRM) patchset. The bindings and clock driver are already
upstream. The MFD and reset drivers have been sent as stand-alone
patches to their respective maintainers [0][1].

Dependencies: Since the binding headers are upstream, this pull request
does not depend on any outstanding patches or pull requests to merge and
build. For the hardware to be usable at runtime, the mentioned drivers
are required.

0: https://lore.kernel.org/mfd/20261108-zx29clk-v14-1-48694e5a9d10@gmail.com
1: https://lore.kernel.org/r/20261109-zx29reset-v14-1-1a05aaa7309a@gmail.com

=2D---------------------------------------------------------------
Stefan D=C3=B6singer (1):
      ARM: dts: zte: Declare zx297520v3 CRM device nodes

 arch/arm/boot/dts/zte/zx297520v3.dtsi | 101 ++++++++++++++++++++++++++++++=
+++
+++++++++++++++++++++++--------
 1 file changed, 89 insertions(+), 12 deletions(-)

--nextParty1QuGRz9RF21jI8u5DrUTA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmryO7AbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiAxkQAI+7jiHejg4fEJt3G/9y
f5UB3ZvPluyk2Y7eEY0RJJADuP+Imy2b1g/sJbZnPHrqj8LBt8XS35WvZlyVF35w
LV94x8ANJQFVTLEPoCP/mw6EbFU3Smo9S+7ZHMYw/HB6RfvyIZi72CIWIfgWxCAJ
DOzEnFa1QhIFK37z8MbsylVbmBhmTSnK9uX28Ape5etN+NOvJmwlS4pz2R5mjYF4
22NJBy2BZwDVmcEcmxnlxGmcYZ61ZAi7SYBENQKJA7hok9QZKwfd51MUpLfj2uIC
8cHP3gNqbPuZmpr/1iOImugke79DJ+AVZimQSMWuc6/zFTFadlB//EGwx6I/0Z6Z
6wxYpZS91cQl8TeFPPG9BnpkGCL06rvmc2ajJWU2wn/eNGFo0sMOmYOzTsGkC/U/
nYkB6oZW3HGcdapv4Hz3w364lrtAZ6vmJ/zt6kO2NJHIYz1u+sia3TIHG4OQmxBL
Gy03x79B37jJM0ZnZwHUsqAZ4cg+ZK1nbQmGwcX5LAA5Max4Mffv/DjQku8PVlbI
XBjKArTTKVkvY5VdyBqt0QaQKxxrp7+siqyK/h/8ymZZDBnjuuuroLxjJec9OFH7
2/XgVJlD+2mJGfD5XNfNgxxsaWucGMSRMcoXBom3kf+NH2pYR2dQRH2PekJruHIk
V2ge4ywv8mnXNsg6ICiIV5sT
=Y6/m
-----END PGP SIGNATURE-----

--nextParty1QuGRz9RF21jI8u5DrUTA--



